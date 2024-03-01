{% macro timezone_convert(source_timezone,target_timezone,column_input) %}
{% set query %}

SELECT 

CONVERT_TIMEZONE('{{source_timezone}}','{{target_timezone}}',{{column_input}}) as converted_timestamp

FROM dev_demo.raw.stg_timestamps

{% endset %}
{% do run_query(query) %}

{% endmacro %}









