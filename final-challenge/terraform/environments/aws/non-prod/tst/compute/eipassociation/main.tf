module "eip_server_association" {
  source             = "../../../../../../modules/networking/vpc/eipassociation"
  instance_id        = local.string_instance_id
  public_ip          = data.terraform_remote_state.eip_server.outputs.eip_public_ip
  private_ip_address = local.string_private_ip_address
  providers = {
    aws = aws.bootcamp-tst
  }
}