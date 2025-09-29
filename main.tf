# Generate a secure random password
resource "random_password" "db" {
  length           = 16
  special          = true
  override_special = "!@#$%&*()_+-=[]{}<>?"
}

# Network module
module "network" {
  source = "./modules/network"
  environment = {
    name           = var.environment_name
    network_prefix = var.network_prefix
  }
}

# Database module
# module "database" {
#   source      = "./modules/database"
#   environment = {
#     name           = var.environment_name
#     network_prefix = var.network_prefix
#   }
#   vpc_id      = module.network.vpc_id
#   subnet_ids  = module.network.public_subnets
#   db_password = random_password.db.result
# }

# App module
module "app" {
  source          = "./modules/app"
  subnets         = module.network.public_subnets
  security_groups = [] # Add security group IDs here if needed
  ecs_ami_id      = "ami-0b2f6494ff0b07a0e" # Example ECS-optimized Amazon Linux 2 AMI (update as needed)
}
