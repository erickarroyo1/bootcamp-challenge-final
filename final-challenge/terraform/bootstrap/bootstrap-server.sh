#! /bin/bash

#install nginx and complements for amz linux 2
sudo apt update -y
sudo apt install curl net-tools inetutils-ping docker docker-compose git -y

# docker and git

sudo systemctl enable docker.service # inicia automáticamente (revisar***)
sudo systemctl start docker.service
sudo usermod -a -G docker ubuntu
sudo id ubuntu
sudo newgrp docker
docker ps  #ejecución sin root

#clone git and start containers

cd ~
sudo git clone https://github.com/erickarroyo1/bootcamp-challenge-final.git
cd bootcamp-challenge-final/final-challenge/Docker/
docker-compose up - d

#reboot instance 
sudo reboot