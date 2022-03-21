-- THIS SCRIPT IS BASED ON COLT STEELE' S UDEMY BOOTCAMP

-- SHOW ALL THE DATABASES
-- show databases;

-- CREATE A NEW DATABASE
-- create database testing_db;

-- DELETE THE EXISTING DATABASE
-- drop database testing_db;

-- USE DATABASE
-- use testing_db;

-- TO KNOW WHAT DATABASE WE ARE USING
-- select database();

-- GET DIVE INTO TABLES

-- DATATYPES

-- NUMERIC TYPES
-- int, smallint, tinyint, mediumint, bigint, decimal, numeric, float, double, bit

-- STRING TYPES
-- char, varchar, binary, varbinary, blob, tinyblob, mediumblob, longblob, text, tinytext, mediumtext, longtext, enum

-- DATE TYPES
-- date, datatime, timestamp, time, year


-- CREATE A TABLE

-- create table cats (
--	name varchar(50) not null,
--	breed varchar(20),
--	age int
-- );

-- GET THE DESCRIPTION ABOUT THE TABLE
-- desc cats;
-- show columns from cats;

-- CHALLANGE
-- create table pastries
--   (
--     name varchar(100),
--     quantity int
--   );

-- desc pastries;
-- drop table pastries;

-- INSERT DATA INTO TABLES

-- INSERT A SINGLE ROW OF DATA
-- insert into cats (name, breed, age) 
-- values ("Blue", "Ragdol", 7);

-- when putting data into table the order of column does matter
-- insert into cats (name, age)
-- values 
-- 	('Britney', 2);

-- MULTIPLE INSERT
-- insert into cats (name, breed, age)
-- values
-- 	("Victoria", "Persian", 2),
-- 	("David", "Siamese", 5),
-- 	("Velu", "Persian", 1);
 
 -- CHALLANGE
--  create table people (
-- 	fname varchar(20), 
--     lname varchar(20),
--     age int );
    
-- insert into people (fname, lname, age)
-- values 
-- 	('Saheen', 'Ahamed', 26),
--     ('Will', 'Smith', 50),
--     ('Joseph', 'Vijay', 45),
--     ('Ajith', 'Kumar', 47);

-- NOTE ON WARNING
-- if your query responses have warning, you can see the warnings by..
-- show warnings;

-- NULL AND NOT-NULL
-- in the SQL content NULL means the value is not known
-- ** keep in mind that NULL is not equal to zero

-- SPECIFY THE DEFAULT VALUES
-- create table cats2(
-- 	name varchar(20) default 'unnamed',
--     age int default 1);
-- desc cats2;
-- drop table cats2;

-- KEYS
-- PRIMARY KEYS - A UNIQUE IDENTIFIER
-- create table unique_cats (
-- 	cat_id int not null, 
--     name varchar(20),
--     age int,
--     primary key (cat_id));
-- desc unique_cats;

-- insert into unique_cats 
-- 	(cat_id, name, age)
--     values (1, "Briteny", 2);
    
-- insert into unique_cats
-- 	(cat_id, name, age)
--     values (2, "Louise", 3);

-- insert into unique_cats
-- 	(cat_id, name, age)
--     values 
-- 		(3, "James", 7),
--         (4, "Velu", 1);

-- select *
-- from unique_cats;

-- when you use a number as a primary key, you can use AUTO_INCREMENT
-- create table unique_cats2(
-- 	cat_id int not null auto_increment,
--     name varchar(20),
--     age int,
--     primary key (cat_id));

-- CHALLANGE
-- create table employees (
-- 	id int auto_increment not null primary key,
--     first_name varchar(50) not null,
--     last_name varchar(50) not null,
--     middle_name varchar(50),
--     age int not null,
--     current_status varchar(20) not null default "employed");

-- show columns from employees;

