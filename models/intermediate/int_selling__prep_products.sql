with 
    product as (
        select *
        from {{ ref ('stg_production__product')}}
    )

    ,category as (
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
            , subcategory.subcategory_name
            , category.category_name
        from
            subcategory
        left join
            category on category.pk_productcategory = subcategory.fk_productcategory
    )

    ,join_product as (
        select
             product.pk_product
            , product.product_name
            , join_subcategory_productcategory.subcategory_name
            , join_subcategory_productcategory.category_name
        from
            product
        left join
            join_subcategory_productcategory on join_subcategory_productcategory.pk_productsubcategory = product.fk_productsubcategory
    )

select
    *
from
    join_product