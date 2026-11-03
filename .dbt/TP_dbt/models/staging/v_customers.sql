{{ config(materialized='view') }}


SELECT *, CONCAT(UPPER(firstname), ' ', lastname) AS full_name FROM bronze.customers