-- Day 05: SQL Set Operators (UNION, INTERSECT, EXCEPT)

-- Create Tables
CREATE TABLE Students_A (
    student_id INT,
    student_name VARCHAR(100)
);

CREATE TABLE Students_B (
    student_id INT,
    student_name VARCHAR(100)
);

-- Insert into Students_A
INSERT INTO Students_A (student_id, student_name) VALUES
(1, 'Vishal'),
(2, 'Amit'),
(3, 'Sneha');

-- Insert into Students_B
INSERT INTO Students_B (student_id, student_name) VALUES
(3, 'Sneha'),
(4, 'Rohit'),
(5, 'Neha');

-- 1. UNION - Combine & remove duplicates
SELECT student_name FROM Students_A
UNION
SELECT student_name FROM Students_B;

-- 2. UNION ALL - Combine & keep duplicates
SELECT student_name FROM Students_A
UNION ALL
SELECT student_name FROM Students_B;

-- 3. INTERSECT - Common in both (Not supported directly in MySQL, use INNER JOIN)
-- MySQL Alternative:
SELECT a.student_name
FROM Students_A a
INNER JOIN Students_B b ON a.student_name = b.student_name;

-- 4. EXCEPT / MINUS - In A but not in B (Not supported directly in MySQL, use LEFT JOIN + NULL check)
-- MySQL Alternative:
SELECT a.student_name
FROM Students_A a
LEFT JOIN Students_B b ON a.student_name = b.student_name
WHERE b.student_name IS NULL;
