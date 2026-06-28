-- Q5. Rank all customers based on total sales
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
SELECT
    customer_name,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS customer_rank,
    DENSE_RANK() OVER (ORDER BY total_sales DESC) AS customer_dense_rank,
    ROW_NUMBER() OVER (ORDER BY total_sales DESC) AS row_num
FROM customer_sales
ORDER BY customer_rank;

-- Q6. Assign row numbers to each order within a customer (PARTITION BY)
SELECT
    `Customer Name`,
    `Order ID`,
    `Sales`,
    ROW_NUMBER() OVER
    (
        PARTITION BY `Customer ID`
        ORDER BY STR_TO_DATE(`Order Date`,'%m/%d/%Y')
    ) AS order_num,

    RANK() OVER
    (
        PARTITION BY `Customer ID`
        ORDER BY `Sales` DESC
    ) AS sales_rank

FROM superstore_raw

ORDER BY
`Customer Name`,
order_num;

-- Q7. Display top 3 customers based on total sales
WITH customer_sales AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(o.sales) AS total_sales
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
),
ranked_customers AS (
    SELECT 
        customer_name,
        total_sales,
        ROW_NUMBER() OVER (ORDER BY total_sales DESC) AS customer_rank
    FROM customer_sales
)
SELECT *
FROM ranked_customers
WHERE customer_rank <= 3;
