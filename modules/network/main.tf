module "provider_network" {
  source      = "./providers/${var.cloud_provider}"
  environment = var.environment
}
