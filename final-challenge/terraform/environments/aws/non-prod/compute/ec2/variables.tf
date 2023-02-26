variable "region" {}
variable "profile" {}
variable "ami_id" {}
variable "instance_count" {}
variable "keyname" {
    default = "key_pair_bootcamp"
}
variable "instance_type" {}
variable "user_data" {}
variable "root_block_device_type" {}
variable "root_block_device_size" {}
variable "sufix" {}
variable "app" {}
variable "env" {}



