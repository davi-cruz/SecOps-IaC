variable "project_id" {
  type        = string
  description = "Google Cloud project ID."
}

variable "chronicle_location" {
  type        = string
  description = "Chronicle regional location (e.g., 'us')."
  default     = "us"
}

variable "chronicle_instance_id" {
  type        = string
  description = "Chronicle instance UUID."
}

variable "rules_dir" {
  type        = string
  description = "Path to the directory containing .yaral and .yaml rule files."
}

variable "deletion_policy" {
  type        = string
  description = "Policy governing rule deletion (DEFAULT, FORCE, ABANDON, PREVENT)."
  default     = "DEFAULT"
}
