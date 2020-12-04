use [AdventureWorksLT]
go

-- SCALAR FUNCTIONS
SELECT YEAR(SELLSTARTDATE) SellStartYear, ProductID, Name
FROM SalesLT.Product
ORDER BY SellStartYear;

SELECT YEAR(SELLSTARTDATe) SELLSTARTYEAR, DATENAME(MM, SellStartDate) SellStartMonth,
	DAY(SellStartDate) SellStartDay, DATENAME(DW, SELLSTARTDATE) SellStartDayWeekday,
	ProductID, Name
FROM SalesLT.Product
ORDER BY SellStartYear;

-- Datediff RETURNS THE DIFFERENCE BETWEEN TWO DATES
SELECT DATEDIFF(yy, SellStartDate, GETDATE()) YearSold, ProductID, Name
FROM SalesLT.Product
ORDER BY ProductID;

-- UPPER CHANGE TEXT TO UPERCASE
SELECT UPPER(Name) AS ProductName
FROM SalesLT.Product;

SELECT CONCAT(FirstName + ' ', LastName) AS FullName
FROM SalesLT.Customer;

SELECT Name, ProductNumber, LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product;

-- CHARINDEX SEARCHES FOR A SUBSTRING IN A STRING, AND RETURNS THE POSITION
SELECT Name, ProductNumber, LEFT(ProductNumber, 2) AS ProductType,
	SUBSTRING(ProductNumber, CHARINDEX('-', ProductNumber) +1, 4) AS ModelCode,
	SUBSTRING(ProductNumber, LEN(ProductNumber) - CHARINDEX('-', REVERSE(RIGHT(ProductNumber, 3))) + 2, 2) AS SizeCode
FROM SalesLT.Product;