with
    source_salesorderdetail as (
        select *
        from {{ source('sales', 'salesorderdetail') }}
    )

    ,renomeado as (
        select 
            cast(source_salesorderdetail.SALESORDERID as int) as fk_SALESORDER
            ,cast(source_salesorderdetail.SALESORDERDETAILID as int) as pk_SALESORDERDETAILID
            ,cast(source_salesorderdetail.CARRIERTRACKINGNUMBER as string) as CARRIERTRACKINGNUMBER
            ,cast(source_salesorderdetail.ORDERQTY as int) as ORDERQTY
            ,cast(source_salesorderdetail.PRODUCTID as int) as fk_PRODUCT
            ,cast(source_salesorderdetail.SPECIALOFFERID as int) as fk_SPECIALOFFERID
            ,cast(source_salesorderdetail.UNITPRICE as numeric(18,2)) as UNITPRICE
            ,cast(source_salesorderdetail.UNITPRICEDISCOUNT as numeric(18,2)) as UNITPRICEDISCOUNT
            ,cast(source_salesorderdetail.ROWGUID as string) as ROWGUID_source_salesorderdetail
            ,cast(source_salesorderdetail.MODIFIEDDATE as date) as MODIFIEDDATE_source_salesorderdetail

        from
            source_salesorderdetail
    )

    select
        *
    from
        renomeado
