-- Name: Nijii Daniels
-- File: TSQL Exercise 06
-- Date: August 9, 2020

create Database ISTAEX06;
use ISTAEX06;

Drop Table if exists Customers;
Create Table Customers
(
customerNumber varchar (50) 
CONSTRAINT PK_CustNum Primary Key,
customerName varchar (50),
contactLastName varchar (50),
contactFirstName varchar (50),
phone varchar (50),
addressLine1 varchar (50),
addressLine2 varchar (50),
city varchar (50),
state1 varchar (50),
postalCode varchar (50),
country varchar (50),
salesRepEmployeeNumber varchar (50),
creditLimit varchar (50)
);

Bulk insert Customers from 'C:\Users\User\Desktop\Customers.txt'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

use ISTAEX06;

Drop Table if exists Employees;
Create Table Employees
(
employeeNumber varchar (50) 
CONSTRAINT PK_Empid Primary Key,
lastName varchar (50),
firstName varchar (50),
extension varchar (50),
email varchar (50),
officeCode varchar (50),
reportsTo varchar (50),
jobTitle varchar (50),

);

Bulk insert Employees from 'C:\Users\User\Desktop\Employees.txt'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

use ISTAEX06;

Drop Table if exists Offices;
Create Table Offices
(
officeCode varchar (50) 
CONSTRAINT PK_OffCode Primary Key,
city varchar (50),
phone varchar (50),
addressLine1 varchar (50),
addressLine2 varchar (50),
state1 varchar (50),
country varchar (50),
postalCode varchar (50),
territory varchar (50)
);

Bulk insert Offices from 'C:\Users\User\Desktop\Offices.txt'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

use ISTAEX06;

Drop Table if exists OrderDetails;
Create Table OrderDetails
(
orderNumber varchar (500) 
CONSTRAINT FK_OrdNum Foreign Key REFERENCES Orders(orderNumber),
productCode varchar (500)
CONSTRAINT FK_ProCode Foreign Key REFERENCES Products(productCode) null,
quantityOrdered varchar (50),
priceEach int,
orderLineNumber varchar (50)
);

Bulk insert OrderDetails from 'C:\Users\User\Desktop\OrderDetails.txt'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

use ISTAEX06;

Drop Table if exists Orders;
Create Table Orders
(
orderNumber varchar (500)
CONSTRAINT PK_OrdNum Primary Key,
orderDate varchar (500),
requiredDate varchar (500),
shippedDate varchar (500),
status1 varchar (500),
comments varchar (500),
customerNumber varchar (500),
);

Bulk insert Orders from 'C:\Users\User\Desktop\Orders.txt'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

use ISTAEX06;

Drop Table if exists Payments;
Create Table Payments
(
customerNumber varchar (50) 
CONSTRAINT FK_CustNum Foreign Key REFERENCES Customers(customerNumber),
checkNumber varchar (50)
CONSTRAINT PK_CheckNum Primary Key,
paymentDate date,
amount varchar (50)
);

Bulk insert Payments from 'C:\Users\User\Desktop\Payments.txt'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

use ISTAEX06;

Drop Table if exists ProductLines;
Create Table ProductLines
(
productLine varchar (50) 
CONSTRAINT PK_ProLine Primary Key,
textDescription varchar (500),
htmlDescription varchar (500),
image1 varchar (500)
);

Bulk insert ProductLines from 'C:\Users\User\Desktop\ProductLines.txt'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');


Drop Table if exists Products;
Create Table Products
(
productCode varchar (500) 
CONSTRAINT PK_ProCode Primary Key,
productName varchar (500),
productLine varchar (500),
productScale varchar (500),
productVendor varchar (500),
productDescription varchar (500),
quantityInStock varchar(500),
buyPrice varchar (500),
MSRP varchar (500),
);

Bulk insert Products from 'C:\Users\User\Desktop\Products.txt'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

use ISTAEX06
--a
select distinct productLine from Products where productLine like 'Clas%'

--b
select customerName,city from Customers where salesRepEmployeeNumber like 'null'

--c
select CONCAT(firstName, ' ', lastName) as Executives from Employees where jobTitle like 'VP%' AND 'Manager'

--d
select orderNumber, orderLineNumber, priceEach from OrderDetails where priceEach > 5000

--e
select CONCAT(contactFirstName, ' ', contactLastName) as AccRep from Customers

--f
select distinct c.customerNumber, customerName, p.amount, p.paymentDate from Customers c 
join Payments p on c.customerNumber = p.customerNumber where c.customerNumber = 103

--g
select c.customerNumber, customerName, p.amount, p.paymentDate from Customers c 
join Payments p on c.customerNumber = p.customerNumber where c.customerNumber = 103 
group by c.customerNumber, c.customerName, 
p.amount, p.paymentDate order by c.customerNumber

--h
select orderNumber from Orders where status1 not like 'Shipped'

--i
select distinct c.customerNumber, customerName, p.amount, p.paymentDate from Customers c 
join Payments p on c.customerNumber = p.customerNumber

--j
select orderNumber, orderDate from Orders order by orderDate

--k
select p.productCode, p.productName from Products

