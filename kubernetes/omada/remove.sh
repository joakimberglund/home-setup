#!/bin/sh

kubectl delete ns omada
kubectl delete pv omada-data-pv
kubectl delete pv omada-logs-pv

