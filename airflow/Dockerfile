ARG AIRFLOW_VERSION

FROM apache/airflow:${AIRFLOW_VERSION}

ARG CERT

USER root

COPY pip_packages_3_8.txt /pip_packages.txt

# sudo apt install gcc g++ libsasl2-dev
#RUN pip install -r /pip_packages.txt

# Set AWS cli TLS CA certificate
ENV AWS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

COPY files/ /

# Add self signed certificates
RUN update-ca-certificates

RUN apt-get update && apt-get install -y gcc g++ libsasl2-dev && \
    su airflow -c "python -m pip install --upgrade pip" && \
    su airflow -c "set -ex && pip install -r /pip_packages.txt" && \
    apt-get purge -y gcc g++ libsasl2-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoclean && \
    apt-get clean

USER airflow

ENTRYPOINT ["/bin/sh"]
