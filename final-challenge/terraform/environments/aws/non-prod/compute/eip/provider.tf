# credentials from ~/.aws/  
provider "aws" {
  alias   = "bootcamp-tst"
  region  = var.region
  profile = var.profile
}