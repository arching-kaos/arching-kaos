#!/bin/sh
docker run -e "port=3002:3000" --volume /arching-kaos-docs:/usr/local/docsify littlstar/docker-docsify --rm
