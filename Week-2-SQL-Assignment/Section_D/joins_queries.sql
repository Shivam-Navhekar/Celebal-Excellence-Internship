-- Q19. Orders with customer name (inner join)

SELECT o.order_id, o.order_date, c.first_name, c.last_name, o.total_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;
-- it displays order details along with customer names
-- INNER JOIN returns only matching records from both tables

-- Q20. All customers with their orders, even if no orders (left join)

SELECT c.first_name, c.last_name, o.order_id, o.order_date, o.total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;
-- it displays all customers and their order details.
-- if a customer has no orders, NULL values will be shown for order columns.


-- Q21. Three table join - orders, order_items, products

SELECT oi.order_id, p.product_name, oi.quantity, oi.unit_price, oi.discount_pct
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
-- it combines orders, order_items and products tables.
-- it displays product details, quantity, price and discount for each order

-- Q22. LEFT JOIN vs RIGHT JOIN

-- LEFT JOIN keeps all rows from the left table and matches whatever it can 
-- find from the right table, filling NULL where there's no match.
-- Example: customers LEFT JOIN orders keeps every customer, even those 
-- with zero orders.
-- RIGHT JOIN does the opposite, it keeps all rows from the right table.
-- Example: customers RIGHT JOIN orders would keep every order, even if 
-- somehow the customer_id didn't match (not possible here because of FK, 
-- but that's the idea).
-- FULL OUTER JOIN would be used if we wanted every customer AND every 
-- order shown, matched where possible and NULL where not. MySQL doesn't 
-- support FULL OUTER JOIN directly, so it's usually done with a UNION of 
-- LEFT and RIGHT joins.

-- Q23. Foreign key relationships

-- orders.customer_id references customers.customer_id
-- order_items.order_id references orders.order_id
-- order_items.product_id references products.product_id
-- If we try inserting an order with customer_id = 999 which doesn't exist 
-- in customers, MySQL will throw a foreign key constraint error and reject 
-- the insert, because it can't create a reference to a customer that 
-- doesn't exist.