-- 1. Create student table
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- 2. Insert sample students
INSERT INTO student (id, name) VALUES
(1, 'Raj'),
(2, 'Vishal'),
(3, 'Ankit');

-- 3. Create marks table
CREATE TABLE marks (
    student_id INT,
    subject VARCHAR(50),
    score INT
);

-- 4. Insert sample marks
INSERT INTO marks (student_id, subject, score) VALUES
(1, 'Math', 85),
(2, 'Math', 90),
(4, 'Math', 70);   -- Notice: student_id=4 does not exist in student

-- ================================
-- INNER JOIN
-- ================================
SELECT s.id, s.name, m.subject, m.score
FROM student s
INNER JOIN marks m
ON s.id = m.student_id;
