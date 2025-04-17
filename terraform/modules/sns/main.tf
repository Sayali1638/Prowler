resource "aws_sns_topic" "main" {
  name = var.topic_name

  tags = {
    Environment = var.environment
    Name        = "${var.environment}-sns-topic"
  }
}

resource "aws_sns_topic_subscription" "main" {
  for_each = var.subscriptions

  topic_arn = aws_sns_topic.main.arn
  protocol  = each.value.protocol
  endpoint  = each.value.endpoint
}

resource "aws_sns_topic_policy" "main" {
  arn    = aws_sns_topic.main.arn
  policy = data.aws_iam_policy_document.sns_policy.json
}

data "aws_iam_policy_document" "sns_policy" {
  statement {
    effect    = "Allow"
    actions   = ["sns:Publish"]
    resources = [aws_sns_topic.main.arn]
    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
  }
} 