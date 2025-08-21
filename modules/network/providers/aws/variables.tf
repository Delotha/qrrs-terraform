variable "environment" {
  description = "Deployment environment"
  type = object({
    name           = string
    network_prefix = string
  })
}

variable "azs" {
  description = "Availability Zones for the VPC"
  type        = list(string)
  default     = ["ca-central-1a", "ca-central-1b", "ca-central-1d"]
}
