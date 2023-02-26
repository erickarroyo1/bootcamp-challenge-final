# credentials from ~/.aws/  
provider "aws" {
  alias   = "bootcamp"
  region  = var.region
  profile = var.profile
}