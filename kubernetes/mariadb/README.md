# Installation

```
kubectl apply -f mariadb.yaml
```

## Migration
To migrate the current data do a backup on the current database server then restore to the new one.

### Backup
```
mysqldump -u root -p --all-databases > all.sql
```
Verif that you didn't get any errors backing it up before starting the restore.

### Restore
```
mysql -u root -h 192.168.0.79  < all.sql
```

### Set root password
```
mysql -u root

ALTER USER 'root'@'localhost' IDENTIFIED BY 'the-new-password';
flush privileges;
exit;
```
