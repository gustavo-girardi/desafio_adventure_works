with 
    address as (
        select *
        from {{ ref ('stg_person__address')}}
    )

    ,countryregion as (
        select *
        from {{ ref ('stg_person__countryregion')}}
    )

    ,stateprovince as (
        select *
        from {{ ref ('stg_person__stateprovince')}}
    )

    ,join_stateprovince_countryregion as (
        select
            stateprovince.pk_stateprovince 
            , countryregion.country_name 
            , stateprovince.state_name
            , stateprovince.stateprovincecode
        from
            stateprovince
        left join
            countryregion on countryregion.pk_COUNTRYREGIONCODE = stateprovince.fk_COUNTRYREGIONCODE
    )

    ,join_adress as (
        select
            address.pk_address
            , address.city
            , join_stateprovince_countryregion.state_name
            , join_stateprovince_countryregion.stateprovincecode            
            , join_stateprovince_countryregion.country_name 
        from
            address
        left join
            join_stateprovince_countryregion on join_stateprovince_countryregion.pk_stateprovince = address.fk_stateprovince
    )
        
select
    *
from
    join_adress
