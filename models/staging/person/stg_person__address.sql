with
    source_address as (
        select *
        from {{ source('person', 'address') }}
    )

    , renomeado as (
        select
            cast(ADDRESSID as int) as pk_address
            , cast(STATEPROVINCEID as int) as fk_stateprovince
            , cast(MODIFIEDDATE as date) as MODIFIEDDATE
            , cast(ADDRESSLINE1 as string) as ADDRESSLINE1
            , cast(ADDRESSLINE2 as string) as ADDRESSLINE2
            , cast(CITY as string) as CITY
            , cast(POSTALCODE as string) as POSTALCODE
            , cast(SPATIALLOCATION as string) as SPATIALLOCATION
            , cast(ROWGUID as string) as ROWGUID
        from
            source_address
    )

    select
        *
    from
        renomeado
