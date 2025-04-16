variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "default_root_object" {
  description = "The default root object of the CloudFront distribution"
  type        = string
  default     = "index.html"
}

variable "price_class" {
  description = "The price class for the CloudFront distribution"
  type        = string
  default     = "PriceClass_100"
}

variable "aliases" {
  description = "List of alternate domain names for the distribution"
  type        = list(string)
  default     = []
}

variable "origin_domain_name" {
  description = "The domain name of the origin"
  type        = string
}

variable "origin_id" {
  description = "A unique identifier for the origin"
  type        = string
} 