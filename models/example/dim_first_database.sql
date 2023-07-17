select 
    C_CUSTKEY as C_id,
    C_NAME as C_name,
    C_ADDRESS as C_fulladdress,
    C_PHONE as C_phone_no,
    N_NAME as C_nation,
    R_REGIONKEY as C_region_name,
    C_ACCTBAL as C_account_balance
from DBT_DEMO.public.customer
left join DBT_DEMO.public.nation on customer.C_NATIONKEY=nation.N_NATIONKEY
left join DBT_DEMO.public.region on nation.N_REGIONKEY=region.R_REGIONKEY
where R_NAME in ('AFRICA','AMERICA','ASIA')

{{ dbt_utils.log_info("Last Compiled At:") }}