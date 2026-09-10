# Auto-generated declarative import blocks for existing Chronicle rules (Terraform 1.5+)
# Generated from existing rule metadata to bind existing remote rules into GCS state.
# Run 'terraform plan' to verify that all rules are imported cleanly (no destroys/creates).

import {
  to = module.chronicle_rules.google_chronicle_rule.rules["AI_C2_Command_Execution_PROMPTSPY"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e5e32e96-17a0-4785-a632-6bc2b2886114"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["AI_C2_Command_Execution_PROMPTSPY"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e5e32e96-17a0-4785-a632-6bc2b2886114/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["AI_Generated_Exploit_Script_Detection"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_205eb9ce-b164-41ff-ba3e-86189f121fb8"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["AI_Generated_Exploit_Script_Detection"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_205eb9ce-b164-41ff-ba3e-86189f121fb8/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["Chrome_Browser_Alert_SideLoaded_Extensions"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_5d7ad0d4-490f-467a-9d51-c2110138e50b"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["Chrome_Browser_Alert_SideLoaded_Extensions"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_5d7ad0d4-490f-467a-9d51-c2110138e50b/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["DEA_plump_spider_core_banking_fraud"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_b19b38ad-0ddc-4037-8316-32285b02f1c3"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["DEA_plump_spider_core_banking_fraud"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_b19b38ad-0ddc-4037-8316-32285b02f1c3/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["DEA_plump_spider_infrastructure_connection"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_64f5fb1c-bc84-4a3e-a174-8cc3773dcf4a"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["DEA_plump_spider_infrastructure_connection"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_64f5fb1c-bc84-4a3e-a174-8cc3773dcf4a/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["DEA_plump_spider_ldap_recon"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0d665bfe-6d3c-4e5c-8704-d01b626b7b92"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["DEA_plump_spider_ldap_recon"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0d665bfe-6d3c-4e5c-8704-d01b626b7b92/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["DEA_plump_spider_malicious_download"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8f9a91b3-1d22-4abc-9e13-6a8bb1f16077"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["DEA_plump_spider_malicious_download"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8f9a91b3-1d22-4abc-9e13-6a8bb1f16077/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["DEA_plump_spider_ps_credential_search"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8ae1c321-1dd4-4cfc-91fc-695dad30b871"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["DEA_plump_spider_ps_credential_search"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8ae1c321-1dd4-4cfc-91fc-695dad30b871/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["DEA_plump_spider_rat_hashes"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8938697f-eea1-4023-b257-90300875afc8"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["DEA_plump_spider_rat_hashes"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8938697f-eea1-4023-b257-90300875afc8/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["DEA_unauthorized_rat_execution_behavioral"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fc440a7e-7ab8-430b-baa8-8cd43421bfd1"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["DEA_unauthorized_rat_execution_behavioral"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fc440a7e-7ab8-430b-baa8-8cd43421bfd1/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["MULTIPLE_CURATED_DETECTIONS_BY_HOSTNAME"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_c7845bef-599c-4c2f-aa69-1797ccee69b8"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["MULTIPLE_CURATED_DETECTIONS_BY_HOSTNAME"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_c7845bef-599c-4c2f-aa69-1797ccee69b8/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["PROMPTFLUX_Thinking_Robot_Correlation"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e8aefab0-62d2-4d91-86c7-561d2bc3e83b"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["PROMPTFLUX_Thinking_Robot_Correlation"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e8aefab0-62d2-4d91-86c7-561d2bc3e83b/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["adfs_db_suspicious_named_pipe_connection"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_6d551704-cc84-4137-be73-735a3304e04f"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["adfs_db_suspicious_named_pipe_connection"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_6d551704-cc84-4137-be73-735a3304e04f/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["ag_ioc_sha256_hash_vt_basic"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_41172f60-6aaa-442b-add4-bbba8a23a6cf"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["ag_ioc_sha256_hash_vt_basic"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_41172f60-6aaa-442b-add4-bbba8a23a6cf/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["apr29_unc6692_malicious_execution_temp"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_63f0468d-67c7-4452-9ace-6566a1aaeab6"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["apr29_unc6692_malicious_execution_temp"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_63f0468d-67c7-4452-9ace-6566a1aaeab6/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["apr29_unc6692_persistence_scheduled_task"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_210e779b-aa5c-414b-8fd6-c2a2983030ce"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["apr29_unc6692_persistence_scheduled_task"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_210e779b-aa5c-414b-8fd6-c2a2983030ce/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_account_leaving_or_removed_from_organization"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2fe88cf9-48f1-4497-8ca6-b483ca4d9a2e"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_account_leaving_or_removed_from_organization"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2fe88cf9-48f1-4497-8ca6-b483ca4d9a2e/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_cloudtrail_logging_tampered"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_9ce2501a-f5ba-46da-8b1b-1f9e5c576ee9"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_cloudtrail_logging_tampered"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_9ce2501a-f5ba-46da-8b1b-1f9e5c576ee9/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_config_service_modified"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_1b1de253-1130-49b8-b627-eafebeb9934b"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_config_service_modified"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_1b1de253-1130-49b8-b627-eafebeb9934b/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_console_login_without_mfa"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2efbee7a-53fd-473a-a917-c9c6bce78314"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_console_login_without_mfa"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2efbee7a-53fd-473a-a917-c9c6bce78314/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_delete_cloudwatch_log_group"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_73467a4a-a822-4492-a145-abb118722088"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_delete_cloudwatch_log_group"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_73467a4a-a822-4492-a145-abb118722088/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_delete_vpc_flow_logs"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_7429133d-013d-4b76-904c-81747b269d07"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_delete_vpc_flow_logs"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_7429133d-013d-4b76-904c-81747b269d07/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_ec2_ami_or_snapshot_shared_publicly"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fce16f29-d677-4bc1-bdc8-03f60756ed48"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_ec2_ami_or_snapshot_shared_publicly"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fce16f29-d677-4bc1-bdc8-03f60756ed48/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_ec2_get_windows_admin_password"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_581b7d80-8fdc-4753-99ef-3e7f49b4d948"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_ec2_get_windows_admin_password"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_581b7d80-8fdc-4753-99ef-3e7f49b4d948/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_ec2_high_number_of_api_calls"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8f70594e-1ff7-41d2-bb03-ad1ebb3db58d"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_ec2_high_number_of_api_calls"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8f70594e-1ff7-41d2-bb03-ad1ebb3db58d/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_ec2_user_data_modified"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ef59670e-e068-4b67-b7d8-bbc1f0e38bed"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_ec2_user_data_modified"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ef59670e-e068-4b67-b7d8-bbc1f0e38bed/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_enable_disable_region"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_eae5dda9-18f8-4b94-95f1-f7d7a1d6ed74"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_enable_disable_region"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_eae5dda9-18f8-4b94-95f1-f7d7a1d6ed74/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_excessive_successful_discovery_events"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_a5eed308-79a0-482c-ae3f-8575aef6a73d"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_excessive_successful_discovery_events"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_a5eed308-79a0-482c-ae3f-8575aef6a73d/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_guardduty_black_hole_traffic_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_63aa8d31-4d3c-4f96-8a68-c5adf6bce0ce"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_guardduty_black_hole_traffic_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_63aa8d31-4d3c-4f96-8a68-c5adf6bce0ce/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_guardduty_brute_force_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_dde76e2b-98df-475f-9bf4-56d4cb0b5eb6"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_guardduty_brute_force_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_dde76e2b-98df-475f-9bf4-56d4cb0b5eb6/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_guardduty_command_and_control_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_734f0cfb-fa32-44f3-9ef4-8d747cd14dea"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_guardduty_command_and_control_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_734f0cfb-fa32-44f3-9ef4-8d747cd14dea/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_guardduty_crypto_currency_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_b04515bb-7cda-42d0-9a7e-c6e2c90adc45"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_guardduty_crypto_currency_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_b04515bb-7cda-42d0-9a7e-c6e2c90adc45/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_guardduty_denial_of_service_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d281fc51-3640-4f51-930f-e4a190b88e47"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_guardduty_denial_of_service_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d281fc51-3640-4f51-930f-e4a190b88e47/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_guardduty_dga_domain_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0f4833e0-736d-47f5-b6c7-e77a599b7e02"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_guardduty_dga_domain_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0f4833e0-736d-47f5-b6c7-e77a599b7e02/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_guardduty_disabled"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_cfa21690-268b-4bbe-b007-bae8720cef95"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_guardduty_disabled"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_cfa21690-268b-4bbe-b007-bae8720cef95/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_guardduty_malicious_or_suspicious_file_executed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d5ee4cfb-1f5e-4e4f-9182-3dcd2c797063"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_guardduty_malicious_or_suspicious_file_executed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d5ee4cfb-1f5e-4e4f-9182-3dcd2c797063/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_guardduty_penetration_testing_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e0d2cef1-add3-494c-b231-e4ae6f5570c1"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_guardduty_penetration_testing_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e0d2cef1-add3-494c-b231-e4ae6f5570c1/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_guardduty_publishing_destination_deleted"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_40784878-f0ca-4eea-8731-24248476ffb1"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_guardduty_publishing_destination_deleted"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_40784878-f0ca-4eea-8731-24248476ffb1/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_guardduty_tor_network_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_c4256165-f6d3-49f1-9a1a-78acd47a6746"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_guardduty_tor_network_activity_detected"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_c4256165-f6d3-49f1-9a1a-78acd47a6746/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_guardduty_trusted_or_threat_ip_lists_tampered"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f12f6235-bf96-4a55-8fa3-e71d07b69768"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_guardduty_trusted_or_threat_ip_lists_tampered"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f12f6235-bf96-4a55-8fa3-e71d07b69768/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_high_number_of_unknown_user_authentication_attempts"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_57addd40-0ef6-4e53-8c16-02fa134839db"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_high_number_of_unknown_user_authentication_attempts"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_57addd40-0ef6-4e53-8c16-02fa134839db/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_iam_access_denied_discovery_events"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_67e38400-2b7d-48fc-adc0-4b9d00da4028"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_iam_access_denied_discovery_events"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_67e38400-2b7d-48fc-adc0-4b9d00da4028/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_iam_activity_by_s3_browser_utility"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_15108806-1f94-4616-b57b-e02bb4edae29"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_iam_activity_by_s3_browser_utility"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_15108806-1f94-4616-b57b-e02bb4edae29/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_iam_activity_from_ec2_instance"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_558ed7f1-d42e-45a5-83ae-4fbcaf280f93"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_iam_activity_from_ec2_instance"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_558ed7f1-d42e-45a5-83ae-4fbcaf280f93/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_iam_administrator_access_policy_attached"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_171aa088-adde-470d-ba14-b9d235a6b89d"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_iam_administrator_access_policy_attached"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_171aa088-adde-470d-ba14-b9d235a6b89d/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_iam_compromised_key_quarantine_policy_attached"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_3a8db66b-e51d-43bf-b6f3-9bc38ccd2929"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_iam_compromised_key_quarantine_policy_attached"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_3a8db66b-e51d-43bf-b6f3-9bc38ccd2929/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_kms_key_disabled_or_scheduled_for_deletion"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_5054819d-e7c9-4f78-91de-4d7137e5a501"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_kms_key_disabled_or_scheduled_for_deletion"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_5054819d-e7c9-4f78-91de-4d7137e5a501/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_lambda_update_function_code"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_172aacd9-e11c-4a07-955a-3687eb10f86b"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_lambda_update_function_code"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_172aacd9-e11c-4a07-955a-3687eb10f86b/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_lateral_movement_using_iam_session_token"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_392b4361-a36d-4de8-8fdc-fd731fa2795b"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_lateral_movement_using_iam_session_token"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_392b4361-a36d-4de8-8fdc-fd731fa2795b/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_multi_factor_authentication_disabled"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_4aa37f19-dc21-4c24-9fb0-8d35cf2e4368"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_multi_factor_authentication_disabled"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_4aa37f19-dc21-4c24-9fb0-8d35cf2e4368/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_new_mfa_method_registered_for_user"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_31958bd3-e588-4ec0-88fd-e28898af1d5d"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_new_mfa_method_registered_for_user"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_31958bd3-e588-4ec0-88fd-e28898af1d5d/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_password_policy_change"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_6a0da15b-d14f-4373-a36f-6daaf53516e0"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_password_policy_change"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_6a0da15b-d14f-4373-a36f-6daaf53516e0/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_privilege_escalation_using_iam_access_key"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2f364b6f-677e-4bac-bdc9-2a407c0bfd23"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_privilege_escalation_using_iam_access_key"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2f364b6f-677e-4bac-bdc9-2a407c0bfd23/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_privilege_escalation_using_iam_login_profile"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fa714c3b-dbea-47f5-8954-ff90d3a60b97"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_privilege_escalation_using_iam_login_profile"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fa714c3b-dbea-47f5-8954-ff90d3a60b97/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_rds_snapshot_shared_publicly"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_7b6c8472-65a0-4183-9b7d-9cc4ee93700f"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_rds_snapshot_shared_publicly"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_7b6c8472-65a0-4183-9b7d-9cc4ee93700f/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_s3_made_public_by_acl"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_567dabba-f315-473b-bbd4-2fe097f5e1df"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_s3_made_public_by_acl"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_567dabba-f315-473b-bbd4-2fe097f5e1df/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_s3_public_access_block_removed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_366e379b-3000-497d-8715-2baae6c38aad"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_s3_public_access_block_removed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_366e379b-3000-497d-8715-2baae6c38aad/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_saml_identity_provider_changes"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_291db93b-a3e9-48bf-93f9-598f04c307e5"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_saml_identity_provider_changes"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_291db93b-a3e9-48bf-93f9-598f04c307e5/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_security_group_open_to_world"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_5df1aa67-2921-447d-944f-f7926b429223"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_security_group_open_to_world"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_5df1aa67-2921-447d-944f-f7926b429223/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_ses_service_modification"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_c9550932-22d4-4fd7-8586-8df226d4e183"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_ses_service_modification"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_c9550932-22d4-4fd7-8586-8df226d4e183/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_successful_api_from_tor_exit_node"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ccca9b65-eaaa-4bad-a529-b50292f375eb"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_successful_api_from_tor_exit_node"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ccca9b65-eaaa-4bad-a529-b50292f375eb/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_successful_console_authentication_from_multiple_ips"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_069c8588-c14b-4e6b-90d8-449013bfcaac"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_successful_console_authentication_from_multiple_ips"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_069c8588-c14b-4e6b-90d8-449013bfcaac/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_successful_login_after_multiple_failed_attempts"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_9af78414-6c94-4f72-aa70-fc135d975061"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_successful_login_after_multiple_failed_attempts"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_9af78414-6c94-4f72-aa70-fc135d975061/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_unusual_number_of_failed_authentications_from_the_same_ip"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_1ce47af9-509e-42c7-a626-9c929a33b6e0"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_unusual_number_of_failed_authentications_from_the_same_ip"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_1ce47af9-509e-42c7-a626-9c929a33b6e0/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["aws_user_creates_permenant_access_key"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_81990bae-09ff-4a92-895f-0a2f04ab89d6"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["aws_user_creates_permenant_access_key"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_81990bae-09ff-4a92-895f-0a2f04ab89d6/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["brute_force"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_4f55cf08-6ce4-4526-b833-7a95ea214760"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["brute_force"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_4f55cf08-6ce4-4526-b833-7a95ea214760/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["cicd_test"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_6ada9e0a-28c7-4f6e-a6d6-fea3ad5bce05"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["cicd_test"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_6ada9e0a-28c7-4f6e-a6d6-fea3ad5bce05/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["claroty_mode_change_stop"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_52286016-f663-40e6-9f0c-bff020691153"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["claroty_mode_change_stop"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_52286016-f663-40e6-9f0c-bff020691153/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["claroty_outdated_firmware"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ce479a11-35c6-4e87-a7b7-88a3199243bd"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["claroty_outdated_firmware"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ce479a11-35c6-4e87-a7b7-88a3199243bd/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_Chrome_Browser_Alert_SideLoaded_Extensions"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_79d320b9-2465-45e7-8dd3-303035c25c37"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_Chrome_Browser_Alert_SideLoaded_Extensions"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_79d320b9-2465-45e7-8dd3-303035c25c37/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_Chrome_Browser_DLP_Alert_Paste_Content"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_3fdd0d14-a3f1-418d-ae1e-b4e735e4b37d"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_Chrome_Browser_DLP_Alert_Paste_Content"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_3fdd0d14-a3f1-418d-ae1e-b4e735e4b37d/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_Chrome_Browser_DLP_File_Transfer_Alert"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e4dcd030-092c-491c-9d8a-2573ae2d7374"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_Chrome_Browser_DLP_File_Transfer_Alert"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e4dcd030-092c-491c-9d8a-2573ae2d7374/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_HMS_CatchAll"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_98ad2771-77d0-4530-b32a-009b90c58ad0"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_HMS_CatchAll"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_98ad2771-77d0-4530-b32a-009b90c58ad0/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_PROMPTFLUX_Composite_Thinking_Robot"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_374d5752-4398-4506-ba28-3cd4447900c5"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_PROMPTFLUX_Composite_Thinking_Robot"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_374d5752-4398-4506-ba28-3cd4447900c5/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_Suspicious_Wscript_Dropper_Spreader"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_24f9e41d-4b75-4403-851e-60d79c95b494"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_Suspicious_Wscript_Dropper_Spreader"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_24f9e41d-4b75-4403-851e-60d79c95b494/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_cryptocurrency_mining_yara"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_988a025a-d267-4aff-ab30-8deedb4065f1"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_cryptocurrency_mining_yara"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_988a025a-d267-4aff-ab30-8deedb4065f1/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_mandiant_asm_confirmed_cve_alert"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e28c97e9-e664-42d4-a857-f73392afeb3c"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_mandiant_asm_confirmed_cve_alert"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e28c97e9-e664-42d4-a857-f73392afeb3c/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_safebrowsing_file_creation"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_163500c0-ba95-43b6-93a0-82533d65e744"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_safebrowsing_file_creation"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_163500c0-ba95-43b6-93a0-82533d65e744/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_suspicious_auth_unusual_interval_time"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_13356088-c96a-4d22-b719-8c869553b7c5"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_suspicious_auth_unusual_interval_time"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_13356088-c96a-4d22-b719-8c869553b7c5/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_suspicious_auth_unusual_interval_time2"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_44e1c382-4537-4857-a20f-869a24739c52"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_suspicious_auth_unusual_interval_time2"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_44e1c382-4537-4857-a20f-869a24739c52/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_suspicious_auth_unusual_interval_time_v2"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0cb52235-c74d-4b6c-bec6-2dc976aaddbc"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_suspicious_auth_unusual_interval_time_v2"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0cb52235-c74d-4b6c-bec6-2dc976aaddbc/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_user_download_executable_from_macro"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ba8348c0-2eb1-45d0-bc6e-c9aca29559f6"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_user_download_executable_from_macro"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ba8348c0-2eb1-45d0-bc6e-c9aca29559f6/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["demoverse_workspace_MalwareDownload"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_53420b6c-6d72-4513-8073-b07330b6d210"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["demoverse_workspace_MalwareDownload"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_53420b6c-6d72-4513-8073-b07330b6d210/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["dns_query_to_recently_created_domain"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e1c228ee-896f-4ffd-867a-0fde1895a53a"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["dns_query_to_recently_created_domain"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e1c228ee-896f-4ffd-867a-0fde1895a53a/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["domain_prevalence"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_535c5efd-4b74-451c-a1df-fb9ecb52cf33"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["domain_prevalence"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_535c5efd-4b74-451c-a1df-fb9ecb52cf33/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["gcp_ngfw_denied_external_connections"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_cdbb9853-b705-470d-bf4d-04253aae4359"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["gcp_ngfw_denied_external_connections"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_cdbb9853-b705-470d-bf4d-04253aae4359/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["gcp_ngfw_enterprise_threats"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_3b18a172-c3c5-4755-b390-6e1685fd3552"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["gcp_ngfw_enterprise_threats"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_3b18a172-c3c5-4755-b390-6e1685fd3552/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["gcti_benign_binaries_contacts_tor_exit_node"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_826a4263-fb6f-4082-8cec-c3c26089d7df"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["gcti_benign_binaries_contacts_tor_exit_node"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_826a4263-fb6f-4082-8cec-c3c26089d7df/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["gcti_remote_access_tools"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_1e6885dc-68cc-453e-aab5-b8df1b669a04"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["gcti_remote_access_tools"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_1e6885dc-68cc-453e-aab5-b8df1b669a04/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["gcti_tor_exit_nodes"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2e628934-034c-455f-bfed-fad4ebe20f20"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["gcti_tor_exit_nodes"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2e628934-034c-455f-bfed-fad4ebe20f20/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["gemini_rule_host_scan"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_cbc90c7c-a4be-4859-bf60-39b7ce3c9865"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["gemini_rule_host_scan"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_cbc90c7c-a4be-4859-bf60-39b7ce3c9865/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["gemini_rule_port_scan"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d8d4145d-cff3-45b9-b8f8-e86a81784e2d"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["gemini_rule_port_scan"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d8d4145d-cff3-45b9-b8f8-e86a81784e2d/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["geoip_user_login_from_multiple_states_or_countries"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_46b63dc1-8790-4e0b-8f67-d7574e5ba723"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["geoip_user_login_from_multiple_states_or_countries"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_46b63dc1-8790-4e0b-8f67-d7574e5ba723/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_access_granted_to_personal_access_token_followed_by_high_number_of_cloned_non_public_repositories"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_111e5244-9f80-46b9-a1f5-8ec90fbb70ec"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_access_granted_to_personal_access_token_followed_by_high_number_of_cloned_non_public_repositories"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_111e5244-9f80-46b9-a1f5-8ec90fbb70ec/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_application_installed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0273c406-941c-40b7-99b4-bb0e36f67eea"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_application_installed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0273c406-941c-40b7-99b4-bb0e36f67eea/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_dependabot_vulnerability_alerts_disabled"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_491fd988-8bc8-47af-abb9-af4a6f4ad1e6"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_dependabot_vulnerability_alerts_disabled"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_491fd988-8bc8-47af-abb9-af4a6f4ad1e6/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_enterprise_audit_log_stream_destroyed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_cbe55129-51fc-4ab2-b38d-d005d50bb2cd"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_enterprise_audit_log_stream_destroyed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_cbe55129-51fc-4ab2-b38d-d005d50bb2cd/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_enterprise_audit_log_stream_modified"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0803c548-1b79-461e-b333-d8d91b513c10"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_enterprise_audit_log_stream_modified"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0803c548-1b79-461e-b333-d8d91b513c10/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_enterprise_deleted"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_a365e36a-0e4e-40ac-a69d-cd7ea786f196"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_enterprise_deleted"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_a365e36a-0e4e-40ac-a69d-cd7ea786f196/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_enterprise_or_organization_recovery_codes_activity"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2e846210-e23e-4e4b-bad4-ca8ed2d58a46"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_enterprise_or_organization_recovery_codes_activity"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2e846210-e23e-4e4b-bad4-ca8ed2d58a46/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_high_number_of_non_public_github_repositories_cloned"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fb148501-1909-409e-8c25-a51ffb262804"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_high_number_of_non_public_github_repositories_cloned"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fb148501-1909-409e-8c25-a51ffb262804/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_high_number_of_non_public_github_repositories_downloaded"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2b951792-b389-4577-8612-669a157163cc"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_high_number_of_non_public_github_repositories_downloaded"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2b951792-b389-4577-8612-669a157163cc/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_invitation_sent_to_non_company_email_domain"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_eee50b7c-d2a1-4667-a122-78f99cc40883"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_invitation_sent_to_non_company_email_domain"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_eee50b7c-d2a1-4667-a122-78f99cc40883/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_oauth_application_access_restrictions_disabled"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_66300b3b-9dca-4c0d-9095-7ff58ea6e800"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_oauth_application_access_restrictions_disabled"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_66300b3b-9dca-4c0d-9095-7ff58ea6e800/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_organization_removed_from_enterprise"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_bc42c387-f357-403f-bbb9-9273ae5f44fd"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_organization_removed_from_enterprise"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_bc42c387-f357-403f-bbb9-9273ae5f44fd/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_outgoing_organization_transfer_initiated"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2fb53592-536e-482a-8fdc-cecc4d368517"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_outgoing_organization_transfer_initiated"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2fb53592-536e-482a-8fdc-cecc4d368517/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_outgoing_repository_transfer_initiated"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_78556f84-f163-4b1f-86c4-33643249f2cf"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_outgoing_repository_transfer_initiated"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_78556f84-f163-4b1f-86c4-33643249f2cf/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_personal_access_token_auto_approve_policy_modified"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e06325a2-fa61-4109-95d0-abcfc42b18b2"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_personal_access_token_auto_approve_policy_modified"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e06325a2-fa61-4109-95d0-abcfc42b18b2/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_personal_access_token_created_from_tor_ip_address"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_6a6a9962-9c24-423e-a27a-6b83e50692f5"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_personal_access_token_created_from_tor_ip_address"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_6a6a9962-9c24-423e-a27a-6b83e50692f5/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_repository_archived_or_deleted"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_419640fb-7142-4485-8495-f94514e0fb31"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_repository_archived_or_deleted"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_419640fb-7142-4485-8495-f94514e0fb31/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_repository_branch_protection_rules_disabled"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_70bd1556-244e-4b9f-8fd2-772d0c96dbf0"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_repository_branch_protection_rules_disabled"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_70bd1556-244e-4b9f-8fd2-772d0c96dbf0/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_repository_deploy_key_created_or_modified"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_150a63ad-d0d0-4da1-8661-4baf71cb7355"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_repository_deploy_key_created_or_modified"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_150a63ad-d0d0-4da1-8661-4baf71cb7355/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_repository_visibility_changed_to_public"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fe7d4e58-34e1-47dd-9133-3a4beaeada18"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_repository_visibility_changed_to_public"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fe7d4e58-34e1-47dd-9133-3a4beaeada18/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_secret_scanning_alert"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_17162997-4232-4eb8-b5c8-90deb713d323"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_secret_scanning_alert"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_17162997-4232-4eb8-b5c8-90deb713d323/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_secret_scanning_disabled_or_bypassed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_7a708c0a-9022-4617-a82e-26f5fb2b06cf"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_secret_scanning_disabled_or_bypassed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_7a708c0a-9022-4617-a82e-26f5fb2b06cf/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_sso_configuration_modified"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_035645c9-604b-41b1-9321-274351757710"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_sso_configuration_modified"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_035645c9-604b-41b1-9321-274351757710/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_two_factor_authentication_requirement_disabled"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_4e36175c-cee9-4973-8ec8-b697eeaa8701"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_two_factor_authentication_requirement_disabled"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_4e36175c-cee9-4973-8ec8-b697eeaa8701/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_user_blocked_from_accessing_organization_repositories"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_6bf3231a-79d5-466a-8ce2-81ef65a90765"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_user_blocked_from_accessing_organization_repositories"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_6bf3231a-79d5-466a-8ce2-81ef65a90765/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["github_user_unblocked_from_accessing_organization_repositories"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8fc49ab2-320b-438d-8e95-587f9c18b097"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["github_user_unblocked_from_accessing_organization_repositories"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8fc49ab2-320b-438d-8e95-587f9c18b097/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["google_safebrowsing_file_contacts_tor_exit_node"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_98fd2a54-1582-479e-8d5e-c55182cb0ac2"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["google_safebrowsing_file_contacts_tor_exit_node"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_98fd2a54-1582-479e-8d5e-c55182cb0ac2/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["google_safebrowsing_file_process_creation"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f4e40bde-29a7-402e-9002-e405b9667fd8"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["google_safebrowsing_file_process_creation"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f4e40bde-29a7-402e-9002-e405b9667fd8/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["google_safebrowsing_with_prevalence"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_c920ebba-f7a5-410e-b0b3-078d59bfc1f3"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["google_safebrowsing_with_prevalence"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_c920ebba-f7a5-410e-b0b3-078d59bfc1f3/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["hash_prevalence"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fd1bafe4-6427-4466-aebb-4c704c1efacf"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["hash_prevalence"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fd1bafe4-6427-4466-aebb-4c704c1efacf/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["high_risk_user_download_executable_from_macro"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_3007133a-189f-44dc-a804-26b52f18d4ff"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["high_risk_user_download_executable_from_macro"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_3007133a-189f-44dc-a804-26b52f18d4ff/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["high_severity_ids_activity_by_branch"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2142ab97-462b-4446-af8c-384214975052"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["high_severity_ids_activity_by_branch"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2142ab97-462b-4446-af8c-384214975052/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["impacket_wmiexec_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_b363643a-50a0-4545-af36-2d6f54f92493"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["impacket_wmiexec_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_b363643a-50a0-4545-af36-2d6f54f92493/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["info_bat"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_33cf0312-03b1-46e0-afa3-5bb8783d3ae7"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["info_bat"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_33cf0312-03b1-46e0-afa3-5bb8783d3ae7/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["ioc_domain_C2"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e03a5920-12a7-40c8-9b1c-4efc2b6a2fca"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["ioc_domain_C2"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e03a5920-12a7-40c8-9b1c-4efc2b6a2fca/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["ioc_domain_internal_policy"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d7818f70-1058-43a1-977b-37a433d4ed3f"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["ioc_domain_internal_policy"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d7818f70-1058-43a1-977b-37a433d4ed3f/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["ioc_hash_prevalence"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2870810e-92d0-43ab-b347-5286d376ddd6"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["ioc_hash_prevalence"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2870810e-92d0-43ab-b347-5286d376ddd6/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["ioc_ip_target"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_704d5996-7545-4b96-9575-2f882cd663d2"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["ioc_ip_target"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_704d5996-7545-4b96-9575-2f882cd663d2/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["ioc_sha256_hash"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_9036e0af-0071-4355-ae80-2a2758d206f9"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["ioc_sha256_hash"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_9036e0af-0071-4355-ae80-2a2758d206f9/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["ioc_sha256_hash_vt"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_829cb986-a8fa-4ff0-902b-60cae1c1a14d"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["ioc_sha256_hash_vt"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_829cb986-a8fa-4ff0-902b-60cae1c1a14d/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["ip_target_prevalence"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_74d088b1-370a-4030-9e60-b2139b0e16fa"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["ip_target_prevalence"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_74d088b1-370a-4030-9e60-b2139b0e16fa/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["logins_from_terminated_employees"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ceb815df-a177-426a-b028-1f12018ddb47"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["logins_from_terminated_employees"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ceb815df-a177-426a-b028-1f12018ddb47/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["low_prevalence_hash_on_process_launch_low_prevalence_domain_accessed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_68b9f507-137b-48cd-bbff-d094f03513ae"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["low_prevalence_hash_on_process_launch_low_prevalence_domain_accessed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_68b9f507-137b-48cd-bbff-d094f03513ae/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["malicious_domain"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_44153a6f-b12f-4a74-8422-eda609e69449"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["malicious_domain"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_44153a6f-b12f-4a74-8422-eda609e69449/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["malware_win_lokibot_c2"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_a41502f7-7ac4-42c0-bc55-a86158a62233"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["malware_win_lokibot_c2"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_a41502f7-7ac4-42c0-bc55-a86158a62233/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["mitre_attack_T1021_002_windows_admin_share_basic"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_cb257f5c-f367-4e24-ac7b-3b15742fbb31"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["mitre_attack_T1021_002_windows_admin_share_basic"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_cb257f5c-f367-4e24-ac7b-3b15742fbb31/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["mitre_attack_T1021_002_windows_admin_share_with_asset_entity"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_df625fe0-10e4-4a1c-a8ca-43d55d7cdba1"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["mitre_attack_T1021_002_windows_admin_share_with_asset_entity"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_df625fe0-10e4-4a1c-a8ca-43d55d7cdba1/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["mitre_attack_T1021_002_windows_admin_share_with_user_enrichment"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_94e6033f-feb2-451a-bf1d-7e882c1942c1"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["mitre_attack_T1021_002_windows_admin_share_with_user_enrichment"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_94e6033f-feb2-451a-bf1d-7e882c1942c1/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["mitre_attack_T1021_002_windows_admin_share_with_user_entity"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_80ea18b8-fb6d-4bc7-9d8d-267e9573e088"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["mitre_attack_T1021_002_windows_admin_share_with_user_entity"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_80ea18b8-fb6d-4bc7-9d8d-267e9573e088/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["mitre_attack_T1053_005_windows_creation_of_scheduled_task"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_655c700e-9303-4d4f-b417-f8721ee37c58"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["mitre_attack_T1053_005_windows_creation_of_scheduled_task"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_655c700e-9303-4d4f-b417-f8721ee37c58/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["mitre_attack_T1140_encoded_powershell_command"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ee8e3475-79c2-4835-a581-07afeffdf461"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["mitre_attack_T1140_encoded_powershell_command"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ee8e3475-79c2-4835-a581-07afeffdf461/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["mitre_attack_T1570_suspicious_command_psexec"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_33ba431e-1c6e-4ce8-a501-0c4fe6761801"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["mitre_attack_T1570_suspicious_command_psexec"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_33ba431e-1c6e-4ce8-a501-0c4fe6761801/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["network_connection_first_seen_in_past_day"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_7f022a35-3024-4b66-93b3-6fcbbafac2db"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["network_connection_first_seen_in_past_day"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_7f022a35-3024-4b66-93b3-6fcbbafac2db/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["network_http_low_prevalence_domain_access"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d4254989-b1c1-498c-aaed-be0c3ff3546b"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["network_http_low_prevalence_domain_access"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d4254989-b1c1-498c-aaed-be0c3ff3546b/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["network_traffic_to_specific_country"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_22bc62fb-fc9b-4d2b-9cd8-5c383f9bad38"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["network_traffic_to_specific_country"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_22bc62fb-fc9b-4d2b-9cd8-5c383f9bad38/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["non_prod_arg_unc3944_cli_13"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8bf85ba8-a373-4898-9424-f6953964491e"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["non_prod_arg_unc3944_cli_13"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8bf85ba8-a373-4898-9424-f6953964491e/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["non_prod_arg_unc3944_cli_22"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d96f3d37-3407-4a04-b269-d3fd2b822c43"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["non_prod_arg_unc3944_cli_22"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d96f3d37-3407-4a04-b269-d3fd2b822c43/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["non_prod_arg_unc3944_cli_3"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_4b27bda4-00ef-4242-976d-a67cc1cfaf71"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["non_prod_arg_unc3944_cli_3"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_4b27bda4-00ef-4242-976d-a67cc1cfaf71/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["o365_ADPowerShell_app_login_subsequent_activity"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ab74cc46-e008-4230-912f-94a11d25855d"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["o365_ADPowerShell_app_login_subsequent_activity"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ab74cc46-e008-4230-912f-94a11d25855d/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["o365_entra_id_app_permissions_percent_threshold_exceeded"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_93c865fd-005c-49c2-8e1c-588b89732427"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["o365_entra_id_app_permissions_percent_threshold_exceeded"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_93c865fd-005c-49c2-8e1c-588b89732427/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["o365_entra_id_app_permissions_threshold_exceeded"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d03f78a1-1855-4df3-b8fc-b3e84662aede"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["o365_entra_id_app_permissions_threshold_exceeded"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d03f78a1-1855-4df3-b8fc-b3e84662aede/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["o365_entra_id_application_creation"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f21c1a61-93cd-4e1f-adfc-59f0a46332d9"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["o365_entra_id_application_creation"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f21c1a61-93cd-4e1f-adfc-59f0a46332d9/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["o365_entra_id_client_secret_add_update_delete_in_app"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8e6fd711-837e-4388-8aac-3e40dbed4833"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["o365_entra_id_client_secret_add_update_delete_in_app"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8e6fd711-837e-4388-8aac-3e40dbed4833/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["o365_login_activity_to_azure_ad_powershell_app"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_753e926e-a437-485a-9b8a-7574c6d89b16"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["o365_login_activity_to_azure_ad_powershell_app"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_753e926e-a437-485a-9b8a-7574c6d89b16/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["o365_onedrive_anonymous_filedownload"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_c2d2850d-981e-48bf-a59f-537bac77759e"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["o365_onedrive_anonymous_filedownload"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_c2d2850d-981e-48bf-a59f-537bac77759e/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["o365_onedrive_anonymous_link_accessed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e1696f70-4b8b-44b6-b808-4492a00e27ea"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["o365_onedrive_anonymous_link_accessed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e1696f70-4b8b-44b6-b808-4492a00e27ea/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["o365_onedrive_anonymous_link_created_updated"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_c2fb3297-6c73-4fc8-ac3b-27eb0bd2df7e"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["o365_onedrive_anonymous_link_created_updated"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_c2fb3297-6c73-4fc8-ac3b-27eb0bd2df7e/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["o365_persistent_login_activity_to_azure_ADPowerShell_app"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f6c4ae60-a2f7-4e61-9b2d-fbece8f07bf9"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["o365_persistent_login_activity_to_azure_ADPowerShell_app"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f6c4ae60-a2f7-4e61-9b2d-fbece8f07bf9/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["o365_recently_created_entra_id_user_assigned_roles"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_04a09515-51ad-494b-b8f0-4f62df46aa65"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["o365_recently_created_entra_id_user_assigned_roles"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_04a09515-51ad-494b-b8f0-4f62df46aa65/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_mfa_brute_force_attack"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_1ae129d0-dc18-4b95-947e-4d8ac956b700"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_mfa_brute_force_attack"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_1ae129d0-dc18-4b95-947e-4d8ac956b700/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_mismatch_between_source_and_response_for_verify_push_request"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8d6952ab-035e-4b09-874d-bef39108d913"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_mismatch_between_source_and_response_for_verify_push_request"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8d6952ab-035e-4b09-874d-bef39108d913/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_multiple_failed_requests_to_access_applications"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_77c37fab-1823-426b-9390-a3499c254014"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_multiple_failed_requests_to_access_applications"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_77c37fab-1823-426b-9390-a3499c254014/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_multiple_users_logins_with_invalid_credentials_from_the_same_ip"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_34a77b5c-f09c-489b-a290-d7189e348bc7"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_multiple_users_logins_with_invalid_credentials_from_the_same_ip"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_34a77b5c-f09c-489b-a290-d7189e348bc7/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_new_api_token_created"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_1adff995-2370-4b8d-b924-d8f195c3d23b"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_new_api_token_created"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_1adff995-2370-4b8d-b924-d8f195c3d23b/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_phishing_detection_with_fastpass_origin_check"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_5eaf9fb0-8371-49cc-9b8d-d2e62e20d1f8"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_phishing_detection_with_fastpass_origin_check"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_5eaf9fb0-8371-49cc-9b8d-d2e62e20d1f8/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_successful_high_risk_user_logins"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_4a4ffe98-34fa-443a-ad56-e6ce9bb4bbb3"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_successful_high_risk_user_logins"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_4a4ffe98-34fa-443a-ad56-e6ce9bb4bbb3/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_suspicious_use_of_a_session_cookie"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f73ac24b-8d66-472c-8da0-4f19999bb20b"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_suspicious_use_of_a_session_cookie"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f73ac24b-8d66-472c-8da0-4f19999bb20b/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_threatinsight_login_failure_with_high_unknown_users"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_97c278ef-8f49-4c8a-bd79-fd855c6abc8f"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_threatinsight_login_failure_with_high_unknown_users"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_97c278ef-8f49-4c8a-bd79-fd855c6abc8f/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_threatinsight_suspected_brute_force_attack"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0362d32b-ef85-4c1a-a05a-c3fef483442a"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_threatinsight_suspected_brute_force_attack"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0362d32b-ef85-4c1a-a05a-c3fef483442a/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_threatinsight_suspected_password_spray_attack"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d42e93cb-7ebe-43d1-86c0-44da31f7bb93"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_threatinsight_suspected_password_spray_attack"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d42e93cb-7ebe-43d1-86c0-44da31f7bb93/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_threatinsight_targeted_brute_force_attack"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_896983ba-ac5f-4b63-aa65-2eb50b20838b"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_threatinsight_targeted_brute_force_attack"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_896983ba-ac5f-4b63-aa65-2eb50b20838b/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_user_account_lockout"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0b51b3ab-f648-42a2-b576-7ad9bbc7bbb1"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_user_account_lockout"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0b51b3ab-f648-42a2-b576-7ad9bbc7bbb1/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_user_failed_number_challenge_during_push_notification"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_98a47801-005c-47ed-af0f-f9fbfb99b816"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_user_failed_number_challenge_during_push_notification"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_98a47801-005c-47ed-af0f-f9fbfb99b816/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_user_login_out_of_hours"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_6cc5b1af-6f5a-4938-935a-706a9b8d4c27"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_user_login_out_of_hours"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_6cc5b1af-6f5a-4938-935a-706a9b8d4c27/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_user_logins_from_multiple_cities"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f36b698d-66bb-4774-b213-6c5fecd439eb"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_user_logins_from_multiple_cities"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f36b698d-66bb-4774-b213-6c5fecd439eb/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_user_rejected_multiple_push_notifications"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_cd7330f0-eccf-459a-99d4-44c7a018f27c"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_user_rejected_multiple_push_notifications"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_cd7330f0-eccf-459a-99d4-44c7a018f27c/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["okta_user_suspicious_activity_reported"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e9e3e419-5705-4d39-b86e-0a3cf3256a1d"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["okta_user_suspicious_activity_reported"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e9e3e419-5705-4d39-b86e-0a3cf3256a1d/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["phishing_from_pp"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_9895ddec-bc3e-48d4-8cc4-f426158f9d71"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["phishing_from_pp"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_9895ddec-bc3e-48d4-8cc4-f426158f9d71/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["port_proxy_forwarding_T1090_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0f735490-c1e2-4fd2-a601-33355ed4b136"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["port_proxy_forwarding_T1090_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_0f735490-c1e2-4fd2-a601-33355ed4b136/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["process_launch_vt_enrichment"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_42472a60-2f2d-4839-8495-0a79bcaa78f8"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["process_launch_vt_enrichment"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_42472a60-2f2d-4839-8495-0a79bcaa78f8/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["recon_credential_theft_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_61908ba7-6aed-49fe-8449-70fd73ba1bb4"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["recon_credential_theft_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_61908ba7-6aed-49fe-8449-70fd73ba1bb4/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["recon_environment_enumeration_active_directory_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_83d98501-8523-4a39-bf91-d88e365881cb"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["recon_environment_enumeration_active_directory_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_83d98501-8523-4a39-bf91-d88e365881cb/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["recon_environment_enumeration_network_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d7c0c0f2-7429-479e-b876-8e777117ee0f"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["recon_environment_enumeration_network_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d7c0c0f2-7429-479e-b876-8e777117ee0f/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["recon_environment_enumeration_system_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_9f00e1db-e76f-4a9d-9846-447a1df81d24"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["recon_environment_enumeration_system_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_9f00e1db-e76f-4a9d-9846-447a1df81d24/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["recon_successful_logon_enumeration_powershell_T1033_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f23f8af3-85d7-43aa-9898-940eda2f959f"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["recon_successful_logon_enumeration_powershell_T1033_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f23f8af3-85d7-43aa-9898-940eda2f959f/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["recon_suspicious_commands_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_92135173-b6af-4a99-b09b-f2b17eb28153"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["recon_suspicious_commands_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_92135173-b6af-4a99-b09b-f2b17eb28153/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["rule_generic_brute_force"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_bda864ce-8020-4595-81db-a3949cec5fac"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["rule_generic_brute_force"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_bda864ce-8020-4595-81db-a3949cec5fac/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["rule_name_xyz"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fd5c09e2-8e52-4e01-ad7b-ca535b2644ee"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["rule_name_xyz"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_fd5c09e2-8e52-4e01-ad7b-ca535b2644ee/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["rw_mimikatz_T1003"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_13683044-fe5a-44e1-90aa-43ba2e7b2ecb"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["rw_mimikatz_T1003"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_13683044-fe5a-44e1-90aa-43ba2e7b2ecb/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["rw_windows_password_spray_T1110_003"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_1f3eee7e-5f55-476a-b8d9-c136371b6f7d"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["rw_windows_password_spray_T1110_003"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_1f3eee7e-5f55-476a-b8d9-c136371b6f7d/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["safebrowsing_process_creation_hashes_seen_more_than_7_days"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_b64b1714-63bf-44da-b21f-a3d295eb08b4"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["safebrowsing_process_creation_hashes_seen_more_than_7_days"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_b64b1714-63bf-44da-b21f-a3d295eb08b4/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["ssh_bruteforce"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ac255817-d555-4552-86cc-f771a06d2aea"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["ssh_bruteforce"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_ac255817-d555-4552-86cc-f771a06d2aea/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["suspicious_asn"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_7d1ac4ee-76a6-4418-9261-da06060995f8"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["suspicious_asn"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_7d1ac4ee-76a6-4418-9261-da06060995f8/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["suspicious_auth_unusual_interval_time_v3"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_3e0f4436-403f-4b97-a75e-0da1a9638ae0"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["suspicious_auth_unusual_interval_time_v3"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_3e0f4436-403f-4b97-a75e-0da1a9638ae0/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["suspicious_download_office"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_282819e7-77cd-474e-ba6a-94e19a376366"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["suspicious_download_office"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_282819e7-77cd-474e-ba6a-94e19a376366/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["suspicious_unusual_location_lnk_file"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_993f692f-10df-4926-a152-2584bb536696"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["suspicious_unusual_location_lnk_file"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_993f692f-10df-4926-a152-2584bb536696/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["test_whoami"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_56a47150-d900-4430-af3f-d5a0bbcc2ad0"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["test_whoami"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_56a47150-d900-4430-af3f-d5a0bbcc2ad0/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["test_whoami_normal"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_358087ea-804b-4142-92c4-47d5ae3168d5"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["test_whoami_normal"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_358087ea-804b-4142-92c4-47d5ae3168d5/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["ttp_chrome_admin_password_reused"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8b221fc3-cef3-4860-943a-0e5629fe3fb7"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["ttp_chrome_admin_password_reused"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8b221fc3-cef3-4860-943a-0e5629fe3fb7/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["vt_relationships_file_contacts_domain"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_46b02729-479e-423e-a070-f5cf0154f98d"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["vt_relationships_file_contacts_domain"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_46b02729-479e-423e-a070-f5cf0154f98d/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["vt_relationships_file_contacts_ip"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_5fdfb3ca-b303-4518-806a-1aef118a5d1d"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["vt_relationships_file_contacts_ip"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_5fdfb3ca-b303-4518-806a-1aef118a5d1d/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["vt_relationships_file_contacts_tor_ip"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_96d87264-b002-4717-b0bc-fc2364d03e93"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["vt_relationships_file_contacts_tor_ip"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_96d87264-b002-4717-b0bc-fc2364d03e93/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["vt_relationships_file_downloaded_from_ip"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e045c0fd-3762-4a81-88de-656b3339ca76"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["vt_relationships_file_downloaded_from_ip"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e045c0fd-3762-4a81-88de-656b3339ca76/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["vt_relationships_file_downloaded_from_url"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_01e0fb46-3f91-429a-86c5-753ae97fcfde"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["vt_relationships_file_downloaded_from_url"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_01e0fb46-3f91-429a-86c5-753ae97fcfde/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["vt_relationships_file_executes_file"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_a68299da-4ef6-44f4-bf55-367155033c00"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["vt_relationships_file_executes_file"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_a68299da-4ef6-44f4-bf55-367155033c00/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["whoami_execution"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8b948a4e-b36d-4d48-b641-4e6bef4c88fb"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["whoami_execution"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_8b948a4e-b36d-4d48-b641-4e6bef4c88fb/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["whois_dns_query_to_typosquatting_domain"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_b2b59bdc-decf-4849-abdf-37b6eb342759"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["whois_dns_query_to_typosquatting_domain"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_b2b59bdc-decf-4849-abdf-37b6eb342759/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["whois_expired_domain_accessed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_4f0fd5ab-998f-4355-b172-489dd4c9e275"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["whois_expired_domain_accessed"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_4f0fd5ab-998f-4355-b172-489dd4c9e275/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["whois_expired_domain_executable_downloaded"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e03021d8-0c62-454c-aede-54ad45503473"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["whois_expired_domain_executable_downloaded"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_e03021d8-0c62-454c-aede-54ad45503473/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["whois_recently_created_domain_access"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d8c79659-d46a-45b2-8eec-a0efa14b6247"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["whois_recently_created_domain_access"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_d8c79659-d46a-45b2-8eec-a0efa14b6247/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["win_repeatedAuthFailure_thenSuccess_T1110_001"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_abd564f8-cafa-4383-9601-14be03331dec"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["win_repeatedAuthFailure_thenSuccess_T1110_001"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_abd564f8-cafa-4383-9601-14be03331dec/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["win_repeatedAuthFailure_thenSuccess_T1110_001_user_asset_entity"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f98f5edf-6cf8-4f3c-a195-3094c8b772ae"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["win_repeatedAuthFailure_thenSuccess_T1110_001_user_asset_entity"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_f98f5edf-6cf8-4f3c-a195-3094c8b772ae/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["win_short_term_account_use"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_5a54df53-efa5-4c93-8f87-8bcb89af2366"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["win_short_term_account_use"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_5a54df53-efa5-4c93-8f87-8bcb89af2366/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["windows_event_log_cleared"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_a1ab1ef0-4827-4859-94c0-69a715f05d00"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["windows_event_log_cleared"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_a1ab1ef0-4827-4859-94c0-69a715f05d00/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["wmic_ntds_dit_T1003_003_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_28ae5564-1e56-4282-b93e-df1bfbccda8d"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["wmic_ntds_dit_T1003_003_cisa_report"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_28ae5564-1e56-4282-b93e-df1bfbccda8d/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["archived/cloud_honeypot_secret_access_archived_37840bc"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_118b1fd8-75ae-4bed-b903-89a5224678a4"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["archived/cloud_honeypot_secret_access_archived_37840bc"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_118b1fd8-75ae-4bed-b903-89a5224678a4/deployment"
}
/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_118b1fd8-75ae-4bed-b903-89a5224678a4"
}

/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_118b1fd8-75ae-4bed-b903-89a5224678a4/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["archived/github_repository_archived_or_deleted"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_419640fb-7142-4485-8495-f94514e0fb31"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["archived/github_repository_archived_or_deleted"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_419640fb-7142-4485-8495-f94514e0fb31/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["archived/prt_use_case_1_archived_37840bc"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_76b497a9-85ba-4b6f-94c2-7026ef467b9a"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["archived/prt_use_case_1_archived_37840bc"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_76b497a9-85ba-4b6f-94c2-7026ef467b9a/deployment"
}
/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_76b497a9-85ba-4b6f-94c2-7026ef467b9a"
}

/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_76b497a9-85ba-4b6f-94c2-7026ef467b9a/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["archived/rule_1727979376900_archived_37840bc"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_984c5ee1-a5c2-4ecb-b7d4-0302e1c74607"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["archived/rule_1727979376900_archived_37840bc"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_984c5ee1-a5c2-4ecb-b7d4-0302e1c74607/deployment"
}
/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_984c5ee1-a5c2-4ecb-b7d4-0302e1c74607"
}

/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_984c5ee1-a5c2-4ecb-b7d4-0302e1c74607/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["archived/rule_1750794727496_archived_37840bc"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2e31e47d-fd24-498f-90f9-936464d8058c"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["archived/rule_1750794727496_archived_37840bc"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2e31e47d-fd24-498f-90f9-936464d8058c/deployment"
}
/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2e31e47d-fd24-498f-90f9-936464d8058c"
}

/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_2e31e47d-fd24-498f-90f9-936464d8058c/deployment"
}
import {
  to = module.chronicle_rules.google_chronicle_rule.rules["archived/suspicious_auth_unusual_interval_time_archived_37840bc"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_101df42b-37f9-4e2a-b151-8f9e44ccb7c0"
}

import {
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["archived/suspicious_auth_unusual_interval_time_archived_37840bc"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_101df42b-37f9-4e2a-b151-8f9e44ccb7c0/deployment"
}
/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_101df42b-37f9-4e2a-b151-8f9e44ccb7c0"
}

/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/rules/ru_101df42b-37f9-4e2a-b151-8f9e44ccb7c0/deployment"
}
