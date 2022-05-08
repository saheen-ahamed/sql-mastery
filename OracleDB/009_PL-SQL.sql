-- PREREQUISITE

-- create table employee(
--     empid int primary key,
--     name varchar2(100) not null,
--     salary int default 2000,
--     department varchar2(100));

-- insert into employee (empid, name, department, salary) values (1, 'Saheen', 'Analytics', 5000);
-- insert into employee (empid, name, department) values (2, 'Jia', 'Accounting');
-- insert into employee (empid, name, department) values (3, 'Kylie', 'HR');
-- commit;

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

-- CURRENT OF

-- Current of <cursor_name> is a pointer for the current record (row) in the table
-- Can be used within the loop of records

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

-- EXCEPTION HANDLING

-- Exception is a identifier which is raised during excecution either implicitly or explicitly

-- Two types of exceptions
    -- Predifined -> implicit
    -- User defined -> explicit

-- PREDEFINED EXCEPTIONS

-- declare
--     ename employee.name%type;
--     esal employee.salary%type;
-- begin
--     select name, salary into ename, esal
--     from employee
--     where empid = 4;

--     dbms_output.put_line(ename || ' earns ' || esal);

--     exception
--         when no_data_found then
--             dbms_output.put_line('No records found');
--         when too_many_rows then
--             dbms_output.put_line('More than 1 rows found');
--         when others then
--             dbms_output.put_line('Some other errors found');
-- end;
-- /

-- USER DEFINED EXCEPTIONS

-- declare
--     ename employee.name%type;
--     esal employee.salary%type;
--     invalid_dept exception;
-- begin
--     update employee
--     set salary = salary + 3000
--     where department = 'Finance';

--     if SQL%notFound then
--         raise invalid_dept;
--     end if;
--     commit;

