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

variable "gws_driveforjob_customer_id" {
  type        = string
  description = "Google Workspace Customer ID for the DriveForJob organization."
  default     = ""
}

variable "gws_davicruz_credentials_secret_name" {
  type        = string
  description = "Name of the secret in GCP Secret Manager holding Google Workspace DaviCruz credentials (customer_id, admin_email, service_account_email, private_key)."
  default     = "secops-feed-gws-davicruz-credentials"
}

variable "gws_driveforjob_credentials_secret_name" {
  type        = string
  description = "Name of the secret in GCP Secret Manager holding Google Workspace DriveForJob credentials (customer_id, admin_email, service_account_email, private_key)."
  default     = "secops-feed-gws-driveforjob-credentials"
}

