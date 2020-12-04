use adventureworkslt
go

CREATE VIEW SalesLT.vCustomerAddress
AS 
SELECT C.CustomerID, FirstName, LastName, AddressLine1, City, StateProvince
FROM SalesLT.Customer AS C
JOIN SalesLT.CustomerAddress AS CA
ON C.CustomerID = CA.CustomerID
JOIN SalesLT.Address AS A
ON CA.AddressID = A.AddressID;

-- QUERY THE VIEW
SELECT * FROM SalesLT.vCustomerAddress;

-- JOINING THE VIEW TO A TABLE
SELECT C.StateProvince, C.City, ISNULL(SUM(S.TotalDue), 0.00) AS Revenue
FROM SalesLT.vCustomerAddress AS C
LEFT JOIN SalesLT.SalesOrderHeader AS s
ON S.CustomerID = C.CustomerID
GROUP BY C.StateProvince, C.City
ORDER BY C.StateProvince, Revenue DESC;