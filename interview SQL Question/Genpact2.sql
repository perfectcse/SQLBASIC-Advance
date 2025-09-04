-- STEP 1: Select your database
-- USE your_database_name;

-- STEP 2: Drop old tables if they exist (clean start)
DROP TABLE IF EXISTS table_1_q2;
DROP TABLE IF EXISTS table_2_q2;

-- STEP 3: Create and insert values into Table_1
-- Notice: duplicates and NULL values included
CREATE TABLE table_1_q2 (id INT);
INSERT INTO table_1_q2 (id) VALUES
(1), (1), (1),    -- three 1s
(2), (2),         -- two 2s
(NULL), (NULL),   -- two NULLs
(3),              -- one 3
(5);              -- one 5

-- STEP 4: Create and insert values into Table_2
CREATE TABLE table_2_q2 (id INT);
INSERT INTO table_2_q2 (id) VALUES
(1), (1),         -- two 1s
(2), (2),         -- two 2s
(NULL), (NULL),   -- two NULLs
(4),              -- one 4
(5),              -- one 5
(6);              -- one 6

-- STEP 5: Verify data in both tables
SELECT * FROM table_1_q2;
SELECT * FROM table_2_q2;

-- STEP 6: INNER JOIN
-- Only matching values are returned (NULLs excluded)
-- Matches:
-- 1 → 3×2 = 6 rows
-- 2 → 2×2 = 4 rows
-- 5 → 1×1 = 1 row
-- Total = 11
SELECT COUNT(*) AS inner_count
FROM table_1_q2 t1
INNER JOIN table_2_q2 t2 ON t1.id = t2.id;

-- STEP 7: LEFT JOIN
-- All rows from table_1 + matches from table_2
-- Extra rows from left side: (3) + (two NULLs)
-- Total = 11 (matches) + 3 = 14
SELECT COUNT(*) AS left_count
FROM table_1_q2 t1
LEFT JOIN table_2_q2 t2 ON t1.id = t2.id;

-- STEP 8: RIGHT JOIN
-- All rows from table_2 + matches from table_1
-- Extra rows from right side: (4) + (6) + (two NULLs)
-- Total = 11 (matches) + 4 = 15
SELECT COUNT(*) AS right_count
FROM table_1_q2 t1
RIGHT JOIN table_2_q2 t2 ON t1.id = t2.id;

-- STEP 9: FULL OUTER JOIN (MySQL doesn’t support directly)
-- Solution: UNION ALL (Left join + unmatched right rows)
-- Extra unmatched rows: left side (3 + 2×NULL), right side (4 + 6 + 2×NULL)
-- Total = 11 + 7 = 18
SELECT COUNT(*) AS full_outer_count
FROM (
    SELECT t1.id AS left_id, t2.id AS right_id
    FROM table_1_q2 t1
    LEFT JOIN table_2_q2 t2 ON t1.id = t2.id
    UNION ALL
    SELECT t1.id AS left_id, t2.id AS right_id
    FROM table_1_q2 t1
    RIGHT JOIN table_2_q2 t2 ON t1.id = t2.id
    WHERE t1.id IS NULL
) AS full_join_rows;



🎯 Expected Output

INNER JOIN → 11

LEFT JOIN → 14

RIGHT JOIN → 15

FULL OUTER JOIN → 18