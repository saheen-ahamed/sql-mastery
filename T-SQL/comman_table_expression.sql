-- CTEs is a temporary result set can be referenced within a SELECT, INSERT, UPDATE or DELETE statement that immediately follow the CTEs
-- Syntex

with EmployeeCount(DepartmentId, TotalEmployees) 
as (
select DepartmentId, count(*) as TotalEmployees
from tblEmployees	
group by DepartmentId
)
select DeptName, TotalEmployees
from tblDepartment
inner join EmployeeCount
on tblDepartment.DeptId = EmployeeCount.DepartmentId
order by TotalEmployees

-- Column names are optional, if you don't specify the column name for CTEs all the column from the inner select query will be returned
-- If you specify the Column, number of columns should match the number of columns in the inner select query.

-- It is also possible to create multiple CTEs with a single with clause.

-- with cte1 as (), cte2 as () select ...

-- UPDATE CTEs
-- if CTE is created from on one base table, then it is possible to update the CTEs, which turn will update the underlying table

with employee_name_gender
as 
(
select id, name, gender 
from tblEmployee
) 
select * from employee_name_gender

with employee_name_gender
as
(
select id, name, gender
from tblEmployee
) 
update employee_name_gender
set gender = 'female'
where id = 1

-- In this case, updating employee_name_gender CTE, updates the tblEmplyee table

-- CTE on 2 table
-- If a CTE is based on more than one table, and if the UPDATE affect only one base table, then UPDATE is allowed

with employee_dept
as
(
select id, name, gender, department
from tblEmployee E
inner join tblDepartment D
on E.depId = D.id
)
update employee_dept
set gender = 'male' 
where id = 1

-- If a CTEs based on multiple table, and if UPDATE statement affects more than 1 based table, then UPDATE is not allowed.
