# Installation order

## K3S
https://docs.k3s.io/quick-start

### Install
```
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --disable servicelb
echo "KUBECONFIG=/etc/rancher/k3s/k3s.yaml" >> /etc/environment
```

## Helm
[Install](helm.md)

## Metal-lb
Kubernetes LoadBalancer

[Install](metal-lb/README.md)

## Argo CD
Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes.
https://rpi4cluster.com/k3s-argo-cd/

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch service argocd-server -n argocd --patch '{ "spec": { "type": "LoadBalancer", "loadBalancerIP": "192.168.0.72" } }'

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-arm64
chmod a+rx /usr/local/bin/argocd
```

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
