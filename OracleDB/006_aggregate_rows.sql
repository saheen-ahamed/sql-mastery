-- AGGREGATING ROWS

-- create table bricks (
--   colour varchar2(10),
--   shape  varchar2(10),
--   weight integer
-- );

-- insert into bricks values ( 'red', 'cube', 1 );
-- insert into bricks values ( 'red', 'pyramid', 2 );
-- insert into bricks values ( 'red', 'cuboid', 1 );

-- insert into bricks values ( 'blue', 'cube', 1 );
-- insert into bricks values ( 'blue', 'pyramid', 2 );

-- insert into bricks values ( 'green', 'cube', 3 );

-- commit;

-- select * from bricks;

-- AGGREGATE FUNCTIONS

-- Aggregate functions combine many rows into one.
-- The query returns one row for each group.
-- If you use these without group by, you have one group. So the query will return one row.

-- select count(*) from bricks;

-- count accepting * return total number of rows

-- COMMON AGGREGATION FUNCTIONS

    -- Sum: the result of adding up all the values for the expression in the group
    -- Min: the smallest value in the group
    -- Max: the largest value in the group
    -- Avg: the arithmetic mean of all the values in the group
    -- Stddev: the standard deviation
    -- Median: the middle value in the data set
    -- Variance: the statistical variance of the values
    -- Stats_mode: the most common value in the group

-- select max(weight) from bricks;

-- DISTINCT VS ALL

-- select count (distinct colour) from bricks;

-- select
--     count (all colour) total_colours,
--     count (distinct colour) distinct_colour,
--     count (unique colour) unique_colour
-- from bricks;

-- select
--     count (distinct shape) distinct_shapes,
--     stddev (distinct weight) distinct_weight_stddev
-- from bricks;

-- Note: not all the functions support distinct

-- GROUPING AGGREGATION FUNCTIONS

-- select colour, count (*) colour_count
-- from bricks
-- group by colour;

-- You don't need to include aggregated column in the select statement

-- select count (*)
-- from bricks
-- group by colour;

-- But unaggregated coloum in the select statement will raise error

-- select colour, shape, count (*)
-- from bricks
-- group by colour;

-- You can group by many columns

-- select colour, shape, count(*)
-- from bricks
-- group by colour, shape;

-- CHALLANGE - return total weights for each shape

-- select shape, sum(weight) shape_weight
-- from bricks
-- group by shape;

-- FILTERING AGGREGATES (HAVING)

-- Since the database processes group by after the where clause, it only filter unaggregate values

-- select colour, count(*) colour_count
-- from bricks
-- where weight > 1
-- group by colour;

-- So in order to filter aggregates use HAVING clause, and excecuted after group by

-- select colour, count(*) colour_count
-- from bricks
-- group by colour
-- having count(*) >= 2;

-- select colour, count (*) colour_count
-- from   bricks
-- having count (*) >= 2
-- group  by colour;

-- both queries will work!!!

-- You can use different aggregate function on select and having clause

-- select colour, count (*) count_colour
-- from bricks
-- group by colour
-- having sum (weight) > 3;

-- CHALLANGE - the shape which has total weight less 4

-- select shape, sum (weight) total_weight
-- from bricks
-- group by shape
-- having sum (weight) < 4;

-- GENERATING SUBTOTALS/ GRAND TOTALS

-- ROLLUP

-- Rollup generates the subtotals for the columns within it
-- calculates:
--     Totals for each (colour, shape) pair
--     Totals for each colour
--     The grand total

-- select colour, shape, count (*)
-- from bricks
-- group by rollup (colour, shape);

-- Each sub groups are superaggregated,
-- For these superaggreagtes, the database returns null for the grouped columns

-- Combine rollup with non-rolled up columns

-- select colour, shape, count (*)
-- from bricks
-- group by colour, rollup (shape);

-- Rollup calculates N+1 groupings, where N is the number of expressions in the rollup.
-- So a rollup with three columns returns 3+1 = 4 groupings.

-- CUBE

-- Cube calculates the subtotals for every combination of columns within it
-- You get groupings for:
--     Each ( colour, shape ) pair
--     Each colour
--     Each shape
--     All the rows in the table

-- select colour, shape, count (*)
-- from bricks
-- group by cube (colour, shape);