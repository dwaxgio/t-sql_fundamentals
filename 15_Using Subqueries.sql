use [AdventureWorksLT]
go

-- DISPLAY A LIST OF PRODUCTS WHOSE LIST PRICE IS HIGHER THAN THE HIGHEST SALESORDERDETAIL
SELECT MAX(UnitPrice) FROM SalesLT.SalesOrderDetail;

SELECT * FROM SalesLT.Product
WHERE ListPrice > 1466.01;

SELECT * FROM SalesLT.Product
WHERE ListPrice >
	(SELECT MAX(UnitPrice) FROM SalesLT.SalesOrderDetail);