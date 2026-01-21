SELECT * FROM fake_apps;

-- ============================================================
-- AGGREGATE FUNCTIONS — SUMMARY
-- ------------------------------------------------------------
-- Aggregate functions perform calculations across many rows
-- to produce meaningful summary values.
--
-- Core aggregate functions:
-- - COUNT() : count rows
-- - SUM()   : total of values in a column
-- - MAX()   : largest value
-- - MIN()   : smallest value
-- - AVG()   : average value
-- - ROUND() : format numeric results
--
-- Key concepts:
-- - Aggregates collapse multiple rows into fewer results
-- - GROUP BY defines how rows are grouped before aggregation
-- - HAVING filters aggregated groups (not individual rows)
--
-- Mental model:
-- - WHERE  → filters rows
-- - GROUP BY → forms groups
-- - HAVING → filters groups
--
-- Status:
-- ✔ Aggregate Functions chapter completed
-- ============================================================

SELECT * FROM fake_apps;

-- ============================================================
-- AGGREGATE FUNCTIONS – INTRODUCTION
-- COURSE: Learn SQL / Aggregate Functions
-- ------------------------------------------------------------
-- Purpose:
-- Aggregate functions perform calculations across multiple rows
-- to answer high-level data questions (totals, averages, extremes).
--
-- Key concept:
-- - Regular SELECT queries return raw rows
-- - Aggregate queries return calculated values based on many rows
--
-- Dataset used in this chapter:
-- - Table: fake_apps
-- - Description: Fake mobile application data
--
-- Core aggregate functions covered:
-- - COUNT() : count the number of rows
-- - SUM()   : calculate the total of a numeric column
-- - MAX()   : find the largest value in a column
-- - MIN()   : find the smallest value in a column
-- - AVG()   : calculate the average of a numeric column
-- - ROUND() : round numeric results to a specified precision
--
-- Important mental model:
-- - Aggregates collapse many rows into a single result
-- - WHERE filters rows BEFORE aggregation is applied
-- - Aggregates become especially powerful when combined with GROUP BY
-- ============================================================
SELECT * FROM fake_apps;

-- ============================================================
-- AGGREGATE FUNCTION: COUNT()
-- ------------------------------------------------------------
-- Purpose:
-- COUNT() is used to calculate how many rows exist in a table
-- or how many rows match a specific condition.
--
-- Key rule:
-- - COUNT(*) counts ALL rows that match the query
-- - It does NOT ignore rows unless filtered by WHERE
--
-- Example use cases in this chapter:
-- 1) Count total number of apps in the table
-- 2) Count number of free apps (price = 0)
--
-- Important detail:
-- - COUNT(*) counts rows, not column values
-- - WHERE is applied BEFORE the counting happens

SELECT COUNT (*)
AS total_free_apps
FROM fake_apps
WHERE price = 0;

-- Expected results (Codecademy dataset):
-- - Total apps: 200
-- - Free apps (price = 0): 73
-- ============================================================

SELECT * FROM fake_apps;

-- ============================================================
-- AGGREGATE FUNCTION: SUM()
-- ------------------------------------------------------------
-- Purpose:
-- SUM() is used to calculate the total of all values
-- in a numeric column.
--
-- Key rule:
-- - SUM(column) adds up all NON-NULL values in that column
-- - It works only on numeric data types (INTEGER, REAL)
--
-- Example use case in this chapter:
-- - Calculate the total number of downloads
--   across all apps in the table
--
-- Core example:
-- What is the total number of downloads for all apps combined?
--
-- SELECT SUM(downloads)
-- FROM fake_apps;
--
-- Important mental model:
-- - WHERE filters rows FIRST
-- - SUM() then adds values from the remaining rows
--
-- Short examples:
--
-- 1) Total downloads of all apps:
    SELECT SUM(downloads) FROM fake_apps;

-- 2) Total downloads of paid apps only:
    SELECT SUM(downloads)
    FROM fake_apps
    WHERE price > 0;
--
-- Notes:
-- - SUM() returns a single value unless combined with GROUP BY
-- - SUM(price) is rarely meaningful by itself
--   (price ≠ revenue without downloads)

-- ============================================================
SELECT * FROM fake_apps;

