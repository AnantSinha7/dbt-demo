{{config(
    database = 'DBT_DEMO',
    materialized = 'table',
    transient = true
)}}



with 
source as (
    select * from {{ source('BRONZE_LAYER','ORDERS') }}
),
staged as(
    select
        o_ORDERKEY as order_id,
        O_CUSTKEY as customer_id,
        O_ORDERDATE as order_date,
        O_ORDERSTATUS as status

    from source
)

select * from staged

{{ dbt_utils.log_info("Last Compiled At:") }}