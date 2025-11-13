--drop table if exits
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (  
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);    --created dept table


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DeptID INT,
    Salary DECIMAL(10, 2) NOT NULL,
    HireDate DATE,
    ManagerID INT,
    
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
       CHECK (Salary > 0)
);    --created emp table


INSERT INTO Departments (DeptID, DeptName, Location) VALUES
(10, 'Sales', 'New York'),
(20, 'IT', 'London'),
(30, 'HR', 'New York'),
(40, 'Finance', 'Chicago');

INSERT INTO Employees (EmployeeID, FirstName, LastName, DeptID, Salary, HireDate, ManagerID) VALUES
(1001, 'Alex', 'Smith', 10, 85000.00, '2020-01-15', NULL),   -- CEO / Top Manager
(1002, 'Betty', 'Johnson', 20, 95000.00, '2019-05-20', 1001), -- IT Manager
(1003, 'Charlie', 'Brown', 10, 60000.00, '2021-11-01', 1001), -- Sales Supervisor
(1004, 'David', 'Lee', 20, 72000.00, '2022-03-10', 1002),
(1005, 'Eva', 'Green', 30, 55000.00, '2023-07-25', 1001),
(1006, 'Frank', 'White', 40, 110000.00, '2018-12-01', 1001),
(1007, 'Grace', 'Hall', 20, 78000.00, '2022-08-15', 1002),
(1008, 'Henry', 'King', 10, 62000.00, '2023-01-20', 1003);


UPDATE Employees
SET Salary = 100000.00
WHERE EmployeeID = 1006;

SELECT E.FirstName, E.LastName, D.DeptName
 FROM Employees E
INNER JOIN Departments D ON E.DeptID = D.DeptID
ORDER BY D.DeptName;


SELECT D.DeptName, AVG(E.Salary) AS AverageSalary
FROM Employees E
INNER JOIN Departments D ON E.DeptID = D.DeptID
GROUP BY D.DeptName
HAVING AVG(E.Salary) > 70000.00; 


SELECT E.FirstName AS EmployeeName, M.FirstName AS ManagerName
FROM Employees E
LEFT JOIN Employees M ON E.ManagerID = M.EmployeeID;


SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);


WITH RecentHires AS (
    SELECT FirstName, LastName, HireDate
    FROM Employees
    WHERE HireDate >= '2024-11-14' 
)

SELECT * FROM RecentHires;

SELECT FirstName, LastName, Salary,
CASE
WHEN Salary >= 90000 THEN 'High Earner'
WHEN Salary >= 65000 THEN 'Mid-Range'
ELSE 'Junior'
END AS SalaryCategory
FROM Employees
ORDER BY Salary DESC;