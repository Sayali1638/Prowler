variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "secret_name" {
  description = "Name of the secret"
  type        = string
}

variable "secret_description" {
  description = "Description of the secret"
  type        = string
  default     = "Secret created by Terraform"
}

variable "secret_value" {
  description = "Value of the secret"
  type        = string
  sensitive   = true
}

variable "policy_json" {
  description = "JSON formatted policy document for the secret"
  type        = string
  default     = ""
} 