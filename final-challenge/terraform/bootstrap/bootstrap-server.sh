#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service nginx start
sudo rm /usr/share/nginx/html/index.html
echo '<html><head><title>Bootcamp Terraform Server</title></head><body style="background-color: #1F778D;"><p style="text-align: center;"><span style="color:#FFFFFF;"><span style="font-size:28px;">Welcome to Bootcamp Class Terraform </span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
