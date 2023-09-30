{% macro session_orders_logic(order_id, session_id, table_alias) %}
  CASE WHEN {{ table_alias }}.{{ order_id }} IS NOT NULL THEN {{ table_alias }}.{{ session_id }} ELSE NULL END
{% endmacro %}