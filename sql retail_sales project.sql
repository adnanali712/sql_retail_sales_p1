-- Retail sales project --
CREATE DATABASE PROJECT1;

USE PROJECT1;

CREATE TABLE RETAIL_SALES(
  transactions_id INT primary KEY,
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


SELECT * FROM RETAIL_SALES;

SELECT COUNT(*) FROM RETAIL_SALES;


SET SQL_SAFE_UPDATES = 0;

-- checking the null values 

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
   

   
-- data exploration 

-- how many sales we have ?

select COUNT(*) AS TOTAL_SALE FROM retail_sales;

-- how many distinct customer we have ?

select count(distinct customer_id) as total_sale from retail_sales;

-- how many type of  category?

select distinct category from retail_sales;

-- DATA ANALYSIS KEY PROBLEM AND SOLUTIONS

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
 
 
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT *
FROM RETAIL_SALES
WHERE SALE_DATE = '2022-11-05'; 

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022

SELECT *
FROM RETAIL_SALES
WHERE CATEGORY = 'Clothing'
    and quantiy >=3
    and date_format(sale_date , 'yyyy-mm' ) = '2022-11';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select 
category,
sum(total_sale)
from retail_sales
group by category;


-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select 
category,
avg(age)
from retail_sales
group by category
having category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

select * from retail_sales
where total_sale >=1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT 
    category,
    gender,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category, gender;



-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.


SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category



-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift

-- End of project






