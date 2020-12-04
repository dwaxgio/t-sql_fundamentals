USE ADVENTUREWORKSLt
go

-- SEARCH BY CITY USING A VARIABLE
DECLARE @City VARCHAR(20) = 'Toronto'
Set @City = 'Bellevue' -- ESTABLECE NUEVO VALOR PARA VARIABLE @City

-- GO -- BATCH O BLOQUE DE CÓDIGO, SI LO ELIMINO, EL BLOQUE ANTERIOR SE UNE CON EL SIGUIENTE CONFORMANDO UNO SOLO

SELECT FirstName + ' ' + LastName AS [Name], AddressLine1 AS Address, City
FROM SalesLT.Customer AS C
JOIN SalesLT.CustomerAddress AS CA
ON C.CustomerID = CA.CustomerID
JOIN SalesLT.Address AS A
ON CA.AddressID = A.AddressID
WHERE City = @City

-- USE A VARIABLE AS AN OUTPUT
DECLARE @Result MONEY
SELECT @Result = MAX(TotalDue)
FROM SalesLT.SalesOrderHeader

PRINT @Result;

