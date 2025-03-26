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
            , stateprovince.fk_TERRITORYID
            , stateprovince.MODIFIEDDATE as MODIFIEDDATE_stateprovince
            , stateprovince.STATEPROVINCECODE
            , stateprovince.ISONLYSTATEPROVINCEFLAG
            , stateprovince.STATE_NAME
            , stateprovince.ROWGUID as ROWGUID_stateprovince
            , countryregion.MODIFIEDDATE as MODIFIEDDATE_countryregion
            , countryregion.country_name
        from
            stateprovince
        left join
            countryregion on countryregion.pk_COUNTRYREGIONCODE = stateprovince.fk_COUNTRYREGIONCODE
    )

    ,enriquecer_adress as (
        select
            address.pk_address
            , enriquecer_stateprovince.fk_TERRITORYID
            , enriquecer_stateprovince.MODIFIEDDATE_stateprovince as MODIFIEDDATE_stateprovince
            , enriquecer_stateprovince.STATEPROVINCECODE
            , enriquecer_stateprovince.ISONLYSTATEPROVINCEFLAG
            , enriquecer_stateprovince.STATE_NAME
            , enriquecer_stateprovince.ROWGUID_stateprovince as ROWGUID_stateprovince
            , enriquecer_stateprovince.MODIFIEDDATE_countryregion as MODIFIEDDATE_countryregion
            , enriquecer_stateprovince.country_name
            , address.fk_stateprovince
            , address.MODIFIEDDATE as MODIFIEDDATE_address
            , address.ADDRESSLINE1
            , address.ADDRESSLINE2
            , address.CITY
            , address.POSTALCODE
            , address.SPATIALLOCATION
            , address.ROWGUID as ROWGUID_address
        from
            address
        left join
            enriquecer_stateprovince on enriquecer_stateprovince.pk_stateprovince = address.fk_stateprovince
    )
        
select
    *
from
    enriquecer_adress
