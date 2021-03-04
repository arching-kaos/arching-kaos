#!/bin/sh
docker run -d --rm --restart always --name opentracker -p 6969:6969/udp -p 6969:6969 lednerb/opentracker-docker
