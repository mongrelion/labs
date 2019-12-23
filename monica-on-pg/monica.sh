#!/usr/bin/env bash

docker run \
  --rm \
  -it \
  --name monica \
  --network home \
  -p 8080:80 \
  --env-file .env \
  monicahq/monicahq:latest
