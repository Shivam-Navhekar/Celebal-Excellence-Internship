-- Q7. All delivered orders
SELECT * FROM orders WHERE status = 'Delivered';
-- It fetches the data from orders where the status is delivered which is 6 rows

-- Q8. Electronics products priced above 2000
SELECT * FROM products WHERE category = 'Electronics' AND unit_price > 2000;
-- It fetches the data from products where the category is Electronics 
-- and unit_price is greter than 2000 which is 2 rows

-- Q9. Customers who joined in 2024 from Maharashtra
SELECT * FROM customers 
WHERE YEAR(join_date) = 2024 AND state = 'Maharashtra';
-- It fetches the data from customers where the YEAR(join_date) is 2024 
-- and state is Maharashtra which is 2 rows

-- Q10. Orders between two dates, excluding cancelled
SELECT * FROM orders 
WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25' 
AND status != 'Cancelled';
-- It fetches the data from orders where the order_date is in between 2024-08-10 to 2024-08-25 
--  and status is not Cancelled which is 5 rows

-- Q11. What idx_orders_date does
-- idx_orders_date is an index created on order_date column.
-- It helps MySQL find records faster without checking every row.
-- This improves query performance.
SELECT * FROM orders WHERE order_date = '2024-08-15';

-- Q12. YEAR(join_date) = 2024 and index usage
-- No the index on join_date will not be used here This is because we are 
-- applying a function (YEAR()) on the column itself, so MySQL has to 
-- calculate YEAR(join_date) for every row before it can compare, which means 
-- it can't use the index directly. This is called a non-SARGable query.
-- A SARGable (index-friendly) version would be:
SELECT * FROM customers 
WHERE join_date >= '2024-01-01' AND join_date < '2025-01-01';