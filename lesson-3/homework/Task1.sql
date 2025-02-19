use lesson3;
go

--selecting to group by with Department column and creating AverageSalary column values with cases
SELECT 
	Department, 
	AVG(Salary) as AverageSalary,
	CASE
		WHEN AVG(Salary) > 80000 Then 'High'
		WHEN (AVG(Salary) >= 50000 and AVG(Salary) <= 80000) Then 'Medium'
		ELSE 'Low'
	END
	AS SalaryCategory
	
FROM (
	SELECT TOP 10 percent	--subquery to retrieve top 10 percent of employees depending on salary, and then apply query above to it 
	*
	FROM Employees
	ORDER BY Salary DESC
	) as p
GROUP BY Department
ORDER BY AverageSalary DESC
OFFSET 2 ROWS FETCH FIRST 5 ROWS ONLY;

