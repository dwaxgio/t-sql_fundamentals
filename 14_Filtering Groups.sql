use [AdventureWorksLT]
go

SELECT ProductID, SUM(sod.OrderQty) AS QUANTITY
FROM SalesLT.SalesOrderDetail AS sod
JOIN SalesLT.SalesOrderHeader AS soh
ON sod.SalesOrderID = soh.SalesOrderID
WHERE YEAR(soh.OrderDate) = 2008
GROUP BY ProductID
HAVING SUM(sod.OrderQty) > 50;

-- HAVING APLICARIA SOBRE LA AGRUPACION, POR ELLO VA DESPUES DE GROUP BY
-- MIENTRAS QUE EL WHERE, ACTUA SOBRE FILAS O REGISTROS