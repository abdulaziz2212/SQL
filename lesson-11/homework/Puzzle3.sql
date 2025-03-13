use lesson11;
go
create view vw_MonthlyWorkSummary as
with EmployeeHours as
(	select EmployeeID,EmployeeName, Department, 
	SUM(HoursWorked) as TotalHoursWorked
	FROM WorkLog
	GROUP BY EmployeeID,EmployeeName, Department
),
TotalperDepartment AS (	
	select Department, 
	SUM(HoursWorked) as TotalHoursDepartment 
	from WorkLog
	GROUP BY Department
),	
avgPerDep AS(
	select Department, 
	AVG(HoursWorked) as AvgHoursDepartment 
	FROM WorkLog
	GROUP BY Department
)
SELECT 
	e.EmployeeID, 
    e.EmployeeName, 
    e.Department, 
    e.TotalHoursWorked, 
    t.TotalHoursDepartment, 
    d.AvgHoursDepartment
FROM EmployeeHours e
JOIN TotalperDepartment t ON t.department = e.Department
JOIN avgPerDep d ON e.Department = d.Department;
GO
select * from vw_MonthlyWorkSummary

