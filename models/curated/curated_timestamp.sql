{{
    config 
    (
       materialized='table',
       database='dev_demo',
       schema='curated',
       transient=false
    )    

}}

With curated_timestamp AS (


    select 
    id as id,
    {{ dbt_date.convert_timezone("MY_TIMESTAMP", "America/New_York", "UTC") }} as converted_timestamp
    from {{source('raw','stg_timestamps')}}
)

select * from curated_timestamp










