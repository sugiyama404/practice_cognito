terraform {
  required_version = "=1.10.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# IAM
module "iam" {
  source   = "./modules/iam"
  app_name = var.app_name
}

# Lambda
module "lambda" {
  source                                  = "./modules/lambda"
  app_name                                = var.app_name
  lambda_authorizer_iam_role_arn          = module.iam.lambda_authorizer_iam_role_arn
  apigatewayv2_api_http_api_execution_arn = module.apigateway.apigatewayv2_api_http_api_execution_arn
}

# API Gateway
module "apigateway" {
  source                               = "./modules/apigateway"
  app_name                             = var.app_name
  lambda_authorizer_invoke_arn         = module.lambda.lambda_authorizer_invoke_arn
  lambda_protected_endpoint_invoke_arn = module.lambda.lambda_protected_endpoint_invoke_arn
}

# Cognito
module "cognito" {
  source = "./modules/cognito"
}
