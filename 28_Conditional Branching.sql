USE ADVENTUREWORKSLt
GO

-- SIMPLE LOGICAL TEST
IF 'Yes' = 'No'
	PRINT 'True'
ELSE
	PRINT 'False'

-- CHANGE CODE BASED ON A CONDITION
UPDATE SalesLT.Product
SET DiscontinuedDate = GETDATE()
WHERE ProductID = 1;

IF @@ROWCOUNT <1 -- Returns the number of rows affected by the last statement. 
	BEGIN
		PRINT 'Product was not found'
	END
ELSE
	BEGIN
		PRINT 'Product updated'
	END
