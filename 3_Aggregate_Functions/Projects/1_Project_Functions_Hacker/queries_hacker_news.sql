SELECT * FROM hacker_news;

-- =========================================================
-- Project: Analyze Hacker News Trends
-- Dataset: hacker_news
-- Rows: ~4000 (Codecademy-aligned subset)
-- =========================================================


-- ---------------------------------------------------------
-- 1. Explore popularity
-- ---------------------------------------------------------
-- Identify the top 5 Hacker News stories by score.
SELECT *
FROM hacker_news
ORDER BY score DESC
LIMIT 5; 


-- ---------------------------------------------------------
-- 2. Total points in the system
-- ---------------------------------------------------------
-- Calculate the total score of all stories.
SELECT SUM(score)
FROM hacker_news;


-- ---------------------------------------------------------
-- 3. Identify power users
-- ---------------------------------------------------------
-- Find users whose combined story scores exceed 200.
-- Return each user and their total score.
SELECT author, SUM(score)
FROM hacker_news
GROUP BY author
HAVING SUM(score) > 200
;

-- extra
-- “COUNT(DISTINCT author) counts how many unique authors exist in the table.”

SELECT DISTINCT author,
COUNT( DISTINCT author)
FROM hacker_news;


-- ---------------------------------------------------------
-- 4. Measure dominance
-- ---------------------------------------------------------
-- Calculate the percentage of the total score
-- contributed by these power users.


-- ---------------------------------------------------------
-- 5. Rickroll detection
-- ---------------------------------------------------------
-- Count how many times each user posted
-- the specified YouTube URL.
-- Works only on codecademy editor. With codecademy database. 
SELECT user, COUNT(*)
FROM hacker_news
WHERE url like '%dQw4w9Wg%'
GROUP BY user;


-- ---------------------------------------------------------
-- 6. Categorize source sites
-- ---------------------------------------------------------
-- Classify each story source as:
-- GitHub
-- Medium
-- New York Times
-- Other
SELECT id, CASE
    WHEN url LIKE
    '%github%' THEN
    'Github' 
    WHEN url LIKE
    '%medium%' THEN
    'Medium'
    WHEN url LIKE
    '%nytimes%' THEN
    'New York Times'
    ELSE 'Other'
    END AS 'Source'
FROM hacker_news;


-- ---------------------------------------------------------
-- 7. Source volume
-- ---------------------------------------------------------
-- Count how many stories fall into each source category.
SELECT CASE
    WHEN url LIKE
    '%github%' THEN
    'Github' 
    WHEN url LIKE
    '%medium%' THEN
    'Medium'
    WHEN url LIKE
    '%nytimes%' THEN
    'New York Times'
    ELSE 'Other'
    END AS 'Source', COUNT(*)
FROM hacker_news
GROUP BY 1;

-- ---------------------------------------------------------
-- 8. Inspect timestamps
-- ---------------------------------------------------------
-- Examine the format of the timestamp column.
SELECT timestamp FROM hacker_news;


-- ---------------------------------------------------------
-- 9. Extract hour
-- ---------------------------------------------------------
-- Extract the hour of day from each timestamp.
SELECT timestamp,
   strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;



-- ---------------------------------------------------------
-- 10. Hourly performance
-- ---------------------------------------------------------
-- For each hour of the day:
-- calculate the average score
-- calculate the number of stories.
SELECT 
   strftime('%H', timestamp), COUNT(*), AVG(score)
FROM hacker_news
GROUP BY 1
ORDER BY 1
;

-- ---------------------------------------------------------
-- 11. Final refinement
-- ---------------------------------------------------------
-- Round average scores.
-- Rename columns for readability.
-- Exclude rows with NULL timestamps.
-- Determine the best hours to post.
-- ---------------------------------------------------------
-- 10. Hourly performance
-- ---------------------------------------------------------
-- For each hour of the day:
-- calculate the average score
-- calculate the number of stories.
SELECT 
   strftime('%H', timestamp) AS post_hour, COUNT(*) as total_posts, ROUND(AVG(score)) as average_score
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 3 DESC
;

