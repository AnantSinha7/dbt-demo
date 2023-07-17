{%- set status = ['O','F'] -%}

with orders as (
    select * from {{ ref('stg_order') }}
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

{{ dbt_utils.log_info("Last Compiled At:") }}