-- CRUD - Create, Read, Update, Delete
-- CREATE
-- create table cats (
-- 	id int auto_increment not null primary key,
--     name varchar(255),
--     breed varchar(255),
--     age int);

-- insert into cats (name, breed, age)
-- values
-- 	('Ringo', 'Tabby', 4),
--     ('Cindy', 'Maine Coon', 10),
--     ('Dubledore', 'Maine Coon', 11),
--     ('Egg', 'Persian', 4),
--     ('Misty', 'Tabby', 13),
--     ('George Micheal', 'Ragdoll', 9),
--     ('Jackson', 'Sphynx', 7);
    
-- READ
-- SELECT COLUMNS

-- ALL COLUMNS
-- select * from cats;

-- SPECIFIC COLUMNS
-- select name, breed from cats;

-- THE ORDER MAY CHANGE
-- select breed, id, age, name 
-- from cats;

-- WHERE
-- CONDITIONAL SELECT 
-- select *
-- from cats
-- where age = 4;  

-- select *
-- from cats
-- where 
-- 	breed = "persian" or age = 4

-- CHALLANGE
-- select id, age
-- from cats
-- where 
-- 	id = age;

-- UPDATE 
-- update cats 
-- set name="Dumbledore"
-- where name = "Dubledore";

-- update cats
-- set age = 14
-- where name = "misty";

-- CHALLANGE
-- update cats
-- set name="Jack"
-- where name = "Jackson";

-- update cats
-- set breed = "British Shorthair"
-- where breed = "Tabby" and name = "Ringo";

-- DELETE
-- DELETE A ROW
-- delete from cats where name="egg";

-- DELETE ALL CATS
-- delete from cats;

-- CONDITIONAL DELETE - (DELETE MULIPLE ROW SETS)
-- delete from cats
-- where age > 4;

-- CHALLANGE ON CRUD
-- create database shirts_db;

-- use shirts_db;

-- create table shirts (
-- 	shirt_id int auto_increment not null primary key,
--     article varchar(50) not null,
-- 	color varchar(50) not null, 
--     shirt_size varchar(2) not null, 
--     last_worn int not null);
    
-- insert into shirts (article, color, shirt_size, last_worn) 
-- values 
-- 	('t-shirt', 'white', 'S', 10),
--     ('t-shirt', 'green', 'S', 200),
--     ('polo shirt', 'black', 'M', 10), 
--     ('tank top', 'blue', 'S', 50),
--     ('t-shirt', 'pink', 'S', 0),
-- 	('polo shirt', 'red', 'M', 5),
--     ('tank top', 'white', 'S', 200),
--     ('tank top', 'blue', 'M', 15);
    
-- insert into shirts (article, color, shirt_size, last_worn)
-- values ('t-shirt', 'blue', 'L', 4);

-- select article, color 
-- from shirts;

-- select * from shirts where shirt_size = "M";

-- update shirts
-- set shirt_size= "L";

-- select * from shirts
-- where article= "polo shirt";

-- update shirts
-- set last_worn = 0
-- where last_worn <= 15;

-- update shirts
-- set shirt_size = "XS", color = "off white"
-- where color = "white";

-- select * from shirts;
   
-- delete from shirts
-- where last_worn >= 200;

-- delete from shirts 
-- where article = "tank top";

-- delete from shirts;

-- drop table shirts;

-- RUNNING SQL FROM FILE
-- CREATE books TABLE 
-- source book_data.sql;

-- MYSQL STRING FUNCTIONS
-- CONCATANATE
-- select concat(author_fname," ",author_lname) as name
-- from books;

-- CONCAT_WS -- CONCAT WITH SEPERATOR

-- select concat_ws("-", title, author_fname, author_lname) from books;    

-- SUBSTRING/SUBSTR
-- select substring("hello world", 1, 4); 
-- hell

-- select substring("hello world", 7); 
-- world

-- select substring("hello world", -3);
-- rld

-- select substring(title,1, 10) from books;

