use lesson4;

CREATE TABLE EmpBirth
(
	EmpId INT  IDENTITY(1,1) ,
	EmpName VARCHAR(50),
	BirthDate DATE
);
 
INSERT INTO EmpBirth(EmpName,BirthDate)
SELECT 'Pawan' , '1983-12-04'
UNION ALL
SELECT 'Zuzu' , '1986-11-28'
UNION ALL
SELECT 'Parveen', '1977-05-07'
UNION ALL
SELECT 'Mahesh', '1983-01-13'
UNION ALL
SELECT 'Ramesh', '1983-05-09';

--Write a query which will find the Date of Birth of employees whose birthdays lies between May 7 and May 15.
select * 
from EmpBirth
WHERE BirthDate BETWEEN Concat(year(BirthDate),'-05-07') AND Concat(year(BirthDate),'-05-15');

