#CLIENT
resource "aws_cognito_user_pool" "cosmos-pool" {
  name                     = "cosmos-pool-${stage}"
  username_attributes      = ["email"]
  auto_verified_attributes = ["email"]
  password_policy {
    minimum_length                   = var.cognito_config.pw_minimum_length
    temporary_password_validity_days = var.cognito_config.pw_temporary_password_validity_days
  }
  schema {
    name                = "email"
    attribute_data_type = "String"
    required            = true
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }
  schema {
    name                = "name"
    attribute_data_type = "String"
    required            = true
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }
}

resource "aws_cognito_user_pool_client" "cosmos-pool-client" {
  name                = "cosmos-pool-client-${stage}"
  user_pool_id        = aws_cognito_user_pool.cosmos-pool.id
  generate_secret     = false
  explicit_auth_flows = ["ADMIN_NO_SRP_AUTH"]
}


