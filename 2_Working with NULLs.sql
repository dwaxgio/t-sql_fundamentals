-- NULL numbers = 0
SELECT Name, ISNULL(TRY_CAST(Size AS Integer),0) AS NumericSize
FROM SalesLT.Product;

-- NULL Strings = blank string
SELECT ProductNumber, ISNULL(Color, '') + ', ' + ISNULL(Size, '') AS ProductDetails
FROM SalesLT.Product;

-- Multi color = NULL
SELECT Name, NULLIF(Color, 'Multi') AS SingleColor
FROM SalesLT.Product;

-- Find first non-null date
SELECT Name, COALESCE(DiscontinuedDate, SellEndDate, SellStartDate) AS LastActivity
FROM SalesLT.Product;

select name, discontinueddate, sellenddate, sellstartdate as lastactivity
from SalesLT.Product;

-- Searched case
SELECT Name, 
	CASE	
		WHEN SellEndDate IS NULL THEN 'On Sale'
		ELSE 'Discontinued'
	END AS SalesStatus
FROM SalesLT.Product;

-- Simple Case
SELECT Name,
	CASE Size
		WHEN 'S' THEN 'Small'
		WHEN 'M' THEN 'Medium'
		WHEN 'L' THEN 'Large'
		WHEN 'XL' THEN 'Extra Large'
		ELSE ISNULL(Size, 'n/a')
	END AS ProductSize
FROM SalesLT.Product;

