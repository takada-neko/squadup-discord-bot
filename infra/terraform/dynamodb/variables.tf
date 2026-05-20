# variables.tf

variable "project_name" {
  type        = string
  default     = "YourProject"
  description = "Project name used as a resource name prefix."
}

variable "environment" {
  type        = string
  default     = "test"
  description = "Deployment environment. Example: prod, stg, test."
}

variable "purpose" {
  type        = string
  default     = "vote"
  description = "Purpose of the resource. Example: vote, checkin, schedule."
}