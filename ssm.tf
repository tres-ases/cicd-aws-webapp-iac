#BUCKETS S3
resource "aws_ssm_parameter" "cosmos-cf-templates" {
  name        = "/cosmos/${var.stage}/s3/cosmos-cf-templates/id"
  description = "Bucket Templates CF"
  type        = "String"
  value       = aws_s3_bucket.cosmos-cf-templates.id
}
resource "aws_ssm_parameter" "cosmos_bucket_front_id" {
  name        = "/cosmos/${var.stage}/s3/cosmos-front/id"
  description = "cosmos frontend bucket S3"
  type        = "String"
  value       = aws_s3_bucket.cosmos-bucket-front.id
}
#VPC
resource "aws_ssm_parameter" "cosmos-vpc-id" {
  name        = "/cosmos/${var.stage}/vpc/id"
  description = "id VPC"
  type        = "String"
  value       = var.vpc_id
}
resource "aws_ssm_parameter" "cosmos-subnets" {
  name        = "/cosmos/${var.stage}/vpc/subnets"
  description = "Subnet List"
  type        = "StringList"
  value       = join(",", var.subnets)
}
#COGNITO CLIENT
resource "aws_ssm_parameter" "userpool_id" {
  name        = "/cosmos/${var.stage}/cognito/client/userpool/id"
  description = "cosmos cognito userpool id"
  type        = "String"
  value       = aws_cognito_user_pool.cosmos-pool.id
}

resource "aws_ssm_parameter" "userpool_arn" {
  name        = "/cosmos/${var.stage}/cognito/client/userpool/arn"
  description = "cosmos cognito userpool arn"
  type        = "String"
  value       = aws_cognito_user_pool.cosmos-pool.arn
}
resource "aws_ssm_parameter" "userpool_endpoint" {
  name        = "/cosmos/${var.stage}/cognito/client/userpool/endpoint"
  description = "cosmos cognito userpool endpoint"
  type        = "String"
  value       = aws_cognito_user_pool.cosmos-pool.endpoint
}
resource "aws_ssm_parameter" "userpool_client_id" {
  name        = "/cosmos/${var.stage}/cognito/client/userpool/client_id"
  description = "cosmos cognito userpool client ID"
  type        = "String"
  value       = aws_cognito_user_pool_client.cosmos-pool-client.id
}

resource "aws_ssm_parameter" "cicd-webapp-table-user" {
  name        = "/cosmos/${var.stage}/dynamodb/table/cicd-webapp-table-user/id"
  description = "cosmos dynamodb"
  type        = "String"
  value       = aws_dynamodb_table.cicd-webapp-table-user.id
}
resource "aws_ssm_parameter" "cosmos_cloudfront_id" {
  name        = "/cosmos/${var.stage}/cloudfront/id"
  description = "cosmos distribution of cloudfront"
  type        = "String"
  value       = aws_cloudfront_distribution.cosmos_distribution.id
}
data "aws_ssm_parameter" "apigw-id" {
  count = var.first_time ? 0 : 1
  name = "/cosmos/backend/aws-webapp-back-${var.stage}/apigateway/id"
}