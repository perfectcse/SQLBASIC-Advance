-- 4. Insert sample marks
INSERT INTO marks (student_id, subject, score) VALUES
(1, 'Math', 85),
(2, 'Math', 90),
(4, 'Math', 70);   -- Notice: student_id=4 does not exist in student

-- LEFT JOIN
-- ================================
SELECT s.id, s.name, m.subject, m.score
FROM student s
LEFT JOIN marks m
ON s.id = m.student_id;