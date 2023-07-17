{{config(
    database = 'DBT_DEMO',
    schema = 'SILVER_LAYER',
    materialized = 'table'
)}}

select 
    customer_id as C_id,
    full_name as C_name,
    contact as C_contact_detail,
    Account_balance as C_balance,
    stg_nations.Nation_id as C_nation_id,
    Nation_name as C_nation_name,
    Region_id as C_region_id,
    Region_name as C_region_name
from DBT_DEMO.BRONZE_LAYER.stg_customers
left join DBT_DEMO.BRONZE_LAYER.stg_nations on stg_customers.Nation_id=stg_nations.Nation_id
left join DBT_DEMO.BRONZE_LAYER.stg_regions on stg_nations.N_Region_id=stg_regions.Region_id
where Region_name in ('AFRICA','AMERICA','ASIA')