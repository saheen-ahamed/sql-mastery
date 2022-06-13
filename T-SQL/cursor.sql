begin
	declare @eno int
	declare @ename varchar(100)
	declare @esal numeric(8,2)
	
	
	declare emp_cur cursor for
		select empID, ename, salary from employee where empID = @eno
		
	open emp_cur
	
	fetch next emp_cur into @eno, @ename, @esal
	
	while @@fetch_status = 0
	begin
		print @ename 
		print @esal
		fetch next emp_cur into @eno, @ename, @esal
	end
	
	close emp_cur
	deallocate emp_cur
end