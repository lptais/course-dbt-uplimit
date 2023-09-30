
WITH sessions_product as (
SELECT
DISTINCT 
product_id, 
session_id
FROM {{ ref('stg_events') }} 
where product_id is not null),

sessions_orders as (
SELECT
DISTINCT
session_id, 
order_id
FROM {{ ref('stg_events') }} 
)

SELECT
a.product_id, 
c.name as product_name,
COUNT(DISTINCT a.session_id) as total_sessions,
COUNT(DISTINCT {{ session_orders_logic('order_id', 'session_id', 'b') }}) as sessions_with_orders,
COUNT(DISTINCT {{ session_orders_logic('order_id', 'session_id', 'b') }})/COUNT(DISTINCT a.session_id) as
conversion_rate
FROM sessions_product a
LEFT JOIN sessions_orders b
ON a.session_id=b.session_id
LEFT JOIN {{ ref('stg_products') }}  c
ON a.product_id=c.product_id
GROUP BY 1,2

