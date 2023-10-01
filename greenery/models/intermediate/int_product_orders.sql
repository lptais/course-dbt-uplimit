{{
  config(
    materialized='table'
  )
}}

SELECT
c.product_id,
a.event_id, 
a.session_id,
a.event_type,
DATE(a.created_at) as created_at,
a.order_id


FROM {{ ref('stg_events') }}  a
LEFT JOIN {{ ref('stg_orders') }} b 
ON a.order_id = b.order_id
LEFT JOIN {{ ref('stg_order_items') }} c 
ON b.order_id=c.order_id

WHERE a.product_id is null
and a.event_type = 'checkout'