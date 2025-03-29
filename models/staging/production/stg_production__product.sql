with
    source_product as (
        select *
        from {{ source('production', 'product') }}
    )

    ,renomeado as (
        select 
            cast(source_product.productid as int) as pk_product
            ,cast(source_product.name as string) as product_name
            ,cast(source_product.productsubcategoryid as int) as fk_productsubcategory
            --,cast(source_product.productnumber as string) as productnumber
            --,cast(source_product.makeflag as boolean) as makeflag
            --,cast(source_product.finishedgoodsflag as boolean) as finishedgoodsflag
            --,cast(source_product.color as string) as color
            --,cast(source_product.safetystocklevel as int) as safetystocklevel
            --,cast(source_product.reorderpoint as int) as reorderpoint
            --,cast(source_product.standardcost as numeric(18,2)) as standardcost
            --,cast(source_product.listprice as numeric(18,2)) as listprice
            --,cast(source_product."size" as string) as "size"
            --,cast(source_product.sizeunitmeasurecode as string) as sizeunitmeasurecode
            --,cast(source_product.weightunitmeasurecode as string) as weightunitmeasurecode
            --,cast(source_product.weight as numeric(18,2)) as weight
            --,cast(source_product.daystomanufacture as int) as daystomanufacture
            --,cast(source_product.productline as string) as productline
            --,cast(source_product.class as string) as class
            --,cast(source_product.style as string) as style
            --,cast(source_product.productmodelid as int) as productmodelid
            --,cast(source_product.sellstartdate as date) as sellstartdate
            --,cast(source_product.sellenddate as date) as sellenddate
            --,cast(source_product.discontinueddate as string) as discontinueddate
            --,cast(source_product.rowguid as string) as rowguid
            --,cast(source_product.modifieddate as date) as modifieddate

        from
            source_product
    )

    select
        *
    from
        renomeado