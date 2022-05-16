-- A BLOCK

begin
  declare @var int = 10;
  set @var = 10;
  print @var;
end;

-- @ -> for local variable
-- @@ -> for gloabal variable

begin
  declare @eno int = 1;
  declare @ename varchar(100) = 'Saheen';
  declare @esal numeric(8,2);

  set @esal = 10000;
  print @ename + ' earn ' + cast(@esal as varchar);
end;

begin
  declare @ename varchar(100);
  declare @esal numeric(8,2);

  select @ename = ename, @esal = salary
  from employee
  where eno = 1;

  print @ename + ' earn ' + cast(@esal as varchar);
end;

-- CONDITIONAL STATEMENT

-- IF - ELSEIF - ELSE

begin
  declare @ename varchar(100);
  declare @esal numeric(8,2);
  declare @grade char(1);
  select @ename = ename, @esal = salary
  from employee
  where eno = 1;
  if @esal > 50000
  begin
    set @grade = 'A';
  end
  else if @esal > 35000
  begin
    set @grade = 'B'
  end
  else
  begin
    set @grade = 'C'
  end
  print @ename + ' belong to class ' + @grade;
end;

-- LOOPS

begin
  declare @ename varchar2(100);
  declare @esal numeric(8, 2);
  declare @id int = 1;
  while @id <=5
  begin
    select
        @ename = ename,
        @esal = salary
    from employee
    where eno = @id;
    print @ename + ' earns ' + cast(@esal as varchar);
    set @id = @id + 1;
    end
end;

-- EXCEPTION HANDLING

begin try
  select 1/0;
end try
begin catch
    select
        @@error as error,
        error_number() as 'number',
        error_severity() as 'severity',
        error_state() as 'state',
        error_procedure() as 'procedure',
        error_line as 'line'(),
        error_message 'message'();
end catch;

-- TRANSACTION

-- A set of SQL statements, which are executed together as a unit
-- Commit statement is used to save the changes
-- Rollback statement used to undo the changes before saving
-- Savepoint split the complete transaction in smaller parts for rollback
-- @@Trancount count the number of transaction

begin transaction
    delete from employee where eno = 5;
    print @@trancount
    -- save the changes
    commit;
    -- undo the changes
    rollback;

begin transaction
    save transaction s1
        delete from employee where eno = 6;
    save transaction s2
        update employee set salary = 12000 where eno = 7;
    rollback transaction s1; -- can rollback specific save point
    commit; -- committing will save all the changes

-- CURSOR

-- Used to retrive data from a result set one row at a time (Cursor point one row at a time)
-- Used when need to update record in a database table row by row
-- @@fetch_status return the status of the last cursor fetch

-- Steps
    -- Declare -> associate select statement with the cursor
    -- Open -> opening cursor, will create an active state in the memory for controlling the select statement defined in declare step
    -- Fetch -> is the iterational process for retriving complete set of data
    -- Close -> closing the cursor
    -- Deallocate -> dealloate memory used for the cursor

begin
    declare @id int;
    declare @ename varchar(100);
    declare @sal numeric(8, 2);

    declare employee_cursor cursor for
        select eno, ename, salary from employee where dept = 30;
    open employee_cursor;
    fetch next from employee_cursor into @id, @ename, @sal;
    while @@fetch_status = 0
    begin
      if @sal < 30000
      begin
        set @sal = @sal + 5000;
        update employee set salary = @sal where eno = @id;
      end;
      print @name + ' earns ' + cast(@sal as varchar);
      fetch next from employee_cursor into @id, @ename, @sal;
    end;
    close employee_cursor;
    dealloate employee_cursor;
end;