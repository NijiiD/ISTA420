-- Name: Nijii Daniels
-- File: TSQL Exercise 05
-- Date: August 02, 2020

-- 1. Create an appropriate table schema.
-- 2. Insert the CSV data into the table you just created.

Drop TABLE IF EXISTS dbo.pres

Create table dbo.pres

(ID varchar(20),
LastName varchar(50),
FirstName varchar(50), 
MiddleName varchar(50),
OrderofPres varchar(50), 
DOB varchar(50), 
DeathDate varchar(50),
BirthPlace varchar(50), 
BirthState varchar(50),
HomeState varchar(50), 
Party varchar(50),
DateTookOffice varchar(50),
DateLeftOffice varchar(50), 
AssassinationAtt varchar(50),
Assassinated varchar(50),
Religion varchar(50),
ImageP varchar(50));

Bulk insert dbo.pres from 'C:\Users\User\Desktop\Quantico06\ISTA420\Pres.txt'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

-- 3. Delete the column that contains the path to the images.
Alter Table dbo.pres drop column ImageP;

-- 4. Delete the first record from your table using the output clause. This is the header.
Alter Table dbo.pres add constraint IDC unique (IDC)

-- 5. Bring the data up to date by updating the last row. Use the output clause.
Update dbo.pres set DateLeftOffice = '1/20/2017' where FirstName = 'Barack';

-- 6. Bring the data up to date by adding a new row. Use the output clause.
Insert into dbo.pres (ID, LastName, FirstName, MiddleName, OrderofPres, DOB,
DeathDate, BirthPlace, BirthState, HomeState, Party, DateTookOffice, DateLeftOffice,
AssassinationAtt, Assassinated, Religion) values (45, 'Trump', 'Donald', 'John', 45, '6/14/1946',
Null, 'Queens', 'New York', 'New York', 'Republican', '1/20/2017', Null, Null, Null, 'Presbyterian');

-- 7. How many presidents from each state belonged to the various political parties? Aggregate by party
-- and state. Note that this will in effect be a pivot table.



-- 8. Create a report showing the number of days each president was in office.

select DATEDIFF('DateLeftOffice' - 'DateTookOffice') as DateDiff1 from dbo.pres

-- 9. Create a report showing the age (in years) of each present when he took office.

-- 10. See if there is any correlation between a president's party and reported religion, or lack of reported
-- religion.
