select
    O_ORDERKEY as order_id,
    {{ dbt_utils.safe_divide('order_id', '1000') }} as modified_ord_id,
    {{ dbt_utils.generate_surrogate_key(['order_id']) }} as S_key_ord_id,
    O_CUSTKEY as customer_id,
    {{ dbt_utils.safe_subtract(['customer_id', 'order_id']) }} as sub_cust_ord,
    O_ORDERDATE as order_date,
    O_ORDERSTATUS as status
from {{ source('BRONZE_LAYER','ORDERS') }}

{{  limit_date_in_order('order_date',11000) }}

{{ dbt_utils.log_info("Last Compiled At:") }}