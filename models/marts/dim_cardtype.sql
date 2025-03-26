with 
    dim_cardtype as (
        select *
        from {{ ref ('stg_sales__creditcard')}}
    )
select
    *
from
    dim_cardtype
