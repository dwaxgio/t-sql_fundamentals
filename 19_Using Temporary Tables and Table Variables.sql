use adventureworkslt
go

-- TEMPORARY TABLES
CREATE TABLE #Colors (
	Color varchar(15)
	);

INSERT INTO #Colors
	SELECT DISTINCT Color FROM SalesLT.Product;

SELECT * FROM #Colors;

-- TABLE VARIABLE 
-- Se usa el @, y se puede definir como varios tipos, ejemplo, AS TABLE, se tiene que ejecutar todo el bloque 
DECLARE @Colors AS TABLE (
	Color varchar(15)
	);

INSERT INTO @Colors
	SELECT DISTINCT Color FROM SalesLT.Product;

SELECT * FROM @Colors;

-- NEW BATCH
SELECT * FROM #Colors; -- ESTÁ LIGADA A LA SESIÓN
SELECT * FROM @Colors; -- ESTÁ LIGADA AL LOTE -- NOW OUT OF SCOPE