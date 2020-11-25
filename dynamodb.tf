resource "aws_dynamodb_table" "cosmos-db" {
  name           = "cosmos-db"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "rut"
  range_key      = "facId_tipo"

  attribute {
    name = "rut"
    type = "N"
  }

  attribute {
    name = "facId_tipo"
    type = "S"
  }

  attribute {
    name = "facId"
    type = "N"
  }

  global_secondary_index {
    name               = "rut_facId_index"
    hash_key           = "rut"
    range_key          = "facId"
    write_capacity     = 0
    read_capacity      = 0
    projection_type    = "ALL"
  }
}

