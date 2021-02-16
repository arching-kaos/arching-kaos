#!/bin/sh
head -1 /radio/current_playlist.m3u > genplay.m3u && find /dat | grep ogg >> genplay.m3u
cp genplay.m3u /radio/current_playlist.m3u
