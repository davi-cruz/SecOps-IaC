variable "project_id" {
  type        = string
  description = "Google Cloud Project ID where Chronicle and Secret Manager reside."
}

variable "chronicle_location" {
  type        = string
  description = "Google SecOps / Chronicle regional location (e.g., 'us', 'europe')."
  default     = "us"
}

variable "chronicle_instance_id" {
  type        = string
  description = "Google SecOps Chronicle instance identifier (UUID format)."
}

variable "office365_credentials_secret_name" {
  type        = string
  description = "Name of the secret in GCP Secret Manager holding Office 365 JSON credentials (tenant_id, client_id, client_secret)."
  default     = "secops-feed-office365-credentials"
}

variable "entra_credentials_secret_name" {
  type        = string
  description = "Name of the secret in GCP Secret Manager holding Microsoft Entra ID JSON credentials (tenant_id, client_id, client_secret)."
  default     = "secops-feed-entra-credentials"
}

variable "gws_davicruz_customer_id" {
  type        = string
  description = "Google Workspace Customer ID for the DaviCruz organization."
  default     = ""
}

variable "gws_davicruz_admin_email" {
  type        = string
  description = "Google Workspace Admin user email for the DaviCruz organization."
  default     = ""
}

variable "gws_driveforjob_customer_id" {
  type        = string
  description = "Google Workspace Customer ID for the DriveForJob organization."
  default     = ""
}

variable "gws_driveforjob_admin_email" {
  type        = string
  description = "Google Workspace Admin user email for the DriveForJob organization."
  default     = ""
}

variable "gws_sa_credentials_secret_name" {
  type        = string
  description = "Name of the secret in GCP Secret Manager holding the raw GCP Service Account JSON key (used by default for all GWS orgs)."
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
  description = "Name of the secret in GCP Secret Manager holding DaviCruz org config JSON (customer_id, admin_email)."
  default     = "secops-feed-gws-davicruz-config"
}

variable "gws_driveforjob_config_secret_name" {
  type        = string
  description = "Name of the secret in GCP Secret Manager holding DriveForJob org config JSON (customer_id, admin_email)."
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


