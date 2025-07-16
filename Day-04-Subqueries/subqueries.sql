-- Day 04: SQL Subqueries Practice

-- Setup Tables
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employees (emp_id, emp_name, department, salary) VALUES
(1, 'Vishal', 'IT', 60000),
(2, 'Amit', 'HR', 50000),
(3, 'Sneha', 'IT', 70000),
(4, 'Rohit', 'Finance', 40000),
(5, 'Neha', 'HR', 55000);

-- 1. Scalar Subquery: Get the employee with highest salary
SELECT emp_name, salary
FROM Employees
WHERE salary = (SELECT MAX(salary) FROM Employees);

-- 2. Subquery with IN: Employees from departments with more than 1 employee
SELECT emp_name, department
FROM Employees
WHERE department IN (
    SELECT department
    FROM Employees
    GROUP BY department
    HAVING COUNT(*) > 1
);

-- 3. Subquery with EXISTS: Check if 'Finance' department exists
SELECT 'Finance Department Exists' AS status
WHERE EXISTS (
    SELECT 1
    FROM Employees
    WHERE department = 'Finance'
);

-- 4. Correlated Subquery: Employees earning more than the average salary of their own department
SELECT emp_name, department, salary
FROM Employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees e2
    WHERE e1.department = e2.department
);

-- 5. Nested Subquery: Employee with the second highest salary
SELECT emp_name, salary
FROM Employees
WHERE salary = (
    SELECT MAX(salary)
    FROM Employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM Employees
    )
);
