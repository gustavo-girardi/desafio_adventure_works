with 
    fact_vendas as (
        select *
        from {{ ref ('int_vendas__prep_vendas')}}
    )
select
    *
from
    fact_vendas
