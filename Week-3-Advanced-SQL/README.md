# Week 3: Advanced SQL - Subqueries, CTEs & Window Functions

## Author

**Shivam Navhekar**
---

## Overview

This project demonstrates advanced SQL concepts using the Superstore dataset in MySQL Workbench.

The objective was to practice:

- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Data analysis using SQL

The dataset was imported from CSV and normalized into separate tables for customers, orders, and products.

---

## Dataset

- Dataset: Sample Superstore
- Format: CSV
- Database: MySQL
- Source: Kaggle (provided by Celebal Technologies)

---

## Topics Covered

### 1. Subqueries

- Orders with sales greater than average sales
- Highest sales for each customer

### 2. Common Table Expressions (CTEs)

- Customer sales summary
- Customers with above-average sales

### 3. Window Functions

- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- PARTITION BY

### 4. Combined Queries

- Customer rankings
- Sales analysis
- Customer order statistics

### 5. Mini Project

Business questions answered using SQL:

- Top 5 customers
- Bottom 5 customers
- Customers with one order
- Above-average customers
- Highest order value per customer

---

## Project Structure

```
Week-3-Advanced-SQL
│
├── README.md
│
├── Data
│   └── Sample - Superstore.csv
│
└── SQL
    ├── 01_setup_tables.sql
    ├── 02_subqueries.sql
    ├── 03_ctes.sql
    ├── 04_window_functions.sql
    ├── 05_combined_queries.sql
    └── 06_mini_project.sql
```

---

## SQL Files

### 01_setup_tables.sql

- Create database
- Import verification
- Create Customers table
- Create Orders table
- Create Products table

### 02_subqueries.sql

Practice queries using nested SELECT statements.

### 03_ctes.sql

Practice Common Table Expressions for readable SQL queries.

### 04_window_functions.sql

Examples using:

- ROW_NUMBER()
- RANK()
- DENSE_RANK()

### 05_combined_queries.sql

Combines JOINs, CTEs and Window Functions.

### 06_mini_project.sql

Business-oriented SQL questions using all concepts learned.

---

## How to Run

1. Open MySQL Workbench.
2. Create a database.
3. Import the Superstore CSV into `superstore_raw`.
4. Execute `01_setup_tables.sql`.
5. Run the remaining SQL files in sequence.

---

## Key Learnings

- Learned how to write nested queries using Subqueries.
- Used CTEs to simplify complex SQL queries.
- Applied Window Functions for ranking and row numbering.
- Performed customer and sales analysis using SQL.
- Improved understanding of SQL query optimization and readability.

---

## Tools Used

- MySQL Workbench
- MySQL 9.x
- Superstore Dataset
- SQL

---