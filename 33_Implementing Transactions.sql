use AdventureWorksLT
GO

--NO TRANSACION
BEGIN TRY 
	INSERT INTO SalesLT.SalesOrderHeader (DueDate, CustomerID, ShipMethod)
	VALUES (DATEADD (dd, 7, GETDATE()), 1, 'STD DELIVERY');

	DECLARE @SalesOrderID INT = SCOPE_IDENTITY();

	INSERT INTO SalesLT.SalesOrderDetail (SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
	VALUES (@SalesOrderID, 1, 99999, 1431.50, 0.00);
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE();
END CATCH

-- VIEW ORPHANED ORDERS
SELECT H.SalesOrderID, H.DueDate, H.CustomerID, H.ShipMethod, D.SalesOrderDetailID
FROM SalesLT.SalesOrderHeader AS H
LEFT JOIN SalesLT.SalesOrderDetail AS D
ON D.SalesOrderID = H.SalesOrderID
WHERE D.SalesOrderDetailID IS NULL;

-- MANUALLY DELETE ORPHANED RECORD
DELETE FROM SalesLT.SalesOrderHeader
WHERE SalesOrderID = SCOPE_IDENTITY();

GO

-- USE A TRANSACTION
BEGIN TRY
	BEGIN TRANSACTION
		INSERT INTO SalesLT.SalesOrderHeader (DueDate, CustomerID, ShipMethod)
		VALUES (DATEADD (dd, 7, GETDATE()), 1, 'STD DELIVERY');

		DECLARE @SalesOrderID INT = SCOPE_IDENTITY();

		INSERT INTO SalesLT.SalesOrderDetail (SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
		VALUES (@SalesOrderID, 1, 99999, 1431.50, 0.00);
END TRY
BEGIN CATCH
	IF @@ROWCOUNT < 1
	BEGIN
		PRINT XACT_STATE();
		ROLLBACK TRANSACTION;
	END
	PRINT ERROR_MESSAGE();
	THROW 50001, 'An insert failed. The transaction was cancelled. ', 0;
END CATCH;

-- VIEW ORPHANED ORDERS
SELECT H.SalesOrderID, H.DueDate, H.CustomerID, H.ShipMethod, D.SalesOrderDetailID
FROM SalesLT.SalesOrderHeader AS H
LEFT JOIN SalesLT.SalesOrderDetail AS D
ON D.SalesOrderID = H.SalesOrderID
WHERE D.SalesOrderDetailID IS NULL;

-- USE XACT_ABORT
SET XACT_ABORT ON;
BEGIN TRY
	BEGIN TRANSACTION
		INSERT INTO SalesLT.SalesOrderHeader (DueDate, CustomerID, ShipMethod)
		VALUES (DATEADD (dd, 7, GETDATE()), 1, 'STD DELIVERY');

		DECLARE @SalesOrderID INT = SCOPE_IDENTITY();

		INSERT INTO SalesLT.SalesOrderDetail (SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
		VALUES (@SalesOrderID, 1, 99999, 1431.50, 0.00);
END TRY
BEGIN CATCH
	IF @@ROWCOUNT < 1
	BEGIN
		PRINT XACT_STATE();
		ROLLBACK TRANSACTION;
	END
	PRINT ERROR_MESSAGE();
	THROW 50001, 'An insert failed. The transaction was cancelled. ', 0;
END CATCH;

-- VIEW ORPHANED ORDERS
SELECT H.SalesOrderID, H.DueDate, H.CustomerID, H.ShipMethod, D.SalesOrderDetailID
FROM SalesLT.SalesOrderHeader AS H
LEFT JOIN SalesLT.SalesOrderDetail AS D
ON D.SalesOrderID = H.SalesOrderID
WHERE D.SalesOrderDetailID IS NULL;











