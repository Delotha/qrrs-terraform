module "network" {
  source           = "./modules/network"
  environment = {
    name           = "qrrs"
    network_prefix = "10.0"
  }
}

module "database" {
  source      = "./modules/database"
  environment = {
    name           = "qrrs"
    network_prefix = "10.0"
  }
  vpc_id      = module.network.vpc_id
  subnet_ids  = module.network.public_subnets
  db_password = var.db_password
}
