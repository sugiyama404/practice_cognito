# Lambda 関数を API Gateway と統合
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id                 = aws_apigatewayv2_api.http_api.id
  integration_type       = "AWS_PROXY"
  integration_uri        = var.lambda_protected_endpoint_invoke_arn
  integration_method     = "POST"
  payload_format_version = "2.0"
}
