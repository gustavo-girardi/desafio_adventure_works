with 
source_salesorderheadersalesreason as (

    select * 
    from {{ source('sales', 'salesorderheadersalesreason') }}

),

renomeado as (
    select
        cast(source_salesorderheadersalesreason.salesorderid as int) as pk_salesorder
        ,cast(source_salesorderheadersalesreason.salesreasonid as int) as fk_salesreason
    from source_salesorderheadersalesreason
)

select * from renomeado