use lesson8;

--Task1 Write an SQL statement that counts the consecutive values in the Status field.
-- We were asked to solve all problems with subqueries, no table expressions and no other advanced topics which we didn't see so far can be used
SELECT MIN(StepNumber) AS MinStepNumber, 
       MAX(StepNumber) AS MaxStepNumber, 
       Status, 
       COUNT(*) AS ConsecutiveCount
FROM (
    SELECT StepNumber, Status, 
           StepNumber - ROW_NUMBER() OVER (ORDER BY StepNumber) AS GroupID
    FROM Groupings
) AS sub
GROUP BY Status, GroupID
ORDER BY MinStepNumber;


--Task2 Find all the year-based intervals from 1975 up to current when the company did not hire employees.

WITH HireYears AS (
    SELECT DISTINCT YEAR(HIRE_DATE) AS HireYear
    FROM EMPLOYEES_N
),
YearGaps AS (
    SELECT HireYear, 
           LEAD(HireYear) OVER (ORDER BY HireYear) AS NextYear
    FROM HireYears
)
SELECT CONCAT(HireYear + 1, '-', COALESCE(NextYear - 1, YEAR(GETDATE()))) AS Years
FROM YearGaps
WHERE NextYear - HireYear > 1;

 