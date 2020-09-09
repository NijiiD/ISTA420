
.echo on
.headers on

--Name: Nijii Daniels
--File: TSQL Quiz 1
--Date: July 2, 2020
 
 drop table if exists VideoGames
 
 
create table VideoGames(
 DiscNum int primary key not null,
 YearReleased int,
 TimePlayed float,
 Name text,
 Difficulty text
 );



insert into VideoGames values (11, 2020, 300, "Call of Duty", "E");
insert into VideoGames values (10, 2009, 3.4, "Minecraft", "E");
insert into VideoGames values (9, 2007, 203.4, "Halo", "M");
insert into VideoGames values (8, 2008, 154.7, "Gears of War 2", "M");
insert into VideoGames values (7, 1996, 50, "Super Mario 64", "E");
insert into VideoGames values (6, 2020, 80.5, "DragonballZ: Kakarot", "M");
insert into VideoGames values (5, 2004, 29.5, "Ninja Gaiden 2", "H");
insert into VideoGames values (4, 2014, 60, "Dark Souls 2", "H");
insert into VideoGames values (3, 2002, 102, "Kingdom Hearts", "M");
insert into VideoGames values (2, 1999, 30, "Silent Hill", "H");
insert into VideoGames values (1, 1997, 60, "MegaMan Legends", "H");

.print

select * from VideoGames
select * from VideoGames where YearReleased BETWEEN 1996 AND 2005
select * from VideoGames where TimePlayed > 75
select DiscNum, Name from VideoGames where Difficulty = "H"
select * from VideoGames where DiscNum > 10 / 5