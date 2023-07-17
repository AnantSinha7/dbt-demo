{{config(
    database = 'DBT_DEMO',
    schema = 'BRONZE_LAYER',
    materialized = 'view'
)}}

with orders as (
    
    select
        o_ORDERKEY as order_id,
        O_CUSTKEY as customer_id,
        O_ORDERDATE as order_date,
        {{division('O_TOTALPRICE',4)}} as Amount,
        O_ORDERPRIORITY as Client_Based_Priority,
        O_ORDERSTATUS as status
    from DBT_DEMO.public.orders
)

select * from orders