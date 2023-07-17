{{config(
    database = 'DBT_DEMO',
    schema = 'SILVER_LAYER',
    materialized = 'table'
)}}

{%- set status = ['O','F'] -%}

with orders as (
    select * from {{ ref('stg_orders') }}
),
pivoted as (
    select 
        order_id,
        {% for stats in status -%}
        sum(case when status = '{{ stats }}' then Amount else 0 end) as {{ stats }}_Amt
        {%- if not loop.last -%}
            ,
        {%- endif %}
        {% endfor -%}    
    from orders
    group by 1
)

select * from pivoted


-- It will generate that number of columns as many records are there in the status field and
-- fill that field with the respective entries...