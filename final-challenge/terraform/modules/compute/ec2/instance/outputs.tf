output "publicIp" {
  value = aws_instance.ec2.*.public_ip
}
output "instance_id" {
  value = aws_instance.ec2.*.id
}
output "private_dns" {
  value = aws_instance.ec2.*.private_dns
}
output "private_ip" {
  value = aws_instance.ec2.*.private_ip
}
output "instance_arn" {
  value = aws_instance.ec2.*.arn
}

output "public_dns" {
  value = aws_instance.ec2.*.public_dns
  
}
