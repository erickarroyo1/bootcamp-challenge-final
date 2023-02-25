#! /bin/bash

#install nginx and complements for amz linux 2
sudo amazon-linux-extras install -y nginx1 

#install docker and git
sudo yum install docker git -y
sudo usermod -a -G docker ec2-user
sudo id ec2-user
sudo newgrp docker
sudo usermod -a -G docker ssm-user
sudo id ssm-user
sudo newgrp docker
sudo systemctl enable docker.service # inicia automáticamente (revisar***)
sudo systemctl start docker.service
sudo docker ps

#install python

sudo yum install python3-pip -y

#install docker-compose


pip3 install --user docker-compose
docker-compose version


#start nginx
sudo service nginx start
sudo rm /usr/share/nginx/html/index.html
echo '<html><head><title>Bootcamp Terraform Server</title></head><body style="background-color: #1F778D;"><p style="text-align: center;"><span style="color:#FFFFFF;"><span style="font-size:28px;">Welcome to Bootcamp Class Terraform </span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
#test
curl localhost

#clone git

cd ~
sudo git clone https://github.com/erickarroyo1/bootcamp-challenge-final.git
cd bootcamp-challenge-final/final-challenge/Docker/
docker-compose up -d