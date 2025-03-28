with
    source_countryregion as (
        select *
        from {{ source('person', 'countryregion') }}
    )

    , renomeado as (
        select
            cast(countryregioncode as string) as pk_countryregioncode
            , cast(name as string) as country_name
            --, cast(modifieddate as date) as modifieddate 
        from
            source_countryregion
    )

select
    *
from
    renomeado
