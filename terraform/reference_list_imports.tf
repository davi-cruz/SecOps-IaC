# Declarative Import Blocks for Existing Chronicle Reference Lists (Terraform 1.5+)

import {
  to = module.chronicle_reference_lists.google_chronicle_reference_list.lists["investigation_ips"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/referenceLists/investigation_ips"
}

import {
  to = module.chronicle_reference_lists.google_chronicle_reference_list.lists["plump_spider_domains"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/referenceLists/plump_spider_domains"
}

import {
  to = module.chronicle_reference_lists.google_chronicle_reference_list.lists["plump_spider_ips"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/referenceLists/plump_spider_ips"
}

import {
  to = module.chronicle_reference_lists.google_chronicle_reference_list.lists["unc6692_malicious_domains"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/referenceLists/unc6692_malicious_domains"
}
