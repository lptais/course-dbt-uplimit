{{
  config(
    materialized='table'
  )
}}


SELECT
a.product_id,
b.name as product_name,
a.event_id, 
a.session_id,
a.event_type,
DATE(a.created_at) as created_at,
a.order_id


FROM {{ ref('stg_events') }}  a
LEFT JOIN {{ ref('stg_products') }}  b
ON a.product_id = b.product_id

WHERE a.product_id is not null