with
    source_salesorderheader as (
        select *
        from {{ source('sales', 'salesorderheader') }}
    )

    ,renomeado as (
        select 
            cast(source_salesorderheader.salesorderid as int) as pk_salesorder
            ,cast(source_salesorderheader.customerid as int) as fk_customer
            ,cast(source_salesorderheader.shiptoaddressid as int) as fk_address
            ,cast(source_salesorderheader.creditcardid as int) as fk_creditcard
            ,cast(source_salesorderheader.orderdate as date) as orderdate 
            ,cast(source_salesorderheader.duedate as date) as duedate 
            ,cast(source_salesorderheader.shipdate as date) as shipdate 
            ,cast(source_salesorderheader.status as int) as status 
            ,cast(source_salesorderheader.onlineorderflag as BOOLEAN) as has_online_order 
            ,cast(source_salesorderheader.taxamt as numeric(18,2)) as taxamt
            ,cast(source_salesorderheader.freight as numeric(18,2)) as freight
            --,cast(source_salesorderheader.currencyrateid as int) as fk_currencyrate
            --,cast(source_salesorderheader.revisionnumber as int) as revisionnumber
            -- ,cast(source_salesorderheader.purchaseordernumber as string) as purchaseordernumber 
            -- ,cast(source_salesorderheader.accountnumber as string) as accountnumber
            --,cast(source_salesorderheader.salesperson as int) as fk_salesperson 
            --,cast(source_salesorderheader.territoryid as int) as fk_territory
            --,cast(source_salesorderheader.billtoaddressid as int) as fk_billtoaddressid
            --,cast(source_salesorderheader.shipmethodid as int) as fk_shipmethod
            --,cast(source_salesorderheader.creditcardapprovalcode as string) as creditcardapprovalcode
            --,cast(source_salesorderheader.subtotal as numeric(18,2)) as subtotal
            --,cast(source_salesorderheader.totaldue as numeric(18,2)) as totaldue
            --,cast(source_salesorderheader.comment as string) as comment
            --,cast(source_salesorderheader.rowguid as string) as rowguid
            --,cast(source_salesorderheader.modifieddate as date) as modifieddate
        from
            source_salesorderheader
    )

    select
        *
    from
        renomeado
