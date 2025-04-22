# API Gateway HTTP API
resource "aws_apigatewayv2_api" "http_api" {
  name          = "http-api-with-authorizer"
  protocol_type = "HTTP"
}
