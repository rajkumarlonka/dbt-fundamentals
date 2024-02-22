{{ 
    config
    (
     materialized='incremental',
     database='dev_demo',
     schema='curated',
     incremental_strategy='merge',
     unique_key='order_id',
     transient=false
    )
}}

select 
*
from {{source('raw', 'stg_orders')}}

{% if is_incremental() %}
   where order_ingestion_datetime > max(order_ingestion_datetime) from {{ this }}
{% endif %}

