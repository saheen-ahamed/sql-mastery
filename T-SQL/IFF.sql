-- Return one of the two values, depending on whether the boolean expression evaluates to true or false
-- IFF is a shorthand way to writing a CASE expression

-- Syntex 
-- IFF(boolean_expression, true_value, false_value)

DECLARE @gender int = 1

SELECT IFF(@gender = 1, 'Male', 'Female') Gender
