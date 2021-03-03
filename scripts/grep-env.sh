#!/bin/sh
cat */*/*/* | grep -e "\{$.*\}"
cat */*/* | grep -e "\{$.*\}"
cat */* | grep -e "\{$.*\}"
cat * | grep -e "\{$.*\}"
