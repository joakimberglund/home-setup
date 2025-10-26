#!/bin/sh

kubectl delete ns docker-registry-ui
kubectl delete pv docker-registry-ui-data-pv

