mkdir -p ~/airflow && cd ~/airflow

curl -LfO https://airflow.apache.org/docs/apache-airflow/2.8.1/docker-compose.yaml

docker-compose up -d
