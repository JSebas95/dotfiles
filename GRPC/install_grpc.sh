#!/bin/bash

#install protoc (compiler) using the image
docker pull namely/protoc-all
#install grpc/phpusing the image
docker pull grpc/php
#Install grpc/go using the image
docker pull grpc/go
#Install redis for go
docker pull redis:alpine
echo "images succesfully installed"
