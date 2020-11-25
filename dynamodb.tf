resource "aws_dynamodb_table" "cicd-webapp-table-user" {
  name         = "cicd-webapp-table-user-${stage}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "N"
  }

  attribute {
    name = "Active"
    type = "N"
  }
  global_secondary_index {
    name            = "ActiveIndex"
    hash_key        = "Id"
    write_capacity  = 0
    read_capacity   = 0
    projection_type = "ALL"
  }
}

