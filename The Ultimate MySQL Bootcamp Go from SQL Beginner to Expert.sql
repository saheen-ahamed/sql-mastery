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

-- CREATE A TABLE

-- create table cats(
-- 	name varchar(50) not null, 
-- 	breed varchar(20),	
-- 	age int);

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

-- update table name
-- set column = "value"
-- where condition

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

-- Note: sql query excecution order:  FROM --> WHERE --> SELECT --> ORDER BY/ GROUP BY
    
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

-- CHALLANGE

-- select title 
-- from books 
-- where title like '%stories%';

-- select title, pages 
-- from books 
-- order by 2 desc limit 1;

-- select concat(title, " - ", released_year) as summary
-- from books
-- order by released_year desc limit 3;

-- select title, author_lname
-- from books
-- where author_lname like '% %';

-- select title, released_year, stock_quantity
-- from books 
-- order by 3 limit 3;

-- select title, author_lname
-- from books 
-- order by author_lname, title;

-- select upper(concat('my favorite author is ', concat(author_fname, " ", author_lname))) as yell
-- from books
-- order by author_lname;

-- AGGEGATE FUNCTIONS

-- COUNT - COUNTING THE NUMBER OF ROWS

-- select count(*)
-- from books;
 
-- select count(author_fname) 
-- from books;

-- select count(distinct author_fname)
-- from books;

-- select count(distinct author_fname, author_lname)
-- from books;

-- select count(*)
-- from books
-- where title like '%the%';  

-- GROUP BY - SUMMARIZES OR AGGREGATES IDENTICAL DATA INTO SINGLE ROWS

-- select title, author_lname from books limit 5;

-- select title, author_lname
-- from books
-- group by author_lname;
-- ???????

-- select author_lname, count(*) 
-- from books 
-- group by author_lname;

-- select author_fname, author_lname, count(*) as 'books written'
-- from books
-- group by author_fname, author_lname;

-- select released_year, count(*) as 'books'
-- from books
-- group by 1 order by 2 desc;

-- select author_lname, count(*) from books
-- where author_lname = "eggers"
-- group by 1;

-- MIN and MAX
-- select min(released_year) from books;
-- select max(released_year) from books;

-- SUB QUERIRES/ IN LINE VIEW

-- select title, pages from books
-- where pages = (select max(pages) from books);
 
-- when use sub queries, it take time greater than a single query

-- better alternative!!!
-- select title, pages 
-- from books
-- order by pages desc limit 1;

-- MIN AND MAX WITH GROUP BY

-- select author_fname, author_lname, min(released_year)
-- from books
-- group by 1, 2;  

-- select author_fname, author_lname, max(pages) 
-- from books
-- group by 1, 2;

-- SUM -- SUMMAZION
-- select sum(stock_quantity) as 'total quantity' from books;

-- SUM WITH GROUP BY

-- select author_fname, author_lname, sum(stock_quantity) as 'total stocks'
-- from books
-- group by 1,2;

-- AVG -- AVERAGE
-- select floor(avg(pages)) from books;

-- AVG WITH GROUP BY

-- select released_year as 'year', ceil(avg(stock_quantity))
-- from books 
-- group by 1;

-- CHALLANGE

-- select count(*) as 'total books in the table' from books;

-- select released_year, count(*) as 'books released' from books
-- group by 1; 

-- select sum(stock_quantity) as 'total books in stocks'
-- from books;

-- select author_fname, author_lname, round(avg(released_year)) 
-- from books 
-- group by 1, 2;

-- select concat(author_fname, " ", author_lname) from books 
-- order by pages desc limit 1;

-- select released_year as 'year', count(*) as '# books', avg(pages) as 'pages'
-- from books
-- group by 1 order by 1;

-- DATA TYPES

	-- NUMERIC TYPES
	-- int, smallint, tinyint, mediumint, bigint, decimal, numeric, float, double, bit

	-- STRING TYPES
	-- char, varchar, binary, varbinary, blob, tinyblob, mediumblob, longblob, text, tinytext, mediumtext, longtext, enum

	-- DATE TYPES
	-- date, datatime, timestamp, time, year

-- CHAR VS VARCHAR
	-- CHAR has a fixed length whereas, VARCHAR hasn't
	-- CHAR is faster for fixed length text

-- DECIMAL(5,2)
	-- The decimal data type is a fixed-point type and calculation are exact
	-- 5 > Number of digit,
	-- 2 > Digital after decimal 

