with 
source_salesreason as (

    select * from {{ source('sales', 'salesreason') }}

),

renomeado as (
    select
        cast(source_salesreason.salesreasonid as int) as pk_salesreason
        ,cast(source_salesreason.name as string) as reason_name
        ,cast(source_salesreason.reasontype as string) as reasontype
    from source_salesreason
)

select * from renomeado