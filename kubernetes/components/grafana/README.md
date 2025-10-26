# Installation

## First install
```
kubectl apply -f grafana.yaml
```

## Restore dashboards
### Stop to prep for restoring dashboards
```
kubectl scale --replicas=0 grafana/grafana
```
### Copy old dashboards
```
```
### Start grafana
```
kubectl scale --replicas=1 grafana/grafana
```
