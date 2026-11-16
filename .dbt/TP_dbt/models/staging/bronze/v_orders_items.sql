{{ config(materialized='view', schema='silver') }}

SELECT
    orderid,
    orderitemid,
    productid,
    quantity,
    unitprice,
    updated_at,
    (quantity * unitprice) AS total_price
FROM {{ source('bronze', 'orderitems') }}