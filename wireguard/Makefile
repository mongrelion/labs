IMG := wireguard

build:
	@docker build -t ${IMG} .

node1:
	@docker run --rm -it --name node1 --privileged=true ${IMG} bash

node2:
	@docker run --rm -it --name node2 --privileged=true ${IMG} bash
