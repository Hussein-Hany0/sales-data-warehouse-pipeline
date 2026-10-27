
{{ config(materialized='table', schema='gold') }}

SELECT
    s.order_id,
    s.order_date,
    c.customer_key,
    p.product_key,
    s.region AS region_name,
    s.quantity,
    s.unit_price,
    s.quantity * s.unit_price AS total_amount
FROM {{ ref('stg_sales_clean') }} s
LEFT JOIN {{ ref('dim_customer') }} c
    ON s.customer_id = c.customer_id
LEFT JOIN {{ ref('dim_product') }} p
    ON s.product = p.product_name
