# # Database outputs
# output "db_endpoint" {
#   description = "PostgreSQL connection endpoint from the database module"
#   value       = module.database.db_endpoint
# }

# output "db_port" {
#   description = "PostgreSQL port from the database module"
#   value       = module.database.db_port
# }

# output "db_name" {
#   description = "Database name from the database module"
#   value       = module.database.db_name
# }

output "app_url" {
	description = "Public URL to access the app"
	value       = "http://${module.app.ec2_public_dns}"
}