--     exception
--         when no_data_found then
--             dbms_output.put_line('No records found');
--         when too_many_rows then
--             dbms_output.put_line('More than 1 rows found');
--         when invalid_dept then
--             dbms_output.put_line('No such department exist in the records);
--         when others then
--             dbms_output.put_line('Some other errors found');
-- end;
-- /

-- PROCEDURES

-- A sub program (or object) used to perform repeated excecution
-- Values can be supplied through parameters
-- Formal parameter is passed when we define the procedure and the actural parameter is passed when we call the procedure

-- Modes of passing parameter
    -- IN paramter -> formal paremeter pass value to the actual parameter
    -- OUT parameter -> actual paramter pass value to the formal parameter
    -- IN OUT parameter -> parameter has dual effect

-- Create procedure

-- create or replace procedure test_procedure is
-- begin
--     dbms_output.put_line('this is the testing procedure');
-- end;
-- /

-- execute test_procedure;

-- Parameterized procedure - IN mode

-- create or replace procedure add_employee(
--     eno in employee.empid%type,
--     ename in employee.name%type,
--     esal in employee.salary%type,
--     dept in employee.department%type) is
-- begin
--     insert into employee values (eno, ename, esal, dept);
--     dbms_output.put_line('1 row inserted.');
-- end;
-- /

-- execute add_employee(4, 'Kira', 6000, 'Finance');

-- Prameterized procedure - OUT mode

-- create or replace procedure get_salary(
--     eno in employee.empid%type,
--     esal out employee.salary%type) is
-- begin
--     select salary into esal from employee
--     where empid = eno;
-- end;
-- /

-- declare
--     salary int;
-- begin
--     get_salary(4, salary);
--     dbms_output.put_line(salary);
-- end;
-- /

-- Parameterized procedure - IN OUT mode

-- create or replace procedure format_name (name in out varchar2) is
-- begin
--     name := initcap(name);
-- end;
-- /

-- declare
--     name varchar2(100);
-- begin
--     name := 'saheen ahamed';
--     format_name(name);
--     dbms_output.put_line(name);
-- end;
-- /

-- FUNCTIONS

-- A PL-SQL block that returns a value
-- Provide reusability
-- Invoked by select or where clause

-- create or replace function get_tax_amount(salary number) return number is
-- begin
--     return (salary * 10/100);
-- end;
-- /

-- select
--     empid,
--     name,
--     department,
--     salary,
--     get_tax_amount(salary) tax_payable,
--     salary - get_tax_amount(salary) gross_salary
-- from employee;

-- PACKAGES

-- Group of logically divided subprograms
-- Divided into two part, package specification and body
-- Public package construct are declared in specification
-- Private package construct are declared in package body
-- Packages itself cannot be invoked
-- On the first call of a package block, the whole package will loaded in memory

-- Create package specification

-- create or replace package manage_employee is
--     procedure add_emp(empno int, ename varchar2, esal int, dept varchar2);
--     procedure edit_emp(empno int, ename varchar2, esal int, dept varchar2);
-- end manage_employee;
-- /

-- Create package specification

-- create or replace package body manage_employee is
--     procedure add_emp (
--         empno int, ename varchar2, esal int, dept varchar2) is
--     begin
--         insert into employee values (empno, ename, esal, dept);
--         dbms_output.put_line('1 row inserted into employee table');
--     end add_emp;

--     procedure edit_emp (
--         empno int, ename varchar2, esal int, dept varchar2) is
--     begin
--         update employee
--         set
--             name = ename, department = dept, salary = esal
--         where empid = empno;
--         dbms_output.put_line('1 row updated with employee id ' || empno);
--     end edit_emp;
-- end;
-- /

-- execute manage_employee.add_emp(4, 'Karlie', 8000, 'Finance');
-- execute manage_employee.edit_emp(4, 'Nikole', 6000, 'Finance');

-- ADVANCED PACKAGES

-- CREATE BODYLESS PACKAGES

-- create or replace package global_constants is
--     mile_to_km constant number := 1.6093;
--     km_to_mile constant number := 0.6214;
-- end;
-- /

-- execute dbms_output.put_line(20 * global_constants.mile_to_km);

-- OVERLOADING THE PROCEDURES

-- create or replace package manage_employee is
--     procedure add_emp(eno int, ename varchar2);
--     procedure add_emp(eno int, ename varchar2, esal int);
--     procedure add_emp(eno int, ename varchar2, esal int, dept varchar2);
-- end manage_employee;
-- /

-- create or replace package body manage_employee is
--     procedure add_emp(eno int, ename varchar2) is
--     begin
--         insert into employee values (eno, ename, 2000, 'Finance');
--     end add_emp;

--     procedure add_emp(eno int, ename varchar2, esal int) is
--     begin
--         insert into employee values (eno, ename, esal, 'Finance');
--     end add_emp;

--     procedure add_emp(eno int, ename varchar2, esal int, dept varchar2) is
--     begin
--         insert into employee values (eno, ename, esal, dept);
--     end add_emp;
-- end;
-- /

-- execute manage_employee.add_emp(5, 'Rocky');
-- execute manage_employee.add_emp(6, 'Aadheera', 6000);
-- execute manage_employee.add_emp(7, 'Leela', 7000, 'HR');

-- FORWARD DECLARATION

-- create or replace package manage_employee is
--     procedure add_emp(empno int, ename varchar2, esal int, dept varchar2);
--     procedure edit_emp(empno int, ename varchar2, esal int, dept varchar2);
-- end manage_employee;
-- /

-- create or replace package body manage_employee is

--     procedure get_emp(eno in out int);

--     procedure add_emp(empno int, ename varchar2, esal int, dept varchar2) is
--     begin
--         insert into employee values (empno, ename, esal, dept);
--     end add_emp;

--     procedure edit_emp(empno int, ename varchar2, esal int, dept varchar2) is
--     begin
--         if get_emp(empno) is null then
--             dbms_output.put_line('Employee with id ' || empno || ' not found');
--         else
--             update employee
--             set name = ename, salary = esal, department = dept
--             where empid = empno;
--         end if;
--     end edit_emp;

--     procedure get_emp(eno in out int) is
--     begin
--         select empid into eno from employee where empid = eno;
--     end get_emp;

-- end;
-- /