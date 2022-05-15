-- SET OPERATION

-- Used to combine record from multiple tables
-- Multiple select statement return a single result set
-- Name and Number of columns in each query must be same
-- To short order by clause must be declared in the last select statement

-- create table employee (
--     eno int primary key,
--     ename varchar2(100) not null,
--     salary int default 2000,
--     dept int);

-- create table department (
--     dno int primary key,
--     dname varchar2(100) not null,
--     dlocation varchar2(100));

-- create table Xemployee (
--     eno int primary key,
--     ename varchar2(100) not null,
--     dept int,
--     foreign key (dept) references department(dno)
-- );

-- alter table employee
-- add constraint emp_dept_fk
-- foreign key (dept) references department (dno);

-- insert into department values (10, 'Accounting', 'Dehiwala');
-- insert into department values (20, 'Finance', 'Galle face');
-- insert into department values (30, 'HR', 'Nugegoda');
-- insert into department values (40, 'Maintanance', 'Kiribathgoda');

-- insert into employee values(1, 'Jia', 4000, 10);
-- insert into employee values(2, 'Kylie', 3000, 20);
-- insert into employee values(3, 'Lily', 6000, 30);
-- insert into employee (eno, ename, salary) values(4, 'Lulu', 5000);

-- insert into Xemployee values (5, 'Munna', 20);
-- insert into Xemployee values (6. 'John', 30);
-- insert into Xemployee values (7, 'Kamal', 10);
-- insert into Xemployee values (8, 'Reynolds', 20);
-- insert into Xemployee values (9, 'Leela', 10);
-- insert into Xemployee values (10, 'Isac', 30);
-- insert into Xemployee values (11, 'Andrew', 40);
-- insert into Xemployee values(12, 'Lily', 30);

-- commit;

-- UNION

-- Duplicate records will be ignored

-- show all the employees of company

-- select ename, dept from employee
-- union
-- select ename, dept from xemployee;

-- UNION ALL

-- Include duplicate records from both table

-- select ename, dept from employee
-- union all
-- select ename, dept from xemployee
-- order by 1;

-- INTERSECT

-- Only return common record(s) for both table

-- select ename, dept from employee
-- intersect
-- select ename, dept from xemployee;

-- EXCEPT

-- Remove the common record(s) while return other records

-- select ename, dept from employee
-- except
-- select ename, dept from Xemployee;