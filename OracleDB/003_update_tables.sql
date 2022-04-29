-- UPDATE DATABASE

-- CREATE DATABASE FOR UPDATATING

-- create table flights ( 
--   flight_id                integer not null primary key, 
--   flight_number            varchar2(6) not null, 
--   departure_airport_code   varchar2(3) not null, 
--   destination_airport_code varchar2(3) not null, 
--   departure_datetime       timestamp with time zone not null, 
--   flight_duration          interval day to second(0) not null, 
--   operating_carrier_code   varchar2(2) not null 
-- ) partition by range (departure_airport_code) ( 
--   partition pA_E values less than ('F'), 
--   partition pF_J values less than ('K'), 
--   partition pK_O values less than ('P'), 
--   partition pP_T values less than ('U'), 
--   partition pU_Z values less than ('a') 
-- );

-- INSERT TABLE DATA

-- insert into flights  
-- values (1, 'BA123', 'LHR', 'JFK', timestamp'2015-01-01 10:00:00 -00:00', interval '5' hour, 'BA');
-- insert into flights  
-- values (2, 'BA123', 'LHR', 'JFK', timestamp'2015-01-02 10:00:00 -00:00', interval '5' hour, 'BA');
-- insert into flights  
-- values (3, 'AA567', 'LHR', 'JFK', timestamp'2015-01-01 13:00:00 -00:00', interval '6' hour, 'AA');
-- insert into flights  
-- values (4, 'BA124', 'JFK', 'LHR', timestamp'2015-01-01 22:00:00 -05:00', interval '5' hour, 'BA');
-- insert into flights  
-- values (5, 'BA124', 'JFK', 'LHR', timestamp'2015-01-02 22:00:00 -05:00', interval '5' hour, 'BA');
-- insert into flights  
-- values (6, 'AA567', 'JFK', 'LHR', timestamp'2015-01-01 20:00:00 -05:00', interval '6' hour, 'AA');
-- insert into flights  
-- values (7, 'AA987', 'JFK', 'SFO', timestamp'2015-01-02 12:00:00 -05:00', interval '4' hour, 'AA');

-- commit;

-- TABLE DESCRIPTION

-- select column_id, column_name, data_type
-- from user_tab_columns
-- where table_name = 'FLIGHTS';

-- SHOW DATA IN THE TABLE
-- select * from flights
-- order by flight_id;

-- UPDATE SINGLE COLUMN IN A ROW

-- update flights 
-- set flight_number = 'AA986'
-- where flight_id = 7;

-- UPDATE SINGLE COLUMN (SELF UPDATE)

-- update flights
-- set flight_duration = flight_duration + interval '30' minute
-- where flight_id = 7;

-- UPDATE MULTIPLE COLUMNS IN A SINGLE ROW

-- update flights
-- set 
--     flight_number = 'BA986', 
--     flight_duration = interval '5' hour, 
--     operating_carrier_code = 'BA' 
-- where flight_id = 7;

-- UPDATE USING CO-RELATED SUBQUERIES **

-- update flights
-- set flight_duration = flight_duration + interval '30' minute
-- where flight_id in (select flight_id from flights where operating_carrier_code = 'BA');

-- Subquery return a list of flight id with operating code 'BA' the outer query will update specific column the rows 

-- Result
-- select flight_id, flight_duration 
-- from flights 
-- where operating_carrier_code = 'BA' 
-- order by 1; 

-- CORELATED UPDATE ***
-- ??
