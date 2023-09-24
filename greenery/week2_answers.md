## What is our user repeat rate?
79.83%
```sql
SELECT
100*COUNT(DISTINCT CASE WHEN orders>1 THEN user_id END)
/COUNT(DISTINCT CASE WHEN orders>0 THEN user_id END) as repeat_rate
FROM dbt_taislaurindopereiraxebiacom.fact_user_orders
```

## What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?
High average order value, order frequency and recency. Users that didn't purchase for a long time are less likely to purchase again - and also users with a very low average order value. If I had more data, I'd look into user demographics information.

## Explain the product mart models you added. Why did you organize the models in the way you did?
I built a intermediate model (int_product_events) as a mid step to perform the necessary joins prior to building the fact table (fact_page_views). 

## What assumptions are you making about each model? (i.e. why are you adding each test?)
Checks for unique values for primary/foreign keys such as user_id, product_id, order_id etc. Also checking for null values. In addition, I
checked for positive values with the positive_values macro for order_total - to check if there would be the case that the discount applied would be higher than the total order price.

## Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
I dind't find bad data, all my tests passed.