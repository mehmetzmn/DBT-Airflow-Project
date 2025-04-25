FROM python:3.9-slim

WORKDIR /usr/app/dbt_airflow

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    ssh-client \
    software-properties-common \
    make \
    build-essential \
    ca-certificates \
    libpq-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# unnecessary to add apache-airflow
RUN pip install --no-cache-dir dbt-postgres apache-airflow

RUN mkdir -p /root/.dbt

#COPY profiles.yml ~/.dbt/

#COPY . .

#CMD sleep infinity