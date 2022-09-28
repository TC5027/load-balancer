FROM ubuntu
RUN apt update && apt install -y clang llvm libelf-dev libpcap-dev gcc-multilib build-essential make linux-tools-common linux-tools-generic
CMD cd load-balancer; make; bash
