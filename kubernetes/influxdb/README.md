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
Verify that you didn't get any errors backing it up before starting the next step.


### Restore
```
influxd restore -portable -host influxdb:8088 /tmp/influxdb-backup
```
Verify that you didn't get any errors restoring before starting the next step.

### Turn of old influxdb
```
systemctl stop influxdb
systemctl disable influxdb
```

### Evaluate and then remove packages and old info
Verify that everything works as it should before starting this step.
```
apt-get remove influxdb
rm -rf /etc/influxdb
rm -rf /var/lib/influxdb
rm -rf /tmp/influxdb-backup
```
