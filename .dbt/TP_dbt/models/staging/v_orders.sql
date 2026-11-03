{{ config(materialized='view') }}

SELECT orderid, orderdate, customerid, employeeid, storeid, status,
    CASE
        WHEN Status = 1 THEN 'En cours'
        WHEN Status = 2 THEN 'Terminée'
        WHEN Status = 3 THEN 'Annulée'
        ELSE 'Inconnue'
    END AS StatusDescription
FROM bronze.orders