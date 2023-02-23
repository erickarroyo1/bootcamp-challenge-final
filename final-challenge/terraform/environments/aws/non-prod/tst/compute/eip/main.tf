module "eip" {
  source = "../../../../../../modules/networking/vpc/elasticip"
  providers = {
    aws = aws.bootcamp-tst
  }
}

