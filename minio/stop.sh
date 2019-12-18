#!/usr/bin/env bash

for i in {1..4}
do
  docker rm -f minio-${i}
done
