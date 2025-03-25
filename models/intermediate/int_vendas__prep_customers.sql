with 
    person as (
        select *
        from {{ ref ('stg_person__person')}}
    )

    ,customer as (
        select *
        from {{ ref ('stg_sales__customer')}}
    )

    ,enriquecer as (
        select
            customer.PK_CUSTOMER
            --,customer.FK_PERSON
            --,customer.FK_STORE
            --,customer.FK_TERRITORY
            --,customer.FK_ROWGUID
            ,customer.MODIFIEDDATE_CUSTOMER
            ,person.PERSONTYPE
            ,person.NAMESTYLE
            ,person.TITLE
            ,person.FIRSTNAME
            ,person.MIDDLENAME
            ,person.LASTNAME
            ,person.SUFFIX
            ,person.EMAILPROMOTION
            ,person.ADDITIONALCONTACTINFO
            ,person.DEMOGRAPHICS
            ,person.ROWGUID_PERSON
            ,person.MODIFIEDDATE_PERSON
        from
            customer
        left join
            person on person.pk_PERSON = customer.fk_PERSON

    )

select
    *
from
    enriquecer