variable "ecs_ami_id" {
  description = "The AMI ID for the ECS-optimized EC2 instance. Use a free-tier eligible AMI."
  type        = string
}
variable "subnets" {
  description = "List of subnet IDs for the ECS service."
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs for the ECS service."
  type        = list(string)
}
