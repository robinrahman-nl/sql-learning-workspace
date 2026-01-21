SELECT * FROM fake_apps;

SELECT COUNT (*) AS 'Total nr of apps' FROM fake_apps;

SELECT COUNT (*)
AS total_free_apps
FROM fake_apps
WHERE price = 0;

SELECT SUM(downloads) FROM fake_apps;


SELECT MIN(downloads) FROM fake_apps;

-- extra
SELECT MAX(downloads) FROM fake_apps;

-- extra
SELECT AVG(downloads) FROM fake_apps;

SELECT MAX(price) FROM fake_apps;

-- extra
SELECT name, MAX(price) FROM fake_apps;

SELECT AVG(downloads) FROM fake_apps;

SELECT AVG(price) FROM fake_apps;

-- extra
SELECT COUNT(*), AVG(downloads), AVG(price) FROM fake_apps;

SELECT name, ROUND(price) FROM fake_apps;

SELECT ROUND(AVG(price), 2) FROM fake_apps;

SELECT price, COUNT (*)
FROM fake_apps
WHERE downloads > 20000
GROUP BY price
;

SELECT price, COUNT(price)
FROM fake_apps
WHERE downloads > 20000
GROUP BY price
ORDER BY 2 ASC
;

SELECT category, SUM(downloads)
FROM fake_apps
GROUP BY 1
ORDER BY 1;



SELECT category, 
    price,
    AVG(downloads)
FROM fake_apps
GROUP BY 1, 2
;

SELECT price, 
ROUND(AVG(downloads)),
COUNT(price) 
FROM fake_apps
GROUP BY price
HAVING COUNT(*) > 10
;




