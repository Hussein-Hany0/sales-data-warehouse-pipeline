Sales Data Warehouse & Automated ETL Pipeline

An end-to-end Data Engineering project that builds a sales data warehouse using PostgreSQL, dbt, Apache Airflow, and Docker. The pipeline transforms raw sales data into analytics-ready datasets and runs automated data quality tests.

Project Overview

This project demonstrates a complete data transformation workflow, from loading raw sales data to producing clean, structured datasets for analytical use.

The pipeline uses dbt to organize data into transformation layers and Apache Airflow to orchestrate and monitor execution.

Architecture

Raw Sales Data
      |
      v
  PostgreSQL
      |
      v
 dbt Transformations
      |
      +----> Silver Layer
      |      Data cleaning
      |      Duplicate handling
      |
      +----> Gold Layer
             Analytics-ready data
      |
      v
   dbt Tests
      |
      v
 Apache Airflow
 (Orchestration)

Tech Stack

Python — Pipeline configuration and data engineering workflows

PostgreSQL — Relational database and data warehouse

SQL — Data transformation and analytical modeling

dbt Core — Data transformation, model organization, and testing

Apache Airflow — Workflow orchestration and monitoring

Docker & Docker Compose — Containerized services and environment setup

Git & GitHub — Version control and project documentation

Key Features

Built a relational sales data warehouse using PostgreSQL.

Organized data transformations into Silver and Gold layers.

Cleaned raw sales data and handled duplicate records.

Implemented automated data quality tests using dbt.

Orchestrated transformation and testing tasks with Apache Airflow.

Configured a scheduled workflow with manual triggering support.

Containerized the project services using Docker Compose.

Data Quality & Results

The initial dataset contained 8 records, including 1 duplicate record.

Metric

Result

Initial records

8

Duplicate records identified

1

Records after cleaning

7

Total sales

54,250

These figures reflect the project's current sample dataset.

Pipeline Workflow

The Airflow DAG, sales_warehouse_pipeline, coordinates the following tasks:

dbt Run — Executes the project's data transformation models.

dbt Test — Validates configured data quality rules.

The workflow is configured to run daily at 08:00 UTC and can also be triggered manually through the Airflow web interface.

Project Structure

data-warehouse-project/
├── airflow/
│   ├── dags/
│   │   └── sales_warehouse_pipeline.py
│   └── dbt_profiles/
│       └── profiles.yml
├── data/
├── sales_warehouse/
│   ├── models/
│   ├── tests/
│   ├── dbt_project.yml
│   └── packages.yml
├── .gitignore
├── Dockerfile.airflow
├── docker-compose.yaml
└── README.md

The structure above highlights the main project components; individual files may vary.

Prerequisites

Docker Desktop

Git

A GitHub account

Docker Compose is included with current Docker Desktop installations.

Getting Started

1. Clone the Repository

git clone <YOUR_GITHUB_REPOSITORY_URL>
cd data-warehouse-project

2. Configure Environment Variables

Create a .env file in the project root and configure the required environment variables.

Example:

POSTGRES_PASSWORD=change_me

Use a strong local password and never commit .env or real credentials to GitHub.

Ensure that all services and dbt profiles reference the appropriate environment variables.

3. Build and Start Services

docker compose up -d --build

4. Access Airflow

Open:

http://localhost:8080

Log in with your locally configured Airflow account.

5. Run the Pipeline

Open the Airflow DAGs page.

Locate sales_warehouse_pipeline.

Trigger the DAG manually.

Monitor the dbt_run and dbt_test tasks.

Verify that both tasks complete successfully.

Data Modeling

The project separates data transformations into layers:

Silver Layer: Cleans and standardizes the raw data.

Gold Layer: Provides structured, analytics-ready datasets.

dbt models and tests define the transformation logic and data quality expectations.

Future Improvements

Add incremental dbt models.

Integrate a larger, more realistic sales dataset.

Expand data quality checks and test coverage.

Add CI/CD using GitHub Actions.

Implement data documentation and lineage reporting.

Add analytical dashboards using a BI tool.

Skills Demonstrated

SQL, PostgreSQL, Data Warehousing, ETL/ELT, dbt, Apache Airflow, Docker, Data Quality Testing, Workflow Orchestration, and Git.

Author

Hussein Hany

Aspiring Data Engineer