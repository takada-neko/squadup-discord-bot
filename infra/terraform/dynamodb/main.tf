# main.tf
locals {
  resource_name = "${var.project_name}-${var.environment}-${var.purpose}"
}

resource "aws_dynamodb_table" "this" {
  name         = "${local.resource_name}-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.hash_key_name
  range_key    = var.range_key_name

  attribute {
    name = var.hash_key_name
    type = "S"
  }

  attribute {
    name = var.range_key_name
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  server_side_encryption {
    enabled = true
  }

  ttl {
    attribute_name = "expires_at"
    enabled        = false
  }

  deletion_protection_enabled = true

  tags = {
    Project     = var.project_name
    Environment = var.environment
    Purpose     = var.purpose
    BuiltBy     = "Terraform"
  }
}
