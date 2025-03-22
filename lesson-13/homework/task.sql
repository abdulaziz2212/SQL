use lesson13

DECLARE @Year INT = YEAR(GETDATE());  -- Dynamically set the current year
DECLARE @Month INT = MONTH(GETDATE()); -- Dynamically set the current month

DECLARE @StartDate DATE = DATEFROMPARTS(@Year, @Month, 1);
DECLARE @EndDate DATE = EOMONTH(@StartDate);

WITH DateSeries AS (
    SELECT @StartDate AS DateValue
    UNION ALL
    SELECT DATEADD(DAY, 1, DateValue)
    FROM DateSeries
    WHERE DateValue < @EndDate
)
SELECT 
    MIN(CASE WHEN DATEPART(WEEKDAY, DateValue) = 1 THEN DateValue END) AS Sunday,
    MIN(CASE WHEN DATEPART(WEEKDAY, DateValue) = 2 THEN DateValue END) AS Monday,
    MIN(CASE WHEN DATEPART(WEEKDAY, DateValue) = 3 THEN DateValue END) AS Tuesday,
    MIN(CASE WHEN DATEPART(WEEKDAY, DateValue) = 4 THEN DateValue END) AS Wednesday,
    MIN(CASE WHEN DATEPART(WEEKDAY, DateValue) = 5 THEN DateValue END) AS Thursday,
    MIN(CASE WHEN DATEPART(WEEKDAY, DateValue) = 6 THEN DateValue END) AS Friday,
    MIN(CASE WHEN DATEPART(WEEKDAY, DateValue) = 7 THEN DateValue END) AS Saturday
FROM DateSeries
GROUP BY DATEDIFF(WEEK, @StartDate, DateValue)
OPTION (MAXRECURSION 100);