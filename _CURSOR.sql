use adventureworks2017
go

--
DECLARE @Description AS nvarchar(400)
DECLARE ProdInfo CURSOR FOR -- Se declara cursor
	SELECT [Description] FROM Production.ProductDescription -- Select a la tabla que se le quiere hacer algo

OPEN ProdInfo -- se abre cursor
FETCH NEXT FROM ProdInfo -- Se le indica al cursor que vaya al siguiente registro que esta en la tabla indicada, verifica uno a uno
INTO @Description
WHILE @@fetch_status = 0 -- @@fetch_status Verifica la existencia de la línea leída
BEGIN
	PRINT @Description
	FETCH NEXT FROM ProdInfo -- Fetch next devolverá la próxima fila de datos, siempre que la misma exista
INTO @Description
END

CLOSE ProdInfo -- Se cierra el cursor
DEALLOCATE ProdInfo -- Se libera espacio en RAM utilizado por cursor

--


select * from Person.person

create table empleado2 (nombre nvarchar(max));

select * from empleado2;

--
DECLARE @NombreEmpleado AS nvarchar(400)
DECLARE PasoNombre CURSOR FOR
	SELECT FirstName FROM Person.Person

OPEN PasoNombre
FETCH NEXT FROM PasoNombre
INTO @NombreEmpleado

WHILE @@FETCH_STATUS = 0
BEGIN
	INSERT INTO empleado2 VALUES(@NombreEmpleado)
	FETCH NEXT FROM PasoNombre
	INTO @NombreEmpleado
END

CLOSE PasoNombre
DEALLOCATE ProdInfo


select * from empleado2;

--

DECLARE @Ruta AS nvarchar(400)
DECLARE ProdInfo CURSOR FOR -- Se declara cursor
	SELECT link FROM ruta -- Select a la tabla que se le quiere hacer algo

OPEN ProdInfo -- se abre cursor
FETCH NEXT FROM ProdInfo -- Se le indica al cursor que vaya al siguiente registro que esta en la tabla indicada, verifica uno a uno
INTO @DRuta
WHILE @@fetch_status = 0 -- @@fetch_status Verifica la existencia de la línea leída
BEGIN
	SELECT [dbo].[EjecutaConsulta]( @Ruta)
	FETCH NEXT FROM ProdInfo -- Fetch next devolverá la próxima fila de datos, siempre que la misma exista
INTO @Description
END

CLOSE ProdInfo -- Se cierra el cursor
DEALLOCATE ProdInfo -- Se libera espacio en RAM utilizado por cursor

--

create table #temporal1 (link nvarchar(max))
truncate table #temporal1

insert into #temporal1 values ('http://vivantov2.unidadvictimas.gov.co/SERVICIODINAMICO/SERVICIODINAMICO.SVC/CONSULTA/60069/D4BAE27E71A34A37A1DCC9291E0F27BC/446/agendamientoruv12b,220001,40441135,,,,')
insert into #temporal1 values ('http://vivantov2.unidadvictimas.gov.co/SERVICIODINAMICO/SERVICIODINAMICO.SVC/CONSULTA/60069/D4BAE27E71A34A37A1DCC9291E0F27BC/446/agendamientoruv12b,220002,1126422349,,,,')
insert into #temporal1 values ('http://vivantov2.unidadvictimas.gov.co/SERVICIODINAMICO/SERVICIODINAMICO.SVC/CONSULTA/60069/D4BAE27E71A34A37A1DCC9291E0F27BC/446/agendamientoruv12b,220003,96042121450,,,,')

DECLARE @Ruta AS nvarchar(400)
DECLARE ProdInfo CURSOR FOR -- Se declara cursor
	SELECT link FROM #temporal1 -- Select a la tabla que se le quiere hacer algo

OPEN ProdInfo -- se abre cursor
FETCH NEXT FROM ProdInfo -- Se le indica al cursor que vaya al siguiente registro que esta en la tabla indicada, verifica uno a uno
INTO @Ruta
WHILE @@fetch_status = 0 -- @@fetch_status Verifica la existencia de la línea leída
BEGIN
	SELECT [dbo].[EjecutaConsulta](@Ruta)
	FETCH NEXT FROM ProdInfo -- Fetch next devolverá la próxima fila de datos, siempre que la misma exista
INTO @Ruta
END

CLOSE ProdInfo -- Se cierra el cursor
DEALLOCATE ProdInfo -- Se libera espacio en RAM utilizado por cursor

--

use indemnizav3
go

create table #temporal1 (link nvarchar(max))
truncate table #temporal1

insert into #temporal1 values ('http://vivantov2.unidadvictimas.gov.co/SERVICIODINAMICO/SERVICIODINAMICO.SVC/CONSULTA/60069/D4BAE27E71A34A37A1DCC9291E0F27BC/446/agendamientoruv12b,220001,40441135,,,,')

select * from #temporal1

DECLARE @Ruta AS nvarchar(400)
DECLARE CursorValida CURSOR FOR -- Se declara cursor
	SELECT link FROM #temporal1 -- Select a la tabla que se le quiere hacer algo

OPEN CursorValida -- se abre cursor
FETCH NEXT FROM CursorValida -- Se le indica al cursor que vaya al siguiente registro que esta en la tabla indicada, verifica uno a uno
INTO @Ruta
WHILE @@fetch_status = 0 -- @@fetch_status Verifica la existencia de la línea leída
BEGIN
	SELECT [dbo].[EjecutaConsulta]('' + @Ruta + '')
	FETCH NEXT FROM CursorValida -- Fetch next devolverá la próxima fila de datos, siempre que la misma exista
INTO @Ruta
END

CLOSE CursorValida -- Se cierra el cursor
DEALLOCATE CursorValida -- Se libera espacio en RAM utilizado por cursor
