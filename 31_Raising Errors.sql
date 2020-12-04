use AdventureWorksLT
GO

select * from sys.messages -- Tabla que cointiene los mensajes de 'error' manejados por SQL Server

--VIEW A SYSTEM ERROR
INSERT INTO SalesLT.SalesOrderDetail (SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
VALUES (100000, 1, 680, 1431.50, 0.00 )

-- RAISE AN ERROR WITH RAISERROR
UPDATE SalesLT.Product
SET DiscontinuedDate = GETDATE()
WHERE ProductID = 0;

IF @@ROWCOUNT < 1
	RAISERROR('The producto was not found - no products have been updated', 16, 0);

-- RAISE AN ERROR WITH RAISERROR
UPDATE SalesLT.Product
SET DiscontinuedDate = GETDATE()
WHERE ProductID = 0;

IF @@ROWCOUNT < 1
	THROW 50001, 'The producto was not found - no products have been updated', 0;