# rpi-alpine-containerd-config
This repository contains setup tools to create a small and simple containerd server on Raspberry Pi 3B+ with Alpine Linux

## prerequisites

1. [Install Alpine Linux on your raspberry pi](https://wiki.alpinelinux.org/wiki/Raspberry_Pi)

2. Download and run scripts

    ``` bash
        wget -O rpi-config.tar.gz https://github.com/pPrecel/rpi-alpine-containerd-config/archive/main.tar.gz
        tar -zxf rpi-config.tar.gz
        cd rpi-alpine-containerd-config-main/
        ./bootstrap.sh
    ```
