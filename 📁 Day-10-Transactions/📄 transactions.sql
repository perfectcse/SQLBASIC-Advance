-- Day 10: SQL Transactions (BEGIN, COMMIT, ROLLBACK, SAVEPOINT)

-- Create Table for Transaction Example
CREATE TABLE Bank_Accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(10,2)
);

-- Insert Sample Data
INSERT INTO Bank_Accounts (account_id, account_holder, balance) VALUES
(1, 'Vishal', 5000.00),
(2, 'Amit', 3000.00);

-- ====================================
-- TRANSACTION START
-- ====================================

-- Start Transaction
START TRANSACTION;

-- Deduct 1000 from Vishal's account
UPDATE Bank_Accounts
SET balance = balance - 1000
WHERE account_id = 1;

-- Add 1000 to Amit's account
UPDATE Bank_Accounts
SET balance = balance + 1000
WHERE account_id = 2;

-- COMMIT: Save the changes permanently
COMMIT;

-- ====================================
-- ROLLBACK (Undo changes)
-- ====================================
START TRANSACTION;

-- Deduct 2000 from Vishal's account (mistake)
UPDATE Bank_Accounts
SET balance = balance - 2000
WHERE account_id = 1;

-- Oops! Rollback this operation
ROLLBACK;

-- ====================================
-- SAVEPOINT (Partial Rollback)
-- ====================================
START TRANSACTION;

-- Savepoint 1
SAVEPOINT before_deduction;

-- Deduct 500
UPDATE Bank_Accounts
SET balance = balance - 500
WHERE account_id = 1;

-- Rollback to the savepoint (undo deduction)
ROLLBACK TO before_deduction;

-- Commit remaining valid operations
COMMIT;
