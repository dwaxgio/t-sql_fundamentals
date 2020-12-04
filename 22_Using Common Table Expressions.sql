use adventureworkslt
go


-- USING A COMMON TABLE EXPRESSION (CTE)
WITH ProductsByCategory (ProductID, ProductName, Category)
AS
(
	SELECT	p.ProductID, p.Name, c.Name AS Category
	FROM SalesLT.Product AS p
	JOIN SalesLT.ProductCategory AS c
	ON p.ProductCategoryID = c.ProductCategoryID
)

SELECT Category, COUNT(ProductID) AS Products
FROM ProductsByCategory
GROUP BY Category
ORDER BY Category;

-- RECURSIVE CTE
SELECT * FROM SalesLT.Employee

-- Using the CTE TO PERFOM RECURSION
WITH OrgReport (ManagerID, EmployeeID, EmployeeName, Level)
AS
(
	--ANCHOR QUERY
	SELECT e.ManagerID, e.EmployeeID, EmployeeName, 0
	FROM SalesLT.Employee AS e
	WHERE ManagerID IS NULL

	UNION ALL

	-- RECURSIVE QUERY
	SELECT e.ManagerID, e.EmployeeID, e.EmployeeName, Level + 1
	FROM SalesLT.Employee AS e
	INNER JOIN OrgReport AS o ON e.ManagerID = o.EmployeeID
);

SELECT * FROM OrgReport
OPTION (MAXRECURSION 3);