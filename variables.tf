variable "fqdn" {
  description = "FQDN of the Zentral tenant"
  type        = string
}

variable "api_token" {
  description = "Zentral API token"
  type        = string
  sensitive   = true
}

variable "osquery_default_compliance_check_interval" {
  description = "Default Osquery compliance check scheduling interval in seconds"
  default     = 3600
}
