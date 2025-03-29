with
    source_productcategory as (
        select *
        from {{ source('production', 'productcategory') }}
    )

    ,renomeado as (
        select
             cast(source_productcategory.productcategoryid as int) as pk_productcategory
            , cast(source_productcategory.name as string) as category_name
            --, cast(source_productcategory.rowguid as string) as rowguid
            --, cast(source_productcategory.modifieddate as date) as modifieddate
        from
            source_productcategory
    )

    select
        *
    from
        renomeado
