with 
source_creditcard as (

    select * from {{ source('sales', 'creditcard') }}

),

renomeado as (
    select
        cast(source_creditcard.creditcardid as int) as pk_creditcard
        ,cast(source_creditcard.cardtype as string) as cardtype
        --,cast(source_creditcard.cardnumber as int) as cardnumber
        --,cast(source_creditcard.expmonth as int) as expmonth
        --,cast(source_creditcard.expyear as int) as expyear
        --,cast(source_creditcard.modifieddate as date) as modifieddate
    from source_creditcard
)
select * from renomeado
