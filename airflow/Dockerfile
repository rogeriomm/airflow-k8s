FROM apache/airflow:2.2.1

USER root

# Add self signed certificates
COPY certificates/ca.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

# Set AWS cli TLS CA certificate
ENV AWS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

#ENTRYPOINT ["/bin/sh"]

COPY files/ /

USER 50000
