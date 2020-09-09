.echo on
.headers on

--Name: Nijii Daniels
--File: TSQL-EX02
--Date: July 10, 2020

--1. List the company name, the contact name and the country of all customers in Poland.
select companyname, contactname, country from customers where country like "Poland";

--2. List the order Id, the order date, and the destination city of all orders shipped to Berlin.
select orderid, orderdate, shipcity from orders where shipcity like "berlin";

--3. How many boxes of Filo Mix do we have in stock?
select productid, productname, unitsinstock from products where productname like "Filo Mix";

--4. List the telephone numbers of all of our shippers.
select shipperid, phone from shippers;

--5. Who is our oldest employee? Who is our youngest employee?
select firstname, min(birthdate) from employees;
select firstname, max(birthdate) from employees;

--6. List the suppliers where the owner of the supplier is also the sales contact.
select supplierid, contactname, contacttitle from suppliers where contacttitle like "Sales%";

--7. Mailing Labels
--From the Northwind database we used in class and SQLite, create mailing labels for customer represen-
--tatives. Each label should consist of six, and exactly six, lines. The mailing labels should be suitable
--for printing on sticky label paper, specically Avery 8160 labels. The format should be as follows:
--TITLE FIRSTNAME LASTNAME
--COMPANYNAME
--STREET ADDRESS
--CITY STATE ZIP COUNTRY
--[blank line]
--[blank line];

select contacttitle || ", " || contactname || "
" || companyname || "
" || address || "
" ||city, region, postalcode, country
from customers;


--8. Telephone Book
--From the Northwind database we used in class and SQLite, create a telephone book for customer repre-
--sentatives. Each line in the telehone book should consist of the representative last name, representative
--First name, company name, and telephone number. Each row should look like this.
--Lastname, Firstname Middlename [tab] Company name [tab] phone number

select substr(contactname, instr(contactname, " ")) || " , " || substr(contactname, 1, instr(contactname, " ") + 1) ||'		'|| companyname ||'     '|| phone from customers;