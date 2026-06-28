-- Q3. Calculate total sales for each customer using CTE
WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(o.sales) AS total_sales,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id,
        c.customer_name
)

SELECT *
FROM customer_sales
ORDER BY total_sales DESC;

-- Q4. Find customers with above-average total sales (CTE + Subquery)
WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(o.sales) AS total_sales
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id,
        c.customer_name
)

SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
)
ORDER BY total_sales DESC;
