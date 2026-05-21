# main.tf
locals {
  resource_name = "${var.project_name}-${var.environment}-${var.purpose}"
}

resource "aws_scheduler_schedule" "this" {
  name        = "${local.resource_name}-eventbridge"
  description = "EventBridge Scheduler for ${local.resource_name}"

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = var.schedule_expression
  schedule_expression_timezone = var.schedule_timezone

  target {
    arn      = var.target_lambda_arn
    role_arn = var.scheduler_role_arn
    input    = var.target_input
  }

  state = "ENABLED"

  tags = {
    Project     = var.project_name
    Environment = var.environment
    Purpose     = var.purpose
    BuiltBy     = "Terraform"
  }
}
