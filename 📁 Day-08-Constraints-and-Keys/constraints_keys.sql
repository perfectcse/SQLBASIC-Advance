-- Day 08: SQL Constraints & Keys

-- Create Students Table with Constraints
CREATE TABLE Students (
    student_id INT PRIMARY KEY,           -- PRIMARY KEY (Unique & Not NULL)
    name VARCHAR(100) NOT NULL,           -- NOT NULL (Name must be provided)
    email VARCHAR(100) UNIQUE,            -- UNIQUE (No duplicate emails)
    age INT CHECK (age >= 18),            -- CHECK (Age must be 18+)
    city VARCHAR(50) DEFAULT 'Unknown'    -- DEFAULT (Value if not provided)
);

-- Insert Data (Valid)
INSERT INTO Students (student_id, name, email, age, city)
VALUES (1, 'Vishal', 'vishal@example.com', 22, 'Noida');

-- Insert Data (City not provided → uses DEFAULT)
INSERT INTO Students (student_id, name, email, age)
VALUES (2, 'Amit', 'amit@example.com', 23);

-- Insert Data (Age < 18 → Fails due to CHECK constraint)
-- INSERT INTO Students (student_id, name, email, age)
-- VALUES (3, 'Sneha', 'sneha@example.com', 16);

-- View Data
SELECT * FROM Students;

-- =========================
-- FOREIGN KEY
-- =========================

-- Create Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

-- Create Enrollments Table with Foreign Key
CREATE TABLE Enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert into Courses
INSERT INTO Courses (course_id, course_name) VALUES
(101, 'SQL Basics'),
(102, 'Advanced SQL');

-- Insert into Enrollments
INSERT INTO Enrollments (enroll_id, student_id, course_id) VALUES
(1, 1, 101),
(2, 2, 102);
