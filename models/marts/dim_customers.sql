with 
    dim_customers as (
        select *
        from {{ ref ('int_vendas__prep_customers')}}
    )
select
    *
from
    dim_customers
