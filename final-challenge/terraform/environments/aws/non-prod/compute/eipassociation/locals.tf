locals {
  #convert tuple to string using join
  tuple_instance_id         = data.terraform_remote_state.ec2_server.outputs.instance_id
  string_instance_id        = join(",", local.tuple_instance_id)
  tuple_private_ip_address  = data.terraform_remote_state.ec2_server.outputs.private_ip
  string_private_ip_address = join(",", local.tuple_private_ip_address)

}