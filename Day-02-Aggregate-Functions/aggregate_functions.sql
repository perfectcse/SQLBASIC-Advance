-- Day 02: SQL Aggregate Functions Practice

-- Create Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    product VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2)
);

-- Insert Data
INSERT INTO Orders (customer_name, product, quantity, price) VALUES
('Vishal Mishra', 'Notebook', 3, 120.00),
('Amit Kumar', 'Pen', 10, 15.00),
('Sneha Sharma', 'Bag', 1, 550.00),
('Vishal Mishra', 'Pen', 5, 15.00),
('Amit Kumar', 'Notebook', 2, 120.00);

-- Total number of orders
SELECT COUNT(*) AS total_orders FROM Orders;

-- Total revenue
SELECT SUM(quantity * price) AS total_revenue FROM Orders;

-- Average order value
SELECT AVG(quantity * price) AS avg_order_value FROM Orders;

-- Minimum and Maximum price
SELECT MIN(price) AS min_price, MAX(price) AS max_price FROM Orders;

-- Group by customer: total quantity and total amount spent
SELECT 
    customer_name,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_spent
FROM Orders
GROUP BY customer_name;
