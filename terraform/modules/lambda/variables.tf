# Lambda Variables
variable "lambda_filename" {
  description = "Path to the function's deployment package"
  type        = string
  default     = "lambda_function.zip"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "app-function"
}

variable "lambda_handler" {
  description = "Function entrypoint in your code"
  type        = string
  default     = "index.handler"
}

variable "lambda_runtime" {
  description = "Runtime environment for the Lambda function"
  type        = string
  default     = "nodejs18.x"
}

variable "lambda_timeout" {
  description = "Amount of time your Lambda Function has to run in seconds"
  type        = number
  default     = 30
}

variable "lambda_memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime"
  type        = number
  default     = 128
}

variable "lambda_environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {
    ENVIRONMENT = "dev"
    DB_HOST     = "localhost"
  }
}

variable "lambda_log_retention_days" {
  description = "Number of days to retain Lambda function logs"
  type        = number
  default     = 14
}

variable "lambda_event_source_arn" {
  description = "ARN of the event source that will trigger the Lambda function"
  type        = string
  default     = ""
}
