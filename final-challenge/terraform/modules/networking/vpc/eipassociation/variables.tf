variable "name" {
  default = "eip_association"
}
variable "environment" {
  default = "develop"
}
variable "dependencies" {
  default = null
}

variable "allocation_id" {
  description = "(Optional) The allocation ID. This is required for EC2-VPC."
  default     = null
  type        = string
}
variable "allow_reassociation" {
  description = "(Optional, Boolean) Whether to allow an Elastic IP to be re-associated. Defaults to true in VPC."
  default     = null
}
variable "instance_id" {
  description = "(Optional) The ID of the instance. This is required for EC2-Classic. For EC2-VPC, you can specify either the instance ID or the network interface ID, but not both. The operation fails if you specify an instance ID unless exactly one network interface is attached."
  default     = null
  type        = string
}
variable "network_interface_id" {
  description = "(Optional) The ID of the network interface. If the instance has more than one network interface, you must specify a network interface ID."
  default     = null
}
variable "private_ip_address" {
  description = "(Optional) The primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address."
  default     = null
}
variable "public_ip" {
  description = "(Optional) The Elastic IP address. This is required for EC2-Classic. "
  default     = null
}