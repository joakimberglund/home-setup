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
[Install](metal-lb/metal-lb.sh)

## Portainer
```
helm repo add portainer https://portainer.github.io/k8s/
helm repo update
helm install --create-namespace -n portainer portainer portainer/portainer
kubectl apply-f portainer-svc.yaml
```

This will make the UI accessible on http://192.168.0.73:9000/.

TODO: switch to DNS name portainer

## InfluxDB
[Instructions](influxdb/README.md)






