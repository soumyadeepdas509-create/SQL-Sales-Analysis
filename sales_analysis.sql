-- Sales Analysis Project

CREATE DATABASE sales_analysis;

USE sales_analysis;


-- Create sales table

CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(100),
    product VARCHAR(100),
    category VARCHAR(50),
    region VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);


-- Add sales data

INSERT INTO sales
(order_id, order_date, customer_name, product, category, region, quantity, price)
VALUES
(1, '2026-01-05', 'Rahul', 'Laptop', 'Electronics', 'East', 1, 55000),
(2, '2026-01-08', 'Amit', 'Mouse', 'Electronics', 'West', 3, 800),
(3, '2026-01-12', 'Priya', 'Keyboard', 'Electronics', 'East', 2, 1500),
(4, '2026-01-15', 'Sneha', 'Office Chair', 'Furniture', 'North', 1, 7000),
(5, '2026-02-02', 'Rahul', 'Monitor', 'Electronics', 'East', 1, 12000),
(6, '2026-02-10', 'Amit', 'Desk', 'Furniture', 'West', 1, 9000),
(7, '2026-02-14', 'Priya', 'Mouse', 'Electronics', 'East', 2, 800),
(8, '2026-02-20', 'Sneha', 'Laptop', 'Electronics', 'North', 1, 60000),
(9, '2026-03-03', 'Rahul', 'Keyboard', 'Electronics', 'East', 3, 1500),
(10, '2026-03-08', 'Amit', 'Office Chair', 'Furniture', 'West', 2, 7000),
(11, '2026-03-15', 'Priya', 'Monitor', 'Electronics', 'East', 2, 12000),
(12, '2026-03-20', 'Sneha', 'Desk', 'Furniture', 'North', 1, 9000);


-- 1. View all sales

SELECT *
FROM sales;


-- 2. Sales from East region

SELECT *
FROM sales
WHERE region = 'East';


-- 3. Products sorted by price

SELECT product, price
FROM sales
ORDER BY price DESC;


-- 4. Calculate revenue for each order

SELECT
    order_id,
    product,
    quantity,
    price,
    quantity * price AS revenue
FROM sales;


-- 5. Overall sales summary

SELECT
    SUM(quantity * price) AS total_revenue,
    AVG(price) AS average_price,
    MAX(price) AS highest_price,
    MIN(price) AS lowest_price,
    COUNT(*) AS total_orders
FROM sales;


-- 6. Revenue by region

SELECT
    region,
    SUM(quantity * price) AS revenue
FROM sales
GROUP BY region
ORDER BY revenue DESC;


-- 7. Products with revenue above 10000

SELECT
    product,
    SUM(quantity * price) AS revenue
FROM sales
GROUP BY product
HAVING SUM(quantity * price) > 10000
ORDER BY revenue DESC;


-- 8. Classify orders based on revenue

SELECT
    order_id,
    product,
    quantity * price AS revenue,
    CASE
        WHEN quantity * price >= 20000 THEN 'High'
        WHEN quantity * price >= 5000 THEN 'Medium'
        ELSE 'Low'
    END AS sales_level
FROM sales;


-- 9. Monthly revenue

SELECT
    MONTH(order_date) AS month,
    SUM(quantity * price) AS revenue
FROM sales
GROUP BY MONTH(order_date)
ORDER BY month;


-- 10. Revenue by category

SELECT
    category,
    SUM(quantity * price) AS revenue
FROM sales
GROUP BY category
ORDER BY revenue DESC;