-- create table department(
--     deptno number primary key,
    -- dname varchar(40) not null,
--     location varchar2(40) not null);

-- create table employee(
--     eno number primary key,
--     ename varchar2(100) not null,
--     deptno number not null,
--     salary number(4,2),
--     commision number(4,2),
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