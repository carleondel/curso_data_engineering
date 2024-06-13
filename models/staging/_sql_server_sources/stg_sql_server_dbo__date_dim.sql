WITH date_data AS 
({{ dbt_date.get_date_dimension('1990-01-01', '2030-12-31') }})
 
SELECT 
    date_day as date
    ,extract(day from date_day) as day
    ,extract(month from date_day) as month
    ,extract(year from date_day) as year
    ,extract(quarter from date_day) as quarter
    ,extract(dow from date_day) as day_of_week
    ,extract(doy from date_day) as day_of_year
FROM date_data