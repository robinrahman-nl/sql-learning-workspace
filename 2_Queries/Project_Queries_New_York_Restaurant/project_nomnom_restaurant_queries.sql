-- ============================================================
-- PROJECT: New York Restaurants
-- COURSE: Learn SQL / Queries
-- ============================================================

-- Task 1: Explore the full dataset
SELECT * FROM nomnom;

-- extra
SELECT * FROM nomnom
LIMIT 1;

-- Task 2: List all distinct neighborhoods
SELECT DISTINCT neighborhood
FROM nomnom;

-- Task 3: List all distinct cuisine types
SELECT DISTINCT cuisine
FROM nomnom;

-- Task 4: Find all Chinese restaurants
SELECT *
FROM nomnom
WHERE cuisine = 'Chinese';

-- extra
SELECT *
FROM nomnom
WHERE cuisine = 'Chinese'
ORDER BY review DESC;

-- Task 5: Find restaurants with reviews >= 4
SELECT *
FROM nomnom
WHERE review >= 4;

-- extra
SELECT *
FROM nomnom
WHERE review >= 4
ORDER BY review DESC;

-- Task 6:
-- Suppose Abbi and Ilana want to have a fancy dinner date.
-- Return all the restaurants that are Italian and $$$.

SELECT * FROM nomnom
WHERE cuisine = 'Italian' AND price = '$$$';

-- Task 7:
-- Your coworker Trey can’t remember the exact name of a restaurant,
-- but he knows it contains the word ‘meatball’.
-- Find the restaurant using a query.

SELECT * FROM nomnom
WHERE name LIKE '%meatball%';

-- extra

SELECT * FROM nomnom
WHERE name LIKE '%pizza%';

-- Task 8:
-- Let’s order delivery to the house!
-- Find all the close-by spots in:
--   - Midtown
--   - Downtown
--   - Chinatown
-- (OR can be used more than once)

SELECT * FROM nomnom
WHERE 
neighborhood = 'Midtown' OR neighborhood = 'Downtown' OR neighborhood = 'Chinatown';

-- extra

SELECT * FROM nomnom
WHERE 
neighborhood = 'Midtown' OR neighborhood = 'Downtown' OR neighborhood = 'Chinatown'
ORDER BY neighborhood;


-- Task 9:
-- Find all restaurants with health grade pending
-- (rows with empty or NULL health values).

SELECT * FROM nomnom
WHERE health IS NULL;

-- Task 10:
-- Create a Top 10 restaurants ranking based on reviews.

SELECT * FROM nomnom
ORDER BY review DESC
LIMIT 10;



-- Task 11:
-- Use a CASE statement to change the rating system:
--   - review > 4.5 → Extraordinary
--   - review > 4   → Excellent
--   - review > 3   → Good
--   - review > 2   → Fair
--   - Everything else → Poor
-- Rename the new column appropriately.
SELECT review,
CASE
    WHEN review > 4.5 THEN 'Extraordinary'
    WHEN review > 4 THEN 'Excellent'
    WHEN review > 3 THEN 'Good'
    WHEN review > 2 THEN 'Fair'
    ELSE 'Poor'
END
AS 'rating'
FROM nomnom;

-- Task 12:
-- If stuck, watch the project walkthrough video
-- in the “Get Unstuck” section.