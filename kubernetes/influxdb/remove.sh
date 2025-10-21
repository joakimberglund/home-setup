#!/bin/sh

kubectl delete ns influxdb
kubectl delete pv influxdb-data-pv
#kubectl delete pv influxdb-config-pv

