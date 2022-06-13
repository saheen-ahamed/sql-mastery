create or alter procedure EmpSalIncrement (@eno int) as
begin 
	declare @ename varchar(100),
	declare @salary numeric(8,2)
	
	select @ename = ename, @salary = salary 
	from employee
	where empID = @eno
	
	if @salary < 3000 
	begin
		update employee
		set salary = salary + 2000
		where empID = @eno
	end	
end

exec EmpSalIncrement(@eno = 20)

create or alter proc GetText (@amount numeric(8,2) out) as 
begin
	@amount = @amount* 0.1
end 

begin
	declare @tex numeric(8,2)
	set @tex = 10000
	exec GetText(@tex out)
	print 'tex amount is ' + cast(@tex as varchar)
end