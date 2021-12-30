FROM apache/airflow:2.2.1

USER root

# Add Minio certificate
COPY minio-cacert.crt /usr/local/share/ca-certificates/
RUN dpkg-reconfigure ca-certificates

#ENTRYPOINT ["/bin/sh"]

USER 50000
