output "rule_names" {
  value       = local.all_rule_names
  description = "Map of rule keys to their Google Cloud Chronicle resource names."
}

output "rule_count" {
  value       = length(google_chronicle_rule.rules) + length(google_chronicle_rule.archived_rules)
  description = "Total count of detection rules managed by Terraform."
}
