with
    source_stateprovince as (
        select *
        from {{ source('person', 'stateprovince') }}
    )

    , renomeado as (
        select
            cast(STATEPROVINCEID as int) as pk_stateprovince
            , cast(COUNTRYREGIONCODE as string) as fk_COUNTRYREGIONCODE
            , cast(TERRITORYID as int) as fk_TERRITORYID
            , cast(MODIFIEDDATE as string) as MODIFIEDDATE
            , cast(STATEPROVINCECODE as string) as STATEPROVINCECODE
            , cast(ISONLYSTATEPROVINCEFLAG as string) as ISONLYSTATEPROVINCEFLAG
            , cast(NAME as string) as STATE_NAME
            , cast(ROWGUID as string) as ROWGUID
        from
            source_stateprovince
    )

select
    *
from
    renomeado
