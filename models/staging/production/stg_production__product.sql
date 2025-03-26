with
    source_product as (
        select *
        from {{ source('production', 'product') }}
    )

    ,renomeado as (
        select 
            cast(source_product.PRODUCTID as int) as pk_product
            ,cast(source_product.NAME as string) as product_name
            ,cast(source_product.PRODUCTNUMBER as string) as PRODUCTNUMBER
            ,cast(source_product.MAKEFLAG as boolean) as MAKEFLAG
            ,cast(source_product.FINISHEDGOODSFLAG as boolean) as FINISHEDGOODSFLAG
            ,cast(source_product.COLOR as string) as COLOR
            ,cast(source_product.SAFETYSTOCKLEVEL as int) as SAFETYSTOCKLEVEL
            ,cast(source_product.REORDERPOINT as int) as REORDERPOINT
            ,cast(source_product.STANDARDCOST as numeric(18,2)) as STANDARDCOST
            ,cast(source_product.LISTPRICE as numeric(18,2)) as LISTPRICE
            ,cast(source_product."SIZE" as string) as "SIZE"
            ,cast(source_product.SIZEUNITMEASURECODE as string) as SIZEUNITMEASURECODE
            ,cast(source_product.WEIGHTUNITMEASURECODE as string) as WEIGHTUNITMEASURECODE
            ,cast(source_product.WEIGHT as numeric(18,2)) as WEIGHT
            ,cast(source_product.DAYSTOMANUFACTURE as int) as DAYSTOMANUFACTURE
            ,cast(source_product.PRODUCTLINE as string) as PRODUCTLINE
            ,cast(source_product.CLASS as string) as CLASS
            ,cast(source_product.STYLE as string) as STYLE
            ,cast(source_product.PRODUCTSUBCATEGORYID as int) as fk_PRODUCTSUBCATEGORY
            ,cast(source_product.PRODUCTMODELID as int) as fk_PRODUCTMODEL
            ,cast(source_product.SELLSTARTDATE as date) as SELLSTARTDATE
            ,cast(source_product.SELLENDDATE as date) as SELLENDDATE
            ,cast(source_product.DISCONTINUEDDATE as string) as DISCONTINUEDDATE
            ,cast(source_product.ROWGUID as string) as ROWGUID
            ,cast(source_product.MODIFIEDDATE as date) as MODIFIEDDATE

        from
            source_product
    )

    select
        *
    from
        renomeado