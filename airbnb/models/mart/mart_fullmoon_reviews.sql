{{
    config(
        materialized = 'table'
    )
}}

with fact_reviews AS (
    select * from {{ref('fact_reviews')}}
),
full_moon_dates AS(
    select * from {{ref('seed_full_moon_date')}}
)
select * ,
    CASE
        WHEN f.full_moon_date IS NULL THEN 'not full moon'
        else 'full  moon'
    end as is_full_moom
    from fact_reviews as r
    LEFT JOIN full_moon_dates as f
    on (TO_DATE(r.review_date)) = DATEADD(DAY , 1 , f.full_moon_date)