output "eip_association_id" {
  value = aws_eip_association.this.id
}
output "eip_association_instance_id" {
  value = aws_eip_association.this.instance_id
}
output "eip_association_public_ip" {
  value = aws_eip_association.this.public_ip
}
output "eip_association_private_ip" {
  value = aws_eip_association.this.private_ip_address
}