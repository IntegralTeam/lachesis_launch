#!/bin/sh

image_name=snapshot-lachesis
[ ! "$(docker ps -a | grep $snapshot-lachesis)" ] && docker run -d --name $snapshot-lachesis $snapshot-lachesis || docker start $snapshot-lachesis
systemd-run --user socat -v -v -v TCP-LISTEN:8080,fork,reuseaddr TCP-CONNECT:$(docker inspect snapshot-lachesis | grep IPAddress | tail -n 1 | cut -d '"' -f 4):80



