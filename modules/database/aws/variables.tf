variable "environment" {
  description = "Deployment environment object"
  type = object({
    name           = string
    network_prefix = string
  })
}

variable "vpc_id" {
  description = "ID of the VPC where the database will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the database can be deployed"
  type        = list(string)
}

variable "db_aws" {
  description = "Database configuration"
  type = object({
    instance_size = string
    min_size      = number
    max_size      = number
    storage_type  = string
  })
  default = {
    instance_size = "db.t4g.micro"
    min_size      = 20
    max_size      = 100
    storage_type  = "gp3"
  }
}

variable "db_password" { # Passed in
  description = "Password for the database"
  type        = string
  sensitive   = true
}
