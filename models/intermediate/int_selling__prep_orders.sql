with 
    salesorderdetail as (
        select *
        from {{ ref ('stg_sales__salesorderdetail')}}
    )

    ,salesorderheader as (
        select *
        from {{ ref ('stg_sales__salesorderheader')}}
    )

    ,gross_total as (
        select
            salesorderdetail.pk_salesorderdetail 
            , salesorderdetail.fk_salesorder 
            , salesorderdetail.fk_product
            , salesorderheader.fk_customer
            , salesorderheader.fk_address
            , salesorderheader.fk_creditcard
            , salesorderheader.orderdate
            , salesorderheader.duedate
            , salesorderheader.shipdate
            , salesorderheader.has_online_order
            , case
                when salesorderdetail.unitpricediscount > 0 then true
                else false
            end as has_discount
            , salesorderheader.status
            , salesorderdetail.orderqty
            , salesorderdetail.unitprice
            , salesorderdetail.orderqty * salesorderdetail.unitprice as gross_total
            , cast(salesorderheader.freight / count(*) over(partition by fk_salesorder) as numeric(18,4)) as allocated_freight
            , cast(salesorderheader.taxamt / count(*) over(partition by fk_salesorder) as numeric(18,4)) as allocated_taxamt            
            , salesorderdetail.unitpricediscount
        from
            salesorderdetail
        left join
            salesorderheader on salesorderheader.pk_salesorder = salesorderdetail.fk_SALESORDER
    )

    select
        *
    from
        gross_total
