{{ 
    config
    (
     materialized='incremental',
     database='dev_demo',
     schema='curated',
     incremental_strategy='merge',
     unique_key='order_id',
     post_hook = "{{update_ctrl()}}"
    )
}}
{% set last_upd_time = ctrl_dt() %}


select 

*

from {{source('raw', 'stg_orders')}} 

{% if is_incremental() %}
   where order_ingestion_datetime > '{{ last_upd_time }}'  
                                    
{% endif %}

