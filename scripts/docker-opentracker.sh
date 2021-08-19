#!/bin/sh
podman run --pod arching-kaos -d --restart always --name opentracker -p 6969:6969/udp -p 6969:6969 docker.io/lednerb/opentracker-docker
