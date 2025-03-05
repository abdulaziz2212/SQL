use lesson6;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DepartmentID INT NULL,
    Salary DECIMAL(10,2) NOT NULL
);
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50) NOT NULL,
    EmployeeID INT NULL,
    CONSTRAINT FK_Projects_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

--Write a query to get a list of employees along with their department names.
SELECT e.EmployeeID, e.Name, d.DepartmentName 
from Employees as e
join Departments as d
on e.DepartmentID = d.DepartmentID;

--Write a query to list all employees, including those who are not assigned to any department.
SELECT e.EmployeeID, e.Name, d.DepartmentName
from Employees as e
LEFT JOIN Departments as d
ON e.DepartmentID = d.DepartmentID;

--Write a query to list all departments, including those without employees.
SELECT d.DepartmentID, d.DepartmentName, e.EmployeeID, e.Name
FROM Departments AS d
LEFT JOIN Employees AS e ON e.DepartmentID = d.DepartmentID;

--Write a query to retrieve all employees and all departments, even if there’s no match between them.
select e.EmployeeID, e.Name, d.DepartmentName
from Employees as e
FULL OUTER JOIN Departments as d
ON e.DepartmentID = d.DepartmentID;

--Write a query to find the total salary expense for each department.
--solution 1
SELECT e.EmployeeID, e.Name, d.DepartmentName, 
       SUM(e.Salary) OVER (PARTITION BY e.DepartmentID) AS TotalDepartmentSalary
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID;

--solution 2
select d.DepartmentName, SUM(Salary) AS TotalDepartmentSalary
FROM Employees as e
JOIN Departments as d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

--Write a query to generate all possible combinations of departments and projects.
--solution 1
select *
FROM Employees
CROSS JOIN Departments;

--solution 2, although, in fact it is less common as it is implicit version of Cross Join, I added it for dicersity
select *
FROM Employees, Departments;

--Write a query to get a list of employees with their department names and 
--assigned project names. Include employees even if they don’t have a project.
select e.EmployeeID, e.Name, d.DepartmentName, p.ProjectName
FROM Employees as e
JOIN Departments as d
ON e.DepartmentID = d.DepartmentID
LEFT JOIN Projects as p
ON e.EmployeeID = p.EmployeeID;