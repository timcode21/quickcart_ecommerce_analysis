# i created a schema, named the analysis for the SQL proj
-- next is to create the tables
CREATE TABLE orders (
order_id INT PRIMARY KEY,
order_date DATE,
customer_city VARCHAR(50),
product_id INT,
quantity INT,
unit_price DECIMAL(10,2),
order_status VARCHAR(20),
delivery_date DATE
);

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50),
supplier VARCHAR(50)
);

CREATE TABLE inventory (
product_id INT PRIMARY KEY,
`month` DATE,
stock_received INT,
stock_sold INT
);

-- import the tables into the schema

# next is checking the number of rows if they match 
select count(*)
from inventory;

select count(*)
from products;

select count(*)
from orders;

-- i noticed that, one of the tables is not complete, so i dropped to import it again
DROP TABLE orders;

-- for the whole rows to be imported, i changed the column feature from integer to support texts
CREATE TABLE orders (
order_id INT,
order_date DATE,
customer_city VARCHAR(50),
product_id INT,
quantity INT,
unit_price DECIMAL(10,2),
order_status VARCHAR(20),
delivery_date  VARCHAR(20)
);

select count(*)
from orders;
# it all completely imported and ready to go

select *
from orders;