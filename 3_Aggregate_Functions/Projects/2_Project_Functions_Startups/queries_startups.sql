-- ============================================================
-- PROJECT: Startups – Aggregate Functions
-- COURSE: Learn SQL / Aggregate Functions
-- ============================================================

-- 1.
-- Getting started, take a look at the startups table:
-- Inspect all rows and columns.
-- Question: How many columns are there?
SELECT * FROM startups;



-- 2.
-- Calculate the total number of companies in the table.
SELECT COUNT(*) from startups;

-- 3.
-- Calculate the total value of all companies.
-- Use the SUM() of the valuation column.
SELECT SUM(valuation) FROM startups;

-- 4.
-- Find the highest amount of money raised by a startup.
-- Return the maximum value from the raised column.
SELECT MAX(raised) FROM startups;
SELECT * FROM startups
ORDER BY raised DESC;


-- 5.
-- Return the highest amount of money raised,
-- but only for startups in the 'Seed' stage.
SELECT MAX(raised)
FROM startups
WHERE stage = 'Seed'
;

-- extra 
SELECT stage, raised
FROM startups
WHERE stage = 'Seed'
ORDER BY stage DESC
;


-- 6.
-- Find the year the oldest company on the list was founded.
SELECT MIN(founded)
FROM startups;

-- ------------------------------------------------------------
-- Valuations across different sectors
-- ------------------------------------------------------------


-- 7.
-- Return the average valuation of all startups.
SELECT AVG(valuation)
FROM startups;

-- 8.
-- Return the average valuation for each category.
SELECT category,
AVG(valuation)
FROM startups
GROUP BY category
;

-- 9.
-- Return the average valuation for each category.
-- Round the averages to two decimal places.
SELECT category,
ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category
;

-- 10.
-- Return the average valuation for each category.
-- Round to two decimal places and order from highest to lowest.
-- Question: Which markets are the most competitive?
SELECT category,
ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category
ORDER BY 2 DESC
;

-- ------------------------------------------------------------
-- Market competitiveness by number of companies
-- ------------------------------------------------------------

-- 11.
-- Return each category with the total number of companies in it.
SELECT category, COUNT(category)
FROM startups
GROUP BY category;


-- 12.
-- Filter the results to include only categories
-- that have more than three companies.
-- Question: Which markets are the most competitive?
SELECT category, COUNT(category)
FROM startups
GROUP BY category
HAVING COUNT(category) > 3;


-- ------------------------------------------------------------
-- Startup size by location
-- ------------------------------------------------------------

-- 13.
-- Return the average size (number of employees)
-- of a startup in each location.
SELECT location, AVG(employees)
FROM startups
GROUP BY location;

-- 14.
-- Return the average startup size per location,
-- but only include locations where the average size is above 500.
SELECT location, AVG(employees)
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;


