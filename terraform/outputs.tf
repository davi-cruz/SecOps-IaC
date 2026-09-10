output "feeds_summary" {
  value = {
    total_feeds = module.chronicle_feeds.feed_count
    feed_names  = module.chronicle_feeds.feed_names
  }
  description = "Summary of Chronicle log ingestion feeds managed by Terraform."
}

output "rules_summary" {
  value = {
    total_rules = module.chronicle_rules.rule_count
  }
  description = "Summary of Chronicle detection rules managed by Terraform."
}

output "reference_lists_summary" {
  value = {
    total_lists = module.chronicle_reference_lists.reference_list_count
    list_ids    = module.chronicle_reference_lists.reference_list_ids
  }
  description = "Summary of Chronicle reference lists managed by Terraform."
}
