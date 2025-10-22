# Installation

```
kubectl apply -f influxdb.yaml
```

## Migrate

### Backup
```
mkdir -p /tmp/influxdb-backup
influxd backup -portable /tmp/influxdb-backup
```

### Restore
```
influxd restore -portable -host influxdb:8088 /tmp/influxdb-backup

rm -rf /tmp/influxdb-backup
```

### Turn of old influxdb
```
systemctl stop influxdb
systemctl disable influxdb
```

### Evaluate and then remove packages and old info
```
apt-get remove influxdb
rm -rf /etc/influxdb
rm -rf /var/lib/influxdb
```

