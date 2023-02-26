terraform {
  required_version = ">= 1.2.8"
  backend "s3" {
    bucket         = "tf-remote-state-tlz-bootcamp"
    key            = "bootcamp/final-challenge/compute/ec2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-dynamodb-tlz-bootcamp"
    encrypt        = true
    profile        = "Test-LandindZone"
  }
}