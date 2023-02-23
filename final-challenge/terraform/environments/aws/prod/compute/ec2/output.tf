output "publicIp" {
  value = module.ec2[0].publicIp
}
output "instance_id" {
  value = module.ec2[0].instance_id
}
output "private_dns" {
  value = module.ec2[0].private_dns
}
output "private_ip" {
  value = module.ec2[0].private_ip
}
output "instance_arn" {
  value = module.ec2[0].instance_arn
}
