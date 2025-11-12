# Installation order

Security? It's internal only with no exposure to the internet thus minimal security setup.
Not recommended for internet access!!


## K3S
Documentation: **https://docs.k3s.io/quick-start**

## Git clone
git clone https://github.com/joakimberglund/home-setup.git

### Install
Standard installation except disabling servicelb since we will replace it with MetalLB.
```
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --disable servicelb
echo "KUBECONFIG=/etc/rancher/k3s/k3s.yaml" >> /etc/environment
cp home-setup/kubernetes/rancher-registries.yaml /etc/rancher/k3s/registries.yaml
```

## Helm
[Install](helm.md)

## Argo CD
Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes.
*https://rpi4cluster.com/k3s-argo-cd/*
### Install
```
cd home-setup/kubernetes
kubectl apply -k argocd
kubectl apply -f apps/root-app.yaml
```
### Get passcode
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
### Install ArgoCD OLD!!!!
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch service argocd-server -n argocd --patch '{ "spec": { "type": "LoadBalancer", "loadBalancerIP": "192.168.0.72" } }'
```

## Apps installed via ArgoCD

**Metallb**:                Kubernetes LoadBalancer

**Docker-registry**:            Local registry

**Portainer**:                  Kubernetes GUI

**Influxdb**:                   Metrics Database

**Grafana**:                    Metrics GUI

**MariaDB**:                    SQL Database

**Omada Software Controller**:  Omada GUI

**SMHI cron**:                  Pull SMHI forecast data and push it to InfluxDB

