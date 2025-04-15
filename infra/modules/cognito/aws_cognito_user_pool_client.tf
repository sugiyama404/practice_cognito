resource "aws_cognito_user_pool_client" "client" {
  name                         = "my-app-client"
  user_pool_id                 = aws_cognito_user_pool.main.id
  generate_secret              = false
  explicit_auth_flows          = ["ALLOW_USER_PASSWORD_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
  supported_identity_providers = ["COGNITO"]
}
