resource "aws_secretsmanager_secret" "main" {
  name        = "${var.environment}-${var.secret_name}"
  description = var.secret_description

  tags = {
    Name = "${var.environment}-${var.secret_name}"
  }
}

resource "aws_secretsmanager_secret_version" "main" {
  secret_id     = aws_secretsmanager_secret.main.id
  secret_string = var.secret_value
}

resource "aws_secretsmanager_secret_policy" "main" {
  count = var.policy_json != "" ? 1 : 0
  
  secret_arn = aws_secretsmanager_secret.main.arn
  policy     = var.policy_json
} 
