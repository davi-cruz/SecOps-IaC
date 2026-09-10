output "reference_list_ids" {
  value       = { for k, v in google_chronicle_reference_list.lists : k => v.id }
  description = "Map of reference list IDs managed by Terraform."
}

output "reference_list_count" {
  value       = length(google_chronicle_reference_list.lists)
  description = "Total count of reference lists managed by Terraform."
}
