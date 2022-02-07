-- KEEP THE FOLLOWING THINGS IN MIND
-- ** FROM --> WHERE --> SELECT --> ORDER BY
-- ** CASE can be used in select and order by statements
-- ** Group by?

-- FOR NEWBIE

-- show databases;
-- use mysql;
-- show tables;
-- desc emp;

-- RETRIEVING RECORDS FROM DATABASE (CHAPTER 1)

-- RETRIVEING ALL DATA FROM A TABLE

-- select * 
-- from emp;

-- CONDITIONAL SELECT (FILTER ROWS BY CONDITION/S)

-- select * 
-- from emp
-- where deptno = 10;

-- select * 
-- from emp
-- 	where ( 
-- 	deptno = 10 and 
-- 	mgr is null);

-- ALIAZING --X IS AN INLINE VIEW

-- select * 
-- from (
-- 	select ename as employee, sal as salary
-- 	from emp) as x
-- where salary>=2000;

-- CONCATANATE COLUMN VALUES (CONCAT)

-- difference disributers has different methods for concatanate

-- select 
-- 	concat(ename, ' works as a ',  job) as msg
-- from emp
-- where deptno=10;

-- CONDITIONAL SELECT (USING CASE)

-- select ename as employee, sal as salary, 
-- 	case
-- 		when sal <=2000 then 'under paid'
-- 		when sal >=4000 then 'over paid'
-- 		else 'fine'
-- 	end as status
-- from emp;

-- LIMIT THE ROWS

-- select * 
-- from emp
-- limit 5;

-- RETURN RANDOM SAMPLES

-- select ename, job
-- from emp
-- order by rand()
-- limit 5;

-- FINDING NULL VALUES

-- select * 
-- from emp
-- where comm is null;

-- transforming nulls into real values

-- select ename, coalesce(comm, 0)
-- from emp;


-- SEARCHING FOR PATTERN

-- select ename, job 
-- from emp
-- where 
-- 	deptno in (10, 20) and
--     (ename like '%I%' and job like '%ER%');

-- SORTING QUERY RESULTS (CHAPTER 2)
-- WITH THE USE OF ORDER BY

-- RETURNING QUERY RESULTS IN A SPECIFIED ORDER (ASCENDING OR DESCENDING)

-- select ename, job, sal
-- from emp
-- where 
-- 	deptno = 10
-- order by
-- 	sal desc;

-- if you want to order value by ascending you dont need to specify it
-- you can also specify the number which represent the column for ordering

-- select ename, job, sal 
-- from emp
-- where 
-- 	deptno = 10
-- order by 3;

-- SORTING BY MULTIPLE FIELDS

-- select empno, ename, deptno, sal, job
-- from emp
-- order by 
-- 	deptno, sal desc;

-- The order of precedence in ORDER BY is from left to right
-- you can use column number

-- SORTING BY SUBSTRING

-- select ename, job
-- from emp
-- order by 
-- 	substr(job, length(job)-2);
    
-- SORTING MIXED ALPHANUMERIC DATA

-- create view V as  
-- you can create view, which is temporarily stored in database

-- select *
-- from 
-- 	(select concat(ename, " ", deptno) from emp) as X;
-- since currenty transalate function doen't support by the mySQL , we can't sort alphanumerical values

-- DEALING WITH NULL VALUES WHEN SORTING

-- Try to fetch non-null values in the comm first as in the ascending order

-- select ename, sal, comm
-- from 
-- 	(select ename, sal, comm,
-- 		case 
-- 			when comm is null then 0 else 1 
-- 		end as is_null from emp) as X
-- order by is_null desc, comm;

-- The purpose of this extra column (in the query only, not in the table) is to allow you to identify NULL values and sort them altogether, first or last

-- SORTING ON THE DATA DEPENDENT KEY

-- select ename, job, sal, comm 
-- from emp
-- order by 
-- 	case 
-- 		when job='SALESMAN' then comm else sal
--     end;
-- you can use case statement with the order by to achieve this

-- WORKING WITH MULTIPLE TABLES (CHAPTER 3)

-- 3.1 STAKING ONE ROWSET ATOP ANOTHER

-- When you stack on rowset top of another row from different table; 
-- the tables do not necessarily have a common key, but their columns do have the same data types

-- select ename, deptno
-- from emp
-- where deptno=10;

-- select dname, deptno
-- from dept;
 
 -- we need to stack above tables 
 
 -- select ename as ename_and_dname, deptno
--  from emp
--  where deptno=10
--  union all
--  select dname, deptno
--  from dept;

-- 3.2 COMBINING RELATED ROWS
-- You want to return rows from multiple tables by joining on a known common column or joining on columns that share common values

-- select e.ename, d.loc
-- from 
-- 	emp as e, dept as d
-- where 
-- 	e.deptno = d.deptno and
--     e.deptno = 10;

-- ** This solution is an example of join, more accurately equi-join
-- ** A join is an operation that combines rows from two tables into one
-- ** An alternative solution makes use of an explicit JOIN clause (the INNER keyword is optional)

-- select e.ename, d.loc
-- from
-- 	emp as e inner join dept as d 
--     on e.deptno = d.deptno
-- where e.deptno = 10;
