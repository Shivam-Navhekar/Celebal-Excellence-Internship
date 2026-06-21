    # Week 2: E-Commerce SQL Database Analysis

    **Student:** Shivam Navhekar  
    **Task:** SQL-based data analysis using filtering, aggregation, and business queries

    ---

    ## Overview

    This assignment focused on writing SQL queries for an e-commerce database called ShopEase. The database has 4 main tables: customers, products, orders, and order_items. I wrote 27 SQL queries across 5 sections to analyze sales data, customer behavior, and product performance.

    ## Database Schema

    The database consists of:
    - **customers** - stores customer info like name, city, and premium status
    - **products** - product catalog with category, brand, and price
    - **orders** - customer orders with date and status (Pending, Shipped, Delivered, Cancelled)
    - **order_items** - line items in each order with quantity and discount

    All tables are connected using Primary Keys and Foreign Keys to maintain data integrity.

    ## Files Included

    - **schema/database_schema.sql** - CREATE TABLE statements and sample data INSERT statements
    - **Section_A/basic_queries.sql** - Q1-Q6 (SELECT basics, constraints, primary keys)
    - **Section_B/filtering_queries.sql** - Q7-Q12 (WHERE, indexes, SARGable queries)
    - **Section_C/aggregation_queries.sql** - Q13-Q18 (COUNT, SUM, AVG, GROUP BY, HAVING)
    - **Section_D/joins_queries.sql** - Q19-Q23 (INNER JOIN, LEFT JOIN, relationships)
    - **Section_E/advanced_queries.sql** - Q24-Q27 (CASE, ACID, transactions)

    ## How to Run

    1. Open MySQL Workbench
    2. Run the schema file first: `schema/database_schema.sql` (creates database and tables)
    3. Run each section's .sql file in order to see the queries and their results
    4. Each query has a comment explaining what it does

    ## Key Learnings

    - Indexes improve SELECT performance but slow down INSERT/UPDATE
    - JOINs connect related tables using keys
    - Transactions ensure multiple operations happen together or not at all
    - GROUP BY + aggregate functions give business insights (top products, revenue per month, etc.)
    - Proper constraints prevent bad data from entering the database

    ## Challenges & Solutions

    **Problem:** Query with YEAR(join_date) = 2024 was slow
    **Solution:** Changed to WHERE join_date >= '2024-01-01' AND join_date < '2025-01-01' to use the index

    **Problem:** Understanding when to use LEFT vs INNER JOIN
    **Solution:** LEFT JOIN keeps all left table rows (good for finding customers with/without orders). INNER JOIN shows only matches (good for reports where you only want customers who placed orders).
