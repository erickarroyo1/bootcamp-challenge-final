locals {
  common_tags = {
    Terraform = "True"
    Owner     = "Erick Arroyo"
    Githuburl = "https://github.com/erickarroyo1/bootcamp-challenge-final"
    Company   = "Bootcamp EducaciónIT"
  }
  tuple_public_dns         = module.ec2[0].public_dns
  string_public_dns        = join(",", local.tuple_public_dns)
    #convert tuple to string using join
  tuple_instance_id         = data.terraform_remote_state.ec2_server.outputs.instance_id
  string_instance_id        = join(",", local.tuple_instance_id)
  tuple_private_ip_address  = data.terraform_remote_state.ec2_server.outputs.private_ip
  string_private_ip_address = join(",", local.tuple_private_ip_address)
}