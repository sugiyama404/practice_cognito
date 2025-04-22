# 保護されたエンドポイント用の Lambda 関数
resource "aws_lambda_function" "protected_endpoint" {
  function_name    = "protected_endpoint"
  filename         = data.archive_file.func1.output_path
  handler          = "main.lambda_handler"
  source_code_hash = data.archive_file.func1.output_base64sha256
  role             = var.lambda_authorizer_iam_role_arn
  runtime          = "python3.12"
}

resource "random_string" "auth_secret_key" {
  length  = 20
  upper   = false
  lower   = true
  numeric = true
  special = false
}
