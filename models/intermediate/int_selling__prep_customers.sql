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
            customer.pk_customer
            , COALESCE(person.title, '') || ' ' || 
              COALESCE(person.firstname, '') || ' ' || 
              COALESCE(person.middlename, '') || ' ' || 
              COALESCE(person.lastname, '') || ' ' || 
              COALESCE(person.suffix, '') AS full_name
        from
            customer
        left join
            person on person.pk_person = customer.fk_person

    )

select
    *
from
    enriquecer