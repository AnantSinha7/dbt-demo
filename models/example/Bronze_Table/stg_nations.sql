{{config(
    database = 'DBT_DEMO',
    schema = 'BRONZE_LAYER',
    materialized = 'view'
)}}

with nations as (
    
    select
        N_NATIONKEY as Nation_id,
        N_NAME as Nation_name,
        N_REGIONKEY as N_Region_id
    from DBT_DEMO.BRONZE_LAYER.nations
)

select * from nations