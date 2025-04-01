/*
    Este teste garante queas vendas brutas no ano de 2011 foram de $12.646.112,16 
*/

with 
    sales_2011 as (
        select
            sum(gross_total) as sum_gross_total
        from
            {{ref('int_selling__prep_orders')}}
        where
            orderdate between '2011-01-01' and '2011-12-31' 
    )

select
    sum_gross_total
from
    sales_2011
where
    sum_gross_total not between 12646112.10 and 12646112.20
