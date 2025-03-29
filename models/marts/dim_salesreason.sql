with 
    dim_salesreason as (
        select *
        from {{ ref ('int_selling__prep_salesreason')}}
    )
select
    *
from
    dim_salesreason
