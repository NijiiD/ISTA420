.echo on
.headers on

--Name: Nijii Daniels
--File: TSQL EX03
--Date: July 18, 2020

-- 1. Using SQLite and the Northwind database, create a line item report that contains a line for each
-- product in the order with the following columns: the order id, the product id, the unit price, the
-- quantity sold, the line item price, and the percent of that line item constitutes of the total amount of
-- the order.

select od.orderid, od.productid, od.unitprice, od.quantity, (od.unitprice * od.quantity) as linetotal from 
order_details od inner join products p on od.productid = p.productid limit 25;

-- 2. I want to know the unique (distinct) cities, regions, and postal codes: (a) where we have both customers
-- and employees, (b) where we have customers but no employees AND both customers and employees,
-- and (c) where we have employees but no customers AND both customers and employees. Write three
-- queries, using inner and outer joins. Report the results of the queries. There is no need for any further
-- reporting.

select distinct e.city, e.region, e.postalcode from employees e cross join customers;

--

select distinct c.city, c.region, c.postalcode from customers c left join employees e on e.city = c.city;

--

select distinct e.city, e.region, e.postalcode from employees e left join customers c on e.city = c.city;