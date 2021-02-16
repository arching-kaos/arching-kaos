# arching-kaos

## Documentation

Documentation can be found on `/docs/`

Can be launched with docker too

`docker-arching-kaos-docs.sh`


## TORRENT-TRACKER

Docker with opentracker
`/scripts/docker-opentracker.sh`

## IRC

`/etc/ngircd/ngircd.conf`

## WEB SERVER

NGINX

`/etc/nginx/sites-enabled`

## STREAM SERVER

icecast2

`/etc/icecast2/icecast.xml`

Docker

`/scripts/docker-icecast.sh`


## PLAYER

liquidsoap

`/etc/liquidsoap/radio.liq`



## Storage

### FS

### Torrent

### IPFS

### Dat

`scripts/run-dat-gateway.sh`

`scripts/run-dat.sh`

## Tools, scripts

### Generate playlist

`scripts/gen-playlist.sh`

### Configuration

"grep"s the variables of the project

`scripts/grep-env.sh`

Supposingly we are going to use this to render all the configuration through it

`scripts/sed-example.sh`

Example is for rendering {$LOCATION} variable to "earth".


