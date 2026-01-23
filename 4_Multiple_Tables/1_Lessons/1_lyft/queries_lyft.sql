SELECT *
FROM customers;
SELECT *
FROM orders;
SELECT *
FROM subscriptions;

-- Introduction
SELECT *
FROM orders
LIMIT 5;
SELECT *
FROM subscriptions
LIMIT 5;
SELECT *
FROM customers
LIMIT 5;

-- Combining Tables with SQL
SELECT *
FROM orders
    JOIN customers ON orders.customer_id = customers.customer_id;

-- 
SELECT orders.order_id,
   customers.customer_name
FROM orders
JOIN customers
  ON orders.customer_id = custom.customer_id;

--

SELECT * FROM orders
JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id;

-- 

SELECT * FROM orders
JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id
WHERE description = 'Fashion Magazine';

-- WITH
SELECT customer_id, Count(customer_id) 
FROM orders
GROUP BY customer_id;

-- extra 
WITH previous_results AS (
SELECT customer_id, Count(customer_id) 
FROM orders
GROUP BY customer_id) 
SELECT * 
FROM
previous_results JOIN customers
ON previous_results.customer_id = customers.customer_id;

-- extra
SELECT customer_id,
   COUNT(subscription_id) AS 'subscriptions'
FROM orders
GROUP BY customer_id;

--

WITH previous_query AS (SELECT customer_id,
   COUNT(subscription_id) AS 'subscriptions'
FROM orders
GROUP BY customer_id)
SELECT customers.customer_name, previous_query.subscriptions
FROM previous_query JOIN customers
ON previous_query.customer_id = customers.customer_id;

-- 
