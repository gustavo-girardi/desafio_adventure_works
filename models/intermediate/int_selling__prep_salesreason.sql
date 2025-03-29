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
            pk_salesorder
            , LISTAGG(reason_name, ', ') WITHIN GROUP (ORDER BY reason_name) 
                OVER (PARTITION BY PK_SALESORDER) AS reason_name_concat
            , LISTAGG(reasontype, ', ') WITHIN GROUP (ORDER BY reasontype) 
                OVER (PARTITION BY PK_SALESORDER) AS reasontype_concat
        FROM enriquecer
    )
    
    ,colunas_unicas AS (
        SELECT DISTINCT 
            pk_salesorder,
            reason_name_concat,
            reasontype_concat
        FROM criar_colunas_reason
    ) 
select
    *
from
    colunas_unicas