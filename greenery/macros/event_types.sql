{% macro event_types(event_type, event_id) %}
  CASE WHEN event_type = {{ event_type }} THEN {{ event_id }} ELSE null END
{% endmacro %}