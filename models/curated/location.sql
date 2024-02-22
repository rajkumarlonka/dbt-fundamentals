
{{config
(
    materialized='table',
    database='dev_demo',
    schema='curated',
    transient=false
)}}

With location AS (


    select 
    id as id,
    latitude::float as latitude,
    longitude::float as longitude,
    city as city,
    state as state
    from {{source('raw','stg_location')}}
)

select * from location



