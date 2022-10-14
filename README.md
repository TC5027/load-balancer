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

## About

The idea behind XDP is to install packet processing programs into the kernel in order to be able to filter traffic at a low-level, in the kernel space. When an XDP program is finished processing a packet, it returns an XDP action among :
* XDP_PASS : let the packet continue to the kernel network stack
* XDP_TX : bounce the packet back to the same Network Interface Controller it arrived on
* XDP_ABORTED : drop the packet
* ...

