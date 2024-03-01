{% macro identify_timezone(input_timezone) %}
{% set timezone_map = {
    "EST": "Eastern Standard Time",
    "EDT": "Eastern Daylight Time",
    "CST": "Central Standard Time",
    "CDT": "Central Daylight Time",
    "MST": "Mountain Standard Time",
    "MDT": "Mountain Daylight Time",
    "PST": "Pacific Standard Time",
    "PDT": "Pacific Daylight Time"
} %}

{% set tz = timezone_map.get(input_timezone) %}
{% if tz is not none %}
    {{ return(tz) }}
{% else %}
    Unknown Timezone
{% endif %}
{% endmacro %}
