app                 = "server-tf"
env                 = "prod"
ami                 = "ami-0fe472d8a85bc7b0e"
instance_type       = "t2.micro"
cidr_public_subnet  = ["172.22.10.0/24", "172.22.11.0/24"]
cidr_private_subnet = ["172.22.10.0/24", "172.22.11.0/24"]
cidr_main_vpc       = "172.22.0.0/16"
profile             = "Test-LandindZone"
region              = "us-east-1"

