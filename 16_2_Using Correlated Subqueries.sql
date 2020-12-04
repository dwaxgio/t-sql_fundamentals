use prueba
go

Create Table tblProducts
(
 [Id] int identity primary key,
 [Name] nvarchar(50),
 [Description] nvarchar(250)
)

Create Table tblProductSales
(
 Id int primary key identity,
 ProductId int foreign key references tblProducts(Id),
 UnitPrice int,
 QuantitySold int
)

Insert into tblProducts values ('TV', '52 inch black color LCD TV')
Insert into tblProducts values ('Laptop', 'Very thin black color acer laptop')
Insert into tblProducts values ('Desktop', 'HP high performance desktop')

Insert into tblProductSales values(3, 450, 5)
Insert into tblProductSales values(2, 250, 7)
Insert into tblProductSales values(3, 450, 4)
Insert into tblProductSales values(3, 450, 9)

select * from tblProducts;
select * from tblProductSales;

-- QUERY PARA CONOCER PRODUCTOS QUE no SE HAN VENDIDO AL MENOS UNA VEZ (ID PRODUCTO 1 NO SE ENCUENTRA EN TABLA TBLPRODUCTSALES)
SELECT Id, [Name], [Description]
FROM tblProducts
WHERE Id NOT IN (SELECT DISTINCT ProductID FROM tblProductSales);

-- QUERY PARA CONOCER NOMBRE DEL PRODUCTO Y LA CANTIDAD VENDIDA DE CADA UNO

SELECT T1.Name, (
	SELECT SUM(QuantitySold) FROM tblProductSales AS T2 	WHERE t2.ProductId = t1.Id) AS QuantitySold
FROM tblProducts AS T1

SELECT Name, 
	(SELECT SUM(QuantitySold) FROM tblProductSales WHERE ProductId = tblProducts.Id) AS QtySold
FROM tblProducts
order by name;

--NOTA: No puedo usar campos llamados en el query interno en el externo, dado que arroja erro

-- QUERYS CORELACIONADAS (EL RESULTADO DEL QUERY interior no se puede ejecutar independientemente)
select * from tblProducts;
select * from tblProductSales;

-- Seleccionar productos que no se han vendido al menos una vez
-- Nota: En el subquery, solor retornar una columna, con un valor, ya que este se analiza fila a fila con el query externo
-- Nota 2: El subquery se ejecuta primero
Select Id, Name, Description
FROM tblProducts
WHERE Id NOT IN (Select DISTINCT ProductID FROM tblProductSales);

-- Seleccionar productos y sus cantidades vendidas
SELECT Name, Description, 
	(SELECT SUM(QuantitySold) FROM tblProductSales WHERE tblproducts.ID = ProductId)
FROM tblProducts
ORDER BY Name;