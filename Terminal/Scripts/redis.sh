#!/bin/bash

ALL_REDIS_CONTAINERS=$(docker ps -a -f ancestor=redislabs/rejson --format="{{ .ID}}")
# echo $ALL_REDIS_CONTAINERS

FIRST_REDIS_CONTAINER=${ALL_REDIS_CONTAINERS[@]:0:12}
# echo "$FIRST_REDIS_CONTAINER"

docker start $FIRST_REDIS_CONTAINER >/dev/null

# docker exec -ti $FIRST_REDIS_CONTAINER bash -c "redis-cli --version; redis-cli"

docker exec -ti $FIRST_REDIS_CONTAINER bash -c 'readarray -n 1 -t SYSTEM_INFO <<< $(cat /etc/os-release); OS=${SYSTEM_INFO[0]:13:-1}; REDIS_INFO=$(redis-cli --version); echo "$REDIS_INFO on $OS"; echo; redis-cli'

docker stop $FIRST_REDIS_CONTAINER >/dev/null





# ATTENTION! This deletes all containers based on image XPTO:
# for n in $(docker ps -a -f ancestor=XPTO --format="{{ .ID}}"); do; docker rm "$n"; done;

# alias dps='docker ps -a -s --format "table {{ .ID }}\t{{.Status}}\t{{.Names}}\t{{.Image}}\t{{ .Size }}"'


# docker start 6918ece11187
# docker exec -ti 6918ece11187 bash

