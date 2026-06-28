CREATE DATABASE superstore;
USE superstore;

SELECT COUNT(*) AS total_rows
FROM superstore_raw;
SHOW CREATE TABLE superstore_raw;
SELECT MIN(`Row ID`), MAX(`Row ID`)
FROM superstore_raw;
SELECT COUNT(DISTINCT `Row ID`)
FROM superstore_raw;	

-- Create customers table
CREATE TABLE customers AS
SELECT DISTINCT
    `Customer ID` AS customer_id,
    `Customer Name` AS customer_name,
    Segment AS segment,
    Country AS country,
    City AS city,
    State AS state,
    `Postal Code` AS postal_code,
    Region AS region
FROM superstore_raw;

-- Create orders table
CREATE TABLE orders AS
SELECT DISTINCT
    `Order ID` AS order_id,
    `Customer ID` AS customer_id,
    `Order Date` AS order_date,
    `Ship Date` AS ship_date,
    `Ship Mode` AS ship_mode,
    Sales AS sales,
    Quantity AS quantity,
    Discount AS discount,
    Profit AS profit
FROM superstore_raw;


-- Create products table
CREATE TABLE products AS
SELECT DISTINCT
    `Product ID` AS product_id,
    Category AS category,
    `Sub-Category` AS sub_category,
    `Product Name` AS product_name
FROM superstore_raw;

-- Verify
SELECT COUNT(*) AS customer_count FROM customers;
SELECT COUNT(*) AS order_count FROM orders;
SELECT COUNT(*) AS product_count FROM products;

