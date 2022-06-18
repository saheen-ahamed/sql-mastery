-- CHECK constraint is used to limit the range of the value, that can be entered for the column

-- THE GENERAL FORMULA FOR ADDING CHECK CONSTRAINT IN SQL SERVER
ALTER TABLE [table_name]
ADD CONSTRAINT [constraint_name] CHECK [boolean_expression]

-- If the boolean_expression is return true, then the CHECK constraint allows the value otherwise it does'nt.

CREATE TABLE emp(
	empID INTEGER PRIMARY KEY,
	ename VARCHAR(100) NOT NULL,
	age INTEGER CHECK (age > 18),
	deptno INTEGER,
	CONSTRAINTS emp_dept_fk FOREIGN KEY (deptno) REFERENCES dept (dno));

