FROM apache/airflow:2.2.1

USER root

# Add self signed certificates
COPY certs/*.crt /usr/local/share/ca-certificates/
RUN dpkg-reconfigure ca-certificates

#ENTRYPOINT ["/bin/sh"]

USER 50000
