# VPC Module
module "vpc" {
  source = "./modules/vpc"

  environment         = var.environment
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
}

# EC2 Module
module "ec2" {
  source = "./modules/ec2"

  environment    = var.environment
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = module.vpc.public_subnet_ids[0]
  vpc_id         = module.vpc.vpc_id
}

# ECR Module
module "ecr" {
  source = "./modules/ecr"

  environment         = var.environment
  repository_name     = var.ecr_repository_name
  image_tag_mutability = var.image_tag_mutability
  scan_on_push        = var.scan_on_push
}

# S3 Module
module "s3" {
  source = "./modules/s3"

  environment       = var.environment
  bucket_name       = var.s3_bucket_name
  versioning_enabled = var.s3_versioning_enabled
}

# RDS Module
module "rds" {
  source = "./modules/rds"

  environment              = var.environment
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.private_subnet_ids
  allowed_security_groups = [module.ec2.security_group_id]
  db_name                 = var.db_name
  db_username             = var.db_username
  db_password             = var.db_password
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  allocated_storage       = var.db_allocated_storage
  storage_type            = var.db_storage_type
  skip_final_snapshot     = var.db_skip_final_snapshot
  backup_retention_period = var.db_backup_retention_period
  backup_window           = var.db_backup_window
  maintenance_window      = var.db_maintenance_window
}

# IAM Module
module "iam" {
  source = "./modules/iam"

  environment         = var.environment
  role_name           = var.iam_role_name
  trusted_services    = var.iam_trusted_services
  policy_name         = var.iam_policy_name
  policy_description  = var.iam_policy_description
  policy_json         = var.iam_policy_json
}

# CloudFront Module
module "cloudfront" {
  source = "./modules/cloudfront"

  environment         = var.environment
  default_root_object = var.cloudfront_default_root_object
  price_class         = var.cloudfront_price_class
  aliases             = var.cloudfront_aliases
  origin_domain_name  = module.s3.bucket_domain_name
  origin_id           = "S3-${var.s3_bucket_name}"
}

# Lambda Module
module "lambda" {
  source = "./modules/lambda"

  environment           = var.environment
  filename              = var.lambda_filename
  function_name         = var.lambda_function_name
  role_arn              = module.iam.role_arn
  handler               = var.lambda_handler
  runtime               = var.lambda_runtime
  timeout               = var.lambda_timeout
  memory_size           = var.lambda_memory_size
  environment_variables = var.lambda_environment_variables
  subnet_ids            = module.vpc.private_subnet_ids
  security_group_ids    = [module.ec2.security_group_id]
  log_retention_days    = var.lambda_log_retention_days
  event_source_arn      = var.lambda_event_source_arn
}

# Secrets Manager Module
module "secrets_manager" {
  source = "./modules/secrets-manager"

  environment         = var.environment
  secret_name         = var.secrets_manager_secret_name
  secret_description  = var.secrets_manager_secret_description
  secret_value        = var.secrets_manager_secret_value
  policy_json         = var.secrets_manager_policy_json
}

# ElastiCache Module
module "elasticache" {
  source = "./modules/elasticache"

  environment              = var.environment
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.private_subnet_ids
  allowed_security_groups = [module.ec2.security_group_id]
  cluster_id              = var.elasticache_cluster_id
  cluster_description     = var.elasticache_cluster_description
  node_type              = var.elasticache_node_type
  num_cache_clusters     = var.elasticache_num_cache_clusters
  parameter_group_family = var.elasticache_parameter_group_family
  parameter_group_name   = var.elasticache_parameter_group_name
  port                   = var.elasticache_port
  transit_encryption_enabled = var.elasticache_transit_encryption_enabled
} 