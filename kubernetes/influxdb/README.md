### Install
```
kubectl apply -f influxdb.yaml
```
### Backup
```
mkdir -p /tmp/influxdb-backup
influxd backup -portable /tmp/influxdb-backup
```
### Restore
```
influxd restore -portable -host 203.0.113.0:8088 /tmp/influxdb-backup

rm -rf /tmp/influxdb-backup
```
