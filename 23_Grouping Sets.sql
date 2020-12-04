use adventureworksLT
GO

SELECT cat.ParentProductCategoryName, cat.ProductCategoryName, count(prd.ProductID) AS Products
FROM SalesLT.vGetAllCategories AS cat
LEFT JOIN SalesLT.Product AS prd
ON prd.ProductCategoryID = cat.ProductCategoryID
-- GROUP BY cat.ParentProductCategoryName, cat.ProductCategoryName
-- GROUP BY GROUPING SETS (cat.ParentProductCategoryName, cat.ProductCategoryName, ()) -- () significa gran total
-- GROUP BY ROLLUP (cat.ParentProductCategoryName, cat.ProductCategoryName) -- Gran total y sub gran total
-- GROUP BY CUBE (cat.ParentProductCategoryName, cat.ProductCategoryName) -- Gran total y todas las combinaciones
ORDER BY cat.ParentProductCategoryName, cat.ProductCategoryName;
