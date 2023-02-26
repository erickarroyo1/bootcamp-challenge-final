locals {
  common_tags = {
    Terraform = "True"
    Owner     = "Erick Arroyo"
    Githuburl = "https://github.com/erickarroyo1/bootcamp-challenge-final"
    Company   = "Bootcamp EducaciónIT"
  }
  tuple_public_dns  = module.ec2[0].public_dns
  string_public_dns = join(",", local.tuple_public_dns)
}