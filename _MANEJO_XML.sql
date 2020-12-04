--URL TUTORIAL: https://www.youtube.com/watch?v=Ckd9cPb6cLc&ab_channel=visoalgt

USE XML
GO

DECLARE @MyXML XML
SET @MyXML = 
'
<CATALOG>
<CD id="1">
<TITLE>Empire Burlesque</TITLE>
<ARTIST>Bob Dylan</ARTIST>
<COUNTRY>USA</COUNTRY>
<COMPANY>Columbia</COMPANY>
<PRICE>10.90</PRICE>
<YEAR>1985</YEAR>
</CD>
<CD>
<TITLE>Hide your heart</TITLE>
<ARTIST>Bonnie Tyler</ARTIST>
<COUNTRY>UK</COUNTRY>
<COMPANY>CBS Records</COMPANY>
<PRICE>9.90</PRICE>
<YEAR>1988</YEAR>
</CD>
<CD>
<TITLE>Greatest Hits</TITLE>
<ARTIST>Dolly Parton</ARTIST>
<COUNTRY>USA</COUNTRY>
<COMPANY>RCA</COMPANY>
<PRICE>9.90</PRICE>
<YEAR>1982</YEAR>
</CD>
<CD>
<TITLE>Still got the blues</TITLE>
<ARTIST>Gary Moore</ARTIST>
<COUNTRY>UK</COUNTRY>
<COMPANY>Virgin records</COMPANY>
<PRICE>10.20</PRICE>
<YEAR>1990</YEAR>
</CD>
<CD>
<TITLE>Eros</TITLE>
<ARTIST>Eros Ramazzotti</ARTIST>
<COUNTRY>EU</COUNTRY>
<COMPANY>BMG</COMPANY>
<PRICE>9.90</PRICE>
<YEAR>1997</YEAR>
</CD>
</CATALOG>

'
-- 1. Seleccionar etiqueta de xml, retorna resultado en XML
--SELECT @MyXML.query('/CATALOG/CD')
-- 1.2 Si quiero seleccionar un elemento con id específico
--SELECT @MyXML.query('(/CATALOG/CD)[2]') -- El [2] hace referencia al nodo encontrado, no al id

-- 2. XML.value toma valor que se especifique
-- 2.1 se declara variable para almacenar el valor
--DECLARE @ValorTomado varchar(100)
--SET @ValorTomado = @MyXML.value('(CATALOG/CD/TITLE)[3]', 'VARCHAR(100)')
--SELECT @ValorTomado

-- 3. Manejar datos en tabla
-- Se puede insertar una columna en tabla ya creada, y almacenar alli datos en xml
-- XML.Nodes: Lee nodo por nodo y convierte al tipo de dato requerido

SELECT 
	--CATALOGG = X.Item.Value ('@CATALOG','VARCHAR(100)'),
	--X.Y.value ('(CD)[1]','VARCHAR') AS CDINFO,
	X.Y.value ('(TITLE)[1]','VARCHAR(100)') AS TITLE,
	X.Y.value ('(ARTIST)[1]','VARCHAR(100)') AS ARTIST,
	X.Y.value ('(COUNTRY)[1]','VARCHAR(100)') AS COUNTRY,
	X.Y.value ('(COMPANY)[1]','VARCHAR(100)') AS COMPANY,
	X.Y.value ('(PRICE)[1]','VARCHAR(100)') AS PRICE,
	X.Y.value ('(YEAR)[1]','bigint') AS YEAR

--FROM @MyXML.nodes('(CATALOG/CD)[1]') AS X(Item)
--FROM @MyXML.nodes('CATALOG/CD/TITLE/ARTIST/COUNTRY/COMPANY/PRICE/YEAR') AS X(Item)
FROM @MyXML.nodes('/CATALOG/CD') AS X(Y)


-- 4. CONVERTIR DATOS EN LENGUAJE XML A ARREGLO DE FILAS Y COLUMNAS
-- con OpenXML

declare @i int --cuente elementos de xml
exec sp_xml_preparedocument @i output, @MyXML
--SELECT * FROM OPENXML(@i, '/CATALOG/CD/TITLE') WITH (TITLE NVARCHAR(100)) 
--SELECT * FROM OPENXML(@i, '(/CATALOG/CD/TITLE)[1]') WITH (TITLE NVARCHAR(100)) 
SELECT * FROM OPENXML(@i, '/CATALOG/CD') WITH (id NVARCHAR(100)) 
SELECT * FROM OPENXML(@i, '/CATALOG/CD') 