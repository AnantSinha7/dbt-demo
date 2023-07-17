with customer as (
  select * from {{ ref('stg_customer')}}
)

select
  customer_id,
	sum(Account_balance) as Amount
from {{ ref('stg_customer') }}
group by 1
having not(Amount >= 1000)