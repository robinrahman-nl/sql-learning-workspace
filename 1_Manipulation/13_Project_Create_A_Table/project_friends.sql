-- ============================================================
-- PROJECT: Create a Table – Friends
-- COURSE: Learn SQL / Manipulation
-- ------------------------------------------------------------
DROP TABLE IF EXISTS friends;
CREATE TABLE IF NOT EXISTS friends (id INTEGER, name TEXT, birthday DATE);
INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo', '1940-05-30');
INSERT INTO friends (id, name, birthday)
VALUES (2, 'Xavier', '2000-01-30');
INSERT INTO friends (id, name, birthday)
VALUES (3, 'Robin', '2020-01-30');
SELECT *
FROM friends;
UPDATE friends
SET name = 'Storm'
WHERE id = 1;
ALTER TABLE friends
ADD COLUMN email;
UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;
DELETE FROM friends
WHERE id = 1;
-- PROJECT CONTEXT
-- You will create your own `friends` table and progressively
-- modify its data and structure.
-- ------------------------------------------------------------
-- TASK CHECKLIST
--
-- 1) Create a table named `friends` with the following columns:
--    - id        : INTEGER
--    - name      : TEXT
--    - birthday  : DATE
--
-- 2) Insert Ororo Munroe into the `friends` table.
--    - Birthday: May 30, 1940
--
-- 3) Verify insertion by querying the table:
--    - SELECT * FROM friends;
--
--    Confirm:
--    - The table exists
--    - Ororo Munroe appears in the results
--
-- 4) Insert two additional friends.
--    - Provide id, name, and birthday for each
--
-- 5) Update Ororo Munroe’s name to:
--    - "Storm"
--
-- 6) Alter the table to add a new column:
--    - email
--
-- 7) Update the email address for all records.
--    - Storm’s email: storm@codecademy.com
--
-- 8) Remove Storm from the table
--    - (She is fictional)
--
-- 9) Final verification:
--    - SELECT * FROM friends;
--
-- ------------------------------------------------------------
-- NOTES FOR FUTURE ME
-- - This file is designed to be re-runnable.
-- - If the database gets into a weird state:
--     • delete the .db file
--     • re-run this script top to bottom
-- ============================================================