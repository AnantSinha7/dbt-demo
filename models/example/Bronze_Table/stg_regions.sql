{{config(
    database = 'DBT_DEMO',
    schema = 'BRONZE_LAYER',
    materialized = 'view'
)}}

with regions as (
    
    select
        R_REGIONKEY as Region_id,
        R_NAME as Region_name
    from DBT_DEMO.BRONZE_LAYER.regions
)

select * from regions