#!/bin/sh

kubectl delete ns docker-registry
kubectl delete pv docker-registry-data-pv

