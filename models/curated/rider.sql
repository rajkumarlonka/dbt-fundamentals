{{
    config 
    (
       materialized='table',
       database='dev_demo',
       schema='curated',
       transient=false
    )    

}}

With rider AS (
    
    select 
    id as id,
    name as name,
    rating::float as rating,
    preferred_payment_method as preferred_payment_method,
    ride_frequency::float as ride_frequency
    from {{source('raw','stg_rider')}}
)

select * from rider



