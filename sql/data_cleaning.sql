SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT order_id) AS unique_orders
FROM orders; -- i want to check for duplicates in the order_id column in the orders table

SELECT
COUNT(*) AS missing_delivery_dates
FROM orders
WHERE delivery_date = ''; -- looking out for total blanks noticed in the table

SELECT 
order_id,
COUNT(*) AS occurrences
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1; -- checking for which value(s) in the column is repeated or a duplicate row
					-- order_id: 47, 14, 17, 19, 28, 31, 33, 45,49
                    
-- checked the order ids one by one to see if the whole rows are a duplicate of just this column row
SELECT *
FROM orders
WHERE order_id = 49;

-- i noticed that the duplicates found in the order id column have different information 
-- so, i generated another column which contains a unique identifier for each row in the table, that means, i am altering the table 
ALTER TABLE orders
ADD COLUMN order_record_id INT AUTO_INCREMENT PRIMARY KEY;

select *
from orders; -- new column has been added, so i can make use of that
# i did not delete the original column as that would just be a reference point 


# i noticed that, some products were delivered but have no delivery_date
SELECT COUNT(*)
FROM orders
WHERE order_status = 'Delivered'
AND delivery_date = ''; -- to know the exact number( will come back later to it)

select *
from orders
where order_status = 'Delivered' and delivery_date = ''
;

# standardization check
select distinct(customer_city)
from orders;

select *
from orders;

select *
from products;

SELECT DISTINCT supplier
FROM products; -- standardization not needed 

SELECT category
FROM products;

SELECT DISTINCT category
FROM products;

# back to the blank delivery date for the delivered order status
SELECT *
FROM orders
WHERE order_status = 'Delivered'
AND delivery_date = '';

-- fixing the data quality issue by adding a value to the rows
UPDATE orders
SET delivery_date = NULL
WHERE delivery_date = '';

SELECT *
FROM orders
WHERE order_status = 'Delivered';

#standardization 
UPDATE products
SET category = 'Home Appliance'
WHERE category IN ('home appliance','Home appliances');

UPDATE products
SET category = 'Electronics'
WHERE category IN ('electronics');

UPDATE products
SET category = 'Kitchen'
WHERE category IN ('kitchen');

# standardization done and complete
SELECT DISTINCT category
FROM products;

SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT category) AS unique_category
FROM products;

SELECT category,
	COUNT(*) AS total_carts
FROM products
GROUP BY category;

