// AWS VPC - PRD
module "bootcamp-vpc" {
  source                          = "../../../../../modules/networking/vpc/vpc"
  sufix_name                      = var.sufix
  cidr_vpc_main                   = var.cidr_main_vpc
  cidr_vpc_main_subnet_public_az  = var.cidr_public_subnet
  cidr_vpc_main_subnet_private_az = var.cidr_private_subnet

  tags = merge(local.common_tags, tomap({ "Environment" = terraform.workspace }))
  providers = {
    aws = aws.bootcamp
  }
}
