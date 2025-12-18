locals {
  artifacts_bucket_name = "cost-optimization-artifacts"
}

data "aws_s3_object" "lambda_package" {
  bucket = local.artifacts_bucket_name
  key    = "artifacts/lambda_package.zip"
}

resource "aws_lambda_function" "lambda" {
  function_name = "cost-optimization"
  handler       = "src.main.lambda_handler"
  runtime       = "python3.13"
  role = aws_iam_role.lambda_role.arn
  s3_bucket = local.artifacts_bucket_name
  s3_key    = data.aws_s3_object.lambda_package.key
  s3_object_version = data.aws_s3_object.lambda_package.version_id
  timeout = 300
}