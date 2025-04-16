# Common Variables
variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

# VPC Variables
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# EC2 Variables
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c7217cdde317cfec" # Amazon Linux 2 AMI in us-east-1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# ECR Variables
variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "app-repository"
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository"
  type        = bool
  default     = true
}

# S3 Variables
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-app-bucket"
}

variable "s3_versioning_enabled" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

# RDS Variables
variable "db_name" {
  description = "The name of the database to create"
  type        = string
  default     = "myappdb"
}

variable "db_username" {
  description = "Username for the master DB user"
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  description = "Password for the master DB user"
  type        = string
  sensitive   = true
  default     = "changeme123" # Change this in production!
}

variable "db_engine" {
  description = "The database engine to use"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "The engine version to use"
  type        = string
  default     = "14.7"
}

variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 20
}

variable "db_storage_type" {
  description = "The type of storage to use"
  type        = string
  default     = "gp2"
}

variable "db_skip_final_snapshot" {
  description = "Whether to skip final snapshot when destroying the instance"
  type        = bool
  default     = true
}

variable "db_backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = 7
}

variable "db_backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
  default     = "03:00-04:00"
}

variable "db_maintenance_window" {
  description = "The window to perform maintenance in"
  type        = string
  default     = "Mon:04:00-Mon:05:00"
}

# IAM Variables
variable "iam_role_name" {
  description = "Name of the IAM role"
  type        = string
  default     = "app-role"
}

variable "iam_trusted_services" {
  description = "AWS services that can assume this role"
  type        = list(string)
  default     = ["ec2.amazonaws.com", "lambda.amazonaws.com"]
}

variable "iam_policy_name" {
  description = "Name of the IAM policy"
  type        = string
  default     = "app-policy"
}

variable "iam_policy_description" {
  description = "Description of the IAM policy"
  type        = string
  default     = "Policy for application resources"
}

variable "iam_policy_json" {
  description = "JSON formatted IAM policy document"
  type        = string
  default     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::my-app-bucket",
        "arn:aws:s3:::my-app-bucket/*"
      ]
    }
  ]
}
EOF
}

# CloudFront Variables
variable "cloudfront_default_root_object" {
  description = "The default root object of the CloudFront distribution"
  type        = string
  default     = "index.html"
}

variable "cloudfront_price_class" {
  description = "The price class for the CloudFront distribution"
  type        = string
  default     = "PriceClass_100"
}

variable "cloudfront_aliases" {
  description = "List of alternate domain names for the distribution"
  type        = list(string)
  default     = []
}

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

# Secrets Manager Variables
variable "secrets_manager_secret_name" {
  description = "Name of the secret in Secrets Manager"
  type        = string
  default     = "app-secret"
}

variable "secrets_manager_secret_description" {
  description = "Description of the secret in Secrets Manager"
  type        = string
  default     = "Application secret created by Terraform"
}

variable "secrets_manager_secret_value" {
  description = "Value of the secret in Secrets Manager"
  type        = string
  sensitive   = true
  default     = "{\"username\":\"admin\",\"password\":\"changeme123\"}"
}

variable "secrets_manager_policy_json" {
  description = "JSON formatted policy document for the secret"
  type        = string
  default     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "secretsmanager:GetSecretValue"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

# ElastiCache Variables
variable "elasticache_cluster_id" {
  description = "ID for the ElastiCache cluster"
  type        = string
  default     = "redis-cluster"
}

variable "elasticache_cluster_description" {
  description = "Description for the ElastiCache cluster"
  type        = string
  default     = "Redis cluster created by Terraform"
}

variable "elasticache_node_type" {
  description = "The compute and memory capacity of the nodes in the cluster"
  type        = string
  default     = "cache.t3.micro"
}

variable "elasticache_num_cache_clusters" {
  description = "Number of cache clusters in the replication group"
  type        = number
  default     = 1
}

variable "elasticache_parameter_group_family" {
  description = "Family of the parameter group"
  type        = string
  default     = "redis6.x"
}

variable "elasticache_parameter_group_name" {
  description = "Name of the parameter group"
  type        = string
  default     = "redis-params"
}

variable "elasticache_port" {
  description = "Port number on which each of the cache nodes will accept connections"
  type        = number
  default     = 6379
}

variable "elasticache_transit_encryption_enabled" {
  description = "Whether to enable encryption in transit"
  type        = bool
  default     = false
} 