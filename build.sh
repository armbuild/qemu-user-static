#!/bin/bash

set -xe


ARCH=$(uname -m)


binary_path() {
    path="${ARCH}"/qemu-arm-static
    mkdir -p "$ARCH"
    touch "${path}"
    chmod +x "${path}"
    echo "${path}"
}


case "$ARCH" in
    x86_64)
        docker run -it --rm ubuntu:latest /bin/bash -xec "apt-get update; apt-get install qemu-arm-static; cat /usr/bin/qemu-arm-static" > $(binary_path)
        ;;
    *)
        echo "Invalid arch: $ARCH"
        exit 1
        ;;
esac
