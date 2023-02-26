terraform {
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.5"
    }
  }
}



resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.keyname
  subnet_id              = var.public_subnets_ids[0]
  count                  = var.instance_count
  user_data              = var.user_data
  vpc_security_group_ids = var.sg
  iam_instance_profile   = var.instance_profile_name
  associate_public_ip_address         = var.enable_public_ip

  root_block_device {
    volume_size = var.root_block_device_size
    volume_type = var.root_block_device_type
  }

 
  tags = merge(
    {
      Name             = "${var.name}-${terraform.workspace}"
      Environment      = "${terraform.workspace}"
      Terraform        = true
      Comments         = "This resource is managed by Terraform"
    }, var.tags,
  )

}