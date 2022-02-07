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