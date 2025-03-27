with
    source_salesorderdetail as (
        select *
        from {{ source('sales', 'salesorderdetail') }}
    )

    ,renomeado as (
        select 
            cast(source_salesorderdetail.salesorderid as int) as fk_salesorder
            , cast(source_salesorderdetail.salesorderdetailid as int) as pk_salesorderdetail
            , cast(source_salesorderdetail.productid as int) as fk_product
            , cast(source_salesorderdetail.orderqty as int) as orderqty
            , cast(source_salesorderdetail.unitprice as numeric(18,2)) as unitprice
            , cast(source_salesorderdetail.unitpricediscount as numeric(18,2)) as unitpricediscount
            --, cast(source_salesorderdetail.carriertrackingnumber as string) as carriertrackingnumber
            --, cast(source_salesorderdetail.specialofferid as int) as fk_specialofferid
            --, cast(source_salesorderdetail.rowguid as string) as rowguid
            --, cast(source_salesorderdetail.modifieddate as date) as modifieddate

        from
            source_salesorderdetail
    )

    select
        *
    from
        renomeado
