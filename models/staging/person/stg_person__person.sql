with
    source_person as (
        select *
        from {{ source('person', 'person') }}
    )

    , renomeado as (
        select
            cast(source_person.businessentityid as int) as pk_person
            ,cast(source_person.persontype as string) as persontype
            ,cast(source_person.title as string) as title
            ,cast(source_person.firstname as string) as firstname
            ,cast(source_person.middlename as string) as middlename
            ,cast(source_person.lastname as string) as lastname
            ,cast(source_person.suffix as string) as suffix
            --,cast(source_person.namestyle as BOOLEAN) as namestyle
            --,cast(source_person.emailpromotion as int) as emailpromotion
            --,cast(source_person.additionalcontactinfo as string) as additionalcontactinfo
            --,cast(source_person.demographics as string) as demographics
            --,cast(source_person.rowguid as string) as rowguid
            --,cast(source_person.modifieddate as date) as modifieddate
        from
            source_person
    )

    select
        *
    from
        renomeado
