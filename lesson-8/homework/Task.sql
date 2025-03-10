use lesson8;

--Task1 Write an SQL statement that counts the consecutive values in the Status field.
-- We were asked to solve all problems with subqueries, no table expressions and no other advanced topics which we didn't see d
select * from Groupings
select MIN(StepNumber) as MinStepNumber, Max(StepNumber) as MaxStepNumber, Status, Count(*) as ConsecutiveCount
FROM(
	select 
		StepNumber,
		Status,
		StepNumber - ROW_NUMBER() OVER (PARTITION BY Status ORDER BY StepNumber) AS GroupID
	from Groupings
) as sub
GROUP BY Status, GroupID
Order BY MinStepNumber;

--Task2 Find all the year-based intervals from 1975 up to current when the company did not hire employees.

select *
from
(
select
	CASE 
		WHEN interval < 2 or hireYear  < 1975 then NULL
		WHEN interval >= 2  then CONCAT(CAST(HireYear + 1 as NVARCHAR), '-', CAST(nextYear - 1 as NVARCHAR))
		WHEN nextYear is null then CONCAT(CAST(HireYear + 1 as NVARCHAR), '-', cast(year(getdate()) as NVARCHAR))
	END as Years
FROM
	(select 
		distinct year(hire_date) as hireYear, 
		LEAD(year(hire_date)) over(order by hire_date) as nextYear,
		LEAD(year(hire_date)) over(order by hire_date) - year(hire_date) as interval
	from Employees_n
	) as sub
	) as sub2
where years is not null;
 