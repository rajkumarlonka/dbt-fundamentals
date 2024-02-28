{# This macro is used to update the existing value in a column - modifying the column value #}


{% macro modify_column(table_name, column_name, expression) %}

{% set query %}

       update {{ref(table_name)}}
       
       set {{column_name}}={{ expression }}

      {% endset %}
      {% do run_query(query) %} 

{% endmacro %}



