output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.qrrs_vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = module.qrrs_vpc.public_subnets
}
