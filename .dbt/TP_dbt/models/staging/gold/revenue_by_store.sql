{{ config(materialized='table', schema='gold') }}

SELECT
    storeid,
    SUM(montant_total) AS total_revenue
FROM {{ ref('t_fact_orders') }}
GROUP BY storeid
