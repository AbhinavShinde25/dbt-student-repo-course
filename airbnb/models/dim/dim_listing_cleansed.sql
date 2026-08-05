{{
    config(
        materialized='view'
    )
}}

with src_listing as(
    select * from {{ref('src_listing')}}
)
select 
    listing_id,
    listing_name,
    listing_url,
    room_type,
    CASE 
        when try_cast(minimum_nights as INT) = 0 then 1
        else try_cast(minimum_nights as INT)
    end as minimum_nights,
    host_id ,
    TRY_CAST(replace(
        price_str , '$', ''
    )  AS DECIMAL(10,2)) AS price,
    created_at,
    updated_at
from src_listing