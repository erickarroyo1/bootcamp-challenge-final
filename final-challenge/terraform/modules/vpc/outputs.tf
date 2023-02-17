# main
output "vpc_id" {
  value = aws_vpc.vpc_main.id
}

output "vpc_subnet_private_ids" {
  value = aws_subnet.subnet_main_private.*.id
}

output "vpc_subnet_public_ids" {
  value = aws_subnet.subnet_main_public.*.id
}

output "igw_id" {
  value = aws_internet_gateway.igw_main.*.id
}

output "rtb_default_public_ids" {
  value = aws_route_table.rtb_default_main_public.*.id
}

output "rtb_default_private_ids" {
  value = aws_route_table.rtb_default_main_private_az.*.id
}
