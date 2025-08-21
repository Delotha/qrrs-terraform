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

variable "db" {
  description = "Database configuration"
  type = object({
    engine        = string
    version       = string
    port          = number
    instance_size = string
    min_size      = number
    max_size      = number
    storage_type  = string
    name          = string
    username      = string
    password      = string
  })
  default = {
    engine        = "postgres"
    version       = "17"
    port          = 5432
    instance_size = "db.t4g.micro"
    min_size      = 20
    max_size      = 100
    storage_type  = "gp3"
    name          = "qrrsdb"
    username      = "qrrsadmin"
    password      = var.db_password
    # Currently getting password from /main.tf
  }
}
