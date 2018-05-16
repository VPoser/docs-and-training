#!/bin/bash

# Builds and runs the container locally (for testing purposes)

cname=app-simple

if [ -z "$1" ]
  then
    echo No port given, setting port to 8080
    port=8080
else
  port=$1
fi

docker kill $cname
docker rm $cname
docker build -t $cname .
docker run -d -p $port:80 --env-file=env --name $cname $cname