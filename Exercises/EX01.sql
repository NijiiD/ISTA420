
.echo on
.headers on

--Name: Nijii Daniels
--File: TSQL EX01
--Date: July 2, 2020
 
 drop table if exists CarnivalPrizes
 
 
create table CarnivalPrizes(
 Ticket int primary key not null,
 ItemNum int
 Weight float,
 ItemName text,
 SpecialPowers VARCHAR2
 );



insert into CarnivalPrizes values (11234, 20, 300, "Lion", "Roars");
insert into CarnivalPrizes values (54610, 29, 45, "Cat", "Meows");
insert into CarnivalPrizes values (78698, 27, 54, "Dog", "Barks");
insert into CarnivalPrizes values (84352, 28, 147, "Hippo", "Yawns");
insert into CarnivalPrizes values (71343, 10, 212, "Shark", "Bites");
insert into CarnivalPrizes values (54526, 45, 3.5, "Bird", "Sings");


.print

select * from CarnivalPrizes
select * from CarnivalPrizes where ItemNum BETWEEN 18 AND 22
select * from CarnivalPrizes where SpecialPowers = "Bites"
select ItemName from CarnivalPrizes where Weight > 100
select * from CarnivalPrizes where ItemName = "Bird"