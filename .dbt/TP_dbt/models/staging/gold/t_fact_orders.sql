{{ config(materialized='table', schema='gold') }}

WITH orders_agregated AS (
    SELECT orderid, SUM(quantity * unitprice) AS total_price
    FROM {{ ref('v_orders_items') }}
    GROUP BY orderid
)

SELECT
    o.customerid,
    o.employeeid,
    o.storeid,
    o.status,
    COUNT(DISTINCT o.orderid) AS nb_commandes,
    SUM(oa.total_price) AS montant_total
FROM {{ source('bronze', 'orders') }} o
LEFT JOIN orders_agregated oa ON o.orderid = oa.orderid
GROUP BY o.customerid, o.employeeid, o.storeid, o.status