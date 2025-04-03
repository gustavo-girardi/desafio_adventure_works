with
    source_address as (
        select *
        from {{ source('person', 'address') }}
    )

    , renomeado as (
        select
            cast(addressid as int) as pk_address
            , cast(stateprovinceid as int) as fk_stateprovince
            , cast(city as string) as city
            --, cast(modifieddate as date) as modifieddate
            --, cast(addressline1 as string) as addressline1
            --, cast(addressline2 as string) as addressline2
            --, cast(postalcode as string) as postalcode
            --, cast(spatiallocation as string) as spatiallocation
            --, cast(rowguid as string) as rowguid
        from
            source_address
    )

    select
        *
    from
        renomeado
