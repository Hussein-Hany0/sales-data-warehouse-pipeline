
from datetime import datetime

from airflow import DAG
from airflow.operators.bash import BashOperator


with DAG(
    dag_id="sales_warehouse_pipeline",
    description="Run dbt transformations and data quality tests",
    start_date=datetime(2026, 1, 1),
    schedule="0 8 * * *",
    catchup=False,
    tags=["dbt", "data-warehouse"],
) as dag:

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command=(
            "dbt run "
            "--project-dir /opt/airflow/dbt/sales_warehouse "
            "--profiles-dir /opt/airflow/.dbt"
        ),
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command=(
            "dbt test "
            "--project-dir /opt/airflow/dbt/sales_warehouse "
            "--profiles-dir /opt/airflow/.dbt"
        ),
    )

    dbt_run >> dbt_test
