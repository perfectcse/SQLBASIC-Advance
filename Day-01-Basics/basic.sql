-- Day 01: Basic SQL Practice

-- Create Table
CREATE TABLE Students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    gender VARCHAR(10)
);

-- Insert Data
INSERT INTO Students (name, age, email, gender) VALUES 
('Vishal Mishra', 22, 'vishal@example.com', 'Male'),
('Amit Kumar', 23, 'amit@example.com', 'Male'),
('Sneha Sharma', 21, 'sneha@example.com', 'Female');

-- Select Data
SELECT * FROM Students;

-- Update a record
UPDATE Students SET age = 24 WHERE name = 'Amit Kumar';

-- Delete a record
DELETE FROM Students WHERE name = 'Sneha Sharma';
