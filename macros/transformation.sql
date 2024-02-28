{# This macro is used to update the existing value in a column - modifying the column value #}


{% macro transformation(table_name, column_name1, column_name2) %}

{% set query %}

       select sum(column_name1) as column_name1
       from {{this.table_name}}
       group by
       column_name2

      {% endset %}
      {% do run_query(query) %} 

{% endmacro %}



