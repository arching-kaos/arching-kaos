#!/bin/sh
find $PWD/storage | grep ogg > $PWD/storage/current_playlist.m3u
sed -i.bak -e 's/'$PWD'\/storage/\/radio/g' $PWD/storage/current_playlist.m3u
