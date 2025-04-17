# Common Variables
environment = "dev"

# VPC Variables
vpc_cidr           = "10.0.0.0/16"
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]

# EC2 Variables
ami_id         = "ami-0c7217cdde317cfec"  # Amazon Linux 2 AMI in us-east-1
instance_type  = "t2.micro"

# ECR Variables
ecr_repository_name     = "app-repository"
image_tag_mutability    = "MUTABLE"
scan_on_push            = true

# S3 Variables
s3_bucket_name       = "my-app-bucket"
s3_versioning_enabled = true

# RDS Variables
db_name                 = "myappdb"
db_username             = "dbadmin"
db_password             = "changeme123"  # Change this in production!
db_engine              = "postgres"
db_engine_version      = "17.2"
db_instance_class      = "db.t3.micro"
db_allocated_storage   = 20
db_storage_type        = "gp2"
db_skip_final_snapshot = true
db_backup_retention_period = 7
db_backup_window       = "03:00-04:00"
db_maintenance_window  = "Mon:04:00-Mon:05:00"

# IAM Variables
iam_role_name          = "app-role"
iam_trusted_services   = ["ec2.amazonaws.com", "lambda.amazonaws.com"]
iam_policy_name        = "app-policy"
iam_policy_description = "Policy for application resources"
iam_policy_json        = <<EOF
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

# CloudFront Variables
cloudfront_default_root_object = "index.html"
cloudfront_price_class        = "PriceClass_100"
cloudfront_aliases            = []

# Lambda Variables
lambda_filename              = "lambda_function.zip"
lambda_function_name         = "app-function"
lambda_handler               = "index.handler"
lambda_runtime               = "nodejs18.x"
lambda_timeout               = 30
lambda_memory_size           = 128
lambda_role                  =  aws_iam_role.lambda_role.arn
lambda_environment_variables = {
  ENVIRONMENT = "dev"
  DB_HOST     = "localhost"
}
lambda_log_retention_days    = 14
lambda_event_source_arn      = ""



# Secrets Manager Variables
secrets_manager_secret_name        = "app-secret"
secrets_manager_secret_description = "Application secret created by Terraform"
secrets_manager_secret_value       = "{\"username\":\"admin\",\"password\":\"changeme123\"}"
secrets_manager_policy_json        = <<EOF
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

# DynamoDB Variables
dynamodb_table_name = "app-table"
dynamodb_billing_mode = "PROVISIONED"
dynamodb_hash_key    = "id"
dynamodb_range_key   = "timestamp"
dynamodb_read_capacity = 5
dynamodb_write_capacity = 5
dynamodb_attributes = [
  {
    name = "id"
    type = "S"
  },
  {
    name = "timestamp"
    type = "N"
  }
]
dynamodb_global_secondary_indexes = []

# SQS Variables
sqs_queue_name                = "app-queue"
sqs_delay_seconds             = 0
sqs_max_message_size          = 262144
sqs_message_retention_seconds = 345600
sqs_receive_wait_time_seconds = 0
sqs_visibility_timeout_seconds = 30

# SNS Variables
sns_topic_name = "app-topic"
sns_subscriptions = {
  email = {
    protocol = "email"
    endpoint = "admin@example.com"
  }
  lambda = {
    protocol = "lambda"
    endpoint = "arn:aws:lambda:us-east-1:443370690706:function:testSNS"
  }
} 