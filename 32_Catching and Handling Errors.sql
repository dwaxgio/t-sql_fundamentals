use AdventureWorksLT
GO

-- CATCH AN ERROR
BEGIN TRY
	UPDATE SalesLT.Product
	SET ProductNumber = ProductID / ISNULL(Weight,0);
END TRY
BEGIN CATCH
	PRINT 'The following error occurred: ';
	PRINT ERROR_MESSAGE();
END CATCH

-- CATCH AND RETHROW
BEGIN TRY
	UPDATE SalesLT.Product
	SET ProductNumber = ProductID / ISNULL(Weight,0);
END TRY
BEGIN CATCH
	PRINT 'The following error occurred: ';
	PRINT ERROR_MESSAGE();
	THROW;
END CATCH

-- CATCH, LOG, AND THROW A CUSTOM ERROR
BEGIN TRY
	UPDATE SalesLT.Product
	SET ProductNumber = ProductID / ISNULL(Weight,0);
END TRY
BEGIN CATCH
	DECLARE @ErrorLogID AS INT, @ErrorMsg AS VARCHAR(250);
	EXECUTE dbo.uspLogError @ErrorLogID OUTPUT;
	SET @ErrorMsg = 'The update failed because of an error , View error #'
		+ CAST(@ErrorLogID AS VARCHAR)
		+ ' in the error log for details ';
	THROW 50001, @ErrorMSG, 0;
END CATCH

-- VIEW ERROR IN LOG
SELECT * FROM dbo.ErrorLog
