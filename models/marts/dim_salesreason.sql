with 
    dim_salesreason as (
        select *
        from {{ ref ('int_vendas__prep_salesreason')}}
    )
select
    *
from
    dim_salesreason
