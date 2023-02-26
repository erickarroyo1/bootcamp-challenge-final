
module "ec2" {
  source        = "../../../../../modules/compute/ec2/instance"
  instance_type = var.instance_type
  count         = var.instance_count
  user_data     = templatefile("${var.user_data}", {})
  #instance_profile_name  = aws_iam_instance_profile.iam-profile.name
  instance_profile_name  = data.terraform_remote_state.iam_instance_profile.outputs.aws_iam_instance_profile
  root_block_device_size = var.root_block_device_size
  public_subnets_ids     = [data.terraform_remote_state.vpc.outputs.vpc_subnet_public_ids[0]]
  keyname                = aws_key_pair.ssh-key.key_name
  sg                     = [aws_security_group.grupo_seguridad.id]
  enable_public_ip       = true #asignar ip publica automáticamente

  providers = {
    aws = aws.bootcamp
  }
  depends_on = [aws_key_pair.ssh-key]
}
