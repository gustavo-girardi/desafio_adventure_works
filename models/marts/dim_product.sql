with 
    dim_product as (
        select *
        from {{ ref ('int_selling__prep_products')}}
    )
select
    *
from
    dim_product
