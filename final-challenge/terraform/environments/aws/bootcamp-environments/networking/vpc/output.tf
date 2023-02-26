output "vpc_id" {
  value = module.bootcamp-vpc.vpc_id
}


output "vpc_subnet_private_ids" {
  value = module.bootcamp-vpc.vpc_subnet_private_ids
}

output "vpc_subnet_public_ids" {
  value = module.bootcamp-vpc.vpc_subnet_public_ids
}

output "igw_id" {
  value = module.bootcamp-vpc.igw_id
}

output "rtb_default_public_ids" {
  value = module.bootcamp-vpc.rtb_default_public_ids
}

output "rtb_default_private_ids" {
  value = module.bootcamp-vpc.rtb_default_private_ids
}
