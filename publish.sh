#!/bin/bash
cd `dirname $0`

repo="kodality"
name="flowable"

#docker login || exit 1
./build.sh

version=$(date +%s)
docker tag $repo/$name:latest $repo/$name:$version &&\
docker push $repo/$name:$version &&\
docker push $repo/$name:latest

