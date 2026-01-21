-- =======================================
-- LESSON: SELECT Basics
-- =======================================

-- * selects all columns from the table
SELECT * 
FROM movies;

-- Select specific columns (comma-separated)
SELECT name, genre 
FROM movies;

-- Select multiple columns for better readability
SELECT name, genre, year 
FROM movies;

-- =======================================
-- LESSON: AS (Aliases)
-- =======================================

-- AS creates a temporary alias for a column or table name in query results.
-- It does NOT permanently rename anything in the database.
-- Aliases make output more readable.

-- Rename a column with AS
SELECT name AS 'Title'
FROM movies;

-- Rename another column
SELECT imdb_rating AS 'IMDb Rating'
FROM movies;

-- =======================================
-- LESSON: DISTINCT
-- =======================================

-- DISTINCT removes duplicate values from the result set.
-- It returns only unique entries for the specified column(s).

-- Example: Show all unique genres
SELECT DISTINCT genre
FROM movies;

-- Example: Show all unique years
SELECT DISTINCT year
FROM movies;

-- =======================================
-- LESSON: WHERE
-- =======================================

-- WHERE filters results based on a condition.
-- Only rows that meet the condition (TRUE) are returned.

-- Comparison operators:
-- =   equal to
-- !=  not equal to
-- >   greater than
-- <   less than
-- >=  greater than or equal to
-- <=  less than or equal to

-- Example: Movies rated below 5
SELECT * 
FROM movies 
WHERE imdb_rating < 5;

-- Example: Movies released after 2014
SELECT * 
FROM movies 
WHERE year > 2014;

--
-- =======================================
-- LESSON: LIKE (Pattern Matching)
-- =======================================

-- LIKE is used in a WHERE clause to search for a specific pattern in text data.
-- _  (underscore) = matches any single character
-- %  (percent)   = matches any sequence of characters (including none)

-- Example: Matches titles starting with 'Se', ending with 'en', and having one character in between
SELECT * 
FROM movies
WHERE name LIKE 'Se_en';

-- % wildcard examples:

-- Titles that start with 'Star'
SELECT * 
FROM movies
WHERE name LIKE 'Star%';

-- Titles that end with 'Man'
SELECT * 
FROM movies
WHERE name LIKE '%Man';

-- Titles that contain 'War' anywhere
SELECT * 
FROM movies
WHERE name LIKE '%War%';

-- =======================================
-- LESSON: IS NULL / IS NOT NULL
-- =======================================

-- NULL = missing or unknown value
-- Can't compare with = or !=
-- Use IS NULL or IS NOT NULL instead

-- Find movies *with* IMDb rating
SELECT name
FROM movies
WHERE imdb_rating IS NOT NULL;

-- Find movies *without* IMDb rating
SELECT name
FROM movies
WHERE imdb_rating IS NULL;

-- =======================================
-- LESSON: BETWEEN (Range Filtering)
-- =======================================

-- Filters rows within a specific range (inclusive of both limits)
-- Works with numbers, text, or dates

-- Example: Movies released between 1970 and 1979
SELECT *
FROM movies
WHERE year BETWEEN 1970 AND 1979
ORDER BY year;

-- Example: Movies with names starting between 'D' and 'G'
SELECT *
FROM movies
WHERE name BETWEEN 'D' AND 'G';

-- =======================================
-- LESSON: AND (Combine Conditions)
-- =======================================

-- AND is used in a WHERE clause to combine multiple conditions.
-- A row is returned ONLY if *all* conditions evaluate to TRUE.

-- Example: Movies from the 1970s with IMDb rating above 8
SELECT *
FROM movies
WHERE year BETWEEN 1970 AND 1979
  AND imdb_rating > 8;

-- Example: Horror movies made before 1985
SELECT *
FROM movies
WHERE genre = 'horror'
  AND year < 1985;

-- =======================================
-- LESSON: ORDER BY (Sorting Results)
-- =======================================

-- ORDER BY sorts query results by one or more columns.
-- Default = ascending (A–Z or low–high)
-- Use DESC for descending (Z–A or high–low)
-- ORDER BY always comes after WHERE (if present)

-- Example: Sort alphabetically by movie name
SELECT name, year
FROM movies
ORDER BY name ASC;

-- Example: Sort by IMDb rating (highest to lowest)
SELECT name, year, imdb_rating
FROM movies
ORDER BY imdb_rating DESC;

-- =======================================
-- LESSON: LIMIT (Restrict Result Size)
-- =======================================

-- LIMIT restricts the number of rows returned by a query.
-- Useful for previewing large datasets or showing top results.
-- Always comes last in the query.

-- Example: Show only first 10 rows
SELECT *
FROM movies
LIMIT 10;

-- Example: Top 3 highest-rated movies
SELECT *
FROM movies
ORDER BY imdb_rating DESC
LIMIT 3;

-- =======================================
-- LESSON: CASE (Conditional Logic)
-- =======================================

-- CASE allows conditional logic inside a SELECT statement.
-- Creates a new COLUMN
-- Thats why 
Select column1, column 2 FROM table_name
SELECT column1, Case ..... END FROM table_name;

-- Works like IF / ELSE IF / ELSE in programming.
-- Must end with END.
-- Use AS to rename the output column.

-- Example 1: Classify movie ratings
SELECT name,
  CASE
    WHEN imdb_rating > 8 THEN 'Fantastic'
    WHEN imdb_rating > 6 THEN 'Poorly Received'
    ELSE 'Avoid at All Costs'
  END AS 'Review'
FROM movies;

-- Example 2: Classify movie moods
SELECT name,
  CASE
    WHEN genre = 'romance' THEN 'Chill'
    WHEN genre = 'comedy' THEN 'Chill'
    ELSE 'Intense'
  END AS 'Mood'
FROM movies;

--