# Installation

```
kubectl apply -f mariadb.yaml
```

```
mysqldump -u root -p --all-databases > all.sql
mysql -u root -h 192.168.0.79  < all.sql
```

