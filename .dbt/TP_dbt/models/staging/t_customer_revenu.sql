{{ config(materialized='table', schema='gold') }}

WITH customer_revenue AS (
    SELECT o.customerid, SUM(oi.quantity * oi.unitprice) AS total_revenue
    FROM bronze.orders o
    JOIN bronze.orderitems oi ON o.orderid = oi.orderid
    GROUP BY o.customerid
)

SELECT c.customerid, CONCAT(c.firstname, ' ', c.lastname) AS full_name, SUM(cr.total_revenue) AS total_revenue
FROM bronze.customers c
JOIN customer_revenue cr ON c.customerid = cr.customerid
GROUP BY c.customerid, full_name