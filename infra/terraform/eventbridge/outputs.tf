# outputs.tf
output "schedule_name" {
  description = "Name of the EventBridge Scheduler schedule."
  value       = aws_scheduler_schedule.this.name
}

output "schedule_arn" {
  description = "ARN of the EventBridge Scheduler schedule."
  value       = aws_scheduler_schedule.this.arn
}
