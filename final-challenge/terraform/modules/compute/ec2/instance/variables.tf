variable "sg" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "key" {
  default = ""
}

variable "instance_count" {
  default = 1
}

variable "public_subnets_ids" {
  type = list(string)
}

variable "environment" {
  default = "develop"
}

variable "name" {
  default = "ec2 instace"

}


variable "user_data" {
  default = null
}
variable "instance_profile_name" {
  default = null
}


variable "root_block_device_size" {
  default = 50
}

variable "root_block_device_type" {
  default = "gp2"
}

variable "with_extra_ebs_volume" {
  default = "NO"
}

variable "extra_block_device_name" {
  default = "/dev/xvdb"
}

variable "extra_block_volume_device_size" {
  default = 50
}

variable "extra_block_volume_device_type" {
  default = "gp2"
}

variable "tags" {
  default = {}
}

variable "with_daily_backup_scheduled" {
  default = true
}

variable "with_weekly_backup_scheduled" {
  default = true
}

variable "with_monthly_backup_scheduled" {
  default = true
}

variable "extra_ebs_block" {
  type = list(object({
    device_name  = string
    volume_type  = string
    volume_size  = string
    delete_on_termination = bool
  }))
  default     = []
  description = "extra ebs block device"
}
variable "ebs_block_device_encrypted" {
  default = true
}

variable "enable_public_ip" {
  default = false
}

variable "keyname" {
  
}

variable "ami_id" {
  default = "ami-0557a15b87f6559cf"
  
}