{{ config(materialized='view') }}

SELECT *, (quantity * unitprice) AS total_price FROM bronze.orderitems