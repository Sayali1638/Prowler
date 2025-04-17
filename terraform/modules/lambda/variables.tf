variable "function_name" {
  type        = string
  description = "Lambda function name"
}

variable "runtime" {
  type        = string
  description = "Lambda runtime environment"
}

variable "handler" {
  type        = string
  description = "Entry point for the Lambda function"
}

variable "role_arn" {
  type        = string
  description = "IAM role ARN for Lambda execution"
}

variable "source_path" {
  type        = string
  description = "Path to the Lambda deployment package (zip file)"
}
