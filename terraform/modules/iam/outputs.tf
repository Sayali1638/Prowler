output "role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.main.arn
}

output "role_name" {
  description = "The name of the IAM role"
  value       = aws_iam_role.main.name
}

output "policy_arn" {
  description = "The ARN of the IAM policy"
  value       = aws_iam_policy.main.arn
}

output "instance_profile_arn" {
  description = "The ARN of the instance profile"
  value       = aws_iam_instance_profile.main.arn
}

output "instance_profile_name" {
  description = "The name of the instance profile"
  value       = aws_iam_instance_profile.main.name
} 