.echo on
.headers on

--Name: Nijii Daniels
--File: TSQL Lab 1
--Date: July 2, 2020


create table Family (
Name text,
Age int,
Height float,
Cook bool,
Sex text,
Role text);

insert into Family values ("Joesph Daniels", 51, 5.6, 1, "M", "Father");
insert into Family values ("Selena Mapp", 48, 5.4, 1, "F", "Mother");
insert into Family values ("Nijii Daniels", 27, 6, 1, "M", "Oldest Child");
insert into Family values ("Jamil Daniels", 22, 5.11, 0, "M", "Middle Child");
insert into Family values ("Shakira Daniels", 15, 5.5, 0, "F", "Youngest Child");

select * from Family
select * from Family where Age > 30
select * from Family where Height > 5.6
Select * from Family where Sex = "F"
select * from Family where Cook is true