#!/usr/bin/env bash

set -e

curl -X POST https://api.creco.dev/homeserver-controller/script \
    -d '{"name": "restart-service", "args": "'$1'"}' \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $HOMESERVER_CRECO_TOKEN"
