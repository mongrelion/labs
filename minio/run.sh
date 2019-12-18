#!/usr/bin/env bash

#docker network create minio
docker run -d --name minio-1 -e MINIO_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE -e MINIO_SECRET_KEY=AKIAIOSFODNN7EXAMPLE -v ${PWD}/data1:/data1 -p 9001:9000 --network minio minio/minio server http://minio-{1...4}/data{1...4}
docker run -d --name minio-2 -e MINIO_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE -e MINIO_SECRET_KEY=AKIAIOSFODNN7EXAMPLE -v ${PWD}/data2:/data2 -p 9002:9000 --network minio minio/minio server http://minio-{1...4}/data{1...4}
docker run -d --name minio-3 -e MINIO_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE -e MINIO_SECRET_KEY=AKIAIOSFODNN7EXAMPLE -v ${PWD}/data3:/data3 -p 9003:9000 --network minio minio/minio server http://minio-{1...4}/data{1...4}
docker run -d --name minio-4 -e MINIO_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE -e MINIO_SECRET_KEY=AKIAIOSFODNN7EXAMPLE -v ${PWD}/data4:/data4 -p 9004:9000 --network minio minio/minio server http://minio-{1...4}/data{1...4}
