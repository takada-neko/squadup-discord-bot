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
  description = "Purpose of the resource. Example: vote, checkin, schedule, general."
}

variable "hash_key_name" {
  type        = string
  default     = "entity"
  description = "DynamoDB table hash key attribute name."
}

variable "range_key_name" {
  type        = string
  default     = "sort"
  description = "DynamoDB table range key attribute name."
}
