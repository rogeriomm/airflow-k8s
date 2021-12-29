   * Clean persistent volumes before install

```commandline
kubectl create ns airflow
kubectl apply -f persistent-volume-claim.yaml
```

```commandline
helm install airflow apache-airflow/airflow --namespace airflow -f values.yaml
```
```text
NAME: airflow
LAST DEPLOYED: Thu Dec 16 10:14:25 2021
NAMESPACE: airflow
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Thank you for installing Apache Airflow 2.2.1!

Your release is named airflow.
You can now access your service(s) by following defined Ingress urls:

Airflow Webserver:
      http://airflow.worldl.xpt//
Flower dashboard:
      http://flower.worldl.xpt//
Default Webserver (Airflow UI) Login credentials:
    username: admin
    password: admin
Default Postgres connection credentials:
    username: postgres
    password: postgres
    port: 5432

You can get Fernet Key value by running the following:

    echo Fernet Key: $(kubectl get secret --namespace airflow airflow-fernet-key -o jsonpath="{.data.fernet-key}" | base64 --decode)
```


   * http://flower.worldl.xpt/
   * http://airflow.worldl.xpt/
      * User: admin, Password: admin

# Certificates
   * https://stackoverflow.com/questions/65403910/ssl-certificate-verification-error-airflow-s3: SSL Certificate Verification Error Airflow S3
# References
   * https://airflow.apache.org/docs/helm-chart/stable/index.html: Helm Chart for Apache Airflow
      * https://airflow.apache.org/docs/helm-chart/stable/production-guide.html#webserver-secret-key
   * https://artifacthub.io/packages/helm/airflow-helm/airflow/

