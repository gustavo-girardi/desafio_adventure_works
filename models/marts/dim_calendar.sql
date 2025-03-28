WITH 
    calendar as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2010-01-01' as date)",
        end_date="cast('2015-01-01' as date)"
        )
    }}
    )

    ,calendar_enriquecida AS (
        SELECT 
            date_day AS calendar_date,
            YEAR(date_day) AS year,
            MONTH(date_day) AS month,
            DAY(date_day) AS day,
            DATE_TRUNC(QUARTER, date_day) AS quarter,
            WEEKOFYEAR(date_day) AS week_of_year,
            DAYOFWEEK(date_day) AS day_of_week_number,
            CASE 
                WHEN DAYOFWEEK(date_day) = 1 THEN 'Sunday'
                WHEN DAYOFWEEK(date_day) = 2 THEN 'Monday'
                WHEN DAYOFWEEK(date_day) = 3 THEN 'Tuesday'
                WHEN DAYOFWEEK(date_day) = 4 THEN 'Wednesday'
                WHEN DAYOFWEEK(date_day) = 5 THEN 'Thursday'
                WHEN DAYOFWEEK(date_day) = 6 THEN 'Friday'
                ELSE 'Saturday'
            END AS day_of_week_name,
            CASE 
                WHEN MONTH(date_day) IN (1,2,3) THEN 'Q1'
                WHEN MONTH(date_day) IN (4,5,6) THEN 'Q2'
                WHEN MONTH(date_day) IN (7,8,9) THEN 'Q3'
                ELSE 'Q4'
            END AS quarter_name,
            CASE 
                WHEN DAYOFWEEK(date_day) IN (1, 7) THEN 'Weekend'
                ELSE 'Weekday'
            END AS day_type
        FROM calendar
    )

SELECT * FROM calendar_enriquecida

