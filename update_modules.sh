#!/bin/bash
cd modules
git submodule update --recursive --remote
git add .
git commit -m "[modules] Update modules"
cd ..

