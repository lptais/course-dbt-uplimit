
{{
  config(
    materialized='table'
  )
}}

SELECT
a.product_id, 
product_name,
COUNT(DISTINCT a.session_id) as sessions,
COUNT(DISTINCT b.session_id) as sessions_with_orders,
ROUND(COUNT(DISTINCT b.session_id)/COUNT(DISTINCT a.session_id),3)*100 as conversion_rate

FROM {{ ref('int_product_events') }} a
JOIN {{ ref('int_product_orders') }} b
ON a.product_id = b.product_id
GROUP BY 1,2