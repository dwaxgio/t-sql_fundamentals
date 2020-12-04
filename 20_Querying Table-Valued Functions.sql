use adventureworkslt
go

CREATE FUNCTION SalesLT.udfCustomersByCity (@City AS VARCHAR(50))
RETURNS TABLE
AS
RETURN 
	(SELECT C.CustomerID, FirstName, LastName, AddressLine1, AddressLine2, City, StateProvince
	FROM SalesLT.Customer AS C 
	JOIN SalesLT.CustomerAddress AS CA 	ON C.CustomerID = CA.CustomerID
	JOIN SalesLT.Address AS A ON CA.AddressID = A.AddressID
	WHERE City = @City);

SELECT * FROM SalesLT.udfCustomersByCity('Bellevue');