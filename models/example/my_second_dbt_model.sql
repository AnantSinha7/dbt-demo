
-- Use the `ref` function to select from other models

select *
from {{ ref('my_first_dbt_model') }}
where id = 1
{{ dbt_utils.log_info("Last Compiled At:") }}