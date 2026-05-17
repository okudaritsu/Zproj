#!/bin/bash

echo "Let's install Zproj."

sudo cp -f zproj.sh /usr/local/bin
sudo mkdir -p /var/zproj
sudo cp -rf templates /var/zproj

echo "installed! Now type zproj.sh and use it."