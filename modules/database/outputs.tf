output "db_endpoint" {
  description = "Database connection endpoint"
  value       = aws_db_instance.database.endpoint
}

output "db_port" {
  description = "Database port"
  value       = aws_db_instance.database.port
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.database.db_name
}
