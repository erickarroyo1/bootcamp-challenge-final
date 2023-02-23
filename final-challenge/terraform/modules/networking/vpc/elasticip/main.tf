terraform {
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.5"
    }
  }
}
resource "aws_eip" "eip" {
  vpc   = true
  tags = {
    Name        = "${var.name}-${terraform.workspace}"
    Environment = var.environment
    Terraform   = true
    Comments    = "This resource is managed by Terraform"
  }
}