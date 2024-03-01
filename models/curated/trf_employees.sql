{{ 
    config
    (
     materialized='incremental',
     database='dev_demo',
     schema='curated',
     incremental_strategy='merge',
     unique_key='employee_id',
     post_hook = "{{update_ctrl()}}"
    )
}}
{% set last_upd_time = ctrl_dt() %}

with trf_employees as (
select 
employee_id::NUMBER as employee_id,
REGEXP_REPLACE(firstname, '[^a-zA-Z0-9 ]', '')::VARCHAR(50) as first_name,
REGEXP_REPLACE(lastname, '[^a-zA-Z0-9 ]', '')::VARCHAR(50) as last_name,
department::VARCHAR(50) as department,
Replace(email,'`','')::VARCHAR(100) as email,
manager::NUMBER as manager_id,
salary::NUMBER(38,2) as salary,
load_ins_time as load_ins_time
from {{source('raw', 'stg_employees')}} 
)
select 

*

from trf_employees

{% if is_incremental() %}

   where load_ins_time > '{{ last_upd_time }}'  
                                    
{% endif %}

