-- Day 07: SQL Views & Indexes

-- Sample Table: Employees
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employees (emp_id, emp_name, department, salary) VALUES
(1, 'Vishal', 'IT', 70000),
(2, 'Amit', 'HR', 50000),
(3, 'Sneha', 'Finance', 60000),
(4, 'Rohit', 'IT', 80000),
(5, 'Neha', 'HR', 55000);

-- =========================
-- 📘 VIEWS
-- =========================

-- 1. Create a View for high salary employees
CREATE VIEW High_Salary_Employees AS
SELECT emp_name, department, salary
FROM Employees
WHERE salary >= 60000;

-- 2. Query the View
SELECT * FROM High_Salary_Employees;

-- 3. Update through a View (only works in simple views)
UPDATE High_Salary_Employees
SET salary = 72000
WHERE emp_name = 'Vishal';

-- 4. Drop the View
DROP VIEW High_Salary_Employees;

-- =========================
-- ⚡ INDEXES
-- =========================

-- 1. Create an Index on department
CREATE INDEX idx_department ON Employees(department);

-- 2. Check Index effect (run EXPLAIN in MySQL Workbench)
EXPLAIN SELECT * FROM Employees WHERE department = 'IT';

-- 3. Drop Index
DROP INDEX idx_department ON Employees;
.........................................................
| Topic           | Description                               | Example                    |
| --------------- | ----------------------------------------- | -------------------------- |
| **VIEW**        | A virtual table based on SELECT query     | `CREATE VIEW`              |
| **Simple View** | Created from one table, supports update   | ✅                          |
| **INDEX**       | Speeds up query on large datasets         | `CREATE INDEX ON column`   |
| `EXPLAIN`       | Shows how a query runs (for optimization) | Used before/after indexing |
