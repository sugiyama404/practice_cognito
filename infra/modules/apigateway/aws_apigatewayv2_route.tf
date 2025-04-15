resource "aws_apigatewayv2_route" "protected_route" {
  api_id             = aws_apigatewayv2_api.http_api.id
  route_key          = "GET /hello"
  authorization_type = "JWT"
  target             = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
  authorizer_id      = aws_apigatewayv2_authorizer.cognito.id
}