-- select concat(substr(title, 1, 10), "...") as short_title 
-- from books;

-- INLINE VIEW

-- select concat(short_title, "...")
-- from 
-- 	(select substr(title, 1, 10) as short_title from books) as X;

-- REPALCE

-- select replace("hello world", "l", '7');
-- select replace("hello world", "hell", ###);
-- select replace("hellO world", "O", "0");
-- select replace("cheese bread coffee milk", " ", " and "); 
-- select replace(title, "e",  "3") from books; 
  
-- REVERSE

-- select reverse('hello world');

-- CHAR_LENGTH

-- select char_length('hello world');

-- select concat(author_lname, ' is ', char_length(author_lname), ' character long') as text
-- from books;

-- UPPER AND LOWER

-- select upper('hello world');
-- select lower('HEllO WOrld');


-- HINT: beautify sql queries @ https://codebeautify.org/sqlformatter

-- CHALLANGE

-- select 
--   upper(
--     reverse(
--       "Why does my cat looks at me with such hatred?"
--     )
--   );
  
-- select 
--   replace(title, " ", "-->") 
-- from 
--   books;

-- select 
--   author_lname as forward, 
--   reverse(author_lname) as backward 
-- from 
--   books;

-- select 
--   upper(
--     concat(author_fname, " ", author_lname)
--   ) as 'full name in caps' 
-- from 
--   books;

-- select 
--   concat(
--     title, " was released in ", released_year
--   ) as blurb 
-- from 
--   books;

-- select 
--   title, 
--   char_length(title) as 'character count' 
-- from 
--   books;

-- select 
--   concat(
--     substr(title, 1, 10), 
--     "..."
--   ) as short_title, 
--   concat(author_fname, ",", author_lname) as author, 
--   concat(stock_quantity, " in stock") as quantity 
-- from 
--   books;

-- REFINING SELECTIONS
-- let's insert some new data into books table
-- insert into books (title, author_fname, author_lname, released_year, stock_quantity, pages)
-- values	
-- 		('10% Happier', 'Dan', 'Harris', '2014', 29, 256),
-- 		('fake_book', 'Freida', 'Harris', '2001', 287, 428),
-- 		('Lincoln In The Bardo', 'George', 'Saunders', '2017', 1000, 367);

-- DISTINCT - FILTER DUPLICATES
-- select distinct * from books;

-- select 
-- 	distinct 
-- 		concat(
-- 			author_fname,
-- 			" ", 
--             author_lname
-- 		) as 'Full name'
-- from books; 

 
-- ORDER BY -- SORTING

-- select author_lname
-- from books
-- order by author_lname asc;
-- you don't need to specify asc since, its default

-- select title 
-- from books 
-- order by title desc;

-- select title, pages, released_year
-- from books
-- order by 3 desc;
-- you can specify the column number

-- Note: sql query excecution order:  FROM --> WHERE --> SELECT --> ORDER BY
    
-- SHORT BY MULTIPLE COLUMNS

-- select author_fname, author_lname
-- from books 
-- order by author_lname, author_fname;

-- the order of column matters here

-- LIMIT -- LIMIT THE QUERY RESULTS

-- select title
-- from books 
-- limit 5;

-- select title, released_year 
-- from books
-- order by 2 desc limit 5;

-- SPECIFY STARING POINT AND HOW MANY ROWS TO LIMIT
-- select title, released_year
-- from books
-- order by 2 desc limit 2,5;

-- LIKE -- SEARCHING FOR PATTERN

-- select title, concat(author_fname," ", author_lname) as 'name'
-- from books 
-- where author_fname like 'da%';

-- select title
-- from books
-- where title like '%the%';

-- %, _ are refered as wildcard characters

-- select title, stock_quantity 
-- from books 
-- where stock_quantity like '____'; 

-- "_" use to match the number of charactors 

-- USE ESCAPE CHARACTER (\)

-- select title 
-- from books
-- where title like '%\%%';