-- CREATE TABLES

-- create table DEPARTMENTS (
--   deptno        number,
--   name          varchar2(50) not null,
--   location      varchar2(50),
--   constraint pk_departments primary key (deptno)
-- );

-- create table EMPLOYEES (
--   empno             number,
--   name              varchar2(50) not null,
--   job               varchar2(50),
--   manager           number,
--   hiredate          date,
--   salary            number(7,2),
--   commission        number(7,2),
--   deptno           number,
--   constraint pk_employees primary key (empno),
--   constraint fk_employees_deptno foreign key (deptno)
--       references DEPARTMENTS (deptno)
-- );

-- TRIGGERS

-- create or replace trigger  DEPARTMENTS_BIU
--     before insert or update on DEPARTMENTS
--     for each row
-- begin
--     if inserting and :new.deptno is null then
--         :new.deptno := to_number(sys_guid(),
--           'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
--     end if;
-- end;
-- /

-- create or replace trigger EMPLOYEES_BIU
--     before insert or update on EMPLOYEES
--     for each row
-- begin
--     if inserting and :new.empno is null then
--         :new.empno := to_number(sys_guid(),
--             'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
--     end if;
-- end;
-- /

-- INSERT DATA

-- insert into departments (name, location) values
--   ('Finance','New York');

-- insert into departments (name, location) values
--   ('Development','San Jose');

-- insert into EMPLOYEES (
--     name,
--     job,
--     salary,
--     deptno)
-- values(
--     'Sam Smith',
--     'Programmer',
--     5000,
--     (select deptno from departments where name = 'Development')
-- );

-- insert into EMPLOYEES
--   (name, job, salary, deptno)
--   values
--   ('Mara Martin','Analyst',
--   6000,
--   (select deptno
--   from departments
--   where name = 'Finance'));

-- insert into EMPLOYEES
--   (name, job, salary, deptno)
--   values
--   ('Yun Yates','Analyst',
--   5500,
--   (select deptno
--   from departments
--   where name = 'Development'));


-- INDEXING

-- RETRIVE THE INDEXES IF EXISTS

-- select table_name "Table",
--       index_name "Index",
--       column_name "Column",
--       column_position "Position"
-- from  user_ind_columns
-- where table_name = 'EMPLOYEES' or
--       table_name = 'DEPARTMENTS'
-- order by table_name, column_name, column_position

-- INDEXING FOREIGN KEY

-- create index employee_dept_no_fk_idx
-- on employees (deptno);

-- INDEXING THE FREQUENTY USED KEYS

-- create unique index employee_ename_idx
-- on employees (name);

-- QUERY DATA FROM TABLES

-- select * from employees

-- JOINS

-- IMPLICIT INNER JOIN

-- select
--     e.name employee,
--     d.name department,
--     e.job,
--     d.location
-- from employees e, departments d
-- where e.deptno = d.deptno
-- order by e.name;

-- EXPLICIT INNER JOIN
-- select
--     e.name employee,
--     d.name department,
--     e.job,
--     d.location
-- from
--     employees e inner join departments d
--     on e.deptno = d.deptno
-- order by 1;

-- ALTER TABLE

-- alter table employees
-- add country_code varchar2(2);

-- DESCRIBE TABLE/ DATA DICTIONARY/ META DATA

-- describe employees

-- select table_name, tablespace_name, status
-- from user_tables
-- where table_name = 'EMPLOYEES';

-- select column_id, column_name , data_type
-- from user_tab_columns
-- where table_Name = 'EMPLOYEES'
-- order by column_id;

-- UPDATE DATA

-- update employees
-- set job = 'Data Engineer'
-- where name = 'Sam Smith';

-- update employees
-- set country_code = 'US';

-- DATA AGGERATION

-- select max(salary) max_salary
-- from employees;

-- select count(*) total_department
-- from departments;

-- select
--       count(*) employee_count,
--       sum(salary) total_salary,
--       sum(commission) total_commission,
--       min(salary + nvl(commission,0)) min_compensation,
--       max(salary + nvl(commission,0)) max_compensation
-- from employees;

-- TABLE COMPRESSION
-- alter table EMPLOYEES compress for oltp;
-- alter table DEPARTMENTS compress for oltp;

-- DECOMPRESSION
-- alter table EMPLOYEES nocompress;

-- DELETE DATA ROWS
-- delete from employees
-- where name = 'Yun Yates';

-- DROP TABLES
-- drop table employees cascade constraint;
-- drop table departments cascade constraint;

-- RECYCLE DELETED DATA

-- select object_name, original_name, type, can_undrop, can_purge
-- from recyclebin;

-- UNDROP TABLE USE FLASHBACK COMMAND

-- flashback table employees to before drop;
-- flashback table departments to before drop;
