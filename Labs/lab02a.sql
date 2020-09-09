.echo on
.headers on

--Name: Nijii Daniels
--File: lab02a
--Date: July 8, 2020

-- 1. What are the regions?
select * from region;

-- 2. What are the cities?
select territoryid, territorydescription from territories;

-- 3. What are cites in the Southern region?
select * from territories where regionid = 4;

-- 4. How do you run this query with a fully qualified column name?
select territories.territoryid, territories.territorydescription, territories.regionid from territories where regionid = 4;

-- 5. How do you run this query with table alias?
select t.territoryid, t.territorydescription, t.regionid from territories t where regionid = 4;

-- 6. What is the contact name, telephone number, and city for each customer?
select c.customerid, c.companyname, c.contactname, c.city, c.phone from customers c;

-- 7. What are the products currently out of stock?
select p.productid, p.productname, p.unitsinstock from products p where p.unitsinstock = 0;

-- 8. What are the ten products currently in stock with the least amount on hand?
select p.productid, p.productname, p.unitsinstock from products p order by p.unitsinstock > 0 limit 10;

-- 9. What are the five most expensive products in stock?
select p.productid, p.productname, p.unitprice from products p order by p.unitprice desc limit 5;

-- 10. How many products does Northwind have? How many customers? How many suppliers?
select count(*) from products;

select count(*) from customers;

select count(*) from suppliers;

