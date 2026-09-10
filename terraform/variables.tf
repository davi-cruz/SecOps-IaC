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

variable "azure_credentials_secret_name" {
  type        = string
  description = "Name of the secret in GCP Secret Manager holding the Microsoft/Azure JSON credentials (tenant_id, client_id, client_secret)."
  default     = "secops-feed-azure-credentials"
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
