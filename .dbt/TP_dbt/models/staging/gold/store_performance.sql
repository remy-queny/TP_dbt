{{ config(materialized='table', schema='gold') }}

WITH orders AS (
    SELECT DISTINCT storeid
    FROM {{ ref('v_orders') }}
),

facts_orders AS (
    SELECT storeid, montant_total AS total_price
    FROM {{ ref('t_fact_orders') }}
),

sales_target AS (
    SELECT storeid, salestarget
    FROM {{ ref('salestarget') }}
)

SELECT
    o.storeid,
    SUM(f.total_price) AS total_sales,
    st.salestarget AS sales_target
FROM orders o
LEFT JOIN facts_orders f ON o.storeid = f.storeid
LEFT JOIN sales_target st ON o.storeid = st.storeid
GROUP BY o.storeid, st.salestarget
ORDER BY o.storeid