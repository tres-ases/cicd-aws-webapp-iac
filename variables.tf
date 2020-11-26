# Network
variable "vpc_id" {
  type    = string
  default = "vpc-dd5b8fa0"
}
variable "stage" {
  type    = string
  default = "dev"
}
variable "subnets" {
  type    = list(string)
  default = ["subnet-e70ab281", "subnet-930f729d", "subnet-dff77380"]
}
variable "region" {
  type    = string
  default = "us-east-1"
}
#COGNITO
variable "CognitoUserPoolName" {
  type    = string
  default = "CognitoAuthApiUserPoolCosmos"
}
variable "CognitoUserPoolClientName" {
  type    = string
  default = "CognitoAuthApiClientCosmos"
}
variable "CognitoUserPoolDomain" {
  type    = string
  default = "CognitoDomainCosmos"
}
variable "cognito_config" {
  type = object({
    pw_minimum_length                   = number
    pw_temporary_password_validity_days = number
  })
  default = {
    pw_minimum_length                   = 8
    pw_temporary_password_validity_days = 30
  }
}

variable "apigateway_id" {
  type = string
  default = "notconfigure"
}