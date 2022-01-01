FROM apache/airflow:2.2.1

USER root

# Add self signed certificates
COPY certs/*.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

# Set AWS cli TLS CA certificate
ENV AWS_CA_BUNDLE=/usr/local/share/ca-certificates/minikube-ca.crt

# Set curl TLS CA certificate
ENV CURL_CA_BUNDLE=/usr/local/share/ca-certificates/minikube-ca.crt

#ENTRYPOINT ["/bin/sh"]

COPY etc/sudoers /etc/sudoers

USER 50000
