{{
  config(
    materialized='table'
  )
}}

SELECT 
user_id,
MIN(order_date) as first_order, 
MAX(order_date) as last_order,
COUNT(DISTINCT order_id) as orders, 
SUM(order_total) as order_spent

FROM {{ref('fact_orders')}}

GROUP BY 1
