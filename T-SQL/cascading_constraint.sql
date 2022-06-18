-- Cascading referential integrity constraint allow to define the action 
-- SQL server should take when a user attempts to delete or update a key to which as exsisting foreign key points

-- However, you have the following options when setting up Cascading referential integrity constraint

-- 1. No Action: This is the default behaviour. No Action specifies that if an attempt is made to delete or update a row with a key referenced by foreign keys in existing rows in other tables, an error is raised and the DELETE or UPDATE is rolled back.

-- 2. Cascade: Specifies that if an attempt is made to delete or update a row with a key referenced by foreign keys in existing rows in other tables, all rows containing those foreign keys are also deleted or updated.

-- 3. Set NULL: Specifies that if an attempt is made to delete or update a row with a key referenced by foreign keys in existing rows in other tables, all rows containing those foreign keys are set to NULL.  

-- 4. Set Default: Specifies that if an attempt is made to delete or update a row with a key referenced by foreign keys in existing rows in other tables, all rows containing those foreign keys are set to default values.

CREATE TABLE dept(
	dno INTEGER,
	dname VARCHAR(100),
	CONSTRAINT dept_pk PRIMARY KEY (dno));

CREATE TABLE emp(
	empID INTEGER,
	ename VARCHAR(100),
	deptno INTEGER,
	CONSTRAINT emp_pk PRIMARY KEY (empID),
	CONSTRAINT emp_dep_fk FOREIGN KEY (deptno) REFERENCES dept(dno) 
	ON DELETE CASCADE);

