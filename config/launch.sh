#!/bin/bash

touch ../src/xdp_lb_kern.c.tmp

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
sudo docker build -t client ./client
sudo docker build -t lb ./load-balancer

sudo docker run -d --name BACKEND_A -h BACKEND_A nginxdemos/hello:plain-text
sudo docker run -d --name BACKEND_B -h BACKEND_B nginxdemos/hello:plain-text
sudo docker run -dit --name CLIENT client
sudo docker run -dit --privileged -v $PWD/../src:/load-balancer --name LB lb
./rename.py
mv ../src/xdp_lb_kern.c.tmp ../src/xdp_lb_kern.c
sudo docker exec LB bash -c 'cd load-balancer ; make'
ip_lb=$(sudo docker inspect LB | grep IPAddress)
echo "ip address of the load-balancer is: $ip_lb"

