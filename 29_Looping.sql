USE ADVENTUREWORKSLt
GO

CREATE TABLE SalesLT.DemoTable (Description nvarchar(max));

SELECT Description FROM SalesLT.DemoTable
TRUNCATE TABLE SalesLT.DemoTable

DECLARE @Counter INT = 1;
WHILE @Counter <= 5
BEGIN
	INSERT SalesLT.DemoTable(Description)
	VALUES ('ROW' + CONVERT(varchar(5), @Counter)) -- CONVERT(varchar(5) convierte a int
	SET @Counter = @Counter + 1
END

SELECT Description FROM SalesLT.DemoTable