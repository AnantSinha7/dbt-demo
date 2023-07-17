{{config(
    database = 'DBT_DEMO',
    schema = 'SILVER_LAYER',
    materialized = 'table'
)}}

select
    o_ORDERKEY as order_id,
    O_CUSTKEY as customer_id,
    O_ORDERDATE as order_date,
    O_ORDERSTATUS as status
from {{ source('BRONZE_LAYER','ORDERS') }}

{{  limit_date_in_order('order_date',11000) }}