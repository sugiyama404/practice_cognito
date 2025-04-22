# Lambda オーソライザーを API Gateway から呼び出すためのパーミッション
resource "aws_lambda_permission" "api_gateway_authorizer" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.protected_endpoint.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.apigatewayv2_api_http_api_execution_arn}/*/*/hello"
}
