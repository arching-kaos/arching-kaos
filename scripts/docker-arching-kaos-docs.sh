#!/bin/sh
docker run --name docs -d -e "port=3002:3000" --volume {$ARCHING_KAOS_BASE_DIR}/docs:/usr/local/docsify littlstar/docker-docsify --rm
