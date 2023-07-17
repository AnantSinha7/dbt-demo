{{config(
    database = 'DBT_DEMO',
    schema = 'BRONZE_LAYER',
    materialized = 'view'
)}}
with customers as (
    
    select 
        C_CUSTKEY as customer_id,
        C_NAME as full_name,
        C_PHONE as contact,
        C_ACCTBAL as Account_balance,
        C_NATIONKEY as Nation_id

    from DBT_DEMO.Bronze_Layer.customers
)

select * from customers