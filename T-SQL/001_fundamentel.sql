-- A BLOCK

-- begin
--   declare @var int = 10;
--   set @var = 10;
--   print @var;
-- end;

-- @ -> for local variable
-- @@ -> for gloabal variable

-- begin
--   declare @eno int = 1;
--   declare @ename varchar(100) = 'Saheen';
--   declare @esal numeric(8,2);

--   set @esal = 10000;
--   print @ename + ' earn ' + cast(@esal as varchar);
-- end;

-- begin
--   declare @ename varchar(100);
--   declare @esal numeric(8,2);

--   select @ename = ename, @esal = salary
--   from employee
--   where eno = 1;

--   print @ename + ' earn ' + cast(@esal as varchar);
-- end;

-- CONDITIONAL STATEMENT

-- IF - ELSEIF - ELSE

-- begin
--   declare @ename varchar(100);
--   declare @esal numeric(8,2);
--   declare @grade char(1);
--   select @ename = ename, @esal = salary
--   from employee
--   where eno = 1;
--   if @esal > 50000
--   begin
--     set @grade = 'A';
--   end
--   else if @esal > 35000
--   begin
--     set @grade = 'B'
--   end
--   else
--   begin
--     set @grade = 'C'
--   end
--   print @ename + ' belong to class ' + @grade;
-- end;

-- LOOPS

-- begin
--   declare @ename varchar2(100);
--   declare @esal numeric(8, 2);
--   declare @id int = 1;
--   while @id <=5
--   begin
--     select
--         @ename = ename,
--         @esal = salary
--     from employee
--     where eno = @id;
--     print @ename + ' earns ' + cast(@esal as varchar);
--     set @id = @id + 1;
--     end
-- end;

-- EXCEPTION HANDLING

-- begin try
--   select 1/0;
-- end try
-- begin catch
--     select
--         @@error as error,
--         error_number() as 'number',
--         error_severity() as 'severity',
--         error_state() as 'state',
--         error_procedure() as 'procedure',
--         error_line as 'line'(),
--         error_message 'message'();
-- end catch;