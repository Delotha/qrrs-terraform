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

variable "db_version" {
  description = "Database version to use"
  type        = string
  default     = "17"
}

variable "db_engine" {
  description = "Database type"
  type        = string
  default     = "postgres"
}

variable "db_port" {
  description = "Database name"
  type        = number
  default     = 5432
}

variable "db_instance_size" {
  description = "Database instance size"
  type        = string
  default     = "db.t4g.micro"
}

variable "db_min_size" {
  description = "Minimum DB size"
  type        = number
  default     = 20
}

variable "db_max_size" {
  description = "Maximum database size"
  type        = number
  default     = 100
}

variable "db_username" {
  description = "Username for the database"
  type        = string
  default     = "qrrsadmin"
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "qrrsdb"
}
