output "topic_arn" {
  description = "The ARN of the SNS topic"
  value       = aws_sns_topic.main.arn
}

output "topic_name" {
  description = "The name of the SNS topic"
  value       = aws_sns_topic.main.name
}

output "subscriptions" {
  description = "Map of subscriptions created for the SNS topic"
  value       = aws_sns_topic_subscription.main
} 