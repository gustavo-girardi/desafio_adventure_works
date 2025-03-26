with 
    salesorderheadersalesreason as (
        select *
        from {{ ref ('stg_sales__salesorderheadersalesreason')}}
    )

    ,salesreason as (
        select *
        from {{ ref ('stg_sales__salesreason')}}
    )

    ,enriquecer as (
        select
            salesorderheadersalesreason.PK_SALESORDER
            --,salesorderheadersalesreason.FK_SALESREASON
            ,salesreason.REASON_NAME
            ,salesreason.REASONTYPE
        from
            salesorderheadersalesreason
        left join
            salesreason on salesreason.PK_SALESREASON = salesreason.PK_SALESREASON
    )

select
    *
from
    enriquecer