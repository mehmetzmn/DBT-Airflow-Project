from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.docker_operator import DockerOperator
from airflow.utils.dates import days_ago

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}

dag = DAG(
    'dbt_daily_run',
    default_args=default_args,
    description='Run dbt models daily at 10 AM',
    schedule_interval='0 10 * * *',
    start_date=datetime(2023, 1, 1),
    catchup=False,
)

dbt_run = BashOperator(
    task_id='dbt_run',
    bash_command='docker exec dbt-container bash -c "dbt seed && dbt run"',
    dag=dag,
)
