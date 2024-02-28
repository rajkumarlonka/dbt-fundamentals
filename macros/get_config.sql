/* this macro will pull the aggregate columns and expression from com_config*/
{% macro get_config(table_name) %}
 
    {% set query %}
SELECT
    group_by_exp,
    agg_exp
FROM
    {{ source('curated','com_config') }}
WHERE
    table_name = '{{table_name}}'
 
    {% endset %}
 
    {% set result = run_query(query) %}
 
    {% if execute %}
     {% set abc = result %}

      {{ print("This is a debug message:") }}
   
      
 
    {% endif %}
 
{% endmacro %}