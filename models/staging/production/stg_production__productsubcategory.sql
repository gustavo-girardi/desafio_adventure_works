with
    source_productsubcategory as (
        select *
        from {{ source('production', 'productsubcategory') }}
    )

    ,renomeado as (
        select
            cast(source_productsubcategory.productsubcategoryid as int) as pk_productsubcategory
            , cast(source_productsubcategory.productcategoryid as int) as fk_productcategory
            , cast(source_productsubcategory.name as string) as subcategory_name
            --, cast(source_productsubcategory.rowguid as string) as rowguid
            --, cast(source_productsubcategory.modifieddate as date) as modifieddate
        from
            source_productsubcategory
    )

    select
        *
    from
        renomeado

