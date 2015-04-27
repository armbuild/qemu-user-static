#!/bin/bash

set -xe

ARCH=$(uname -m)


case "$ARCH" in
    x86_64)
        mkdir -p "${ARCH}"
        docker run -it --rm ubuntu:latest /bin/bash -xec "apt-get update; apt-get install qemu-user-static"
        docker cp $(docker ps -lq):/usr/bin/ "${ARCH}"/
        ;;
    *)
        echo "Invalid arch: $ARCH"
        exit 1
        ;;
esac
