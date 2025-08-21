module "provider_network" {
  source      = "./providers/aws"
  environment = var.environment
  # Change to the appropriate provider: aws, azure, gcp, oracle
}
