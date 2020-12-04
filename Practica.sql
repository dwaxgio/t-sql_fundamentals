USE AdventureWorksLT
GO

SELECT ProductID, name, color, size, color + size, size - size
FROM Saleslt.product;

select * from SalesLT.Product

select standardcost, listprice, standardcost + listprice, name + color
from saleslt.Product

-- casteo
SELECT CAST(ProductID as varchar(5)) + ': ' + Name as ProductName
FROM SalesLT.Product;
/*select productid + productname
from SalesLT.Product */

-- Convert
SELECT CONVERT(varchar(5), ProductID) + ': ' + Name as productname
from SalesLT.Product;

