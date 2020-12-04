use adventureworkslt
go

-- BASIC INNER JOIN
-- Esquema.tabla.columna
SELECT SalesLT.Product.Name AS ProductName, SalesLT.ProductCategory.Name AS Category
FROM SalesLT.Product
INNER JOIN SalesLT.ProductCategory
ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID;

-- TABLE ALIASES
SELECT p.Name AS ProductName, c.Name AS Category
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS c
ON p.ProductCategoryID = c.ProductCategoryID;

--JOINING MORE THAN 2 TABLES
SELECT oh.OrderDate, oh.SalesOrderNumber, p.Name AS ProductName, od.OrderQty, od.UnitPrice, od.LineTotal
FROM SalesLT.SalesOrderHeader AS oh
INNER JOIN SalesLT.SalesOrderDetail AS od
ON oh.SalesOrderID = od.SalesOrderID
INNER JOIN SalesLT.Product AS p
ON od.ProductID = p.ProductID
ORDER BY oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID;

-- MULTIPLE JOIN PREDICATES
SELECT oh.OrderDate, oh.SalesOrderNumber, p.Name AS ProductName, od.OrderQty, od.UnitPrice, od.LineTotal
FROM SalesLT.SalesOrderHeader AS oh
INNER JOIN SalesLT.SalesOrderDetail AS od
ON oh.SalesOrderID = od.SalesOrderID
INNER JOIN SalesLT.Product AS p
ON od.ProductID = p.ProductID AND od.UnitPrice < p.ListPrice --Note multiple predicates
ORDER BY oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID
