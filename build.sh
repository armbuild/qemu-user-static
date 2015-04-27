#!/bin/bash

set -xe

ARCH=$(uname -m)


case "$ARCH" in
    x86_64)
        mkdir -p "${ARCH}"
        docker run -it ubuntu:latest /bin/bash -xec "apt-get update; apt-get install -y -qq qemu-user-static"
        docker cp $(docker ps -lq):/usr/bin/ "${ARCH}"/
	docker rm $(docker ps -lq)
	cp -rf "${ARCH}"/bin/qemu-*-static "${ARCH}"/
	rm -rf "${ARCH}"/bin/
        ;;
    *)
        echo "Invalid arch: $ARCH"
        exit 1
        ;;
esac
