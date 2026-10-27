
{{ config(materialized='table', schema='gold') }}

SELECT
    ROW_NUMBER() OVER (ORDER BY customer_id) AS customer_key,
    customer_id
FROM (
    SELECT DISTINCT customer_id
    FROM {{ ref('stg_sales_clean') }}
    WHERE customer_id IS NOT NULL
) customers
