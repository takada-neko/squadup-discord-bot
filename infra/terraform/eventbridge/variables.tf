# variables.tf
variable "project_name" {
  type        = string
  default     = "your-project"
  description = "Project name used as a resource name prefix."
}

variable "environment" {
  type        = string
  default     = "test"
  description = "Deployment environment. Example: prod, stg, test."

  validation {
    condition     = contains(["prod", "stg", "test"], var.environment)
    error_message = "environment must be one of: prod, stg, test."
  }
}

variable "purpose" {
  type        = string
  default     = "general"
  description = "Purpose of the EventBridge Scheduler. Example: weekly-post, daily-checkin."
}

variable "schedule_expression" {
  type        = string
  description = "Schedule expression for EventBridge Scheduler. Example: cron(30 12 ? * MON *), rate(1 day)."
}

variable "schedule_timezone" {
  type        = string
  default     = "Asia/Tokyo"
  description = "Timezone used by EventBridge Scheduler."
}

variable "target_lambda_arn" {
  type        = string
  description = "ARN of the Lambda function invoked by the scheduler."
}

variable "scheduler_role_arn" {
  type        = string
  description = "ARN of the IAM role used by EventBridge Scheduler to invoke Lambda."
}

variable "target_input" {
  type        = string
  default     = "{}"
  description = "JSON payload passed to the Lambda function. Example: {\"key\": \"value\"}."
}
