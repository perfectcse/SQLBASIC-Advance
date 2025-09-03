CREATE TABLE table_1 (product VARCHAR(50));
INSERT INTO table_1 (product) VALUES ('Bag'), ('Bottle'), ('Pen'), ('Book'), ('Mug');

CREATE TABLE table_2 (price INT);
INSERT INTO table_2 (price) VALUES (600), (250), (25), (350), (150);
WITH t1 AS (
    SELECT product, ROW_NUMBER() OVER () AS rn
    FROM table_1
),
t2 AS (
    SELECT price, ROW_NUMBER() OVER () AS rn
    FROM table_2
)
SELECT t1.product, t2.price
FROM t1
JOIN t2 ON t1.rn = t2.rn;
