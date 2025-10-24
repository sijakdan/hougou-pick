#!/usr/bin/env bash

set -e

if [ ! -f .env ]
then
  export $(cat .env | xargs)
fi

# My favorite from the comments. Thanks @richarddewit & others!
set -a && source .env && set +a

export PGPASSWORD=$POSTGRES_PASSWORD

psql "postgresql://$POSTGRES_USER@$POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DB" -f $1