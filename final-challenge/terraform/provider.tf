# credentials from ~/.aws/  
provider "aws" {
  alias   = "bootcamp-prd"
  region  = var.region
  profile = var.profile
}