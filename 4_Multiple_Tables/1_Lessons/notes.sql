-- ============================================================
-- Multiple Tables — Introduction
-- ============================================================

-- WHY MULTIPLE TABLES EXIST
-- ------------------------------------------------------------
-- In real-world databases, storing everything in one table
-- does not scale. It leads to duplicated data, larger tables,
-- update problems, and higher risk of inconsistencies.
--
-- The solution is normalization: splitting data into logical,
-- focused tables with clear responsibilities.

-- THE NAIVE (BAD) APPROACH
-- ------------------------------------------------------------
-- A single large table might contain:
--   order_id
--   customer_id
--   customer_name
--   customer_address
--   subscription_id
--   subscription_description
--   subscription_monthly_price
--   subscription_length
--   purchase_date
--
-- This causes repeated customer details and repeated
-- subscription details, making the table unmanageable.

-- THE NORMALIZED (CORRECT) APPROACH
-- ------------------------------------------------------------
-- We split the data into three related tables:
--
-- 1. orders       → what was ordered and when
-- 2. subscriptions → what a subscription is
-- 3. customers    → who the customer is

-- ------------------------------------------------------------
-- ORDERS TABLE
-- Purpose: Track purchases
-- Columns:
--   order_id
--   customer_id
--   subscription_id
--   purchase_date
-- ------------------------------------------------------------

SELECT *
FROM orders;

-- ------------------------------------------------------------
-- SUBSCRIPTIONS TABLE
-- Purpose: Define subscription types
-- Columns:
--   subscription_id
--   description
--   price_per_month
--   subscription_length
-- ------------------------------------------------------------

SELECT description, price_per_month
FROM subscriptions;

-- ------------------------------------------------------------
-- CUSTOMERS TABLE
-- Purpose: Store customer information
-- Columns:
--   customer_id
--   customer_name
--   address
-- ------------------------------------------------------------

SELECT customer_name, address
FROM customers;

-- ------------------------------------------------------------
-- HOW THE TABLES RELATE
-- ------------------------------------------------------------
-- orders.customer_id     → customers.customer_id
-- orders.subscription_id → subscriptions.subscription_id
--
-- These relationships allow us to combine data only when
-- needed, instead of storing duplicates.

-- ------------------------------------------------------------
-- WHY THIS DESIGN IS BETTER
-- ------------------------------------------------------------
-- • No duplicated customer or subscription data
-- • Smaller, cleaner tables
-- • Easier updates
-- • Faster queries
-- • Industry-standard relational modeling
--
-- This structure is the foundation for JOINs, which is the
-- core topic of the Multiple Tables chapter.

-- ------------------------------------------------------------
-- WHAT COMES NEXT
-- ------------------------------------------------------------
-- Next concepts:
-- • JOIN
-- • INNER JOIN
-- • LEFT JOIN
-- • Combining multiple tables into meaningful results
--
-- This is where SQL becomes truly powerful.

-- ============================================================
-- Multiple Tables — Combining Tables with SQL (JOIN)
-- ============================================================

-- WHY WE NEED JOINS
-- ------------------------------------------------------------
-- Data is often split across multiple tables to avoid
-- duplication and improve maintainability.
--
-- While this design is efficient for storage, it means
-- we must combine tables when querying meaningful information.
--
-- SQL solves this problem using JOINs.

-- WHAT A JOIN DOES
-- ------------------------------------------------------------
-- A JOIN combines rows from two tables based on a related
-- column between them.
--
-- Think of a JOIN as:
-- "Match rows from table A with rows from table B
--  where a specific condition is true."

-- BASIC JOIN SYNTAX
-- ------------------------------------------------------------
-- SELECT columns
-- FROM table_1
-- JOIN table_2
--   ON table_1.common_column = table_2.common_column;

-- JOINING ORDERS AND CUSTOMERS
-- ------------------------------------------------------------
-- We connect orders to customers using customer_id.
-- This allows us to see who placed each order.

SELECT *
FROM orders
JOIN customers
  ON orders.customer_id = customers.customer_id;

-- COLUMN NAME AMBIGUITY
-- ------------------------------------------------------------
-- When multiple tables contain columns with the same name
-- (e.g. customer_id, subscription_id),
-- we must prefix columns with the table name:
--
-- table_name.column_name
--
-- This avoids ambiguity and makes queries explicit.

-- SELECTING SPECIFIC COLUMNS FROM A JOIN
-- ------------------------------------------------------------
-- Instead of selecting all columns (*),
-- we can choose exactly what we need from each table.

SELECT orders.order_id,
       customers.customer_name
FROM orders
JOIN customers
  ON orders.customer_id = customers.customer_id;

-- JOINING ORDERS AND SUBSCRIPTIONS
-- ------------------------------------------------------------
-- We connect orders to subscriptions using subscription_id.
-- This lets us see what type of subscription was purchased.

SELECT *
FROM orders
JOIN subscriptions
  ON orders.subscription_id = subscriptions.subscription_id;

-- FILTERING JOIN RESULTS WITH WHERE
-- ------------------------------------------------------------
-- After joining tables, we can filter the combined result
-- using a WHERE clause.
--
-- This filters rows, not tables.

SELECT *
FROM orders
JOIN subscriptions
  ON orders.subscription_id = subscriptions.subscription_id
WHERE description = 'Fashion Magazine';

-- KEY TAKEAWAYS
-- ------------------------------------------------------------
-- • JOIN combines data from multiple tables
-- • ON defines how rows are matched
-- • table_name.column_name avoids ambiguity
-- • WHERE filters rows after the join
--
-- JOINs are the foundation of relational databases.

-- WHAT COMES NEXT
-- ------------------------------------------------------------
-- Next lessons build on this with:
-- • INNER JOIN (default behavior)
-- • LEFT JOIN
-- • Combining more than two tables
--
-- Mastering JOINs = mastering SQL.



-- ============================================================
-- Multiple Tables — Review Summary
-- ============================================================

-- JOIN
-- Combines rows from multiple tables when the join condition
-- between related columns is true.

-- LEFT JOIN
-- Returns all rows from the left table.
-- If no match exists in the right table, NULLs are returned
-- for the right-side columns.

-- PRIMARY KEY
-- A column that uniquely identifies each row in a table.

-- FOREIGN KEY
-- A column that references the primary key of another table,
-- creating a relationship between tables.

-- CROSS JOIN
-- Combines every row from one table with every row from another
-- table (all possible combinations).

-- UNION
-- Stacks the result of one query on top of another.
-- Requires same number of columns, compatible types, same order.

-- WITH (CTE)
-- Defines temporary named result sets that can be reused
-- within a larger query for clarity and structure.

-- ============================================================