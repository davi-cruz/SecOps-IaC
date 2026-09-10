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

variable "config_file_path" {
  type        = string
  description = "Path to the reference_list_config.yaml file."
}

variable "content_dir" {
  type        = string
  description = "Directory containing the reference list .txt entry files."
}
