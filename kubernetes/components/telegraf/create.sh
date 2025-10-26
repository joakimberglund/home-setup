#!/bin/sh

kubectl create ns telegraf
helm upgrade --install telegraf-ds-k3s -n telegraf -f values.yaml awesome-helm-charts/telegraf-ds-k3s
