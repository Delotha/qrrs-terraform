# Network:

module "network" {
  source = "./modules/network"
  environment = {
    name           = "qrrs"
    network_prefix = "10.0"
  }
}

# Database:

# Generate a secure random password
resource "random_password" "db" {
  length           = 16
  special          = true
  override_special = "!@#$%&*()_+-=[]{}<>?"
}

module "database" {
  source      = "./modules/database"
  environment = {
    name           = "qrrs"
    network_prefix = "10.0"
  }
  vpc_id      = module.network.vpc_id
  subnet_ids  = module.network.public_subnets
  db_password = random_password.db.result
}
