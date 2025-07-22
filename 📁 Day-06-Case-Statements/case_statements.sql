-- Day 06: SQL CASE Statements & Conditional Logic

-- Create Employees Table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

-- Insert Sample Data
INSERT INTO Employees (emp_id, emp_name, department, salary) VALUES
(1, 'Vishal', 'IT', 60000),
(2, 'Amit', 'HR', 40000),
(3, 'Sneha', 'IT', 75000),
(4, 'Rohit', 'Finance', 50000),
(5, 'Neha', 'HR', 55000);

-- 1. CASE for Salary Grade
SELECT 
    emp_name,
    salary,
    CASE 
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_grade
FROM Employees;

-- 2. Department Bonus Logic
SELECT 
    emp_name,
    department,
    salary,
    CASE 
        WHEN department = 'IT' THEN salary * 0.10
        WHEN department = 'HR' THEN salary * 0.05
        ELSE salary * 0.08
    END AS bonus
FROM Employees;

-- 3. CASE with ORDER BY (Sort by Grade)
SELECT 
    emp_name,
    salary,
    CASE 
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS grade
FROM Employees
ORDER BY 
    CASE 
        WHEN salary >= 70000 THEN 1
        WHEN salary >= 50000 THEN 2
        ELSE 3
    END;
