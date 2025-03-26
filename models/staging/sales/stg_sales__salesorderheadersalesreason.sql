with 
source_salesorderheadersalesreason as (

    select * from {{ source('sales', 'salesorderheadersalesreason') }}

),

renomeado as (
    select
        cast(source_salesorderheadersalesreason.SALESORDERID as int) as pk_SALESORDER
        ,cast(source_salesorderheadersalesreason.SALESREASONID as int) as fk_SALESREASON
    from source_salesorderheadersalesreason
)

select * from renomeado