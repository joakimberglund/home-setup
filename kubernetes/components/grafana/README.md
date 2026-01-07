# Installation

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


Det är faktiskt ett mycket smidigare sätt i Kubernetes! När du använder miljövariabler (env) behöver du inte hantera filer eller subPath-monteringar, och Grafana prioriterar dessa värden framför standardinställningarna.

Här är manifesten för att köra hela databaskonfigurationen via miljövariabler:

1. Secret (för känslig data)
Vi lägger både databaslösenordet och användarnamnet här för god sed.

YAML

apiVersion: v1
kind: Secret
metadata:
  name: grafana-db-credentials
type: Opaque
stringData:
  # Ändra till dina riktiga värden
  user: "grafanauser"
  password: "ditt_starka_lösenord"
2. Deployment (med enbart miljövariabler)
I stället för en ConfigMap använder vi prefixet GF_ följt av sektion och variabelnamn (t.ex. [database] type blir GF_DATABASE_TYPE).

YAML

apiVersion: apps/v1
kind: Deployment
metadata:
  name: grafana
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana
  template:
    metadata:
      labels:
        app: grafana
    spec:
      containers:
      - name: grafana
        image: grafana/grafana:latest
        ports:
        - containerPort: 3000
        
        env:
        # Databaskonfiguration via Env Vars
        - name: GF_DATABASE_TYPE
          value: "mysql"
        - name: GF_DATABASE_HOST
          value: "mariadb:3306"  # Namnet på din MariaDB Service
        - name: GF_DATABASE_NAME
          value: "grafana"
          
        # Hämta användare och lösenord från Secreten
        - name: GF_DATABASE_USER
          valueFrom:
            secretKeyRef:
              name: grafana-db-credentials
              key: user
        - name: GF_DATABASE_PASSWORD
          valueFrom:
            secretKeyRef:
              name: grafana-db-credentials
              key: password

        # Valfritt: Om du vill tillåta osäkra anslutningar (t.ex. vid lokala tester)
        - name: GF_DATABASE_SSL_MODE
          value: "disable"



