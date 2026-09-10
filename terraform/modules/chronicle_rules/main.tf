locals {
  # Active rules in content/secops/rules/
  rule_files = fileset(var.rules_dir, "*.yaral")

  active_rules = {
    for file in local.rule_files :
    trimsuffix(file, ".yaral") => {
      rule_id = trimsuffix(file, ".yaral")
      text    = file("${var.rules_dir}/${file}")
      config  = try(yamldecode(file("${var.rules_dir}/${trimsuffix(file, ".yaral")}.yaml")), {})
    }
  }

  # Archived rules in content/secops/rules/archived/
  archived_rule_files = try(fileset("${var.rules_dir}/archived", "*.yaral"), [])

  archived_rules = {
    for file in local.archived_rule_files :
    "archived/${trimsuffix(file, ".yaral")}" => {
      rule_id = trimsuffix(file, ".yaral")
      text    = file("${var.rules_dir}/archived/${file}")
      config  = try(yamldecode(file("${var.rules_dir}/archived/${trimsuffix(file, ".yaral")}.yaml")), {})
    }
  }

  all_rules = merge(local.active_rules, local.archived_rules)
}

resource "google_chronicle_rule" "rules" {
  for_each = local.all_rules

  project         = var.project_id
  location        = var.chronicle_location
  instance        = var.chronicle_instance_id
  deletion_policy = var.deletion_policy

  text = each.value.text
}

resource "google_chronicle_rule_deployment" "deployments" {
  for_each = local.all_rules

  project  = var.project_id
  location = var.chronicle_location
  instance = var.chronicle_instance_id

  rule = element(split("/", google_chronicle_rule.rules[each.key].name), length(split("/", google_chronicle_rule.rules[each.key].name)) - 1)

  enabled       = lookup(each.value.config, "enabled", false)
  alerting      = lookup(each.value.config, "alerting", false)
  run_frequency = lookup(each.value.config, "run_frequency", "LIVE")
  archive_state = lookup(each.value.config, "archived", false) ? "ARCHIVED" : "LIVE"
}
