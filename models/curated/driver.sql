{{
    config 
    (
       materialized='table',
       database='dev_demo',
       schema='curated',
       transient=false
    )    

}}

With driver AS (


    select 
    id as id,
    name as name,
    rating::float as rating,
    vehicle_type_preference as vehicle_type_preference,
    active_hours as active_hours
    from {{source('raw','stg_driver')}}
)

select * from driver



