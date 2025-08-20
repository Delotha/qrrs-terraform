variable "environment" {
  description = "Deployment environment"

  type        = object ({
    name           = string
    network_prefix = string
  })
  default = {
    name           = "prod"
    network_prefix = "10.0"
  }
}

variable "asg_min" {
  description = "Minimum instance count for the ASG"
  default     = 1
}

variable "asg_max" {
  description = "Maximum instance count for the ASG"
  default     = 2
}
