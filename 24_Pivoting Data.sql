USE AdventureWorksLT
GO

SELECT * FROM (SELECT P.ProductID, PC.Name, ISNULL(P.Color, 'Uncolored') AS Color
	FROM SalesLT.ProductCategory AS PC
	JOIN SalesLT.Product AS P
	ON PC.ProductCategoryID = P.ProductCategoryID
	) AS PPC
PIVOT (COUNT(ProductID) FOR Color IN ([Red], [Blue]))
ORDER BY Name;