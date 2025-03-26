with
    source_customer as (
        select *
        from {{ source('sales', 'customer') }}
    )

    ,renomeado as (
        select 
            cast(source_customer.CUSTOMERID as int) as pk_CUSTOMER 
            ,cast(source_customer.PERSONID as int) as fk_PERSON
            ,cast(source_customer.STOREID as int) as fk_store
            ,cast(source_customer.TERRITORYID as int) as fk_TERRITORY
            ,cast(source_customer.ROWGUID as string) as fk_ROWGUID
            ,cast(source_customer.MODIFIEDDATE as date) as MODIFIEDDATE_customer

        from
            source_customer
    )

    select
        *
    from
        renomeado