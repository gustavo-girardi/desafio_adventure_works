with
    source_person as (
        select *
        from {{ source('person', 'person') }}
    )

    , renomeado as (
        select
            cast(source_person.BUSINESSENTITYID as int) as pk_PERSON
            ,cast(source_person.PERSONTYPE as string) as PERSONTYPE
            ,cast(source_person.NAMESTYLE as BOOLEAN) as NAMESTYLE
            ,cast(source_person.TITLE as string) as TITLE
            ,cast(source_person.FIRSTNAME as string) as FIRSTNAME
            ,cast(source_person.MIDDLENAME as string) as MIDDLENAME
            ,cast(source_person.LASTNAME as string) as LASTNAME
            ,cast(source_person.SUFFIX as string) as SUFFIX
            ,cast(source_person.EMAILPROMOTION as int) as EMAILPROMOTION
            ,cast(source_person.ADDITIONALCONTACTINFO as string) as ADDITIONALCONTACTINFO
            ,cast(source_person.DEMOGRAPHICS as string) as DEMOGRAPHICS
            ,cast(source_person.ROWGUID as string) as ROWGUID_person
            ,cast(source_person.MODIFIEDDATE as date) as MODIFIEDDATE_person
        from
            source_person
    )

    select
        *
    from
        renomeado
