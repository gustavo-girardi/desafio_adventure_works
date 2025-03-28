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
            salesorderheadersalesreason.pk_salesorder
            ,salesreason.reason_name
            ,salesreason.reasontype
        from
            salesorderheadersalesreason
        left join
            salesreason on salesorderheadersalesreason.fk_salesreason = salesreason.pk_salesreason
    )

    ,criar_colunas_reason as (
        SELECT 
            enriquecer.pk_salesorder
            ,MAX(CASE WHEN reason_name = 'Television Advertisement' THEN 1 ELSE 0 END) AS reason_name_price
            ,MAX(CASE WHEN reason_name = 'Demo Event' THEN 1 ELSE 0 END) AS reason_name_quality
            ,MAX(CASE WHEN reason_name = 'Other' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name = 'Price' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name = 'Manufacturer' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name = 'Quality' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name = 'On Promotion' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name = 'Magazine Advertisement' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name = 'Sponsorship' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name = 'Review' THEN 1 ELSE 0 END) AS reason_name_manufacturer
        FROM enriquecer
        GROUP BY enriquecer.pk_salesorder
    )
select
    *
from
    criar_colunas_reason