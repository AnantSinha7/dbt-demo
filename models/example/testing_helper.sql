{% set old_fct_orders_query %}

    select * from dbt_demo.public.stg_customer

{% endset %}




{% set new_fct_orders_query %}

  select
  customer_id,full_name,contact,Account_balance,Nation_id
  from {{ ref('stg_customer') }}

{% endset %}




{{ audit_helper.compare_queries(

    a_query=old_fct_orders_query,

    b_query=new_fct_orders_query,

    primary_key="customer_id"

) }}