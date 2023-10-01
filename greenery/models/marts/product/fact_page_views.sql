{{
  config(
    materialized='table'
  )
}}

SELECT
created_at as date,
product_id, 
product_name,
COUNT(DISTINCT {{ event_types("'page_view'", 'event_id') }}) as page_views,
COUNT(DISTINCT {{ event_types("'add_to_cart'", 'event_id') }}) as add_to_carts,
COUNT(DISTINCT session_id) as sessions

FROM {{ ref('int_product_events') }} 

GROUP BY 1,2,3