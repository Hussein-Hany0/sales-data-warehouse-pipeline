
{{ config(materialized='view', schema='silver') }}

SELECT
    order_id::INT AS order_id,
    order_date::DATE AS order_date,
    customer_id,
    TRIM(product) AS product,
    quantity::INT AS quantity,
    unit_price::NUMERIC(10,2) AS unit_price,
    TRIM(region) AS region
FROM {{ source('warehouse', 'raw_sales') }}
