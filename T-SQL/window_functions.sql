-- Different catogories of windows functions
	-- Aggregate funtions - AVG, SUM, COUNT, MIN, MAX, etc
	-- Ranking functions - RANK, DENSE_RANK, ROW_NUMBER, etc
	-- Analytical function - LEAD, LAG, FIRST_VALUE, LAST_VALUE etc

-- OVER clause define the partitioning (window) and ordering or rows for the above functions
-- OVER clause accept following arguments
	-- ORDER BY - calculate the running total
	-- PARTITION BY - divide the query result into partitions
	-- ROW OR RANGE clause - further limit the rows within the partition by specifiying start and the end

-- Default for ROWS OR RANGE - RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW

use employeedb
go

select distinct count(*) over () from emp

-- AGGREGATE DATA
select 
	ename, 
	job, 
	sal, 
	cast(avg(sal) over () as numeric(8,2)) as avg_sal 
from emp

-- Calculate the running total (no range)

select sal, count(*) over (order by empno) 'runnig total' from emp

select sal, count(*) over (order by empno range between unbounded preceding and current row) 'runnig total' from emp

select sal, count(*) over (order by empno rows between unbounded preceding and current row) 'running total' from emp

-- Specify the range

select sal, count(*) over (order by empno rows between unbounded preceding and unbounded following) from emp

select sal, count(*) over (order by empno rows between 1 preceding and current row) from emp

select sal, count(*) over (order by empno rows between 1 preceding and 1 following) from emp

-- PARTITIONING

select ename, sal, job, convert(numeric(8,2), avg(sal) over (partition by job)) from emp

-- RANKING

select ename, sal, row_number() over (order by empno) from emp

select ename, sal, rank() over (order by sal desc) from emp

select ename, sal, dense_rank() over (order by sal desc) from emp

-- LAST_VALUE/FIRST_VALUE

select 
	ename, 
	sal, 
	last_value(ename) 
	over(
	partition by deptno
	order by sal 
	rows between unbounded preceding and unbounded following) as 'highest paid emp'
from emp

-- NTILE
-- Distribute the rows into specific number of group
-- ORDER BY clause is required/ But partition by is optional
-- NTILE(number_of_groups) OVER (ORDER BY col1, col2...)

select 
	ename, 
	job, 
	sal,
	ntile(2) over (order by sal desc) as [ntile]
from emp

select 
	ename, 
	job, 
	sal,
	ntile(2) over (partition by job order by sal desc) as [ntile]
from emp

-- LEAD and LEG
-- LEAD function is used to access the subsequent row data along with current row data
-- LAG function is used to access the previous row data along with current row data
-- ORDER BY clause is required/ PARTION BY is optional

-- LEAD(col_name, offset, default_value) over (order by col1..)
-- offset -> number of rows to lead or lag
-- default_value -> the default value to return the number of rows to lead or lag goes beyond the first row or the last row in the table partition
-- if default value is not specified NULL will be returned

select 
	ename, 
	job, 
	sal,
	lead(sal) over (order by sal) as [lead],
	lag(sal) over (order by sal) as [lag]
from emp

select 
	ename, 
	job, 
	sal,
	lead(sal, 2) over (order by sal) as [lead],
	lag(sal, 2) over (order by sal) as [lag]
from emp

select 
	ename, 
	job, 
	sal,
	lead(sal, 2, -1) over (order by sal) as [lead],
	lag(sal, 2, -1) over (order by sal) as [lag]
from emp

-- with partition by
select
	ename, 
	job, 
	sal,
	lead(sal) over(partition by job order by sal) [lead],
	lag(sal) over(partition by job order by sal) [lag]
from emp