with full_moon_date as(
    select * from {{ref('mart_fullmoon_reviews')}}
)
select 
    is_full_moom , revies_centiments,
    count(*) as fact_reviews
from full_moon_date
group by is_full_moom , revies_centiments
order by is_full_moom , revies_centiments
