# Installation
For disk so allocates a PV (Physical Volume) for each node.
All applications claims a part of it via a PVC.

## Setup
```
kubectl apply -f cluster-pv.yaml
kubectl get pv
```




