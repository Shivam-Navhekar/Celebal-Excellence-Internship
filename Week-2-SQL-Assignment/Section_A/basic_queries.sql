-- Q1. Display all columns and rows from customers table
SELECT * FROM customers;
-- It displays all records and all columns from the customers table

-- Q2. Get first_name, last_name and city of all customers
SELECT first_name, last_name, city FROM customers;
-- It displays only first_name, last_name and city from the customers table

-- Q3. List all unique categories from products table
SELECT DISTINCT category FROM products;
-- It displays unique product categories without duplicates

-- Q4. Primary keys of each table
-- customers -> customer_id
-- products -> product_id
-- orders -> order_id
-- order_items -> item_id
-- A primary key has to be unique and not null because it is used to identify 
-- each row in the table. If two rows had the same id, the database wouldn't 
-- know which row we're talking about when we do an update or delete. 
-- If it was allowed to be null, that row would have no identity at all.

-- Q5. Constraints on email column
-- email has UNIQUE and NOT NULL constraints.
-- If we try to insert a duplicate email, MySQL will throw an error like
-- "Duplicate entry for key customers.email" and the insert will fail.

-- Q6. Insert product with negative price
INSERT INTO products VALUES (209, 'Test Product', 'Electronics', 'TestBrand', -50.00, 10);
-- This query tries to insert a product with a negative price.
-- The insertion fails because unit_price must be greater than 0.
-- MySQL returns a check constraint error and does not insert the record.