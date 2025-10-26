# Installation


```
helm repo add metallb https://metallb.github.io/metallb
helm repo update
kubectl create namespace metallb
helm install metallb metallb/metallb --namespace metallb
kubectl -n metallb get pod
kubectl apply -f metallb-config.yaml
```

