-- CROSS APPLY and OUTER APPLY are used to join table and table valued function
-- CROSS APPLY is serving the purpose of INNER JOIN (returns only the matching rows)
-- OUTER APPLY is servinth the purpose of LEFT OUTER JOIN (return the matching + unmatched rows)

create function fn_GetEmployeesByDepartmentId(@departmentId int)
returns table
as
return
(
select id, name, gender, salary, departmentId
from Employee where departmentId = @departmentId
)
go

select D.departmentName, E.name, E.gender, E.salary
from department D
cross apply fn_GetEmployeesByDepartmentId(D.id) E

-- Doesn't requires the join condition