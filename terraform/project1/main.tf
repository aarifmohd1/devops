#root

module "vpc" {
  source            =       "./vpc"
  az                =       var.az_val
}

module "ec2" {
  source            =       "./web"
  sn                =       module.vpc.pb_sn
  sg                =       module.vpc.sg
}