use lesson5;
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Employees (Name, Department, Salary, HireDate) VALUES
    ('Alice', 'HR', 50000, '2020-06-15'),
    ('Bob', 'HR', 60000, '2018-09-10'),
    ('Charlie', 'IT', 70000, '2019-03-05'),
    ('David', 'IT', 80000, '2021-07-22'),
    ('Eve', 'Finance', 90000, '2017-11-30'),
    ('Frank', 'Finance', 75000, '2019-12-25'),
    ('Grace', 'Marketing', 65000, '2016-05-14'),
    ('Hank', 'Marketing', 72000, '2019-10-08'),
    ('Ivy', 'IT', 67000, '2022-01-12'),
    ('Jack', 'HR', 52000, '2021-03-29');


--Assign a Unique Rank to Each Employee Based on Salary

select *, row_number() over(order by Salary) as rank
from Employees
order by EmployeeID;

--Find Employees Who Have the Same Salary Rank

--solution 1
select *
from
	(select *, 
	dense_rank() over(order by salary) as rank,
	count(*) over(partition by salary) as salary_count
	from Employees) as sub
where salary_count > 1

--solution 2
-- it will select employees with same salary which means with the same salary rank
select * from
	(select *, COUNT(*) OVER(partition by Salary) as dup
	from Employees) as sub
where dup > 1

--dentify the Top 2 Highest Salaries in Each Department
--solution 1
select * 
from(
	select *, 
		DENSE_RANK() OVER(Partition by Department ORDER BY salary DESC) as rank
	from Employees
	) as sub
where rank in (1,2) ;

--solution2
select * 
from(
	select *, 
		ROW_NUMBER() OVER(Partition by Department ORDER BY salary DESC) as rank
	from Employees
	) as sub
where rank <=2 ;

--Find the Lowest-Paid Employee in Each Department
select * 
from(
	select *, 
		ROW_NUMBER() OVER(partition by department order by salary asc) as rnk
	FROM Employees
	) as sub
where rnk = 1;

--Calculate the Running Total of Salaries in Each Department
--ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROw
select*, 
	sum(salary) over(partition by department order by HireDate)
from Employees

--Find the Total Salary of Each Department Without GROUP BY

select distinct Department, 
	sum(salary) over(partition by department) as total_department_salary
from Employees

--Calculate the Average Salary in Each Department Without GROUP BY
select distinct Department,
	AVG(Salary) over(partition by department) as avg_department_salary
from Employees

--Find the Difference Between an Employee’s Salary and Their Department’s Average

select *, (salary - avg_department_salary) as difference_salary 
from 
	(select *,
		AVG(Salary) over(partition by department) as avg_department_salary
	from Employees
	) as sub

--Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)

select *,
	AVG(salary) over(
		order by EmployeeID
		rows between 1 preceding and 1 following 
		)as rolling_average
from Employees

--Find the Sum of Salaries for the Last 3 Hired Employees

select *,
	SUM(salary) over() as last_three
from(
	select *,
			rank() over(order by hiredate desc) as rnk
	from Employees
	) as sub
where rnk <=3

--another approach with running sum
SELECT *, 
       SUM(Salary) OVER (ORDER BY HireDate DESC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS RunningTotal_Last3
FROM Employees;

--Calculate the Running Average of Salaries Over All Previous Employees
SELECT *, 
       AVG(Salary) OVER (ORDER BY HireDate ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS Running_AVG
FROM Employees;

--Find the Maximum Salary Over a Sliding Window of 2 Employees Before and After

select *,
	MAX(SALARY) 
	over(order by EmployeeID
		ROWS between 2 preceding and 2 following) as max_salary_of_sldw
FROM Employees

--Determine the Percentage Contribution of Each Employee’s Salary to Their Department’s Total Salary
select *, 
	(1.0 * Salary / totalSalary) * 100 AS contribution_percent
from(
	select *, SUM(salary) over(partition by Department) as totalSalary
	from Employees
	) as sub