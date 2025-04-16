variable "topic_name" {
  description = "The name of the SNS topic"
  type        = string
}

variable "environment" {
  description = "Environment name for tagging"
  type        = string
}

variable "subscriptions" {
  description = "Map of subscription configurations"
  type = map(object({
    protocol = string
    endpoint = string
  }))
  default = {}
} 