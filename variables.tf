variable "environment_name" {
  description = "Deployment environment name"
  type        = string
  default     = "qrrs"
}

variable "network_prefix" {
  description = "Network prefix for the VPC"
  type        = string
  default     = "10.0"
}
