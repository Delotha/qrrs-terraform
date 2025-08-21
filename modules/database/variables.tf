variable "vpc_id" {
  description = "ID of the VPC where the DB will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the DB can be deployed"
  type        = list(string)
}

variable "db_username" {
  description = "Username for the PostgreSQL database"
  type        = string
  default     = "qrrsadmin"
}

variable "db_password" {
  description = "Password for the PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "qrrsdb"
}
