-- PL/SQL

-- PL/SQL is the oracle's procedural extension of SQL
-- The basic unit of a PL/SQL source program is the block, which groups related declarations and statements.
-- A PL/SQL block is defined by the keywords DECLARE, BEGIN, EXCEPTION, and END.
-- These keywords divide the block into a declarative part, an executable part, and an exception-handling part.

-- begin
--     dbms_output.put_line ('hello');
-- end;
-- /

-- declare
--     l_today date := sysdate;
-- begin
--     dbms_output.put_line ('today is '|| to_char(l_today,'Day'));
-- exception when others then
--     dbms_output.put_line(sqlerrm);
-- end;
-- /

-- STATIC SQL

-- With PL/SQL it is easy to integrate SQL statements.

-- create table employee(
--     empid int primary key,
--     name varchar2(100) not null,
--     salary int default 2000,
--     department varchar2(100));

-- insert into employee (empid, name, department, salary) values (1, 'Saheen', 'Analytics', 5000);
-- insert into employee (empid, name, department) values (2, 'Jia', 'Accounting');
-- insert into employee (empid, name, department) values (3, 'Kylie', 'HR');
-- commit;

-- declare
--     ename varchar2(100);
--     dept varchar2(100);
-- begin
--     select name, department into ename, dept
--     from employee
--     where empid = 1;
--     dbms_output.put_line('Name: ' || ename);
--     dbms_output.put_line('Department: ' || dept);
-- end;
-- /

-- GET TYPES

-- declare
--     ename employee.name%type;
--     dept employee.department%type;
-- begin
--     select name, department into ename, dept from employee
--     where empid = 2;
--     dbms_output.put_line('Name: ' || ename);
--     dbms_output.put_line('Department: ' || dept);
-- end;
-- /

-- GET A ROW

-- declare
--     record employee%rowtype;
-- begin
--     select * into record from employee
--     where empid = 1;
--     dbms_output.put_line('Name: ' || record.name);
--     dbms_output.put_line('Salary: ' || record.salary);
-- end;
-- /

-- CONDITIONAL LOGIC

-- IF-ELSIF-ELSE

-- declare
--     record employee%rowtype;
-- begin
--     select * into record from employee
--     where empid = 2;

--     if record.department = 'Analytics' then
--         dbms_output.put_line('The employee belong to Analytics department');
--     elsif record.department = 'Accounting' then
--         dbms_output.put_line('The employee belong to Accounting department');
--     else
--         dbms_output.put_line('The employee belong to other department');
--     end if;
-- end;
-- /

-- CASE STATEMENT

-- declare
--     num int := 2;
--     dayname varchar2(10);
-- begin
--     dayname := case num
--         when 1 then 'Monday'
--         when 2 then 'Tuesday'
--         else 'Sunday'
--     end;
--     dbms_output.put_line(dayname);
-- end;
-- /

-- LOOPS (BASIC LOOP, WHILE LOOP, FOR LOOP)

-- BASIC LOOP

-- declare
--     i number(2);
-- begin
--     i:= 1;
--     loop
--         dbms_output.put_line(i);
--         i:= i + 1;
--         exit when i > 10;
--     end loop;
-- end;
-- /

-- WHILE LOOP

-- declare
--     i number(2);
-- begin
--     i := 1;
--     while i < 10 loop
--         dbms_output.put_line(i);
--         i := i + 1;
--     end loop;
-- end;
-- /

-- FOR LOOP

-- begin
--     for i in 1..10 loop
--         dbms_output.put_line(i);
--     end loop;
-- end;
-- /

-- begin
--     for i in reverse 1..10 loop
--         dbms_output.put_line(i);
--     end loop;
-- end;
-- /

-- LOOP FOR DQL (DATA RETRIEVAL)

-- declare
--     record employee%rowtype;

-- begin
--     for i in 1..2 loop
--         select * into record from employee
--         where empid = i;
--         dbms_output.put_line('Name: ' || record.name || ' Salary: ' || record.salary);
--     end loop;
-- end;
-- /

-- IMPLICIT CURSOR

-- Oracle use implicit cursors to excecute SQL statement and is declared for all DML and PL/SQL select statement

    -- Curser attributes
        -- %rowcount
        -- %found
        -- %notfound
        -- %isopen

-- declare
--     counter int;
-- begin
--     update employee set salary = salary + 2000
--     where empid = 2;

--     if SQL%found then
--         counter := SQL%rowcount;
--         dbms_output.put_line(counter || ' row(s) updated');
--     end if;
-- end;
-- /

-- EXPLICIT CURSORS

-- Useful when dealing with multiple rows in a table

    -- Steps
        -- Declare -> in this step, we have to assosiate a select statement for cursor
        -- Open -> in this step, we open cursor will create an active state in the memory for controlling the select statement defined in declare step
        -- Fetch -> is the iterational process for retriving complete set of data
        -- Close -> finally close the cursor

-- Explict cursor inherit all the attributes of implicit cursor

-- declare
--     v_empno employee.empid%type;
--     v_ename employee.name%type;
--     cursor emp_cursor is
--         select empid, name from employee;
-- begin
--     open emp_cursor;
--     loop
--         fetch emp_cursor into v_empno, v_ename;
--         exit when emp_cursor%rowcount > 3 or emp_cursor%notfound;
--         dbms_output.put_line(v_empno || ' : ' || v_ename);
--     end loop;
--     close emp_cursor;
-- end;
-- /

-- ADVANCED CURSORS

-- PARAMETERIZED CURSOR

-- declare
--     v_empno employee.empid%type;
--     v_ename employee.name%type;
--     cursor emp_cursor(pid number) is
--         select empid, name from employee
--         where empid = pid;
-- begin
--     open emp_cursor(3);
--     loop
--         fetch emp_cursor into v_empno, v_ename;
--         exit when emp_cursor%rowcount > 3 or emp_cursor%notfound;
--         dbms_output.put_line('Id: ' || v_empno || ' Name: ' || v_ename);
--     end loop;
--     close emp_cursor;

--     open emp_cursor(1);
--     loop
--         fetch emp_cursor into v_empno, v_ename;
--         exit when emp_cursor%rowcount > 3 or emp_cursor%notfound;
--         dbms_output.put_line('Id: ' || v_empno || ' Name: ' || v_ename);
--     end loop;
--     close emp_cursor;
-- end;
-- /


-- CURSOR FOR UPDATE (FOR UPDATE OF)

-- This function lock the update for a perticular column in the table
-- When another user try to update the value the column will be locked

-- declare
--     cursor emp_cursor is
--         select empid, name, salary
--         from employee
--         where empid = 1
--         for update of salary nowait;
-- begin
--     update employee
--     set salary = salary + 2000
--     where empid = 1;
-- end;
-- /

-- declare
--     cursor sal_cursor is
--         select empid, name, salary
--         from employee
--         for update of salary nowait;
-- begin
--     for emp_record in sal_cursor loop
--         if emp_record.salary < 5000 then
--             update employee
--             set salary = salary + 3000
--             where current of sal_cursor;
--         end if;
--     end loop;
-- end;
-- /