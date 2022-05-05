-- ANALYTIC FUNCTION AND WINDOWS

-- create table water (
--     name varchar2(30) primary key,
--     type varchar2(10),
--     square_km int);

-- insert into water(name,type,square_km) values ('Pacific Ocean','Ocean',155557000);
-- insert into water(name,type,square_km) values ('Atlantic Ocean','Ocean',76762000);
-- insert into water(name,type,square_km) values ('Indian Ocean','Ocean',68556000);
-- insert into water(name,type,square_km) values ('Southern Ocean','Ocean',20327000);
-- insert into water(name,type,square_km) values ('Arctic Ocean','Ocean',14056000);
-- insert into water(name,type,square_km) values ('Mediterranean Sea','Sea',2965800);
-- insert into water(name,type,square_km) values ('Caribbean Sea','Sea',2718200);
-- insert into water(name,type,square_km) values ('South China Sea','Sea',2319000);
-- insert into water(name,type,square_km) values ('Bering Sea','Sea',2291900);
-- insert into water(name,type,square_km) values ('Gulf of Mexico','Gulf',1592800);
-- insert into water(name,type,square_km) values ('Okhotsk Sea','Sea',1589700);
-- insert into water(name,type,square_km) values ('East China Sea','Sea',1249200);
-- insert into water(name,type,square_km) values ('Hudson Bay','Bay',1232300);
-- insert into water(name,type,square_km) values ('Japan Sea','Sea',1007800);
-- insert into water(name,type,square_km) values ('Andaman Sea','Sea',797700);
-- insert into water(name,type,square_km) values ('North Sea','Sea',575200);
-- insert into water(name,type,square_km) values ('Red Sea','Sea',438000);
-- insert into water(name,type,square_km) values ('Baltic Sea','Sea',422200);

-- commit;

-- GENERIC SYNTEX

-- window_function over (window)
-- () mean select entire column as a window

-- select
--     name,
--     type,
--     square_km,
--     sum (square_km) over () as tot
-- from water
-- order by 3 desc;

-- PARTITIONING WINDOWS

-- With partition by clause, we can divide a larger window into smaller windows based on a single column or multiple columns.
-- The smaller window is then referred to as a partition.

-- select
--     distinct type,
--     sum (square_km) over (partition by (type)) sub_tot
-- from water
-- order by 2 desc;

-- WINDOW FUNCTIONS ARE AGGREGATE FUNCTIONS (SUM, COUNT, MIN, MAX, ..)

-- select
--     distinct type,
--     count (*) over (partition by (type)) total_count
-- from water;

-- select
--     distinct type,
--     max (square_km) over (partition by (type)) max_square_km
-- from water;

-- ORDER

-- The order by clause enables you to compute running totals

-- select
--     name,
--     square_km,
--     count(square_km) over (order by square_km desc) as total,
--     sum(square_km) over (order by square_km desc) as cumulative_sum
-- from water;

-- RANIKING

-- ROW_NUMBER

-- select
--     name,
--     type,
--     square_km,
--     row_number () over (order by square_km desc) as ranking
-- from water;

-- CTEs
-- with ranking_view as (
--     select
--         name,
--         type,
--         square_km,
--         row_number () over (order by square_km desc) as ranking
--     from water
-- )

-- select name, ranking
-- from ranking_view
-- where ranking < 11;

-- ROW_NUMBER with PARTITION

-- select
--     name,
--     type,
--     square_km,
--     row_number () over (partition by type order by square_km) as sub_ranking
-- from water;

-- RANKS and DENSE_RANK

-- RANK return rows with the same value in the order by as the same rank, but ROW_NUMBER returns a new value for each row.
-- DENSE_RANK return rows with the same value in the order by as the same rank, but there are no gaps in the ranks

-- select
--     name,
--     type,
--     square_km,
--     rank () over (partition by type order by square_km desc) ranking
-- from water;

-- LAG and LEAD

-- LAG allows to pull data from previous row
-- LEAD allows to pull data from following row

-- select
--     name,
--     type,
--     square_km,
--     lag (square_km, 1, 0) over (order by square_km) as square_km_prev,
--     lead (square_km, 1, 0) over (order by square_km) as square_km_next
-- from water;

-- FIRST_VALUES and LAST_VALUE in window

-- select
--     name,
--     type,
--     square_km,
--     first_value (square_km) over (order by square_km) as first_value,
--     last_value (square_km) over (order by square_km) as last_value
-- from water;

-- WINDOW

-- When you use order by, the database adds a default windowing clause of:
    -- range between unbounded preceding and current row

-- select
--     name,
--     square_km,
--     count(*) over
--         (order by square_km desc rows between unbounded preceding and current row) as total,
--     sum(square_km) over
--         (order by square_km desc rows between unbounded preceding and current row) as cumulative_sum
-- from water;

-- FIXED SIZE SLIDING WINDOWs

-- select
--     name,
--     square_km,
--     count(*) over (order by square_km rows between 1 preceding and current row) as cum_total,
--     sum(square_km) over (order by square_km rows between 1 preceding and current row) as cum_total
-- from water;

-- select
--     name,
--     square_km,
--     count(*) over (order by square_km rows between 1 preceding and 1 following) cum_total,
--     sum(square_km) over (order by square_km rows between 1 preceding and 1 following) cumulative_sum
-- from water;

-- FILTERING

-- To filter queries you must use the analytic in a subquery
-- select *
-- from (
--     select
--         type,
--         count(*) over (partition by type) as type_count
--     from water
--     )
-- where type_count = 1;