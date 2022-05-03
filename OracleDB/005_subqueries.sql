-- create table department(
--     deptno number primary key,
--     dname varchar(40) not null,
--     location varchar2(40) not null);

-- create table employee(
--     eno number primary key,
--     ename varchar2(100) not null,
--     deptno number not null,
--     salary number,
--     commision number,
--     constraint emp_dept_fk foreign key (deptno) references department(deptno)
-- );

-- insert into department (deptno, dname, location) values (1, 'Finance', 'Colombo');
-- insert into department (deptno, dname, location) values (2, 'Accounting', 'Kandy');
-- insert into department (deptno, dname, location) values (3, 'HR', 'Colombo');

-- insert into employee (eno, ename, deptno, salary) values (1, 'Saheen', 3, 5800);
-- insert into employee (eno, ename, deptno, salary) values (2, 'Kamal', 2, 3000);
-- insert into employee (eno, ename, deptno, salary) values (3, 'Gunal', 3, 6500);
-- insert into employee (eno, ename, deptno, salary, commision) values (4, 'Jia', 1, 8000, 3000);


-- INLINE VIEW

-- select *
-- from
--     (select dname from department);

-- INLINE VIEW WITH AGGERATE FUNCTION

-- select *
-- from
--     (select deptno, count(*) number_of_employees
--     from employee
--     group by deptno) x;

-- INLINE VIEW WITH AGGREGATE AND JOIN FUNCTION

-- select dname, number_of_employees
-- from
--     (select deptno, count(*) number_of_employees
--     from employee
--     group by deptno) x
-- join department d
-- on d.deptno = x.deptno;

-- NESTED SUBQUERIES
-- Nested subqueries go in your where clause. The query filters rows in the parent tables.

-- select ename, salary
-- from employee e
-- where
--     e.deptno in (select deptno from department);

-- Also, exists can be used in a nested subquery

-- select ename, salary
-- from employee e
-- where exists (
--     select null
--     from department d
--     where
--         d.deptno = e.deptno and
--         e.deptno = 5);


-- Filter row in subquery

-- select *
-- from employee e
-- where
--     e.deptno in (select deptno from department d where d.location = 'Kandy');

-- Filter row with exist

-- select *
-- from employee e
-- where exists
--     (select null
--     from department d
--         where
--             e.deptno = d.deptno and
--             d.location = 'Kandy');

-- CORRELATED VS UNCORRELATED

-- UNCORRELATED

-- select *
-- from employee e
-- where exists
--     (select null from department);

-- select *
-- from employee e
-- where exists
--     (select null from department d where d.location = 'Jaffna');

-- Exists returns rows from the parent query, as long as the subquery finds at least one row
-- When using exists, what you select in the subquery does not matter because it is only checking the existence of a row that matches the where clause (if there is one).
-- You can "select null" or "select 1" or select an actual column.

-- CORRELATED

-- To find the exact matching result, you must join in the subquery.
-- Normally you need to correlate EXISTS subqueries with a table in the parent

-- select *
-- from employee e
-- where exists
--     (select null from department d
--     where
--         d.deptno = e.deptno and
--         d.deptno = 3);

-- NOT IN VS NOT EXISTS

-- select *
-- from employee e
-- where
--     e.deptno not in
--     (select deptno
--     from department d
--     where
--         d.dname = 'HR' and
--         e.deptno = d.deptno);

-- select *
-- from employee e
-- where not exists
--     (select deptno
--     from department d
--     where
--         d.dname = 'HR' and
--         e.deptno = d.deptno);

-- select *
-- from employee e
-- where
--     e.deptno not in (2,3);

-- SCALAR SUBQUERIES ***

-- Scalar subqueries return one column and at most one row. You can replace a column with a scalar subquery in most cases.
-- For example, to return a count of the number of employees matching each department, you could do the following:

-- select
--     deptno,
--     dname,
--     (select count(*)
--     from employee e
--     where e.deptno = d.deptno
--     group by e.deptno) number_of_employees
-- from department d
-- order by 1;

-- COMMON TABLE EXPRESSIONS

-- Common table expressions (CTEs) enable you to name subqueries.
-- You then refer to these like normal tables elsewhere in your query.
-- This can make your SQL easier to write and understand later

-- with employee_count as (
--     select deptno, count(*) emp_count
--     from employee
--     group by deptno)

-- select d.dname, d.location, ec.emp_count
-- from
--     department d join employee_count ec
--     on d.deptno = ec.deptno;

-- Because you access CTEs in the same way as a regular table, you can use it many times in your query.
-- This can help if you want to use this subquery many times

-- with employee_count as (
--     select deptno, count(*) emp_count
--     from employee
--     group by deptno)

-- select d.dname, d.location, ec.emp_count
-- from
--     department d join employee_count ec
--     on d.deptno = ec.deptno
-- where
--     ec.deptno in (1,2);

-- LITERATE SQL

-- The idea is to write code that makes sense if you read it like a book: from start to finish. (Clean coding)
-- But subqueries usually break this human readable flow.
-- We can use CTEs to order the subqueries to match, it makes easier to figure out what a SQL statement does when you look into it later.
-- Another big advantages of CTES (With clause) is it makes your SQL easier to test and debug.