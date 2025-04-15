output "lambda_authorizer_invoke_arn" {
  value = aws_lambda_function.authorizer.invoke_arn
}

output "lambda_protected_endpoint_invoke_arn" {
  value = aws_lambda_function.protected_endpoint.invoke_arn
}

