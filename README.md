# load-balancer

A step further Liz Rice's lb-from-scratch

## How to launch ?

In a first terminal:
git clone this
then go in src/libbpf
git submodule init
git submodule update
then go in config and sudo docker-compose up

In a second terminal:
go in config 
chmod+x launch.sh and rename.py if needed
./launch.sh
sudo docker exec -it CONTAINER_ID_OF_LB bash
cd load-balancer
make

(you can get container id doing sudo docker ps)

In a third terminal:
sudo docker exec -it CONTAINER_ID_OF_CLIENT bash
curl IP_ADDRESS_OF_LB

(you can get container ip address doing sudo docker inspect d7f38f660b68 | grep IPAddress)
