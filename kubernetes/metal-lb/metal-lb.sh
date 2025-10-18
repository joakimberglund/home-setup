#!/bin/sh

helm repo add metallb https://metallb.github.io/metallb
helm repo update
kubectl create namespace metallb
helm install metallb metallb/metallb --namespace metallb
kubectl -n metallb get pod

# https://picluster.ricsanfre.com/docs/metallb/

kubectl apply -f metallb-config.yaml
