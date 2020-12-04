use adventureworkslt
go

-- CROSS JOIN (RECOMENDED TO GENERATE RANDOM DATES WITH ALL THE POSIBLE COMBINATIONS BETWEEN TABLES)
-- CALL EACH CUSTOMER ONCE PER PRODUCT
SELECT p.Name, c.FirstName, c.LastName, c.Phone
FROM SalesLT.Product AS p
CROSS JOIN SalesLT.Customer AS c;

-- SELF JOINS (USE WHEN FOR EXAMPLE, YOU HAVE TWO COLUMNS WITH DIFERENT ID'S)
-- CREATE TABLE
CREATE TABLE SalesLT.Employee (
	EmployeeID int IDENTITY PRIMARY KEY,
	EmployeeName nvarchar(256),
	ManagerID int );
GO
-- INSERT INFORMATION (GET SALESPERSON FROM CUSTOMER TABLE AND GENERATE MANAGERS)
INSERT INTO SalesLT.Employee (EmployeeName, ManagerID)
SELECT DISTINCT SalesPerson, NULLIF(CAST(RIGHT(SalesPerson, 1) AS int), 0)
FROM SalesLT.Customer;
GO
UPDATE SalesLT.Employee
SET ManagerID = 
	(SELECT MIN(EmployeeID) FROM SalesLT.Employee WHERE ManagerID IS NULL)
WHERE ManagerID IS NULL
AND EmployeeID > 
	(SELECT MIN(EmployeeID) FROM SalesLT.Employee WHERE	ManagerID IS NULL);
GO

-- THE ACTUAL SELF JOIN
SELECT e.EmployeeName, m.EmployeeName AS ManagerName
FROM SalesLT.Employee AS e
LEFT JOIN SalesLT.Employee AS m
ON e.ManagerID = m.EmployeeID
ORDER BY e.ManagerID;

SELECT * FROM SalesLT.Employee;

