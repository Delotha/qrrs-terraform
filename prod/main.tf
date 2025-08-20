module "prod" {
  source = "../modules/qrrs"
  environment = {
    name = "prod"
    network_prefix = "10.0"
  }
  asg_min = 1
  asg_max = 10
}
