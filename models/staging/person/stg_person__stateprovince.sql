with
    source_stateprovince as (
        select *
        from {{ source('person', 'stateprovince') }}
    )

    , renomeado as (
        select
            cast(stateprovinceid as int) as pk_stateprovince
            , cast(countryregioncode as string) as fk_countryregioncode
            , cast(name as string) as state_name
            , cast(stateprovincecode as string) as stateprovincecode
            --, cast(isonlystateprovinceflag as string) as isonlystateprovinceflag
            --, cast(territoryid as int) as fk_territoryid
            --, cast(modifieddate as string) as modifieddate
            --, cast(rowguid as string) as rowguid
        from
            source_stateprovince
    )

select
    *
from
    renomeado
