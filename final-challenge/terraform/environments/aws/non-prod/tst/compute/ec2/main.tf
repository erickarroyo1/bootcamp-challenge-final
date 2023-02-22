
module "ec2" {
  source                 = "../../../../../../modules/compute/ec2/instance"
  instance_type          = var.instance_type
  count                  = var.instance_count
  user_data              = var.user_data
  root_block_device_size = var.root_block_device_type
  public_subnets_ids     = var.public_subnets_ids
  keyname                = var.keyname
  sg                     = [aws_security_group.grupo_seguridad.id]
  providers = {
    aws = aws.bootcamp-tst
  }
}