-- FLOAT & DOUBLE
	-- The float and double data types are floating point types and calculation are approximate
    -- Store larger numbers using less space 'decimal can't
    -- When working with these two data type, you have to worry about the precision

-- DATE, TIME & DATETIME
	-- DATE > (YYYY-MM-DD)
    -- TIME > (HH:MM:SS)
	-- DATETIME > (	YYYY-MM-DD HH:MM:SS)
    
-- CREATE DATE DATA
-- create table people(
-- 	name varchar(100),
--     birth_date date,
--     birth_time time, 
--     birth_dt datetime);
    
-- insert into people (name, birth_date, birth_time, birth_dt) 
-- values 
-- 	("Saheen", "1996-07-11", "12:00:00", "1996-07-11 12:00:00"),
-- 	("Suhail", "2001-04-17", "12:00:00", "2001-04-17 12:00:00");

-- select * from people;
-- desc people;

-- CURDATE, CURTIME & NOW

	-- select curdate();
	-- select curtime();
	-- select now();

-- insert into people(name, birth_date, birth_time, birth_dt)
-- values ('Jimmy', curdate(), curtime(), now());

-- FORMATING DATES

	-- select day();
    -- select dayname();
    -- select dayofweek();
    -- select dayofyear();

-- select name, day(birth_date) from people;
-- select name, dayname(birth_date) from people; 
-- select name, dayofyear(birth_date) from people;
-- select name, monthname(birth_date) from people;

-- select name, date_format(birth_dt, "born on %M %D %Y") as 'birth day' from people;

-- DATE MATH

-- select datediff(curdate(), "1996-07-11") as "age calculator";
-- select date_add(curdate(), interval 3 quarter);
-- select curdate() - interval 3 month;
-- select current_time() + interval 5 hour + interval 30 minute;

-- TIMESTAMPS
	-- Timestamps data type is used for values that contain both date and time parts
    -- Timestamps has a range of 1970-01-01 00:00:01 UTC to 2038-01-19 03:14:07 UTC
    
-- create table comments(
-- 	content varchar(200),
--     created_at timestamp default now());
    
-- insert into comments(content) values ("Wow learning sql is awesome");
-- insert into comments(content) values ("SQL is powerfull than I thought");

-- select * from comments order by created_at desc limit 1;

-- ON UPDATE

-- create table comments2(
-- 	content varchar(200),
--     created_at timestamp default now() on update current_timestamp);
    
-- insert into comments2(content) values ("Wow learning sql is awesome");
-- insert into comments2(content) values ("SQL is powerfull than I thought");

-- update comments2
-- set content = "Learning SQL is bit harder"
-- where content = "Wow learning sql is awesome";

-- CHALLANGE

-- What is the good use for CHAR
-- For fixed length characters char data type is faster, it hold less number of bytes comparared to varchar

-- create table inventory(
-- 	item_name varchar(20),
--     price decimal(6,2),
--     quantity int);

-- What is the different between datetime and timestamps
	-- Range > datetime support wide range of dates
    -- Size > timestams takes less amount of memory than datetime

-- select curtime();

-- select curdate();

