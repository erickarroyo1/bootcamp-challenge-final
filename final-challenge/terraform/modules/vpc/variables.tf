#------------------------------
# Department:   Ciberseguridad
# Author:       squintero
# Module:       network/vpc
#------------------------------

variable "region" {
  default = "eu-west-1"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "sufix_name" {}

variable "vpc_tags" {
  type        = map(string)
  description = "A map of tags for vpc specific resources"
  default = {
    Module = "networking/vpc"
  }
}

# vars main vpc
variable "cidr_vpc_main" {
  default = "0.0.0.0/0"
}

variable "cidr_vpc_main_subnet_private_az" {
  type    = list(string)
  default = []
}

variable "cidr_vpc_main_subnet_public_az" {
  type    = list(string)
  default = []
}