with 
    salesorderdetail as (
        select *
        from {{ ref ('stg_sales__salesorderdetail')}}
    )

    ,salesorderheader as (
        select *
        from {{ ref ('stg_sales__salesorderheader')}}
    )

    ,enriquecer_salesorderdetail as (
        select
            salesorderdetail.PK_SALESORDERDETAILID
            ,salesorderdetail.FK_SALESORDER
            ,salesorderheader.FK_CUSTOMER
            ,salesorderheader.FK_SALESPERSON
            ,salesorderheader.FK_TERRITORY
            ,salesorderheader.FK_CREDITCARDID
            ,salesorderheader.FK_CURRENCYRATE
            ,salesorderdetail.FK_PRODUCT
            ,salesorderdetail.FK_SPECIALOFFERID
            ,salesorderheader.PK_SALESORDER
            --,salesorderdetail.CARRIERTRACKINGNUMBER
            ,salesorderheader.BILLTOADDRESSID
            ,salesorderheader.SHIPTOADDRESSID
            ,salesorderheader.SHIPMETHODID
            ,salesorderheader.ORDERDATE
            ,salesorderheader.DUEDATE
            ,salesorderheader.SHIPDATE
            ,salesorderheader.TAXAMT
            ,salesorderheader.FREIGHT
            ,salesorderheader.CREDITCARDAPPROVALCODE
            ,salesorderheader.REVISIONNUMBER
            ,salesorderheader.ONLINEORDERFLAG
            ,salesorderheader.PURCHASEORDERNUMBER
            ,salesorderheader.ACCOUNTNUMBER
            ,salesorderheader.STATUS
            ,salesorderdetail.ORDERQTY
            ,salesorderdetail.UNITPRICE
            ,salesorderdetail.UNITPRICEDISCOUNT
            --,salesorderdetail.ROWGUID_SOURCE_SALESORDERDETAIL
            --,salesorderdetail.MODIFIEDDATE_SOURCE_SALESORDERDETAIL
            --,salesorderheader.SUBTOTAL
            --,salesorderheader.TOTALDUE
            --,salesorderheader.COMMENT
            --,salesorderheader.ROWGUID
            --,salesorderheader.MODIFIEDDATE
        from
            salesorderdetail
        left join
            salesorderheader on salesorderheader.pk_salesorder = salesorderdetail.fk_SALESORDER
    )

    select
        *
    from
        enriquecer_salesorderdetail
