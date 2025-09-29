output "public_subnets" {
  description = "List of public subnet IDs from the provider module"
  value       = module.provider_network.public_subnets
}
