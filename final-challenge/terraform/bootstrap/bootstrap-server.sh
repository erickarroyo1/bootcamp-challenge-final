#!/bin/bash


sudo apt update -y
sudo apt install curl net-tools inetutils-ping docker docker-compose git -y

echo -e 'install docker and git\n'
# docker and git

sudo systemctl enable docker.service
echo '1'
sudo systemctl start docker.service
echo '2'
sudo usermod -a -G docker ubuntu
echo '3'

echo -e 'fin docker and git\n'

echo 'docker ps'

docker ps  #ejecución sin root


echo 'inicializar git y ejecutar docker'


cd ~
echo '1'
rm -rf ~/bootcamp-challenge-final/
sudo git clone https://github.com/erickarroyo1/bootcamp-challenge-final.git
echo '2'
cd bootcamp-challenge-final/final-challenge/Docker/
echo -e '\ninicio docker-compose\n'

sudo docker-compose up -d
sudo newgrp docker


echo 'fin script bootstrap'
