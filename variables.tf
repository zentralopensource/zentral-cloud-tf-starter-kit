variable "fqdn" {
  description = "FQDN of the Zentral tenant"
  type        = string
}

variable "api_token" {
  description = "Zentral API token"
  type        = string
  sensitive   = true
}
