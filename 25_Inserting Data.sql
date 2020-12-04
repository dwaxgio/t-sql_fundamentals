USE ADVENTUREWORKSLT
GO

-- CREATE TABLE FOR THE DEMO
CREATE TABLE SalesLT.Callog
(
	CallID int IDENTITY PRIMARY KEY NOT NULL,
	CallTime datetime NOT NULL DEFAULT GETDATE(),
	SalesPerson nvarchar(256) NOT NULL,
	CustomerID int NOT NULL REFERENCES SalesLT.Customer(CustomerID),
	PhoneNumber nvarchar(25) NOT NULL,
	Notes nvarchar(max) NULL
)
GO

-- INSERT A ROW
INSERT INTO SalesLT.Callog
VALUES ('2015-01-01T12:30:00', 'adventure-works\pamela0', 1, '3105321140', 'Returning call re: enquery about delivery')

SELECT * FROM SalesLT.Callog

-- INSERT DEFAULTS AND NULLS
INSERT INTO SalesLT.Callog
VALUES (DEFAULT, 'adventure-works\jhon8', 2, '3174014490', NULL)

SELECT * FROM SalesLT.Callog


-- INSERT A ROW WITH EXPLICIT COLUMNS
INSERT INTO SalesLT.Callog (SalesPerson, CustomerID, PhoneNumber)
VALUES ('adventure-works\jenny25', 3, '300000012')

SELECT * FROM SalesLT.Callog

-- INSERT MULTIPLE ROWS
INSERT INTO SalesLT.Callog
VALUES (DATEADD(mi, -2, GETDATE()), 'adventure-works\olga5', 4, '3124132751', NULL),
	(DEFAULT, 'adventure-works\fab4', 5, '300120485', 'Called to arrange deliver of order 10987');

SELECT * FROM SalesLT.Callog

-- INSERT THE RESULTS OF A QUERY - insert into, luego especifico los campos, luego un select con los campos deseado
-- y que se van a insertar en el insert
INSERT INTO SalesLT.Callog (SalesPerson, CustomerID, PhoneNumber, Notes)
SELECT SalesPerson, CustomerID, Phone, 'Sales promotion call'
FROM SalesLT.Customer
WHERE CompanyName = 'Big-Time Bike Store';

SELECT * FROM SalesLT.Callog

-- RETRIEVING INSERTED IDENTITY
INSERT INTO SalesLT.Callog (SalesPerson, CustomerID, PhoneNumber)
VALUES ('adventure-works\jose1', 10, '10757393');

SELECT SCOPE_IDENTITY(); -- TRAE EL ÚLTIMO ID DE LA SESIÓN

SELECT * FROM SalesLT.Callog

-- OVERRIDING IDENTITY
SET IDENTITY_INSERT SalesLT.Callog ON; -- HABILITA PARA QUE SE PUEDA HACER INSERTS EN LA PRIMARY KEY o IDENTITY

INSERT INTO SalesLT.Callog (CallID, SalesPerson, CustomerID, PhoneNumber)
VALUES (9, 'adventure-works\jose1', 11, '10757393')

SET IDENTITY_INSERT SalesLT.Callog OFF;

SELECT * FROM SalesLT.Callog

