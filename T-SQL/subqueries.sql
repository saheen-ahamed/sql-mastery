use employeedb
go

-- Sub queries

-- Single row subquery

select * from emp
where
	sal > (select sal from emp where ename = 'JONES') and
	deptno = (select deptno from emp where ename = 'JONES')
	
-- Multi row subquery

-- Return if any condition should be satisfied

select * from emp
where 
	sal > any (select sal from emp where ename in ('JONES', 'MARTIN'))

-- Return if all condition should be satisfied

select * from emp
where 
	sal > all (select sal from emp where ename in ('JONES', 'MARTIN'))

-- Co-related subqueries

select deptno, convert(numeric(8,2), avg(sal)) as average_salary from emp e
where 
	deptno = (select deptno from dept d where d.deptno = e.deptno)
group by deptno