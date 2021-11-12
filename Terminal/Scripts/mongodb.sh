#!/bin/bash

ALL_MONGO_CONTAINERS=$(docker ps -a -f ancestor=mongo --format="{{ .ID}}")
# echo $ALL_MONGO_CONTAINERS

FIRST_MONGO_CONTAINER=${ALL_MONGO_CONTAINERS[@]:0:12}
# echo "$FIRST_MONGO_CONTAINER"

docker start "$FIRST_MONGO_CONTAINER" >/dev/null
sleep 2
docker exec -ti "$FIRST_MONGO_CONTAINER" bash -c "mongo"
docker stop "$FIRST_MONGO_CONTAINER" >/dev/null
