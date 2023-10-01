## What is our overall conversion rate?

62.46%
```sql
SELECT
  ROUND(100*
    COUNT(DISTINCT CASE WHEN event_type = 'checkout' THEN session_id END)/
    COUNT(DISTINCT session_id), 2)
 AS overall_conversion_rate
FROM dev_db.dbt_taislaurindopereiraxebiacom.stg_events
```

## What is our conversion rate by product?

| PRODUCT_NAME         | CONVERSION_RATE |
|----------------------|-----------------|
| String of pearls     | 60.94           |
| Arrow Head           | 55.56           |
| Pilea Peperomioides  | 47.46           |
| Rubber Plant         | 51.85           |
| Orchid               | 45.33           |
| Cactus               | 54.55           |
| Aloe Vera            | 49.23           |
| Money Tree           | 46.43           |
| Bird of Paradise     | 45.00           |
| Birds Nest Fern      | 42.31           |
| Angel Wings Begonia  | 39.34           |
| Boston Fern          | 41.27           |
| Calathea Makoyana    | 50.94           |
| Ponytail Palm        | 40.00           |
| Bamboo               | 53.73           |
| Monstera             | 51.02           |
| ZZ Plant             | 53.97           |
| Philodendron         | 48.39           |
| Jade Plant           | 47.83           |
| Fiddle Leaf Fig      | 50.00           |
| Ficus                | 42.65           |
| Devil’s Ivy          | 48.89           |
| Dragon Tree          | 46.77           |
| Snake Plant          | 39.73           |
| Pink Anthurium       | 41.89           |
| Majesty Palm         | 49.25           |
| Peace Lily           | 40.91           |
| Pothos               | 34.43           |
| Spider Plant         | 47.46           |
| Alocasia Polly       | 41.18           | 

SQL code in the model fact_conversion_product.sql

## Which products had their inventory change from week 2 to week 3

ZZ Plant
Bamboo
Monstera
Pothos
Philodendron
String of pearls

(Checked via the snapshot)