   * Clean persistent volumes before install
```commandline
cd scripts
./clean-pv.sh
```

   * Create airflow namespace and persistent volume claim
```commandline
cd k8s/yaml
kubectl create ns airflow
kubectl apply -f persistent-volume-claim.yaml
```

   * Add helm repository
```commandline
helm repo add apache-airflow https://airflow.apache.org
helm repo update
```

   * Install Helm chart
```commandline
helm install airflow apache-airflow/airflow --namespace airflow --version 1.3.0 --values values.yaml
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

# Uninstall
```commandline
helm uninstall airflow --namespace airflow
```
```commandline
kubectl delete ns airflow
```

```commandline
cd scripts
./clean-pv.sh
```

# Certificates
   * https://stackoverflow.com/questions/65403910/ssl-certificate-verification-error-airflow-s3: SSL Certificate Verification Error Airflow S3

## curl 
```commandline
curl https://minio.minio-tenant-1.svc.cluster.local
```
   * Dockerfile
```commandline
export CURL_CA_BUNDLE=/usr/local/share/ca-certificates/minikube-ca.crt
```

## Python
```python
import http.client

connection = http.client.HTTPSConnection("minio-tenant-1-console.minio-tenant-1.svc.cluster.local", 9443)
connection.request("GET", "/login")
response = connection.getresponse()
print("Status: {} and reason: {}".format(response.status, response.reason))
```

## AWS cli/Airflow S3 connection
   * https://stackoverflow.com/questions/32946050/ssl-certificate-verify-failed-in-aws-cli: SSL CERTIFICATE_VERIFY_FAILED in aws cli

   * Dockerfile
```commandline
export AWS_CA_BUNDLE=/usr/local/share/ca-certificates/minikube-ca.crt
```

# Helm repo versions
```commandline
helm search repo apache-airflow/airflow --versions
```

```text
NAME                  	CHART VERSION	APP VERSION	DESCRIPTION
apache-airflow/airflow	1.3.0        	2.2.1      	The official Helm chart to deploy Apache Airflo...
apache-airflow/airflow	1.2.0        	2.1.4      	The official Helm chart to deploy Apache Airflo...
apache-airflow/airflow	1.1.0        	2.1.2      	The official Helm chart to deploy Apache Airflo...
apache-airflow/airflow	1.0.0        	2.0.2      	Helm chart to deploy Apache Airflow, a platform...
```

# Minio
   * https://stackoverflow.com/questions/55529401/airflow-minio-how-do-i-use-minio-as-a-local-s3-proxy-for-data-sent-from-airflow

   * Airflow connection Id: "aws_default". Extra configuration:
```json
{"aws_access_key_id": "minio", "aws_secret_access_key": "awesomes3", "host": "https://minio.minio-tenant-1.svc.cluster.local"}
```


# References
   * https://airflow.apache.org/docs/helm-chart/stable/index.html: Helm Chart for Apache Airflow
      * https://airflow.apache.org/docs/helm-chart/stable/production-guide.html#webserver-secret-key
   * https://artifacthub.io/packages/helm/airflow-helm/airflow/
   * https://github.com/airflow-helm/charts/blob/main/charts/airflow/values.yaml
   * https://airflow.apache.org/docs/apache-airflow/1.10.12/usage-cli.html: Using the Command Line Interface
   * https://www.youtube.com/watch?v=dGn5gfzGFJs: Install Apache Airflow on MacOS