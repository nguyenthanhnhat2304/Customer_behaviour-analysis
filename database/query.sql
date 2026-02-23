--Question 1: Which product categories generate the highest total revenue?
SELECT 
    category,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping_behaviour
GROUP BY category
ORDER BY total_revenue DESC;

--Question 2: What is the average purchase amount by age group?
SELECT
    age_group,
    AVG(purchase_amount) AS avg_purchase_amount
FROM customer_shopping_behaviour
GROUP BY age_group
ORDER BY avg_purchase_amount DESC;

--Question 3: Top 10 items are purchased most frequently by customers?
SELECT
    item_purchased,
    COUNT(*) AS purchase_count
FROM customer_shopping_behaviour
GROUP BY item_purchased
ORDER BY purchase_count DESC
LIMIT 10;

--Question 4: How does customer purchase frequency relate to spending behavior?
SELECT
    frequency_of_purchases,
    AVG(purchase_amount) AS avg_purchase_amount
FROM customer_shopping_behaviour
GROUP BY frequency_of_purchases
ORDER BY avg_purchase_amount DESC;

--Question 5: Which locations contribute the most to overall revenue?
SELECT
    location,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping_behaviour
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 10;

--Question 6: What payment methods are most commonly used by customers?
SELECT
    payment_method,
    COUNT(*) AS usage_count
FROM customer_shopping_behaviour
GROUP BY payment_method
ORDER BY usage_count DESC;

--Question 7: How do product categories perform in terms of customer satisfaction (review ratings)?
SELECT
    category,
    ROUND(AVG(review_rating), 2) AS avg_rating
FROM customer_shopping_behaviour
GROUP BY category
ORDER BY avg_rating DESC;

--Question 8. What is the revenue contribution of each age group? 
SELECT 
    age_group,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping_behaviour
GROUP BY age_group
ORDER BY total_revenue DESC;

--Question 9. Segment customers into New, Returning, and Loyal based on their total 
-- number of previous purchases, and show the count of each segment. 
WITH customer_type as (
SELECT customer_id, previous_purchases,
CASE 
    WHEN previous_purchases = 1 THEN 'New'
    WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
    ELSE 'Loyal'
    END AS customer_segment
FROM customer_shopping_behaviour)

SELECT customer_segment,count(*) AS "Number of Customers" 
FROM customer_type 
GROUP BY customer_segment;

--Question 10. What are the top 3 most purchased products within each category? 
WITH item_counts AS (
    SELECT category,
           item_purchased,
           COUNT(customer_id) AS total_orders,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY COUNT(customer_id) DESC) AS item_rank
    FROM customer_shopping_behaviour
    GROUP BY category, item_purchased
)
SELECT item_rank,category, item_purchased, total_orders
FROM item_counts
WHERE item_rank <=3;

--Question 11. Do subscribed customers spend more? Compare average spend and total revenue between subscribers and non-subscribers.
SELECT subscription_status,
       COUNT(customer_id) AS total_customers,
       ROUND(AVG(purchase_amount),2) AS avg_spend,
       ROUND(SUM(purchase_amount),2) AS total_revenue
FROM customer_shopping_behaviour
GROUP BY subscription_status
ORDER BY total_revenue ASC, avg_spend DESC;
