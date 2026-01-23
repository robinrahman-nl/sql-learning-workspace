-- ============================================================
-- Codecademy Project: Lyft Trip Data
-- ------------------------------------------------------------
-- Objective:
-- Practice SQL techniques for working with multiple tables,
-- including JOINs, UNIONs, aggregations, and subqueries.
--
-- Context:
-- This project simulates a real-world data analyst scenario
-- at Lyft, where trip data, rider data, and car data must be
-- combined and analyzed to answer business questions.
--
-- Scope:
-- - Table inspection and schema awareness
-- - CROSS JOIN, LEFT JOIN, and INNER JOIN usage
-- - UNION to combine datasets
-- - Aggregations (AVG, COUNT)
-- - Filtering and ordering for insights
--
-- Notes:
-- - Queries are written in the order of Codecademy tasks
-- - Extra exploratory queries are intentionally preserved
-- ============================================================


--
-- Any additional or alternative approaches are clearly marked as -- extra.


-- 1.
-- Let’s examine the three tables.
SELECT * FROM trips;
SELECT * FROM riders;
SELECT * FROM cars;
SELECT * FROM riders2;


-- 3.
-- Try out a simple cross join between riders and cars.
-- Is the result useful?
SELECT *
FROM riders
CROSS JOIN cars;


-- 4.
-- Suppose we want to create a Trip Log with the trips and its users.
-- Find the columns to join between trips and riders and combine the two tables using a LEFT JOIN.
-- Let trips be the left table.
SELECT *
FROM trips
LEFT JOIN riders
  ON trips.rider_id = riders.id;


-- 5.
-- Suppose we want to create a link between the trips and the cars used during those trips.
-- Find the columns to join on and combine the trips and cars table using an INNER JOIN.
SELECT *
FROM trips
JOIN cars
  ON trips.car_id = cars.id;


-- 6.
-- The new riders data are in! There are three new users this month.
-- Stack the riders table on top of the new table named riders2.
SELECT * FROM riders
UNION
SELECT * FROM riders2;


-- 7.
-- What is the average cost for a trip?
SELECT ROUND(AVG(cost), 2) AS trip_avg_cost
FROM trips;


-- 8.
-- Lyft is looking to do an email campaign for all the irregular users.
-- Find all the riders who have used Lyft less than 500 times!

-- extra
SELECT * FROM riders
WHERE total_trips < 500;

SELECT * FROM riders
WHERE total_trips < 500
UNION
SELECT * FROM riders2
WHERE total_trips < 500;

WITH all_riders AS (
    SELECT * FROM riders
    UNION
    SELECT * FROM riders2
)
SELECT *
FROM all_riders
WHERE total_trips < 500;


-- 9.
-- Calculate the number of cars that are active.
SELECT COUNT(*)
FROM cars
WHERE status = 'active';


-- 10.
-- It’s safety recall time for cars that have been on the road for a while.
-- Write a query that finds the two cars that have the highest trips_completed.
SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;
