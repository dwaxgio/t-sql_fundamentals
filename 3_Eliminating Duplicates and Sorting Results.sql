use adventureworkslt
GO

-- DISPLAY ALL COLORS AND DISTINCT COLORS WITH THE WORD NONE IF THE VALUE IS NULL SORTED BY COLOR
SELECT ISNULL(COLOR, 'None') AS Color FROM SalesLT.Product
ORDER BY Color;

SELECT DISTINCT ISNULL(COLOR, 'None') AS Color FROM SalesLT.Product
ORDER BY Color;

-- DISPLAY ALL COLORS AND DISTINCT COLORS WITH THE WORD NONE IF THE VALUE IS NULL AND A DASH IF THE SIZE IS NULL SORTED BY COLOR
SELECT DISTINCT ISNULL(COLOR, 'None') AS Color, ISNULL(Size, '-') AS Size
FROM SalesLT.Product
ORDER BY Color;

-- DISPLAY THE TOP 100 PRODUCTS BY LIST PRICE
SELECT TOP 100 NAME, ListPrice 
FROM SalesLT.Product 
ORDER BY ListPrice DESC

-- DISPLAY THE FIRST TEN PRODUCTS BY PRODUCT NUMBER
SELECT TOP 10 Name, ListPrice 
FROM SalesLT.Product 
ORDER BY ProductNumber 
--
SELECT Name, ListPrice 
FROM SalesLT.Product 
ORDER BY ProductNumber OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- DISPLAY THE NEXT TEN PRODUCTS BY PRODUCT NUMBER
SELECT Name, ListPrice
FROM SalesLT.Product
ORDER BY ProductNumber OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;
