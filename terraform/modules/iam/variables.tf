variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "trusted_services" {
  description = "AWS services that can assume this role"
  type        = list(string)
  default     = ["ec2.amazonaws.com"]
}

variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
}

variable "policy_description" {
  description = "Description of the IAM policy"
  type        = string
}

variable "policy_json" {
  description = "JSON formatted IAM policy document"
  type        = string
} 