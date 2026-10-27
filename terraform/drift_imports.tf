# Auto-generated declarative import blocks for newly detected console rules
# Run 'terraform plan' to verify that imports resolve cleanly.

import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_ot_plc_dos_flood"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_9ec01fda-52a7-4641-80a6-0e78d9e77283"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_ot_plc_dos_flood"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_9ec01fda-52a7-4641-80a6-0e78d9e77283/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["secops_configuration_drift_detector"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_bf10dc4a-f922-4272-aa35-3c037f62e608"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["secops_configuration_drift_detector"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_bf10dc4a-f922-4272-aa35-3c037f62e608/deployment"
}
