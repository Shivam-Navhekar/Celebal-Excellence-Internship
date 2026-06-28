-- Q9. Top 5 customers
WITH customer_sales AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(o.sales) AS total_sales
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    RANK() OVER (ORDER BY total_sales DESC) AS customer_rank,
    customer_name,
    total_sales
FROM customer_sales
ORDER BY total_sales DESC
LIMIT 5;

-- Q10. Bottom 5 customers (with sales)
WITH customer_sales AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(o.sales) AS total_sales
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT 
    RANK() OVER (ORDER BY total_sales ASC) AS customer_rank,
    customer_name,
    total_sales
FROM customer_sales
WHERE total_sales > 0
LIMIT 5;

-- Q11. Customers who made only one order
SELECT 
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS num_orders,
    SUM(o.sales) AS total_sales
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.order_id) = 1
ORDER BY total_sales DESC;

-- Q12. Customers with above-average total sales
WITH avg_sales AS (
    SELECT AVG(total_sales) AS avg_total_sales
    FROM (
        SELECT 
            c.customer_id,
            SUM(o.sales) AS total_sales
        FROM customers c
        LEFT JOIN orders o ON c.customer_id = o.customer_id
        GROUP BY c.customer_id
    ) customer_totals
),
customer_sales AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(o.sales) AS total_sales
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT 
    customer_name,
    total_sales,
    ROUND(total_sales - (SELECT avg_total_sales FROM avg_sales), 2) AS above_average
FROM customer_sales
WHERE total_sales > (SELECT avg_total_sales FROM avg_sales)
ORDER BY total_sales DESC;

-- Q13. Highest order value per customer
SELECT 
    c.customer_name,
    MAX(o.sales) AS highest_order_value,
    MIN(o.sales) AS lowest_order_value,
    AVG(o.sales) AS avg_order_value,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY highest_order_value DESC;