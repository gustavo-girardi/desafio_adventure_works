with
    source_countryregion as (
        select *
        from {{ source('person', 'countryregion') }}
    )

    , renomeado as (
        select
            cast(COUNTRYREGIONCODE as string) as pk_COUNTRYREGIONCODE
            , cast(MODIFIEDDATE as date) as MODIFIEDDATE 
            , cast(NAME as string) as country_name
        from
            source_countryregion
    )

select
    *
from
    renomeado
