{#
/* this macro is used to update the ctrl_dt in audit.job_ctrl_tbl */
#} 

 {% macro update_ctrl() %}
       {% set query %}

       update {{source('audit','job_ctrl_tbl')}} 
       
       set ctrl_dt= (select max(load_ins_time) from {{this}})

       where table_name='{{this.table}}'

      {% endset %}
      {% do run_query(query) %}
{% endmacro %}










