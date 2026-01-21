DROP TABLE IF EXISTS hacker_news;

CREATE TABLE hacker_news (
  id INTEGER,
  title TEXT,
  url TEXT,
  score INTEGER,
  time INTEGER,
  comments INTEGER,
  author TEXT
);

ALTER TABLE hacker_news
ADD COLUMN timestamp TEXT;

UPDATE hacker_news
SET timestamp = datetime(time, 'unixepoch');