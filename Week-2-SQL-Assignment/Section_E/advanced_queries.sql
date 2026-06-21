-- Q24. CASE statement for price tiers
SELECT product_name, unit_price,
CASE 
    WHEN unit_price < 1000 THEN 'Budget'
    WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
    ELSE 'Premium'
END AS price_tier
FROM products;
-- it categorizes products into Budget, Mid-Range and Premium price tiers
-- CASE is used to apply different conditions and return different values

-- Q25. Count delivered vs not delivered orders
SELECT 
    SUM(CASE WHEN status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_count,
    SUM(CASE WHEN status != 'Delivered' THEN 1 ELSE 0 END) AS not_delivered_count
FROM orders;
-- It counts how many orders are delivered and how many are not delivered
-- CASE is used inside SUM() to count records based on a condition

-- Q26. ACID explanation
-- Atomicity - a transaction is all or nothing. If one part fails, the whole 
-- thing rolls back. Example: in a bank transfer, if money is deducted from 
-- account A but the credit to account B fails, atomicity makes sure the 
-- deduction is also undone, so money doesn't just disappear.
--
-- Consistency - the database always moves from one valid state to another 
-- valid state. Example: if there's a rule that balance can't go negative, 
-- consistency makes sure no transaction is allowed to break that rule.
--
-- Isolation - transactions happening at the same time don't interfere with 
-- each other. Example: if two people are transferring money from the same 
-- account at the same time, isolation makes sure their transactions don't 
-- mix up and cause wrong balances.
--
-- Durability - once a transaction is committed, it stays saved even if the 
-- system crashes right after. Example: once a bank transfer is confirmed, 
-- it stays recorded even if the server restarts immediately after.

-- Q27. Transaction for new order
START TRANSACTION;

INSERT INTO orders VALUES (1011, 102, CURDATE(), 'Pending', 1598.00);

INSERT INTO order_items VALUES (5016, 1011, 206, 1, 1299.00, 0);
INSERT INTO order_items VALUES (5017, 1011, 208, 1, 599.00, 0);

UPDATE products SET stock_qty = stock_qty - 1 WHERE product_id = 206;
UPDATE products SET stock_qty = stock_qty - 1 WHERE product_id = 208;

COMMIT;
-- If any step fails, use ROLLBACK instead of COMMIT to undo all changes
-- this ensures that either all operations are completed successfully or none of them are applied