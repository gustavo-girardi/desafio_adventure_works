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

    ,enriquecer_stateprovince as (
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

    ,enriquecer_adress as (
        select
            address.pk_address
            , address.city
            , enriquecer_stateprovince.state_name
            , enriquecer_stateprovince.stateprovincecode            
            , enriquecer_stateprovince.country_name 
        from
            address
        left join
            enriquecer_stateprovince on enriquecer_stateprovince.pk_stateprovince = address.fk_stateprovince
    )
        
select
    *
from
    enriquecer_adress
