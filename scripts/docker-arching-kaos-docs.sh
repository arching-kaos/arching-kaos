#!/bin/sh
podman run --name docs --restart always -d -p 3002:3000 -v $PWD/docs:/usr/local/docsify docker.io/littlstar/docker-docsify
