-- ADD DEFAULT CONSTRAINT TO EXISTING COLUMN
ALTER TABLE emp
ADD CONSTRAINT df_sal
DEFAULT 3000 FOR sal

-- ADDING A NEW COLUMN WITH DEFAULT CONSTRAINT
ALTER TABLE emp
ADD COLUMN gender 
CONSTRAINT df_gen DEFAULT un_known

-- DROPPING CONSTRAINT
ALTER TABLE emp
DROP CONSTRAINT df_gen

