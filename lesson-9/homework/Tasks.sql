use lesson9;

CREATE TABLE Employees
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);

go
INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');


--Task1: Given this Employee table below, find the level of depth each employee from the President.

;with emp
AS
(
	select EmployeeID, ManagerID, JobTitle, 0 as Depth
	FROM Employees
	WHERE ManagerID is NULL

	union all

	select e.EmployeeID, e.ManagerID, e.JobTitle, m.Depth + 1 as Depth
	from Employees AS e
	join emp AS m
	ON e.ManagerID = m.EmployeeID
)
select *
from emp
ORDER BY Depth, EmployeeID;

--Find Factorials up to N
--Expected output for N=10 

declare @N int = 10
;with factorial
AS
(
	select 1 as num, CAST(1 AS BIGINT) as factorial
	union all
	select num + 1 as num, factorial * (num+1) as factorial
	from factorial as f
	where num < @N
)
select * from factorial 

--Find Fibonacci numbers up to N
--Expected output for N=10

declare @n2 int = 10
;WITH fibonacci
AS
( 
	select 1 as n, 1 as fib, 0 as prev_fib
	union all
	select n+1, fib + prev_fib, fib
	from fibonacci
	where n < @n2
)
select n, fib as Fibonacci_Number from fibonacci
