{{ config(materialized='table', schema='gold') }}

{{ dbt_utils.deduplicate(
    relation=source('bronze', 'orderitems'),
    partition_by='orderid, orderitemid',
    order_by='updated_at desc'
) }}
