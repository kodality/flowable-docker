#!/bin/bash
cd `dirname $0`

repo="kodality"
name="flowable"

docker build -t $repo/$name .

