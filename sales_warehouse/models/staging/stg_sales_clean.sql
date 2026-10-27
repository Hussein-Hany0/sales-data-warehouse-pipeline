
{{ config(materialized='table', schema='silver') }}

WITH source_data AS (
    SELECT
        order_id::INT AS order_id,
        order_date::DATE AS order_date,
        TRIM(customer_id) AS customer_id,
        TRIM(product) AS product,
        quantity::INT AS quantity,
        unit_price::NUMERIC(10,2) AS unit_price,
        TRIM(region) AS region
    FROM {{ source('warehouse', 'raw_sales') }}
),

deduplicated AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY order_id
            ORDER BY order_date
        ) AS row_num
    FROM source_data
)

SELECT
    order_id,
    order_date,
    customer_id,
    product,
    quantity,
    unit_price,
    region
FROM deduplicated
WHERE row_num = 1
