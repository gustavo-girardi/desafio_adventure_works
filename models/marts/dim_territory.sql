with 
    dim_territory as (
        select *
        from {{ ref ('int_vendas__prep_territory')}}
    )
select
    *
from
    dim_territory
