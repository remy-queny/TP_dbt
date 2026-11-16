{{ config(materialized='view', schema='bronze') }}

SELECT orderid, orderitemid, productid, quantity, unitprice, updated_at, (quantity * unitprice) AS total_price FROM bronze.orderitems