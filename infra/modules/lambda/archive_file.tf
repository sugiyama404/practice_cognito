data "archive_file" "func1" {
  type        = "zip"
  source_dir  = "./modules/lambda/src/func1/in"
  output_path = "./modules/lambda/src/func1/out/lambda_function_payload.zip"
}
