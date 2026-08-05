{{
    config(
        materialized="view"
    )
}}

with src_hosts as(
    select * from {{ ref('src_hosts')}}
)
select 
    host_id , 
    -- CASE
    --     WHEN host_name is NULL THEN "Anonymous"
    --     ELSE host_name
    -- END AS host_name,
    NVL(host_name , "Anonymous") as host_name,
    is_superhost,
    created_at,
    updated_at
FROM src_hosts

