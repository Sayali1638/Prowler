# AWS Infrastructure as Code with Terraform

This repository contains a modular Terraform configuration for deploying AWS infrastructure. The configuration is organized into modules for different AWS services, making it easy to reuse and maintain.

## Project Structure

```
terraform-aws/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── ecr/
│   ├── s3/
│   ├── rds/
│   ├── iam/
│   ├── cloudfront/
│   ├── lambda/
│   ├── ecs/
│   └── secrets-manager/
├── provider.tf
├── variables.tf
├── outputs.tf
├── main.tf
└── terraform.tfvars
```

## Modules

The project includes the following modules:

1. **VPC**: Creates a VPC with public and private subnets, internet gateway, and route tables.
2. **EC2**: Deploys EC2 instances with security groups.
3. **ECR**: Creates Elastic Container Registry repositories.
4. **S3**: Sets up S3 buckets with versioning, encryption, and lifecycle policies.
5. **RDS**: Deploys RDS instances with security groups and subnet groups.
6. **IAM**: Creates IAM roles, policies, and instance profiles.
7. **CloudFront**: Sets up CloudFront distributions with S3 origins.
8. **Lambda**: Deploys Lambda functions with VPC configuration and CloudWatch logs.
9. **ECS**: (To be implemented) Will deploy ECS clusters, services, and task definitions.
10. **Secrets Manager**: (To be implemented) Will manage secrets in AWS Secrets Manager.

## Prerequisites

- Terraform >= 1.2.0
- AWS CLI configured with appropriate credentials
- AWS account with necessary permissions

## Usage

1. Clone this repository:
   ```
   git clone <repository-url>
   cd terraform-aws
   ```

2. Initialize Terraform:
   ```
   terraform init
   ```

3. Review the plan:
   ```
   terraform plan
   ```

4. Apply the configuration:
   ```
   terraform apply
   ```

5. To destroy the infrastructure:
   ```
   terraform destroy
   ```

## Environment-Specific Configuration

For environment-specific configurations, use the `environments` directory:

1. Navigate to the desired environment directory:
   ```
   cd environments/dev
   ```

2. Initialize and apply as described above.

## Customization

You can customize the infrastructure by modifying the variables in `terraform.tfvars` or by creating environment-specific variable files.

## Security Considerations

- The default configuration includes basic security settings. Review and enhance them for production use.
- Sensitive information like database passwords should be managed securely, preferably using AWS Secrets Manager.
- Review IAM permissions to follow the principle of least privilege.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details. 