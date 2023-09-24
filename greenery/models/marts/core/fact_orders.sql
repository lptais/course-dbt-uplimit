{{
  config(
    materialized='table'
  )
}}

SELECT
a.order_id, 
a.user_id, 
a.promo_id,
b.discount,
b.status as promo_status,
a.address_id,
DATE(a.created_at) as order_date,
a.order_cost, 
a.order_total,
a.tracking_id,
a.shipping_service,
a.shipping_cost,
DATE(a.estimated_delivery_at) as estimated_delivery_at,
DATE(a.delivered_at) as delivered_at,
DATEDIFF(day, a.estimated_delivery_at, a.delivered_at) as days_for_delivery,
order_status

FROM {{ ref('stg_orders') }}  a
LEFT JOIN {{ ref('stg_promos') }}  b 
on a.promo_id=b.promo_id