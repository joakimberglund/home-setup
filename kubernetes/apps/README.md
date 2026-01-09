# Applications

This directory contains the instructions for all the applications that should be installed in the cluster.

I use the **.yaml2** extension for disabled applications so they won't be autoloaded
Also I move them to the archive dir


# Start order

```
metadata:
  name: my-database
  namespace: argocd
  annotations:
    # Denna startar före Wave 0
    argocd.argoproj.io/sync-wave: "-1"
```

#### -1
metallb

sealed-secret

#### 0
portainer

#### 1
mariadb

influxdb

docker-registry

#### 2
grafana

omada-controller

### 3
smhi

 
