#!/bin/bash

touch ../src/xdp_lb_kern.c.tmp

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
sudo docker build -t client ./client
sudo docker build -t lb ./load-balancer

sudo docker run -d --name BACKEND_A nginxdemos/hello:plain-text
sudo docker run -d --name BACKEND_B nginxdemos/hello:plain-text
#sudo gnome-terminal -- sudo docker run -it --name CLIENT client
#sudo gnome-terminal -- sudo docker run -v $PWD/../src:/load-balancer --privileged -it --name LB lb
# je voudrais pouvoir renommer les terminaux et mettre un flag qui hold https://askubuntu.com/questions/46627/how-can-i-make-a-script-that-opens-terminal-windows-and-executes-commands-in-the 
# il faudrait que je trouve un moyen de pouvoir attendre la complétion des commandes dans les nouveaux terminaux avant de lancer ./rename.py
#./rename.py
#mv ../src/xdp_lb_kern.c.tmp ../src/xdp_lb_kern.c
# afficher l'ip du loadbalancer

#in my profile preferences, in command sub section, when command exits : hold the terminal open
