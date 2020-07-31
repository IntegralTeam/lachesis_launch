#!/bin/sh

image_name=snapshot-lachesis
[ ! "$(docker ps -a | grep $image_name)" ] && docker run -d -p 80 --name $image_name $image_name || docker start $image_name
systemd-run --user socat -v -v -v TCP-LISTEN:8080,fork,reuseaddr TCP-CONNECT:$(docker inspect $image_name | grep IPAddress | tail -n 1 | cut -d '"' -f 4):80



