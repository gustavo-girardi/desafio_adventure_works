with 
    dim_customers as (
        select *
        from {{ ref ('int_selling__prep_customers')}}
    )
select
    *
from
    dim_customers
