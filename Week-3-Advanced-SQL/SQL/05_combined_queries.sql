-- Q8. Combined: Customer Name + Total Sales + Rank
WITH customer_sales AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        c.segment,
        c.city,
        SUM(o.sales) AS total_sales,
        COUNT(o.order_id) AS num_orders,
        AVG(o.sales) AS avg_order_value
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name, c.segment, c.city
)
SELECT 
    customer_name,
    segment,
    city,
    total_sales,
    num_orders,
    ROUND(avg_order_value, 2) AS avg_order_value,
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank,
    PERCENT_RANK() OVER (ORDER BY total_sales DESC) AS sales_percentile
FROM customer_sales
ORDER BY sales_rank;