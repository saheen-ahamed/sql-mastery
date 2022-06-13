-- Data aggregation (and) group by

select count(*) from emp
where ename <> 'KING'

select d.dname, count(*) as employees
from 
	emp e inner join dept d
	on e.deptno = d.deptno
group by d.dname
	
select d.dname, max(sal) as max_salary
from 
	emp e inner join dept d
	on e.deptno = d.deptno
where e.job <> 'PRESIDENT'
group by d.dname
