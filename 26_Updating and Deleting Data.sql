USE ADVENTUREWORKSLT
GO

-- UPDATE A TABLE
UPDATE SalesLT.Callog
SET Notes = 'No notes'
WHERE Notes IS NULL;

SELECT * FROM SalesLT.Callog

-- UPDATE MULTIPLE COLUMNS
UPDATE SalesLT.Callog
SET SalesPerson = '', PhoneNumber = '';

SELECT * FROM SalesLT.Callog;

-- UPDATE FROM RESULTS OF A QUERY
UPDATE	SalesLT.Callog
SET SalesPerson = C.SalesPerson, PhoneNumber = C.Phone
FROM SalesLT.Customer AS C
WHERE C.CustomerID = SalesLT.Callog.CustomerID

SELECT * FROM SalesLT.Callog;

-- DELETE ROWS
DELETE FROM SalesLT.Callog
WHERE CallTime < DATEADD(dd, -7, GETDATE());

SELECT * FROM SalesLT.Callog;

-- TRUCATE TABLE
TRUNCATE TABLE SalesLT.Callog

SELECT * FROM SalesLT.Callog;
