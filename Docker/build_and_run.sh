#!/bin/bash

shopt -s expand_aliases
alias docker='docker.exe'

mkdir build
cp -r ../UDPHolePunchingServer/src/* ./build/
#cd ./build
#find -name "*.java" > sources.txt
#cd ..

docker build -t udp_hole .
[[ $(docker ps -f "name=udp_hole_run" --format '{{.Names}}') != "udp_hole_run" ]] || docker rm -f udp_hole_run
docker run -d -it --rm -p 5666:5666 --name udp_hole_run udp_hole

rm -rf ./build
docker rmi $(docker images | grep none | awk '{print $3}')
