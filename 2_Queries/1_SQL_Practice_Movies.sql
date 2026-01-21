
SELECT * FROM movies;

SELECT name, genre 
FROM movies;

SELECT name, genre, year 
FROM movies;

-- AS

SELECT name AS 'Titles'
FROM movies;

SELECT name AS 'Titels'
FROM movies;

SELECT imdb_rating AS 'IMBD'
FROM movies;

SELECT genre FROM movies;

-- DISTINCT

SELECT DISTINCT genre FROM movies;

SELECT year FROM movies;

SELECT DISTINCT year FROM movies;

-- WHERE

SELECT * FROM movies
WHERE imdb_Rating > 8;

SELECT * FROM movies
WHERE imdb_Rating < 5;

SELECT * FROM movies
WHERE year > 2014;

SELECT * FROM movies
WHERE name LIKE '%final%';

SELECT * FROM movies
WHERE name LIKE 'Se_en';

SELECT * FROM movies
WHERE name LIKE '%man%';

SELECT * FROM movies
WHERE name LIKE '% man';

SELECT * FROM movies
WHERE imdb_rating IS NOT NULL;

SELECT * FROM movies
WHERE imdb_rating IS NULL;

SELECT name FROM movies
WHERE imdb_rating IS NULL;

SELECT * FROM movies
WHERE name BETWEEN 'D' AND 'G';

SELECT * FROM movies
WHERE genre = 'action' ORDER BY imdb_rating;

SELECT * FROM movies
WHERE year BETWEEN 1970 AND 1979 ORDER BY year;

SELECT * FROM movies
WHERE year BETWEEN 1970 AND 1979 AND imdb_rating > 8;

SELECT * FROM movies
WHERE year < 1985 AND genre = 'horror';

SELECT * FROM movies
WHERE year > 2014 OR genre = 'action';

SELECT * FROM movies
WHERE genre = 'romance' OR genre = 'comedy';

-- ORDER BY

SELECT name, year, imdb_rating FROM movies
ORDER BY name ASC;

SELECT name, year, imdb_rating FROM movies
ORDER BY imdb_rating DESC;

-- LIMIT

SELECT * FROM movies
ORDER BY  imdb_rating DESC
LIMIT 3;

-- CASE

SELECT name,
CASE
    WHEN imdb_rating > 8 THEN
    'Fantastic'
    WHEN imdb_rating > 6 THEN
    'Poorly Received'
    ELSE 'Avoid at all cost'
    END
FROM movies;

SELECT name,
CASE 
    WHEN genre = 'romance' THEN 'Chill'
    WHEN genre = 'comedy' THEN 'Chill'
    ELSE 'Intense'
    END
FROM movies;

SELECT name,
CASE 
    WHEN genre = 'romance' THEN 'Chill'
    WHEN genre = 'comedy' THEN 'Chill'
    ELSE 'Intense'
    END AS 'mood'
FROM movies;

--