-- ============================================================
-- AGGREGATE FUNCTIONS: MAX() / MIN()
-- ------------------------------------------------------------
-- Purpose:
-- MAX() and MIN() are used to find the highest or lowest value
-- in a numeric (or comparable) column.
--
-- Key rules:
-- - MAX(column) returns the largest NON-NULL value
-- - MIN(column) returns the smallest NON-NULL value
-- - Both return a single value unless used with GROUP BY
--
-- Typical use cases:
-- - Find the most popular app (highest downloads)
-- - Find the least popular app (lowest downloads)
-- - Find the most expensive or cheapest app
--
-- Core examples:
--
-- 1) Highest number of downloads (most popular app):
    SELECT MAX(downloads)
    FROM fake_apps;
--
-- 2) Lowest number of downloads (least popular app):
    SELECT MIN(downloads)
    FROM fake_apps;
--
-- 3) Price of the most expensive app:
    SELECT MAX(price)
    FROM fake_apps;
--
-- Important mental model:
-- - WHERE filters rows FIRST
-- - MAX() / MIN() then evaluate remaining values
--
-- Example with filtering:
-- - Most expensive paid app:
   SELECT MAX(price)
   FROM fake_apps
   WHERE price > 0;
--
-- Notes:
-- - MAX() / MIN() do NOT tell you *which row* had the value
-- - To get the full row, you need ORDER BY + LIMIT
--   (you’ll learn this pattern later)

-- ============================================================

-- ============================================================
-- AGGREGATE FUNCTION: ROUND()
-- ------------------------------------------------------------
-- Purpose:
-- ROUND() is used to make numeric results easier to read
-- by limiting the number of decimal places.
--
-- Syntax:
-- ROUND(column_or_expression, decimals)
--
-- Key rules:
-- - ROUND() does NOT change stored data
-- - It only affects the query output
-- - Often used with AVG(), SUM(), etc.
--
-- Examples:
--
-- 1) Round prices to whole numbers:
    SELECT name, ROUND(price, 0)
    FROM fake_apps;
--
-- 2) Round average price to 2 decimals:
    SELECT ROUND(AVG(price), 2)
    FROM fake_apps;
--
-- Mental model:
-- - AVG() calculates first
-- - ROUND() formats the final result
-- ============================================================

-- AGGREGATE FUNCTION: ROUND()
-- ------------------------------------------------------------
-- Purpose:
-- ROUND() formats numeric results by limiting decimal places.
--
-- Syntax:
-- ROUND(column_or_expression, decimals)
--
-- Key rules:
-- - Does NOT change stored data
-- - Only affects query output
-- - Commonly combined with AVG(), SUM(), etc.
--
-- Mental model:
-- - Aggregation happens first
-- - ROUND() formats the final result
-- ------------------------------------------------------------

-- Round prices to whole numbers
SELECT name, ROUND(price, 0)
FROM fake_apps;

-- Round average price to 2 decimal places
SELECT ROUND(AVG(price), 2)
FROM fake_apps;

-- AGGREGATE FUNCTIONS: GROUP BY (Column References)
-- ------------------------------------------------------------
-- Purpose:
-- GROUP BY can reference SELECT columns by position (1, 2, 3…)
-- instead of repeating full column names or expressions.
--
-- Why this matters:
-- - Reduces repetition
-- - Avoids errors with complex expressions
-- - Improves readability for aggregate-heavy queries
--
-- Key rule:
-- - Column numbers refer to the SELECT list order
--   1 = first selected column
--   2 = second selected column
--
-- Mental model:
-- - SELECT defines the output shape
-- - GROUP BY groups based on that shape
-- - Numbers point to SELECT columns, not table columns
-- ------------------------------------------------------------

SELECT category,
       price,
       AVG(downloads)
FROM fake_apps
GROUP BY 1, 2;

-- AGGREGATE FUNCTIONS: HAVING
-- ------------------------------------------------------------
-- Purpose:
-- HAVING is used to filter GROUPS after aggregation.
--
-- Key distinction:
-- - WHERE  → filters individual rows (before GROUP BY)
-- - HAVING → filters aggregated groups (after GROUP BY)
--
-- Execution order (mental model):
-- 1) FROM
-- 2) WHERE        → row-level filtering
-- 3) GROUP BY     → form groups
-- 4) HAVING       → group-level filtering
-- 5) SELECT       → compute aggregates
-- 6) ORDER BY / LIMIT
--
-- Rule of thumb:
-- - If your condition uses an aggregate (COUNT, AVG, SUM, etc.)
--   you MUST use HAVING.
--
-- Example use case:
-- - Only keep price points that have enough data to be meaningful
-- ------------------------------------------------------------

SELECT price,
       ROUND(AVG(downloads)),
       COUNT(*)
FROM fake_apps
GROUP BY price
HAVING COUNT(*) > 10;