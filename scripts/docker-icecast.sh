#!/bin/sh
docker run -p 8000:8000 -v etc/icecast2/icecast.xml:/etc/icecast2/icecast.xml moul/icecast
