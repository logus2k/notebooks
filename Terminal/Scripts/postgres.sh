#!/bin/bash

ALL_POSTGRES_CONTAINERS=$(docker ps -a -f ancestor=postgres --format="{{ .ID}}")
# echo $ALL_POSTGRES_CONTAINERS

FIRST_POSTGRES_CONTAINER=${ALL_POSTGRES_CONTAINERS[@]:0:12}
# echo "$FIRST_POSTGRES_CONTAINER"

docker start $FIRST_POSTGRES_CONTAINER >/dev/null

# docker exec -it Postgres psql -U postgres -W 
docker exec -ti $FIRST_POSTGRES_CONTAINER psql -U postgres -w
docker stop $FIRST_POSTGRES_CONTAINER >/dev/null





# ATTENTION! This deletes all containers based on image XPTO:
# for n in $(docker ps -a -f ancestor=XPTO --format="{{ .ID}}"); do; docker rm "$n"; done;

# Lists all containers using a custom table
# docker ps -a -s --format "table {{ .ID }}\t{{.Image}}\t{{ .Size }}"
# alias dps='docker ps -a -s --format "table {{ .ID }}\t{{.Status}}\t{{.Image}}\t{{ .Size }}"'
