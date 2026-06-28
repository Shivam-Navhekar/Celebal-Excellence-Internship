-- Q1. Find all orders where sales > average sales
SELECT
    `Order ID`,
    `Customer Name`,
    `Sales`
FROM superstore_raw
WHERE `Sales` >
(
    SELECT AVG(`Sales`)
    FROM superstore_raw
)
ORDER BY `Sales` DESC;

-- Q2. Find the highest sales order for each customer
SELECT
    `Customer Name`,
    MAX(`Sales`) AS highest_order_sales
FROM superstore_raw
GROUP BY `Customer ID`, `Customer Name`
ORDER BY highest_order_sales DESC;


