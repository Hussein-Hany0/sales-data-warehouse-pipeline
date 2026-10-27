
{{ config(materialized='table', schema='gold') }}

SELECT
    ROW_NUMBER() OVER (ORDER BY product_name) AS product_key,
    product_name
FROM (
    SELECT DISTINCT product AS product_name
    FROM {{ ref('stg_sales_clean') }}
    WHERE product IS NOT NULL
) products
