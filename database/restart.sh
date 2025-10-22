#!/usr/bin/env bash

set -e

# The initial version
if [ ! -f ./database/.env ]
then
  export $(cat ./database/.env | xargs)
fi

# My favorite from the comments. Thanks @richarddewit & others!
set -a && source ./database/.env && set +a

PORT=4003
LABEL=$1
CPUS=$2
MEMORY=$3
DOCKERFILE_PATH=./database/Dockerfile
POSTGRES_USER=$POSTGRES_USER
POSTGRES_PASSWORD=$POSTGRES_PASSWORD
POSTGRES_DB=$POSTGRES_DB

mkdir -p ./database/pgdata && chmod 700 ./database/pgdata

docker run -d \
  -e POSTGRES_USER=$POSTGRES_USER \
  -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
  -e POSTGRES_DB=$POSTGRES_DB \
  -p $PORT:$PORT \
  --cpus="$CPUS" --memory="$MEMORY" \
  -v ./database/pgdata:/var/lib/postgresql/data \
  --health-cmd='pg_isready -U app' --health-interval=10s --health-timeout=5s --health-retries=5 \
  --name "${LABEL}" \
  postgres:16

echo "✅ Container '${LABEL}' is now running at http://localhost:$PORT"
