# load-balancer

A step further Liz Rice's lb-from-scratch

## How to launch ?

Clone this repository.
```console
X:~/load-balancer$ cd src/libbpf
X:~/load-balancer/src/libbpf$ git submodule init
X:~/load-balancer/src/libbpf$ git submodule update
```

Then 
```console
X:~/load-balancer$ cd config
X:~/load-balancer/config$ ./launch.sh
```

Now you can play with the load-balancer doing
```console
X:~/load-balancer/config$ sudo docker exec -it CLIENT bash
root@eeeeeeeeddd4:/# curl IP_OF_LOAD_BALANCER
```

