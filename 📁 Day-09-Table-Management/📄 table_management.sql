-- Day 09: SQL Table Management (ALTER, DROP, TRUNCATE)

-- Create a Sample Table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

-- Insert Data
INSERT INTO Employees (emp_id, emp_name, department, salary) VALUES
(1, 'Vishal', 'IT', 60000),
(2, 'Amit', 'HR', 50000),
(3, 'Sneha', 'Finance', 70000);

-- ====================================
-- ALTER TABLE (Modify Structure)
-- ====================================

-- 1. Add a new column
ALTER TABLE Employees ADD email VARCHAR(100);

-- 2. Modify data type of a column
ALTER TABLE Employees MODIFY salary DECIMAL(10,2);

-- 3. Rename a column (MySQL 8+)
ALTER TABLE Employees RENAME COLUMN emp_name TO employee_name;

-- 4. Drop a column
ALTER TABLE Employees DROP COLUMN email;

-- ====================================
-- TRUNCATE vs DELETE
-- ====================================

-- TRUNCATE: Removes all rows, but structure remains
TRUNCATE TABLE Employees;

-- DELETE: Removes rows with condition (but keeps data logs)
-- DELETE FROM Employees WHERE department = 'IT';

-- ====================================
-- DROP TABLE (Delete structure & data)
-- ====================================

-- DROP TABLE Employees;
