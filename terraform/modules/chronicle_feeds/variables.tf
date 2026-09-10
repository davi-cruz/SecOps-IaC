variable "project_id" {
  type        = string
  description = "Google Cloud project ID."
}

variable "chronicle_location" {
  type        = string
  description = "Chronicle regional location (e.g. 'us')."
  default     = "us"
}

variable "chronicle_instance_id" {
  type        = string
  description = "Chronicle instance UUID."
}

variable "feeds_config_path" {
  type        = string
  description = "Path to the declarative feeds.yaml file."
}

variable "azure_credentials_secret_name" {
  type        = string
  description = "Name of the secret in Secret Manager containing Azure/M365 JSON credentials."
  default     = "secops-feed-azure-credentials"
}

variable "gws_davicruz_customer_id" {
  type        = string
  description = "Google Workspace customer ID for the DaviCruz org."
  default     = ""
}

variable "gws_driveforjob_customer_id" {
  type        = string
  description = "Google Workspace customer ID for the DriveForJob org."
  default     = ""
}
