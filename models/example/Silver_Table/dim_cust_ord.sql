{{config(
    database = 'DBT_DEMO',
    schema = 'SILVER_LAYER',
    materialized = 'view'
)}}

with customers as (
    select * from {{ ref('stg_customers')}}
),
orders as (
    select * from {{ ref('stg_orders') }}
),
customer_orders_silver as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders
    from orders
    group by 1
),
final_cte as (
    select
        customers.customer_id,
        customers.full_name,
        customer_orders_silver.first_order_date,
        customer_orders_silver.most_recent_order_date,
        coalesce(customer_orders_silver.number_of_orders, 0) as number_of_orders
    from customers
    left join customer_orders_silver using (customer_id)
)

select * from final_cte