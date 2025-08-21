module "database" {
  source = "./modules/database/providers/${var.cloud_provider}"
  environment = var.environment
}
