//AWS Configuration
variable "region" {}
variable "profile" {}
// VPC for  main VPC

variable "cidr_main_vpc" {}
variable "cidr_public_subnet" {}
variable "cidr_private_subnet" {}
variable "instance_type" {}
variable "app" {}
variable "keyname" {}
variable "key_pair_pub" {}
variable "env" {}
variable "ami" {}
variable "bootstrap-bootcamp-server" {
  type        = string
  description = "path to bootstrap script - user-data"
  default     = "./bootstrap/bootstrap-server.sh"
}
variable "root_block_device_type" {}
variable "root_block_device_size" {}