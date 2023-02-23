#Extract data from devops deploymnts for networks in other accounts (VPC and Subnnets)
#para modularizar debe estar esta linea de configuraciín: key     = "env:/${terraform.workspace}/lulox/2-network/2.1-network-environment/terraform.tfstate", en caso que no se tenga, tomará el valor del workspace de networking (sin modularizar)

data "terraform_remote_state" "ec2_server" {
  backend = "s3"
  config = {
    bucket = "tf-remote-state-tlz-bootcamp"
    #se coloca el env de acuerdo al nombramiento de devops en shared services, no se utiliza la variable env de workspace porque estan nombrados diferentes
    key     = "env:/${terraform.workspace}/bootcamp/final-challenge/compute/ec2/terraform.tfstate"
    region  = "us-east-1"
    profile = "Test-LandindZone"
  }
}

data "terraform_remote_state" "eip_server" {
  backend = "s3"
  config = {
    bucket = "tf-remote-state-tlz-bootcamp"
    #se coloca el env de acuerdo al nombramiento de devops en shared services, no se utiliza la variable env de workspace porque estan nombrados diferentes
    key     = "env:/${terraform.workspace}/bootcamp/final-challenge/networking/vpc/eip/terraform.tfstate"
    region  = "us-east-1"
    profile = "Test-LandindZone"
  }
}





#data "terraform_remote_state" "network-play" {
#  backend = "s3"
#  config = {
#    bucket = "lulox-terraform-state"
#    #se coloca el env de acuerdo al nombramiento de devops en shared services, no se utiliza la variable env de workspace porque estan nombrados diferentes
#    key     = "env:/play/lulox/2-network/2.1-network-environment/terraform.tfstate"
#    region  = "us-west-2"
#    profile = "lulox-shared-services"
#  }
#}
#data "terraform_remote_state" "network-qa" {
#  backend = "s3"
#  config = {
#    bucket = "lulox-terraform-state"
#    #se coloca el env de acuerdo al nombramiento de devops en shared services, no se utiliza la variable env de workspace porque estan nombrados diferentes
#    key     = "env:/qa/lulox/2-network/2.1-network-environment/terraform.tfstate"
#    region  = "us-west-2"
#    profile = "lulox-shared-services"
#  }
#}
#data "terraform_remote_state" "network-stg" {
#  backend = "s3"
#  config = {
#    bucket = "lulox-terraform-state"
#    #se coloca el env de acuerdo al nombramiento de devops en shared services, no se utiliza la variable env de workspace porque estan nombrados diferentes
#    key     = "env:/stg/lulox/2-network/2.1-network-environment/terraform.tfstate"
#    region  = "us-west-2"
#    profile = "lulox-shared-services"
#  }
#}
#data "terraform_remote_state" "networking-dev-albs" {
#  backend = "s3"
#  config = {
#    region         = "us-west-2"
#    bucket         = "lulox-tf-remote-state-security"
#    key            = "env:/lulox-albs-fws-dev/transit-network/tgw-connect/terraform.tfstate"
#    profile        = "lulox-shared-services"
#  }
#}
#
#data "terraform_remote_state" "networking-dev-contingency" {
#  backend = "s3"
#  config = {
#    region         = "us-west-2"
#    bucket         = "lulox-tf-remote-state-security"
#    key            = "env:/lulox-cdn-sandbox/transit-network/tgw-connect/terraform.tfstate"
#    profile        = "lulox-shared-services"
#  }
#}
#
#data "aws_security_group" "sg-id-alb-sand" {
#  tags = {
#    Name = "Cloudfront-Contingency-lulox-cdn-sandbox"
#  }
#  provider = aws.lulox-accounts
#}
#data "aws_security_group" "sg-id-alb-play-devops" {
#  tags = {
#    Name = "Cloudfront-Contingency-lx-cdn-playdevops"
#  }
#  provider = aws.lulox-accounts
#}
#data "aws_security_group" "sg-id-alb-qa" {
#  tags = {
#    Name = "Cloudfront-Contingency-lulox-cdn-qa"
#  }
#  provider = aws.lulox-accounts
#}
#data "aws_security_group" "sg-id-alb-stg" {
#  tags = {
#    Name = "Cloudfront-Contingency-lulox-cdn-stg"
#  }
#  provider = aws.lulox-accounts
#}