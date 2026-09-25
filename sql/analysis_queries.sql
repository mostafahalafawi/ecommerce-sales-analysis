-- E-commerce Sales Analysis Queries
-- Author: Mostafa Halafawi

-- 1. Total Revenue
SELECT 
    SUM(quantity * unit_price) AS total_revenue
FROM sales;

-- 2. Revenue by Month
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(quantity * unit_price) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- 3. Top 10 Products by Revenue
SELECT 
    product_name,
    SUM(quantity * unit_price) AS product_revenue
FROM sales
GROUP BY product_name
ORDER BY product_revenue DESC
LIMIT 10;

-- 4. Revenue by Region
SELECT 
    region,
    SUM(quantity * unit_price) AS region_revenue
FROM sales
GROUP BY region
ORDER BY region_revenue DESC;

-- 5. Average Order Value
SELECT 
    AVG(order_total) AS average_order_value
FROM (
    SELECT order_id, SUM(quantity * unit_price) AS order_total
    FROM sales
    GROUP BY order_id
) AS order_totals;
