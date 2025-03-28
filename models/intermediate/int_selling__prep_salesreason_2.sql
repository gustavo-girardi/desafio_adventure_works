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
            ,MAX(CASE WHEN reason_name like '%Television Advertisement%' THEN 1 ELSE 0 END) AS reason_name_price
            ,MAX(CASE WHEN reason_name like '%Demo% Event' THEN 1 ELSE 0 END) AS reason_name_quality
            ,MAX(CASE WHEN reason_name like '%Other%' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name like '%Price%' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name like '%Manufacturer%' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name like '%Quality%' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name like '%On Promotion%' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name like '%Magazine Advertisement%' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name like '%Sponsorship%' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reason_name like '%Review%' THEN 1 ELSE 0 END) AS reason_name_manufacturer
            ,MAX(CASE WHEN reasontype like '%Promotion%' THEN 1 ELSE 0 END) AS reason_type_promotion
            ,MAX(CASE WHEN reasontype like '%Other%' THEN 1 ELSE 0 END) AS reason_type_other
            ,MAX(CASE WHEN reasontype like '%Marketing%' THEN 1 ELSE 0 END) AS reason_type_marketing
        FROM enriquecer
        GROUP BY enriquecer.pk_salesorder
    )
select
    *
from
    criar_colunas_reason