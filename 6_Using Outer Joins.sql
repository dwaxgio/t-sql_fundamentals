use adventureworkslt
go

-- GET ALL CUSTOMERS, WITH SALES ORDERS FOR THOSE WHO'VE BOUGHT ANYTHING
SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
FROM SalesLT.Customer AS c
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
ORDER BY c.CustomerID;

-- RETURN ONLY CUSTOMERS WHO HAVEN´T PURCHASED ANYTHING
SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
FROM SalesLT.Customer AS c
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
WHERE oh.CustomerID IS NULL
ORDER BY c.CustomerID;

-- MORE THAN 2 TABLES
SELECT p.Name AS ProductName, oh.SalesOrderNumber
FROM SalesLT.Product AS p
LEFT JOIN SalesLT.SalesOrderDetail AS od
ON p.ProductID = od.ProductID
LEFT JOIN SalesLT.SalesOrderHeader AS oh -- ADDITIONAL TABLES ADDED TO THE RIGHT MUST ALSO HAVE TO BE THE SAME TYPE OF JOIN, LIKE IN THIS CASE 'LEFT JOIN
ON od.SalesOrderID = oh.SalesOrderID
ORDER BY p.ProductID;

-- NOTE: DOESN´T MATTER IF I USE 'LEFT OUTER JOIN' OR 'LEFT JOIN', IT RETREIVES THE SAME INFORMATION DEPENDING ON THE MATCH

-- MULTIPLE JOINS
SELECT p.Name AS ProductName, oh.SalesOrderNumber
FROM SalesLT.Product AS p
LEFT JOIN SalesLT.SalesOrderDetail AS od
ON p.ProductID = od.ProductID
LEFT JOIN SalesLT.SalesOrderHeader AS oh
ON od.SalesOrderID = oh.SalesOrderID
INNER JOIN SalesLT.ProductCategory AS c -- ADDED TO THE LEFT, SO CAN USE INNER JOIN
ON p.ProductCategoryID = c.ProductCategoryID
ORDER BY p.ProductID;


-- MULTIPLE JOINS
SELECT p.Name AS ProductName, oh.SalesOrderNumber
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS c -- ADDED TO THE LEFT, SO CAN USE INNER JOIN
ON p.ProductCategoryID = c.ProductCategoryID
LEFT JOIN SalesLT.SalesOrderDetail AS od
ON p.ProductID = od.ProductID
LEFT JOIN SalesLT.SalesOrderHeader AS oh
ON od.SalesOrderID = oh.SalesOrderID
ORDER BY p.ProductID;

