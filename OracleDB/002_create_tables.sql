-- SCHEMA DESIGN

-- CREATE TABLE
-- create table users(
--     userid number,
--     username varchar2(50),
--     email varchar2(50)
-- );

-- select table_name, iot_name, iot_type, external
--     partitioned, temporary, cluster_name
-- from user_tables;

-- TABLE ORGANIZATION

-- Defines how it physically stores rows in the table.
    -- heap
    -- index
    -- external

-- create table cats(
--     catid number,
--     cname varchar2(50),
--     breed varchar2(50)) organization heap;

-- By default, tables are heap-organized

-- INDEX ORAGANIZED TABLES

-- Unlike a heap table, an index-organized table (IOT) imposes order on the rows within it
-- Should have a priamry key in the table
-- Use 'oragnization index' cluase to define

-- create table books(
--     bookid number,
--     name varchar2(50),
--     aurthor varchar2(50),
--     released_year number(4,0),
--     genre varchar2(50),
--     constraint books_pk primary key (bookid)) organization index;

-- select table_name, iot_type
-- from user_tables
-- where table_name = 'BOOKS';

-- EXTERNAL TABLES

-- Use external tables to read non-database files on the database server
-- Import CSV files as database

-- To do this,
    -- Create a directory pointing to the location of the file on the server
    -- Use the organization external clause
    -- State the directory and name of the file you want to read

-- create or replace directory toy_dir as '/path/to/file';

-- create table toys_ext (
--   toy_name varchar2(100)
-- ) organization external (
--   default directory tmp
--   location ('toys.csv')
-- );

-- TEMPORARY TABLES

-- Temporary tables store session specific data.
-- Only the session that adds the rows can see them

-- create global temporary table cats(
--     name varchar2(50)
-- )

-- The definition of the temporary table is permanent. All users of the database can access it. But only your session can view rows you insert.

-- PRIAVATE TEMPORARY TABLES

-- This tables are only visible in your project
-- Other sessions can't see the table!
-- To create one use "private temporary" between create and table.
-- You must also prefix the table name with ora$ptt_:

-- create private temporary table ora$ptt_dogs(
--     name varchar2(50),
--     breed varchar2(50)
-- )


-- PARTITIONING

-- Partitioning logically splits up a table into smaller tables according to the partition column(s). So rows with the same partition key are stored in the same physical location.

-- There are three types of partitioning available:
    -- Range
    -- List
    -- Hash

-- To create a partitioned table, you need to:
    -- Choose a partition method
    -- State the partition columns
    -- Define the initial partitions

-- create table toys(
--     name varchar2(50)
-- ) partition by Range(name)(
--     partition p0 values less than ('b'),
--     partition p1 values less than ('c')
-- );

-- create table toys(
--     name varchar2(40) not null,
--     toy_class varchar2(40) not null
-- ) partition by List(toy_class)(
--     partition p0 values ('Guns'),
--     partition p1 values ('Cars')
-- );

-- TABLE CLUSTERS

-- A table cluster can store rows from many tables in the same physical location.
-- To do this, first you must create the cluster:

-- create cluster animals(
--     aname varchar2(100)
-- );

-- create table parrots(
--     pname varchar2(100),
--     pclass varchar2(100)
-- ) cluster animals (pname);

-- create table dogs(
--     dgid integer,
--     dname varchar2(100),
--     breed varchar2(100)
-- ) cluster animals (dname);

-- select cluster_name from user_clusters;

-- select table_name, cluster_name
-- from user_tables
-- where table_name in ('PARROTS', 'DOGS');

-- Before inserting values into tables which assosiate with cluster create index for cluster

-- create index animal_idx
-- on cluster animals;

-- insert into dogs(dgid, dname, breed) values (1, 'blue', 'persian');
-- insert into parrots(pname, pclass) values ('lola', 'cockatoos');

-- DROP TABLES

-- create table dropme(
--     dummy_column integer);

-- drop table dropme;