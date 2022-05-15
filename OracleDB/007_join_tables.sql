-- JOINS

-- create table toys (
--   toy_id     integer,
--   toy_name   varchar2(20),
--   toy_colour varchar2(10)
-- );

-- create table bricks (
--   brick_id     integer,
--   brick_colour varchar2(10),
--   brick_shape  varchar2(10)
-- );

-- insert into toys values ( 1, 'Miss Snuggles', 'pink' ) ;
-- insert into toys values ( 2, 'Cuteasaurus', 'blue' ) ;
-- insert into toys values ( 3, 'Baby Turtle', 'green' ) ;

-- insert into bricks values ( 2, 'blue', 'cube' );
-- insert into bricks values ( 3, 'green', 'cube' );
-- insert into bricks values ( 4, 'blue', 'pyramid' );

-- commit;

-- JOIN SYNTEX

-- Oracle Database has two syntaxes for joining tables.
-- The proprietary Oracle method and the ANSI standard way.
-- Recommeded way to use ANSI, since oracle syntax joins tables in the where clause
-- Whereas ANSI clearly separates the join and filter clauses.
-- This can make your query easier to read, particularly with outer joins.

-- CROSS JOIN/CARTISIAN PRODUCT

-- Return every row from the first table matched to every row in the second table

-- select *
-- from toys, bricks;

-- select *
-- from toys cross join bricks;

-- EQUI JOIN/IMPLICT INNER JOIN

-- select *
-- from toys t, bricks b
-- where t.toy_id = b.brick_id;

-- INNER JOIN (EXPLICIT)

-- Select all records from left and right table where the join condition met

-- select *
-- from
--     toys t inner join bricks b
--     on t.toy_id = b.brick_id;

-- Note: inner keyword is not mandatory

-- LEFT JOIN

-- Select everything from left table along with any matching records in right table

-- select *
-- from
--     toys t left join bricks b
--     on t.toy_id = b.brick_id;

-- RIGHT JOIN

-- Select everything from right table along with any matching records in right table

-- Left and Right joins can be refered as an outer joins

-- JOINS WITH FILTERS

-- select *
-- from
--     toys t left join bricks b
--     on t.toy_id = b.brick_id
-- where
--     t.toy_colour = 'blue';

-- FULL OUTER JOIN

-- Joins matching rows and unmatching rows on the condition

-- select *
-- from
--     toys full join bricks
--     on toy_id = brick_id;

-- SELF JOIN

-- create table tbl_emp (
--     eno int primary key,
--     ename varchar2(100),
--     mgrid int);

-- insert into tbl_emp values(101, 'A', null);
-- insert into tbl_emp values(103, 'B', null);
-- insert into tbl_emp values(104, 'C', null);
-- insert into tbl_emp values(105, 'D', 101);
-- insert into tbl_emp values(106, 'E', 103);
-- insert into tbl_emp values(107, 'F', 101);
-- insert into tbl_emp values(108, 'G', 104);
-- insert into tbl_emp values(109, 'H', 101);

-- commit;

-- find the employees for each manager

-- select manager.ename, worker.ename
-- from
--     tbl_emp worker join tbl_emp manager
--     on worker.mgrid = manager.eno;