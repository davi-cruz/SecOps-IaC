output "rule_names" {
  value       = { for k, v in google_chronicle_rule.rules : k => v.name }
  description = "Map of rule keys to their Google Cloud Chronicle resource names."
}

output "rule_count" {
  value       = length(google_chronicle_rule.rules)
  description = "Total count of detection rules managed by Terraform."
}
