# credentials from ~/.aws/ 
 
provider "aws" {
  alias   = "tlz-account"
  region  = var.region
  profile = var.profile
}
