with 
    product as (
        select *
        from {{ ref ('stg_production__product')}}
    )

    ,productcategory as (
        select *
        from {{ ref ('stg_production__productcategory')}}
    )

    ,subcategory as (
        select *
        from {{ ref ('stg_production__productsubcategory')}}
    )

    ,join_subcategory_productcategory as (
        select
            subcategory.pk_productsubcategory
            , subcategory.fk_productcategory
            , subcategory.subcategory_name
            , productcategory.category_name
        from
            subcategory
        left join
            productcategory on productcategory.pk_productcategory = subcategory.sk_productcategory
    )

    , enriquecer_product as (
        select
             product.pk_product
            , product.product_name
            , join_subcategory_productcategory.subcategory_name
            , join_subcategory_productcategory.category_name
        from
            product
        left join
            join_subcategory_productcategory on join_subcategory_productcategory.pk_productcategory = product.sk_productcategory
    )

select
    *
from
    enriquecer_product