
#module "ec2" {
#  source                 = "../terraform/modules/compute/ec2/instance"
#  ami                    = var.ami_id
#  instance_type          = var.instance_type
#  vpc_security_group_ids = [aws_security_group.grupo_seguridad.id]
#  key_name               = var.keyname
#  subnet_id              = module.bootcamp-prd-vpc.aws_subnet.subnet_main_public[count.index].id
#  count                  = var.instance_count
#  user_data              = var.user_data
#  iam_instance_profile   = var.instance_profile_name
#  root_block_device_size = var.root_block_device_type
#}

resource "aws_instance" "server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.grupo_seguridad.id]
  key_name               = var.keyname
  tags                   = merge(local.common_tags, tomap({ "Name" = "${var.app}-ec2-${var.env}", "Environment" = terraform.workspace }))
  provider               = aws.bootcamp-prd
  user_data              = file("${var.bootstrap-bootcamp-server}")
}