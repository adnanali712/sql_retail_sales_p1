# Retail Sales SQL Project

## Overview

This project is a complete SQL-based Retail Sales Analysis project created using MySQL. The project focuses on data exploration, cleaning, and business analysis using SQL queries.

The dataset contains retail transaction details such as customer information, product categories, quantity sold, pricing, and total sales. Using SQL queries, different business insights are generated to understand customer behavior, sales performance, and category trends.

---

# Project Objectives

The main objectives of this project are:

* Create and manage a retail sales database
* Perform data cleaning and null value checking
* Explore customer and sales data
* Analyze sales trends and customer behavior
* Generate business insights using SQL queries
* Practice real-world SQL data analysis techniques

---

# Technologies Used

* MySQL
* SQL Queries
* Database Management System (DBMS)

---

# Database Creation

```sql
CREATE DATABASE PROJECT1;
USE PROJECT1;
```

---

# Table Structure

The project uses a table named `RETAIL_SALES`.

## Columns Used

| Column Name     | Data Type   | Description           |
| --------------- | ----------- | --------------------- |
| transactions_id | INT         | Unique transaction ID |
| sale_date       | DATE        | Date of sale          |
| sale_time       | TIME        | Time of sale          |
| customer_id     | INT         | Unique customer ID    |
| gender          | VARCHAR(50) | Gender of customer    |
| age             | INT         | Age of customer       |
| category        | VARCHAR(50) | Product category      |
| quantiy         | INT         | Quantity purchased    |
| price_per_unit  | FLOAT       | Price per item        |
| cogs            | FLOAT       | Cost of goods sold    |
| total_sale      | FLOAT       | Total sale amount     |

---

# Table Creation Query

```sql
CREATE TABLE RETAIL_SALES(
  transactions_id INT PRIMARY KEY,
  sale_date DATE,
  sale_time TIME,
  customer_id INT,
  gender VARCHAR(50),
  age INT,
  category VARCHAR(50),
  quantiy INT,
  price_per_unit FLOAT,
  cogs FLOAT,
  total_sale FLOAT
);
```

---

# Data Cleaning

The project includes checking for null values to ensure data quality.

## Null Value Check

```sql
SELECT * FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
```

---

# Data Exploration

Basic data exploration queries were performed to understand the dataset.

## Total Number of Sales

```sql
SELECT COUNT(*) AS total_sales
FROM retail_sales;
```

## Total Unique Customers

```sql
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales;
```

## Product Categories

```sql
SELECT DISTINCT category
FROM retail_sales;
```

---

# Business Problems & SQL Analysis

## 1. Sales Made on Specific Date

Retrieve all sales made on `2022-11-05`.

```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

---

## 2. Clothing Sales in November 2022

Retrieve clothing transactions where quantity sold is greater than or equal to 3.

```sql
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantiy >= 3
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11';
```

---

## 3. Total Sales by Category

Calculate total sales for each product category.

```sql
SELECT
    category,
    SUM(total_sale) AS net_sales
FROM retail_sales
GROUP BY category;
```

---

## 4. Average Age of Beauty Category Customers

Find the average age of customers purchasing beauty products.

```sql
SELECT
    AVG(age) AS average_age
FROM retail_sales
WHERE category = 'Beauty';
```

---

## 5. Transactions with High Sales

Find transactions where total sales exceed 1000.

```sql
SELECT *
FROM retail_sales
WHERE total_sale > 1000;
```

---

## 6. Transactions by Gender and Category

Count total transactions made by each gender in each category.

```sql
SELECT
    category,
    gender,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category, gender;
```

---

## 7. Best Selling Month Analysis

Calculate average sales for each month and identify the best-selling month.

```sql
SELECT
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sale
FROM retail_sales
GROUP BY year, month
ORDER BY avg_sale DESC;
```

---

## 8. Top 5 Customers by Sales

Find customers with the highest total sales.

```sql
SELECT
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```

---

## 9. Unique Customers by Category

Find the number of unique customers for each category.

```sql
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;
```

---

## 10. Sales Shift Analysis

Categorize orders into Morning, Afternoon, and Evening shifts.

```sql
WITH hourly_sale AS (
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift
FROM retail_sales
)
SELECT
    shift,
    COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;
```

---

# Key Insights

* Clothing and Beauty categories generated significant sales.
* Customer purchasing behavior varies across product categories.
* High-value transactions can be identified for premium customer analysis.
* Sales patterns differ based on time shifts.
* Monthly analysis helps identify peak sales periods.

---

# Learning Outcomes

Through this project, the following SQL concepts were practiced:

* Database creation
* Table creation
* Data cleaning
* Aggregate functions
* GROUP BY and ORDER BY
* Filtering using WHERE clause
* Common Table Expressions (CTEs)
* Date and time functions
* Business data analysis

---

# Future Improvements

Possible future enhancements:

* Add Power BI dashboard integration
* Create advanced sales KPIs
* Add stored procedures and views
* Build interactive visualizations
* Perform predictive sales analysis using Python

---

# Conclusion

This Retail Sales SQL Project demonstrates practical SQL skills used in real-world data analytics. The project covers database management, data exploration, cleaning, and business insight generation using SQL queries.

It is a strong beginner-friendly project for showcasing SQL and data analytics skills in portfolios, resumes, and GitHub profiles.
