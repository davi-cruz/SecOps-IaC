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

variable "gws_driveforjob_customer_id" {
  type        = string
  description = "Google Workspace customer ID for the DriveForJob org."
  default     = ""
}

variable "gws_davicruz_credentials_secret_name" {
  type        = string
  description = "Name of the secret in Secret Manager containing Google Workspace DaviCruz credentials."
  default     = "secops-feed-gws-davicruz-credentials"
}

variable "gws_driveforjob_credentials_secret_name" {
  type        = string
  description = "Name of the secret in Secret Manager containing Google Workspace DriveForJob credentials."
  default     = "secops-feed-gws-driveforjob-credentials"
}

