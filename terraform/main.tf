# Root Terraform Configuration for Google Security Operations (SecOps) IaC

module "chronicle_feeds" {
  source = "./modules/chronicle_feeds"

  project_id            = var.project_id
  chronicle_location    = var.chronicle_location
  chronicle_instance_id = var.chronicle_instance_id
  feeds_config_path     = "${path.root}/../content/secops/feeds.yaml"

  office365_credentials_secret_name      = var.office365_credentials_secret_name
  entra_credentials_secret_name          = var.entra_credentials_secret_name
  gws_davicruz_credentials_secret_name   = var.gws_davicruz_credentials_secret_name
  gws_driveforjob_credentials_secret_name = var.gws_driveforjob_credentials_secret_name
  gws_davicruz_customer_id               = var.gws_davicruz_customer_id
  gws_driveforjob_customer_id            = var.gws_driveforjob_customer_id
}

module "chronicle_rules" {
  source = "./modules/chronicle_rules"

  project_id            = var.project_id
  chronicle_location    = var.chronicle_location
  chronicle_instance_id = var.chronicle_instance_id
  rules_dir             = "${path.root}/../content/secops/rules"
  deletion_policy       = "DEFAULT"
}

module "chronicle_reference_lists" {
  source = "./modules/chronicle_reference_lists"

  project_id            = var.project_id
  chronicle_location    = var.chronicle_location
  chronicle_instance_id = var.chronicle_instance_id
  config_file_path      = "${path.root}/../content/secops/config/reference_list_config.yaml"
  content_dir           = "${path.root}/../content/secops/reference_lists"
}