-- select dayofweek(curdate

-- select date_format(now(), "%m/%d/%Y");

-- select date_format(now(), "%M %D at %h:%m");

-- create table tweets(
-- 	content varchar(200),
--     Username varchar(20),
--     created_at time default now() on update now());

-- LOGICAL OPERATORS

-- NOT EQUAL (!=)

-- select * from books where released_year != 2007;

-- NOT LIKE

-- select * from books where title not like '%the%'; 
-- select * from books where stock_quantity not like '__';

-- > , < , >= and <=

-- select * from books where released_year >= 2004;
-- select * from books where stock_quantity < 100;
-- select 'a' < 'b';
-- select 'A' >= 'a';

-- LOGICAL AND (&&)

-- select title, released_year 
-- from books 
-- where 
-- 	author_lname = 'eggers' &&
--     author_fname = 'dave' &&
--     released_year > 2010;

-- select * from books 
-- where 
-- 	author_lname = 'eggers' and 
-- 	released_year > 2010 and
--     title like '%novel%';

-- LOGICAL OR (||)

-- select * from books
-- where 
-- 	author_lname = 'eggers' or
--     released_year > 2010 or 
--     stock_quantity > 100;

-- BETWEEN
	
    -- !! A way of doing BETWEEN with only and operator !!
	-- select * from books 
	-- where 
	-- 	stock_quantity > 100 and 
	--     stock_quantity < 500;
    
-- select * from books
-- where stock_quantity between 100 and 500; 
    
-- Note: convert the dates to datetime type using cast(), when working with between and dates

-- select name, birth_dt as 'birth day' from people
-- where
-- 	birth_dt 
-- 		between 
-- 			cast('1990-01-01' as datetime) and 
-- 			cast('1999-12-31' as datetime);
 
-- IN

	-- select title, author_lname from books
	-- where
	-- 	author_lname = 'carver' or
	--     author_lname = 'lahri' or
	--     author_lname = 'smith';
    
-- select title, author_lname from books
-- where author_lname in ('carver', 'lahri', 'smith');

-- select title, released_year from books 
-- where released_year in (2017, 2001);

-- select title, released_year from books 
-- where released_year not in (2017, 2001);

-- select title, released_year from books 
-- where 
-- 	released_year >= 2000 and
--     released_year not in 
-- 		(2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016)
-- order by 2;

-- MODULO (NOT A LOGICAL OPERATOR)

-- select title, released_year from books 
-- where 
-- 	released_year >= 2000 and
--     released_year % 2 != 0
-- order by 2;

-- CASE -- CONDITIONAL SELECT

-- select title, released_year,
-- 	case
-- 		when released_year >= 2000 then "Modern lit"
-- 		else "21th Century lit"
-- 		end as "genre"
-- from books;

-- select title, stock_quantity, 
-- 	case
-- 		when stock_quantity between 0 and 50 then '*'
--         when stock_quantity between 51 and 100 then '**'
--         else '***'
-- 	end as stock
-- from books;

-- CHALLANGE

-- select 10 != 10;
-- select 15 > 14 && 99 - 4 <= 94;
-- select 1 in (5,3) or 9 between 8 and 10;

-- select * from books
-- where released_year < 1980;

-- select * from books
-- where 
-- 	author_lname = 'eggers' or 
--     author_lname = 'chabon';

-- select * from books
-- where 
-- 	author_lname = 'lahri' and 
--     released_year >= 2000;
    
-- select * from books
-- where
-- 	pages between 100 and 200;
    
-- select * from books
-- where
-- 	author_lname like 'C%' or 
--     author_lname like 'S%';

-- select title, author_lname, 
-- 	case
-- 		when title like '%stories%' then 'Short stories'
--         when title like 'Just Kids' or title like 'A Heartbreaking Work%' then 'Memoir'
--         else 'Novel'
-- 	end as 'type'
-- from books;

-- select author_lname, concat(count(*), " books") as 'count' 
-- from books 
-- group by author_lname;

-- RELATIONSHIPS AND JOINS

-- ONE TO MANY RELATIONSHIP

-- PRIMARY KEYS AND FOREING KEY 

-- CREATE TABLE customers(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     first_name VARCHAR(100),
--     last_name VARCHAR(100),
--     email VARCHAR(100)
-- );

-- CREATE TABLE orders(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     order_date DATE,
--     amount DECIMAL(8,2),
--     customer_id INT,
--     FOREIGN KEY(customer_id) REFERENCES customers(id)
-- );

-- Inserting some customers and orders

-- INSERT INTO customers (first_name, last_name, email) 
-- VALUES ('Boy', 'George', 'george@gmail.com'),
--        ('George', 'Michael', 'gm@gmail.com'),
--        ('David', 'Bowie', 'david@gmail.com'),
--        ('Blue', 'Steele', 'blue@gmail.com'),
--        ('Bette', 'Davis', 'bette@aol.com');
       
-- INSERT INTO orders (order_date, amount, customer_id)
-- VALUES ('2016/02/10', 99.99, 1),
--        ('2017/11/11', 35.50, 1),
--        ('2014/12/12', 800.67, 2),
--        ('2015/01/03', 12.50, 2),
--        ('1999/04/11', 450.25, 5);

-- This INSERT fails because of our fk constraint.  No user with id: 98

-- INSERT INTO orders (order_date, amount, customer_id)
-- VALUES ('2016/06/06', 33.67, 98);

-- JOINS

-- CROSS JOINS / CARTISIAN JOIN

-- select * from customers, orders
-- where

-- INNER JOIN / EQUI JOIN
-- Select all records from left and right table where the join condition met

-- IMPLICIT INNER JOIN

-- select first_name, last_name, order_date, amount 
-- from 
-- 	customers c, orders o
-- where c.id = o.customer_id;

-- EXPLICIT INNER JOIN (INNER KEYWORD IS OPTIONAL)

-- select first_name, last_name, order_date, amount
-- from 
-- 	customers join orders 
--     on customers.id = orders.customer_id;

-- AGGREGATE WITH INNER JOIN

-- list customers had ordered with total amount they spent

-- select 
-- 	first_name, 
-- 	last_name, 
--     sum(amount) as total_spent
-- from 
-- 	customers join orders 
--     on customers.id = orders.customer_id
-- group by orders.customer_id
-- order by 3 desc;

-- Note: the orders of tables matters

-- LEFT JOIN 
-- Select everything from left table along with any matching records in right table

-- select c.id, first_name, last_name, order_date, amount
-- from customers c left join orders o
-- 	on c.id = o.customer_id; 

-- AGGREGATE WITH LEFT JOIN

-- list all the customers with order details

-- select 
-- 	c.id,
-- 	first_name, 
--     last_name, 
--     ifnull(sum(amount), 0)
-- from customers c left join orders o
-- 	on c.id = o.customer_id
-- group by c.id;

-- RIGHT JOIN
-- Select everything from right table along with any matching records in left table

-- select 
-- 	o.id, 
--     order_date,
--     first_name, 
--     last_name,
--     email
-- from 
-- 	customers c right join orders o
-- 	on c.id = o.customer_id
-- order by 2 desc;

-- AGGREGATE WITH RIGHT JOIN

-- list the customers had orders 

-- select 
-- 	first_name,
--     last_name,
--     email,
--     sum(amount)
-- from 
-- 	customers c right join orders o
--     on c.id = o.customer_id
-- group by c.id
-- order by 4 desc;

-- ON DELETE CASCADE -- DELETING TABLE/DATA WITH HAS RELATIONSHIPS

-- WHEN CREATING A TABLE WITH FORIENG KEY SPECIFY ON DELETE CASCADE

-- CREATE TABLE orders(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     order_date DATE,
--     amount DECIMAL(8,2),
--     customer_id INT,
--     FOREIGN KEY(customer_id) 
-- 		REFERENCES customers(id)
--         ON DELETE CASCADE
-- );

-- RIGHT JOIN is a flip of LEFT JOIN

-- select * from 
-- customers left join orders
-- on customers.id = orders.customer_id;

-- select * from 
-- orders right join customers
-- on customers.id = orders.customer_id;

-- CHALLANGE

-- create table students(
-- 	id int auto_increment primary key,
--     first_name varchar(50) not null);

-- create table papers(
-- 	title varchar(50) not null,
--     grade int,
--     student_id int, 
-- 	foreign key(student_id) 
-- 		references students(id) 
--         on delete cascade); 

-- INSERT INTO students (first_name) 
-- VALUES 
-- 	('Caleb'), 
-- 	('Samantha'), 
-- 	('Raj'), 
-- 	('Carlos'), 
-- 	('Lisa');

-- INSERT INTO papers (student_id, title, grade ) 
-- 	VALUES
-- 	(1, 'My First Book Report', 60),
-- 	(1, 'My Second Book Report', 75),
-- 	(2, 'Russian Lit Through The Ages', 94),
-- 	(2, 'De Montaigne and The Art of The Essay', 98),
-- 	(4, 'Borges and Magical Realism', 89);

-- select first_name, title, grade 
-- from 
-- 	students right join papers
--     on students.id = papers.student_id
-- order by 3 desc;

-- select 
-- 	first_name, 
-- 	ifnull(title, "Missing"), 
--     ifnull(grade, 0)
-- from 
-- 	students left join papers
--     on students.id = papers.student_id;

-- select 
-- 	first_name, 
--     ifnull(avg(grade), 0) as 'average'
-- from 
-- 	students left join papers	
-- 	on students.id = papers.student_id
-- group by 1
-- order by 2 desc;

-- select 
-- 	first_name, 
--     ifnull(avg(grade), 0) as 'average',
--     case
-- 		when avg(grade) >= 75 then 'PASSING'
--         else 'FAILINIG'
--     end as passing_status
-- from 
-- 	students left join papers	
-- 	on students.id = papers.student_id
-- group by 1
-- order by 2 desc;