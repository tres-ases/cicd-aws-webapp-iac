#BUCKETS S3
resource "aws_ssm_parameter" "cosmos-cf-templates" {
  name        = "/cosmos/s3/cosmos-cf-templates/id"
  description = "Bucket Templates CF"
  type        = "String"
  value       = aws_s3_bucket.cosmos-cf-templates.id
}
#VPC
resource "aws_ssm_parameter" "cosmos-vpc-id" {
  name        = "/cosmos/vpc/id"
  description = "id VPC"
  type        = "String"
  value       = var.vpc_id
}
resource "aws_ssm_parameter" "cosmos-subnets" {
  name        = "/cosmos/vpc/subnets"
  description = "Subnet List"
  type        = "StringList"
  value       = join(",", var.subnets)
}
#COGNITO CLIENT
resource "aws_ssm_parameter" "userpool_id" {
  name        = "/cosmos/cognito/client/userpool/id"
  description = "cosmos cognito userpool id"
  type        = "String"
  value       = aws_cognito_user_pool.cosmos-pool.id
}

resource "aws_ssm_parameter" "userpool_arn" {
  name        = "/cosmos/cognito/client/userpool/arn"
  description = "cosmos cognito userpool arn"
  type        = "String"
  value       = aws_cognito_user_pool.cosmos-pool.arn
}
resource "aws_ssm_parameter" "userpool_endpoint" {
  name        = "/cosmos/cognito/client/userpool/endpoint"
  description = "cosmos cognito userpool endpoint"
  type        = "String"
  value       = aws_cognito_user_pool.cosmos-pool.endpoint
}
resource "aws_ssm_parameter" "userpool_client_id" {
  name        = "/cosmos/cognito/client/userpool/client_id"
  description = "cosmos cognito userpool client ID"
  type        = "String"
  value       = aws_cognito_user_pool_client.cosmos-pool-client.id
}

resource "aws_ssm_parameter" "cicd-webapp-table-user" {
  name        = "/cosmos/dynamodb/table/cicd-webapp-table-user/id"
  description = "cosmos dynamodb"
  type        = "String"
  value       = aws_dynamodb_table.cicd-webapp-table-user.id
}

data "aws_ssm_parameter" "apigw-id" {
  name = "/cosmos/backend/aws-webapp-back-${stage}/apigateway/id"
}