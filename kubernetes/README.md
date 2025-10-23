# Installation order

## K3S
https://docs.k3s.io/quick-start

### Install
```
curl -sfL https://get.k3s.io | sh - --write-kubeconfig-mode 644 --disable=servicelb 
```

## Helm
[Install](helm.md)

## Metal-lb
Kubernetes LoadBalancer

[Install](metal-lb/README.md)

## Portainer
Kubernetes GUI

[Instructions](portainer/README.md)

## InfluxDB
Metrics database

[Instructions](influxdb/README.md)

## MariaDB
Database...

[Instructions](mariadb/README.md)

## Grafana
Metrics GUI

[Instructions](grafana/README.md)

## Telegraf
Metrics collector

[Instructions](telegraf/README.md)

## SMHI puller
Python script for fetching SMHI forcast data based on a lat/long location and pushing it to a InfluxDB v1 database

[Instructions](smhi/README.md)

## Omada Software Controller
Controller software for Omada network hardware

[Instructions](omada/README.md)
