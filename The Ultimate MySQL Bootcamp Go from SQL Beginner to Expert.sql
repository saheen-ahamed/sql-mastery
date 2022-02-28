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
-- 	name varchar(50) not null,
--     breed varchar(20),
--     age int
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
