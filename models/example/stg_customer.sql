with customer as (
    
    select 
        C_CUSTKEY as customer_id,
        C_NAME as full_name,
        C_PHONE as contact,
        C_ACCTBAL as Account_balance,
        C_NATIONKEY as Nation_id

    from DBT_DEMO.public.customer
)

select * from customer

{{ dbt_utils.log_info("Last Compiled At:") }}