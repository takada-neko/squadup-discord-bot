# main.tf

locals {
  resource_name = "${var.project_name}-${var.environment}-${var.purpose}"
}

resource "aws_dynamodb_table" "this" {
  name         = "${local.resource_name}-dynamodb"
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "entity"
  range_key = "sort"

  attribute {
    name = "entity"
    type = "S"
  }

  attribute {
    name = "sort"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  deletion_protection_enabled = true

  tags = {
    Project     = var.project_name
    Environment = var.environment
    Purpose     = var.purpose
    BuiltBy     = "Terraform"
  }
}