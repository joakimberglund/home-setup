#!/bin/sh


kubectl create namespace docker-registry
kubectl create secret tls docker-registry-tls-cert -n docker-registry --cert=registry.crt --key=registry.key

kubectl apply -f docker-registry.yaml
