with
    source_salesorderheader as (
        select *
        from {{ source('sales', 'salesorderheader') }}
    )

    ,renomeado as (
        select 
            cast(source_salesorderheader.SALESORDERID as int) as pk_salesorder
            ,cast(source_salesorderheader.REVISIONNUMBER as int) as REVISIONNUMBER
            ,cast(source_salesorderheader.ORDERDATE as date) as ORDERDATE 
            ,cast(source_salesorderheader.DUEDATE as date) as DUEDATE 
            ,cast(source_salesorderheader.SHIPDATE as date) as SHIPDATE 
            ,cast(source_salesorderheader.STATUS as int) as STATUS 
            ,cast(source_salesorderheader.ONLINEORDERFLAG as BOOLEAN) as ONLINEORDERFLAG 
            ,cast(source_salesorderheader.PURCHASEORDERNUMBER as string) as PURCHASEORDERNUMBER 
            ,cast(source_salesorderheader.ACCOUNTNUMBER as string) as ACCOUNTNUMBER 
            ,cast(source_salesorderheader.CUSTOMERID as int) as fk_CUSTOMER
            ,cast(source_salesorderheader.SALESPERSONID as int) as fk_SALESPERSON 
            ,cast(source_salesorderheader.TERRITORYID as int) as fk_TERRITORY
            ,cast(source_salesorderheader.BILLTOADDRESSID as int) as BILLTOADDRESSID
            ,cast(source_salesorderheader.SHIPTOADDRESSID as int) as SHIPTOADDRESSID
            ,cast(source_salesorderheader.SHIPMETHODID as int) as SHIPMETHODID
            ,cast(source_salesorderheader.CREDITCARDID as int) as fk_CREDITCARDID
            ,cast(source_salesorderheader.CREDITCARDAPPROVALCODE as string) as CREDITCARDAPPROVALCODE
            ,cast(source_salesorderheader.CURRENCYRATEID as int) as fk_CURRENCYRATE
            ,cast(source_salesorderheader.SUBTOTAL as numeric(18,2)) as SUBTOTAL
            ,cast(source_salesorderheader.TAXAMT as numeric(18,2)) as TAXAMT
            ,cast(source_salesorderheader.FREIGHT as numeric(18,2)) as FREIGHT
            ,cast(source_salesorderheader.TOTALDUE as numeric(18,2)) as TOTALDUE
            ,cast(source_salesorderheader.COMMENT as string) as COMMENT
            ,cast(source_salesorderheader.ROWGUID as string) as ROWGUID
            ,cast(source_salesorderheader.MODIFIEDDATE as date) as MODIFIEDDATE
        from
            source_salesorderheader
    )

    select
        *
    from
        renomeado
