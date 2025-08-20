module "qrrs" {
  source = "./modules/qrrs"
  environment = {
    name = "qrrs"
    network_prefix = "10.0"
  }
  asg_min = 1
  asg_max = 3
}
