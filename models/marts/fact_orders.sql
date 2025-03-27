with 
    fact_orders as (
        select *
        from {{ ref ('int_selling__prep_orders')}}
    )
select
    *
from
    fact_orders
