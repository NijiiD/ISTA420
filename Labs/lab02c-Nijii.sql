.echo on
.headers on

--Name: Nijii Daniels
--File: lab02c-Nijii.sql
--Date: July 15, 2020

-- 1. List the employee IDs with the number of sales by each employee from most sales to least. I want to
-- recognize the employees with the most sales.
select employeeid, count(orderid) as order_count from orders group by employeeid order by count(orderid) desc;

-- 2. I want to look at the average discounts taken by all customers for products that cost more than $50.00.
-- Specifically, I want to know the average discount of all orders for each product from the highest price
-- to the lowest price.
select productid, avg(discount) as avg_discount from order_details where unitprice > 50 group by productid order by avg_discount desc limit 10;

-- 3. I am doing an analysis of which shippers ship to each country, and I need a report showing the number
-- of orders each shipper delivered to each country and the nuber of orders. I don't need the data where
-- the number of orders is ten or less, but I need the report listed by country and the number of orders
-- shipped to that country.
select count(orderid) order_count, shipcountry, shipperid from orders group by shipperid, shipcountry having count(orderid) > 10 order by shipcountry, order_count desc;

-- 4. For each order, what was the time lag between the order date and the ship date?
select orderdate, shippeddate, julianday(shippeddate)-julianday(orderdate) as lag from orders order by lag desc;

-- 5. Continuing with the previous query, I need the average time lag for each shipper.
select orderdate, shippeddate, avg(julianday(shippeddate)-julianday(orderdate)) as avg_lag from orders group by shipperid order by avg_lag desc;

-- 6. I am doing inventory, and I need to know the total price of each product on hand, that is, the price of
-- each product line, sorted alphabetically by product name.
select productid, productname, unitprice*unitsinstock as total_price from products order by productname;

-- 7. What is the dollar total we have tied up in inventory?
select sum(unitprice*unitsinstock) as total from products;