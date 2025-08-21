output "db_endpoint" {
  description = "PostgreSQL connection endpoint from the database module"
  value       = module.database.db_endpoint
}

output "db_port" {
  description = "PostgreSQL port from the database module"
  value       = module.database.db_port
}

output "db_name" {
  description = "Database name from the database module"
  value       = module.database.db_name
}
