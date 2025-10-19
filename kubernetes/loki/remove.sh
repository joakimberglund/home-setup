#!/bin/sh

kubectl delete ns loki
kubectl delete pv loki-data-pv

