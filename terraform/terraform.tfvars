# Common Variables
environment = "dev"

# VPC Variables
vpc_cidr           = "10.0.0.0/16"
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]

# EC2 Variables
ami_id        = "ami-0c7217cdde317cfec" # Amazon Linux 2 AMI in us-east-1
instance_type = "t2.micro"

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
db_password             = "changeme123" # Change this in production!
db_engine               = "postgres"
db_engine_version       = "14.7"
db_instance_class       = "db.t3.micro"
db_allocated_storage    = 20
db_storage_type         = "gp2"
db_skip_final_snapshot  = true
db_backup_retention_period = 7
db_backup_window        = "03:00-04:00"
db_maintenance_window   = "Mon:04:00-Mon:05:00"

# IAM Variables
iam_role_name        = "app-role"
iam_trusted_services = ["ec2.amazonaws.com", "lambda.amazonaws.com"]
iam_policy_name      = "app-policy"
iam_policy_description = "Policy for application resources"

# CloudFront Variables
cloudfront_default_root_object = "index.html"
cloudfront_price_class         = "PriceClass_100"
cloudfront_aliases             = []

# Lambda Variables
lambda_filename     = "lambda_function.zip"
lambda_function_name = "app-function"
lambda_handler      = "index.handler"
lambda_runtime      = "nodejs18.x"
lambda_timeout      = 30
lambda_memory_size  = 128
lambda_log_retention_days = 14 