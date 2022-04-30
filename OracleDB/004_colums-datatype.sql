-- COLUMNS AND DATATYPES

-- create table employee(
--     eno integer primary key,
--     ename varchar2(100),
--     dptno integer,
--     employement_date date);

-- VIEW TABLE INFOMATION

-- select table_name, column_name, data_type, data_length, data_precision, data_scale
-- from user_tab_columns
-- order by 1;

-- select column_id, column_name, data_type, data_length, data_scale, nullable, identity_column
-- from user_tab_columns
-- where table_name = 'EMPLOYEE';

-- describe employee;

-- ADD COLUMN(S) TO EXISTING TABLE

-- alter table employee
-- add (epfno integer, date_of_birth date);

-- MODIFY COLUMN TYPE

-- alter table employee 
-- modify (
--     epfno number(4,0),
--     ename varchar2(50) not null,
--     dptno not null,
--     employement_date not null);

-- VISIBLE/INVISIBLE COLUMNS

-- alter table employee
-- modify column date_of_birth invisible;

-- alter table employee
-- modify date_of_birth visible;

-- DROP COLUMN FROM TABLE

-- alter table employee
-- drop column date_of_birth;

-- CHARACTER DATA TYPES
    -- CHAR
    -- NVARCHAR2
    -- VARCHAR2
    -- CLOB

-- NUMERIC TYPES
    -- NUMBER
    -- FLOAT
    -- BINARY_FLOAT 
    -- BINARY_DOUBLE
    
-- DATE TYPE
    -- DATE 
    -- TIMESTAMP
    -- INTERVAL
