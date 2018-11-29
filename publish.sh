#!/bin/bash

repo="kodality"
name="flowable"
tag="6.4.0"

#docker login || exit 1
docker build -t $repo/$name . || exit 1

docker push $repo/$name:latest
docker tag $repo/$name $repo/$name:$tag && \
docker push $repo/$name:$tag