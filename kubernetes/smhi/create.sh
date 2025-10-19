#!/bin/sh

docker build -t smhi:latest .
docker tag smhi:latest registry.cube.local:5000/smhi
docker push registry.cube.local:5000/smhi

kubectl apply -f smhi.yaml

