#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "Run with sudo"
   exit 1
fi
#install docker and docker-compose
apt-get update
apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce
usermod -aG docker $USER
echo "Docker successfully installed"
curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
#install protoc (compiler) using the image
docker pull namely/protoc-all
#install grpc/phpusing the image
docker pull grpc/php
#Install grpc/go using the image
docker pull grpc/go
#Install redis for go
docker pull redis:alpine

