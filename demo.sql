-- Create a new table called 'Employees' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
DROP TABLE dbo.Employees
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Employees
(
    Id INT NOT NULL PRIMARY KEY, -- primary key column
    Name [NVARCHAR](50) NOT NULL,
    Salary INT NOT NULL,
    Departmentid INT NOT NULL
    -- specify more columns here
);
GO

;
-- Insert rows into table 'Employees'
INSERT INTO Employees
   ([Id],[Name],[Salary],[Departmentid])
VALUES
   ( 1, N'Joe', 70000, 1),
   ( 2, N'Jim', 90000,1),
   ( 3, N'Henry', 80000,2),
   ( 4, N'Sam', 60000,2),
   ( 5, N'Max', 90000,1)
GO
-- Query the total value of employees
Select * from Employees

-- Create table Deparment
CREATE TABLE dbo.Department 
(
        Id INT NOT NULL PRIMARY KEY,
        Name [NVARCHAR](50) NOT NULL
);

-- Insert rows into table 'Department'
INSERT INTO Department
    ([Id],[Name])
VALUES
    (1, N'IT'),
    (2, N'Sales')
-- Query the total value of Department
Select * FROM Department

-- Query employees who have the highest salary in each of departments
Select d.Name as "Department", e.Name as "Employee", e.Salary FROM Employees e join Department d on e.Departmentid = d.Id 
Where e.Salary IN (
    Select max(Salary) from Employees e join Department d on e.Departmentid = d.Id 
    Group by d.Id)
Order by Salary DESC

-- (2) CHECK OVERLAPPING TIMEFRAME




-- (3) Consecutive Numbers

Create Table dbo.Logs
(
    Id INT NOT NULL PRIMARY KEY,
    Num INT NOT NULL
)
INSERT INTO Logs
VALUES
    (1,1),
    (2,1),
    (3,1),
    (4,2),
    (5,1),
    (6,2),
    (7,2)

-- Query to find numbers that appear at least 3 times consecutively
Select DISTINCT l1.Num
From 
    Logs l1,
    Logs l2,
    Logs l3
WHERE 
    l1.Id = l2.Id -1
    AND l2.Id = l3.Id - 1
    And l1.Num = l2.Num 
    AND l2.Num = l3.Num

-- (4) Write a query to display the records with consecutive id and the number of people >=100

CREATE TABLE dbo.Stadium
(
    id INT NOT NUll PRIMARY KEY,
    visit_date DATE,
    people INT NOT NULL
);

INSERT INTO Stadium
VALUES
    (1, '2017-01-01', 10),
    (2, '2017-01-02',109),
    (3, '2017-01-03',150),
    (4, '2017-01-04',99),
    (5, '2017-01-05',145),
    (6, '2017-01-06',1455),
    (7, '2017-01-07',199),
    (8, '2017-01-09',188)
SELECT * FROM Stadium