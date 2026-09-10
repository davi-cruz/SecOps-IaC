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

variable "office365_credentials_secret_name" {
  type        = string
  description = "Name of the secret in Secret Manager containing Office 365 JSON credentials."
  default     = "secops-feed-office365-credentials"
}

variable "entra_credentials_secret_name" {
  type        = string
  description = "Name of the secret in Secret Manager containing Microsoft Entra ID JSON credentials."
  default     = "secops-feed-entra-credentials"
}

variable "gws_davicruz_customer_id" {
  type        = string
  description = "Google Workspace customer ID for the DaviCruz org."
  default     = ""
}

variable "gws_davicruz_admin_email" {
  type        = string
  description = "Google Workspace Admin user email for the DaviCruz org."
  default     = ""
}

variable "gws_driveforjob_customer_id" {
  type        = string
  description = "Google Workspace customer ID for the DriveForJob org."
  default     = ""
}

variable "gws_driveforjob_admin_email" {
  type        = string
  description = "Google Workspace Admin user email for the DriveForJob org."
  default     = ""
}

variable "gws_sa_credentials_secret_name" {
  type        = string
  description = "Name of the secret in Secret Manager containing the raw GCP Service Account JSON key (used by default for all GWS orgs)."
  default     = "secops-feed-gws-sa-key"
}

variable "gws_davicruz_sa_credentials_secret_name" {
  type        = string
  description = "Optional org-specific SA secret name for DaviCruz (falls back to gws_sa_credentials_secret_name if empty)."
  default     = ""
}

variable "gws_driveforjob_sa_credentials_secret_name" {
  type        = string
  description = "Optional org-specific SA secret name for DriveForJob (falls back to gws_sa_credentials_secret_name if empty)."
  default     = ""
}

variable "gws_davicruz_config_secret_name" {
  type        = string
  description = "Name of the secret in Secret Manager containing DaviCruz org config JSON (customer_id, admin_email)."
  default     = "secops-feed-gws-davicruz-config"
}

variable "gws_driveforjob_config_secret_name" {
  type        = string
  description = "Name of the secret in Secret Manager containing DriveForJob org config JSON (customer_id, admin_email)."
  default     = "secops-feed-gws-driveforjob-config"
}

variable "gws_davicruz_credentials_secret_name" {
  type        = string
  description = "Legacy / bundled secret name for DaviCruz (falls back to decoupled secrets if not set)."
  default     = ""
}

variable "gws_driveforjob_credentials_secret_name" {
  type        = string
  description = "Legacy / bundled secret name for DriveForJob (falls back to decoupled secrets if not set)."
  default     = ""
}

