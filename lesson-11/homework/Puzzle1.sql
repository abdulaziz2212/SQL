use lesson11;

select * from Employees;

--Puzzle 1: Puzzle 1: The Shifting Employees

--1.creating a temporary table and inserting a given data
create table #EmployeeTransfers
(
	EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

insert into #EmployeeTransfers
Values 
	(1, 'Alice', 'HR', 5000),
    (2, 'Bob', 'IT', 7000),
    (3, 'Charlie', 'Sales', 6000),
    (4, 'David', 'HR', 5500),
    (5, 'Emma', 'IT', 7200);

--preview
select * from #EmployeeTransfers;

--2.Swap departments for each employee in a circular manner:
--HR → IT → Sales → HR

--to view before updating a table
select EmployeeID, Name, Department as Old,
CASE
	WHEN Department = 'HR' THEN 'IT'
	WHEN Department = 'IT' THEN 'Sales'
	WHEN Department = 'Sales' THEN 'HR'
END
	as new,
	Salary

from #EmployeeTransfers

--3.Insert the updated records into #EmployeeTransfers.

UPDATE #EmployeeTransfers
SET Department = 
		CASE
			WHEN Department = 'HR' THEN 'IT'
			WHEN Department = 'IT' THEN 'Sales'
			WHEN Department = 'Sales' THEN 'HR'
			ELSE Department -- Keeps other departments unchanged
		END;
--4.Retrieve all records from #EmployeeTransfers.

select * from #EmployeeTransfers
