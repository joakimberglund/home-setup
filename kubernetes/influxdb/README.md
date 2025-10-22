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
influxd restore -portable -host influxdb:8088 /tmp/influxdb-backup

rm -rf /tmp/influxdb-backup
```
