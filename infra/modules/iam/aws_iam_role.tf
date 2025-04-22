# Lambda オーソライザー関数の IAM ロール
resource "aws_iam_role" "lambda_authorizer_role" {
  name = "lambda_authorizer_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}
