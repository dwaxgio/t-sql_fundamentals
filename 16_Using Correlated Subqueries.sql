USE ADVENTUREWORKSLT
GO

-- FOR EACH CUSTOMER LIST ALL SALES ON THE LAST DAY THAT THEY MADE A

SELECT CustomerID, SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader AS SO1
ORDER BY CustomerID, OrderDate;

SELECT CustomerID, SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader AS SO1
WHERE OrderDate = 
	(SELECT MAX(OrderDate)
	FROM SalesLT.SalesOrderDetail)
ORDER BY CustomerID;

select * from SalesLT.SalesOrderHeader
order by CustomerID;

SELECT CustomerID, SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader AS SO1
WHERE OrderDate = 
	(SELECT MAX(OrderDate)
	FROM SalesLT.SalesOrderHeader AS SO2
	WHERE SO2.CustomerID = SO1.CustomerID) -- Está retornando un valor por clienteid
ORDER BY CustomerID;

