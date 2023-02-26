profile                = "Test-LandindZone"
region                 = "us-east-1"
app                    = "server-tf"
env                    = "dev"
ami_id                 = "ami-0fe472d8a85bc7b0e"
instance_type          = "t2.micro"
keyname                = "bootcamp-final-keypair"
root_block_device_type = "gp3"
root_block_device_size = 20
sufix                  = "bootcamp-eduit"
instance_count         = 1
user_data              = "../../../../../bootstrap/bootstrap-server.sh"


#note if this file contain sensitive variables, please add to .gitignore