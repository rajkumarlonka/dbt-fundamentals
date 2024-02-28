{{
    config 
    (
       materialized='table',
       database='dev_demo',
       schema='curated',
       transient=false
    )    

}}

With vehicle AS (
    
    select 
    id as id,
    type as type,
    capacity::number as capacity,
    model as  model,
    year::number as year
    from {{source('raw','stg_vehicle')}}
)

select * from vehicle



