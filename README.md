# arching-kaos

## Documentation

Documentation can be found on `/docs/`

Can be launched with docker too

`docker-arching-kaos-docs.sh`

## Components

### TORRENT-TRACKER

Docker with opentracker
`/scripts/docker-opentracker.sh`

### IRC

`/etc/ngircd/ngircd.conf`

### WEB SERVER

NGINX

`/etc/nginx/sites-enabled`

### STREAM SERVER

icecast2

`/etc/icecast2/icecast.xml`

Docker

`/scripts/docker-icecast.sh`


### PLAYER

liquidsoap

`/etc/liquidsoap/radio.liq`



## Storage

### FS

`/storage`

### Torrent

### IPFS

`/storage/ipfs`

#### Docker

`scripts/docker-ipfs.sh`

### Dat

`/storage/dat`

`scripts/run-dat-gateway.sh`

`scripts/run-dat.sh`

#### Docker submodule

`modules/docker-dat-store`

## Tools, scripts

### Generate playlist

`scripts/gen-playlist.sh`

### Configuration

#### Environment tools

"grep"s the variables of the project

`scripts/grep-env.sh`

Supposingly we are going to use this to render all the configuration through it

`scripts/sed-example.sh`

Example is for rendering {$LOCATION} variable to "earth".

#### CJDNS tools

Strip comments from cjdroute configuration

`scripts/cjdroute-strip-comment.sh`


