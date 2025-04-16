resource "aws_iam_role" "main" {
  name = "${var.environment}-${var.role_name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = var.trusted_services
        }
      }
    ]
  })

  tags = {
    Name = "${var.environment}-${var.role_name}"
  }
}

resource "aws_iam_policy" "main" {
  name        = "${var.environment}-${var.policy_name}"
  description = var.policy_description

  policy = var.policy_json

  tags = {
    Name = "${var.environment}-${var.policy_name}"
  }
}

resource "aws_iam_role_policy_attachment" "main" {
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.main.arn
}

resource "aws_iam_instance_profile" "main" {
  name = "${var.environment}-${var.role_name}-profile"
  role = aws_iam_role.main.name
} 
