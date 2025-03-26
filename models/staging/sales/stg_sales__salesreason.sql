with 
source_salesreason as (

    select * from {{ source('sales', 'salesreason') }}

),

renomeado as (
    select
        cast(source_salesreason.SALESREASONID as int) as pk_SALESREASON
        ,cast(source_salesreason.NAME as string) as reason_name
        ,cast(source_salesreason.REASONTYPE as string) as reasontype
    from source_salesreason
)

select * from renomeado