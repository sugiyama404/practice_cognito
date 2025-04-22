resource "aws_cognito_user" "test_user" {
  user_pool_id = aws_cognito_user_pool.main.id
  username     = var.username

  attributes = {
    email          = var.username
    email_verified = "true"
  }

  temporary_password   = var.password
  force_alias_creation = false
  message_action       = "SUPPRESS"
}
