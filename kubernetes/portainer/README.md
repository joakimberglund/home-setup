# Installation

```
helm repo add portainer https://portainer.github.io/k8s/
helm repo update
helm install --create-namespace -n portainer portainer portainer/portainer
kubectl apply-f portainer-svc.yaml
```

This will make the UI accessible on http://192.168.0.73:9000/.

TODO: switch to DNS name portainer
