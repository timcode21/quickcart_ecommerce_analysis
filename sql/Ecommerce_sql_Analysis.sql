SELECT *
FROM orders
LIMIT 10;

-- exploring for problems and getting a feel of the data 
SELECT 
order_status,
COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

select *
from orders;

select *
from products;

-- calculating the realized revenue
SELECT order_status, SUM(quantity * unit_price) as revenue
FROM orders
WHERE order_status = "Delivered";

-- Total orders 
SELECT COUNT(*) AS total_orders
FROM orders;

-- trying to know the cities with the most orders 
SELECT 
customer_city,
COUNT(*) AS total_orders
FROM orders
GROUP BY customer_city
ORDER BY total_orders DESC;

-- knowing which products sell the most or have the most orders 
SELECT 
product_id,
COUNT(*) AS total_orders
FROM orders
GROUP BY product_id
ORDER BY total_orders DESC;

select *
from orders;

# going into the analysis proper 
-- looking at cities by revenue
SELECT 
	customer_city,
	COUNT(*) AS total_orders,
	SUM(quantity * unit_price) AS total_revenue
FROM orders
GROUP BY customer_city
ORDER BY total_revenue DESC;

-- Which products generate the most revenue?
SELECT 
	p.product_name,
	p.category,
	COUNT(o.order_id) AS total_orders,
	SUM(o.quantity) AS units_sold,
	SUM(o.quantity * o.unit_price) AS revenue
FROM orders as o
JOIN products as p
ON o.product_id = p.product_id
GROUP BY p.product_name, p.category
ORDER BY revenue DESC;

-- checking the format of date written yyyy-mm-dd
SELECT DISTINCT order_date
FROM orders
LIMIT 10;

SELECT DISTINCT delivery_date
FROM orders
WHERE delivery_date IS NOT NULL
LIMIT 10;

-- change the data type of the delivery_date column
ALTER TABLE orders
MODIFY delivery_date DATE;

DESCRIBE orders;

SELECT COUNT(*)
FROM orders
WHERE delivery_date IS NULL;

SELECT *,
	DATEDIFF(delivery_date, order_date) AS delivery_days
FROM orders
WHERE delivery_date IS NOT NULL
ORDER BY delivery_days DESC; -- the days taken to deliver the product 

SELECT
	AVG(DATEDIFF(delivery_date, order_date)) AS avg_delivery_days
FROM orders
WHERE delivery_date IS NOT NULL; -- avg number for delivery days 

SELECT
	DATEDIFF(delivery_date, order_date) AS delivery_days,
	COUNT(*) AS number_of_orders
FROM orders
WHERE delivery_date IS NOT NULL
GROUP BY delivery_days
ORDER BY delivery_days; -- delivery time order distribution

SELECT
	customer_city,
	AVG(DATEDIFF(delivery_date, order_date)) AS avg_delivery_days
FROM orders
WHERE delivery_date IS NOT NULL
GROUP BY customer_city
ORDER BY avg_delivery_days DESC; -- avereage delivery days for each customer location 

SELECT
	order_status,
	COUNT(*) AS total_orders
FROM orders
GROUP BY order_status; -- total number of orders either delivered or cancelled 

SELECT 
	p.product_name,
	COUNT(*) AS cancelled_orders
FROM orders o
JOIN products p
ON o.product_id = p.product_id
WHERE o.order_status = 'Cancelled'
GROUP BY p.product_name
ORDER BY cancelled_orders DESC; -- knowing the total number of orders cancelled for each product

SELECT 
p.product_name,
COUNT(*) AS total_orders,
SUM(CASE WHEN o.order_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
ROUND(
SUM(CASE WHEN o.order_status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
2
) AS cancellation_rate
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY cancellation_rate DESC; -- understanding the percentage cancellation rate for each products 

SELECT 
	order_status,
	AVG(DATEDIFF(delivery_date, order_date)) AS avg_delivery_days
FROM orders
WHERE delivery_date IS NOT NULL
GROUP BY order_status; -- checked for the average number of delivery days for delivered products 

SELECT 
	DATE_FORMAT(order_date, '%Y-%m') AS month,
	COUNT(order_id) AS total_orders,
	SUM(quantity * unit_price) AS revenue
FROM orders
WHERE order_status = 'Delivered'
GROUP BY month
ORDER BY month; -- looking at the monthly sales trend 



# i want to go next into the power bi visual dashboarding 
-- so first, i run a query to create a table that has all the necessary information columns
SELECT
	o.order_id,
	o.order_date,
	DATE_FORMAT(o.order_date,'%Y-%m') AS order_month,
	o.customer_city,
	o.product_id,
	p.product_name,
	p.category,
	o.quantity,
	o.unit_price,
	(o.quantity * o.unit_price) AS revenue,
	o.order_status,
	o.delivery_date,
	DATEDIFF(o.delivery_date, o.order_date) AS delivery_days
FROM orders o
JOIN products p
ON o.product_id = p.product_id;


SELECT
	o.order_id,
	o.order_date,
	DATE_FORMAT(o.order_date,'%Y-%m') AS order_month,
	o.customer_city,
	o.product_id,
	p.product_name,
	p.category,
	o.quantity,
	(o.unit_price * 1000) AS unit_price,
	(o.quantity * o.unit_price * 1000) AS revenue,
	o.order_status,
	o.delivery_date,
	DATEDIFF(o.delivery_date, o.order_date) AS delivery_days
FROM orders o
JOIN products p
ON o.product_id = p.product_id;

