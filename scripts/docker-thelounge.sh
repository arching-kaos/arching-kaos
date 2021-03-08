#!/bin/sh
docker run -d --network=host \
        --name thelounge \
        --volume $PWD/etc/thelounge:/var/opt/thelounge \
        --restart always \
        thelounge/thelounge:latest
