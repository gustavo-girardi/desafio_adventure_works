with
    source_customer as (
        select *
        from {{ source('sales', 'customer') }}
    )

    ,renomeado as (
        select 
            cast(source_customer.customerid as int) as pk_customer 
            , cast(source_customer.personid as int) as fk_person
            --, cast(source_customer.storeid as int) as fk_store
            --, cast(source_customer.territoryid as int) as fk_territory
            --, cast(source_customer.rowguid as string) as rowguid
            --, cast(source_customer.modifieddate as date) as modifieddate

        from
            source_customer
    )

    select
        *
    from
        renomeado