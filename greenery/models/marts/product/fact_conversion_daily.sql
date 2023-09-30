SELECT
DATE(created_at) as date,
COUNT(DISTINCT session_id) as total_sessions, 
COUNT(DISTINCT {{ session_orders_logic('order_id', 'session_id', 'a') }}) as sessions_with_orders,
100*ROUND(COUNT(DISTINCT (CASE WHEN order_id is not null then session_id ELSE null END))/COUNT(DISTINCT session_id),2) as conversion_rate
FROM {{ ref('stg_events') }} a
GROUP by 1