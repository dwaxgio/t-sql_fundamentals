use [AdventureWorksLT]
go

SELECT c.SalesPerson, ISNULL(SUM(oh.SubTotal),00) SalesRevenue
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader oh
ON c.CustomerID = oh.CustomerID
GROUP BY c.SalesPerson
ORDER BY SalesRevenue DESC;

SELECT c.SalesPerson, CONCAT(c.FirstName + ' ', c.LastName) AS Customer, ISNULL(SUM(oh.SubTotal), 0.00) SalesRevenue
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader oh
ON c.CustomerID = oh.CustomerID
GROUP BY c.SalesPerson, CONCAT(c.FirstName + ' ', c.LastName)
ORDER BY SalesRevenue DESC, Customer;

