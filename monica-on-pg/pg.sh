#!/usr/bin/env bash

docker run --rm -it --name postgres -e POSTGRES_PASSWORD=postgres --network home postgres:12-alpine
