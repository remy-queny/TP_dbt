{{ config(materialized='view', schema='bronze') }}


SELECT customerid, firstname, lastname, email, phone, address, city, state, zipcode, updated_at, CONCAT(UPPER(firstname), ' ', lastname) AS full_name FROM bronze.customers