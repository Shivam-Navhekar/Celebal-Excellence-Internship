-- Q13. Total number of orders
SELECT COUNT(*) AS total_orders FROM orders;
-- it counts the total number of orders present in the orders table
-- the result is displayed with the alias name total_orders
-- total orders = 10

-- Q14. Total revenue from delivered orders
SELECT SUM(total_amount) AS total_revenue 
FROM orders 
WHERE status = 'Delivered';
-- it calculates the total revenue generated from delivered orders only
-- cancelled, Pending and Shipped orders are not included

-- Q15. Average unit price per category
SELECT category, AVG(unit_price) AS avg_price
FROM products
GROUP BY category;
-- it calculates the average unit price for each product category
-- the result is displayed using the alias avg_price

-- Q16. Count and revenue per order status, sorted by revenue desc
SELECT status, COUNT(*) AS order_count, SUM(total_amount) AS total_revenue
FROM orders
GROUP BY status
ORDER BY total_revenue DESC;
-- it shows the number of orders and total revenue for each order status
-- the results are sorted by total revenue in descending order

-- Q17. Most expensive and cheapest product per category
SELECT category, MAX(unit_price) AS most_expensive, MIN(unit_price) AS cheapest
FROM products
GROUP BY category;
-- it will fetch most expensive(MAX) and cheapest(MIN) product price in each category

-- Q18. Categories where avg price > 2000
SELECT category, AVG(unit_price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(unit_price) > 2000;
-- it displays only those categories whose average product price is greater than 2000
-- HAVING is used because the condition is applied after GROUP BY on the aggregated value