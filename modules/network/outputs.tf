output "vpc_id" {
  value = module.provider_network.vpc_id
}

output "public_subnets" {
  value = module.provider_network.public_subnets
}
