variable "subnets" {
  description = "List of subnet IDs for the ECS service."
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs for the ECS service."
  type        = list(string)
}
