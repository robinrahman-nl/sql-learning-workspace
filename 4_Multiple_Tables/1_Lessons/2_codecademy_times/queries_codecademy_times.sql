-- ============================================================
-- PROJECT: Codecademy Times
-- MODULE: Multiple Tables
-- TOPIC: JOINs & CROSS JOIN
-- ============================================================


-- ------------------------------------------------------------
-- Inspect source tables
-- ------------------------------------------------------------

SELECT *
FROM newspaper;

SELECT *
FROM online;

SELECT * 
FROM months;


-- ------------------------------------------------------------
-- INNER JOIN
-- Combine newspaper and online subscribers
-- Only includes users present in BOTH tables
-- ------------------------------------------------------------

SELECT *
FROM newspaper
JOIN online
  ON newspaper.id = online.id;


-- ------------------------------------------------------------
-- LEFT JOIN
-- All newspaper subscribers,
-- plus matching online data where available
-- ------------------------------------------------------------

SELECT *
FROM newspaper
LEFT JOIN online
  ON newspaper.id = online.id;


-- ------------------------------------------------------------
-- LEFT JOIN + NULL filter
-- Question:
-- Which users subscribe to the newspaper
-- but NOT to the online edition?
-- ------------------------------------------------------------
SELECT *
FROM newspaper
LEFT JOIN online
  ON newspaper.id = online.id
WHERE online.id IS NULL;


-- ------------------------------------------------------------
-- Aggregate version of the same question
-- How many newspaper-only subscribers are there?
-- ------------------------------------------------------------
SELECT COUNT(*)
FROM newspaper
LEFT JOIN online
  ON newspaper.id = online.id
WHERE online.id IS NULL;


-- ------------------------------------------------------------
-- CROSS JOIN (Step 1 – baseline check)
-- Question:
-- How many customers were subscribed to the print newspaper
-- during March?
-- (start_month <= 3 AND end_month >= 3)
-- ------------------------------------------------------------
SELECT COUNT(*)
FROM newspaper
WHERE start_month <= 3
  AND end_month >= 3;

-- 
SELECT * 
FROM newspaper CROSS JOIN months;

-- 
SELECT * 
FROM newspaper CROSS JOIN months
WHERE start_month <= month AND end_month >= month;

--
SELECT month, COUNT(*)
FROM newspaper CROSS JOIN months
WHERE start_month <= month AND end_month >= month
GROUP BY month;

--
SELECT * FROM newspaper
UNION
SELECT * FROM online;