-- Pivot operation turn rows into columns
-- Unpivot operatation turn columns into rows

--use employeedb
--go

--create table ProductSales (
--	SalesAgent varchar(40),
--	India int,
--	US int,
--	UK int)
 
--insert into ProductSales 
--values ('David', 960, 520, 360), ('Jhon', 970, 540, 800)

select SalesAgent, Country, SalesAmount
from ProductSales
unpivot
(
SalesAmount
for Country in (India, US, UK)
) as unpivot_example


create table #tblUnpivot (SalesAgent varchar(40), Country varchar(10), SalesAmount int) 

insert into #tblUnpivot
select SalesAgent, Country, SalesAmount
from ProductSales
unpivot
(
SalesAmount
for Country in (India, US, UK)
) as unpivot_example

-- PIVOT

select SalesAgent, India, US, UK
from #tblUnpivot
pivot(
sum(SalesAmount)
for Country in ([India],[US],[UK])
) as pivot_example