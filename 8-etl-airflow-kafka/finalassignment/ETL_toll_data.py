# import the libraries
from datetime import timedelta
# The DAG object; we'll need this to instantiate a DAG
from airflow import DAG
# Operators; we need this to write tasks!
from airflow.operators.bash_operator import BashOperator
# This makes scheduling easy
from airflow.utils.dates import days_ago

bash_cwd = '/opt/airflow/dags/finalassignment/'

# defining DAG arguments
# You can override them on a per-task basis during operator initialization
default_args = {
    'owner': 'wwbel',
    'start_date': days_ago(0),
    'email': ['wwbel@somemail.com'],
    'email_on_failure': True,
    'email_on_retry': True,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# defining the DAG

dag = DAG(
    'ETL_toll_data',
    default_args=default_args,
    description='Apache Airflow Final Assignment',
    schedule_interval=timedelta(days=1),
)

# define the task 'download'
unzip_data = BashOperator(
    task_id='unzip_data',
    bash_command='tar -zxf tolldata.tgz',
    cwd=bash_cwd,
    dag=dag,
)

# define the 'extract' tasks
extract_data_from_csv = BashOperator(
    task_id='extract_data_from_csv',
    bash_command='cut -d"," -f1-4 vehicle-data.csv > csv_data.csv',
    cwd=bash_cwd,
    dag=dag,
)

extract_data_from_tsv = BashOperator(
    task_id='extract_data_from_tsv',
    bash_command='cut -d$\'\\t\' -f5-7 tollplaza-data.tsv | tr $\\\t\' \',\' | tr -d $\'\\r\' > tsv_data.csv',
    cwd=bash_cwd,
    dag=dag,
)

extract_data_from_fixed_width = BashOperator(
    task_id='extract_data_from_fixed_width',
    bash_command='cut -c 59- payment-data.txt | tr " " "," > fixed_width_data.csv',
    cwd=bash_cwd,
    dag=dag,
)

consolidate_data = BashOperator(
    task_id='consolidate_data',
    bash_command='paste -d \',\' csv_data.csv tsv_data.csv fixed_width_data.csv >  extracted_data.csv',
    cwd=bash_cwd,
    dag=dag,
)

# define the task 'load'

transform_data = BashOperator(
    task_id='transform_data',
    bash_command='awk -F\',\' \'{ print $1","$2","$3","toupper($4)","$5","$6","$7","$8","$9; }\' < extracted_data.csv > staging/transformed_data.csv',
    cwd=bash_cwd,
    dag=dag,
)

# task pipeline
unzip_data >> extract_data_from_csv >> extract_data_from_tsv >> extract_data_from_fixed_width >> consolidate_data >> transform_data

