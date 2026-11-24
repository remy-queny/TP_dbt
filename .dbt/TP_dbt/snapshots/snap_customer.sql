{% snapshot snap_customer %}
{{
    config(
        target_schema='silver',
        unique_key='customerid',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

SELECT * 
FROM {{ source('bronze', 'customers') }}

{% endsnapshot %}

--UPDATE bronze.customers
--SET phone = '67',
--updated_at = NOW()
--WHERE customerid = '20266';

--UPDATE bronze.customers
--SET email = 'estaban.queraud@gmail.com',
--updated_at = NOW()
--WHERE customerid = '20266';