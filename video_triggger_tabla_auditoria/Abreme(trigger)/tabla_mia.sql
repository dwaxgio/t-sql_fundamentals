USE TRIGGER_AUDITORIA
GO

CREATE TABLE PACIENTE (
	DOCUMENTO CHAR(13) NOT NULL,
	NOMBRES CHAR(70) NOT NULL,
	APELLIDOS CHAR(70) NOT NULL,
	DIRECCION CHAR(30) NOT NULL,
	TELEFONO CHAR(15) NOT NULL
);

CREATE TABLE ESPECIALIDAD (
	CODIGO_ES CHAR(1) NOT NULL,
	DIA_HOR CHAR(10) NULL,
	DESCRIPCION_ES CHAR(30) NOT NULL
);

-- TABLA AUDITORIA -- MUESTRA SI SE INSERTAN O ELIMINAN REGISTROS DE LA TABLA PACIENTE O ESPECIALIDAD 
-- LO ANTERIOR, SE LOGRA MEDIANTE LOS TRIGGERS (DISPARADORES)
CREATE TABLE AUDITORIA (
	CODIGO_AU INT IDENTITY(1,1) PRIMARY KEY,
	USUARIO_AU VARCHAR(29) NOT NULL,
	TABLA VARCHAR(20) NOT NULL,
	ACCION VARCHAR(20) NOT NULL,
	REGISTRO VARCHAR(12) NOT NULL,
	NOMBRE VARCHAR(70) NOT NULL,
	DESCRIPCION VARCHAR(50),
	FECHA_HORA DATETIME NOT NULL
);

GO
-- TRIGGER INSERTAR
CREATE TRIGGER [TR_Auditoriap_Insertar]
ON PACIENTE -- SE ACTIVA EN TABLA PACIENTE
FOR INSERT
AS 
	BEGIN 
	INSERT AUDITORIA SELECT 'DESCONOCIDO', 'PACIENTE', 'INSERT�', DOCUMENTO, RTRIM(NOMBRES) + ' ' + RTRIM(APELLIDOS),
	'NINGUNA', GETDATE() FROM inserted
	END;
GO

-- TRIGGER ACTUALIZAR
CREATE TRIGGER [TR_Auditoriap_Actualizar]
ON PACIENTE
FOR UPDATE
AS
	BEGIN
	INSERT AUDITORIA SELECT 'DESCONOCIDO', 'PACIENTE', 'ACTUALIZ�', DOCUMENTO, RTRIM(NOMBRES) + ' ' + RTRIM(APELLIDOS),
	(SELECT RTRIM(NOMBRES) + ' ' + RTRIM(APELLIDOS) FROM deleted), GETDATE() FROM INSERTED
	END;
GO

-- TRIGGER ELIMINAR
CREATE TRIGGER [TR_Auditoriap_Eliminar]
ON PACIENTE
FOR DELETE
AS
	BEGIN
	INSERT AUDITORIA SELECT 'DESCONOCIDO', 'PACIENTE', 'ELIMIN�', DOCUMENTO, RTRIM(NOMBRES) + ' ' + RTRIM(APELLIDOS),
	'NINGUNA', GETDATE() FROM DELETED
	END;
GO

-- TRIGGERS TABLA ESPECIALIDAD
-- TRIGGER INSERTAR
CREATE TRIGGER [TR_AuditoriaE_Insertar]
ON ESPECIALIDAD
FOR INSERT
AS
	BEGIN
	INSERT AUDITORIA SELECT 'DESCONOCIDO', 'ESPECIALIDAD', 'INSERT�', CODIGO_ES, DESCRIPCION_ES, 'NINGUNA',
	GETDATE () FROM INSERTED
END;
GO

-- TRIGGER ACTUALIZAR
CREATE TRIGGER [TR_AuditoriaE_Actualizar]
ON ESPECIALIDAD
FOR UPDATE
AS
	BEGIN
	INSERT AUDITORIA SELECT 'DESCONOCIDO', 'ESPECIALIDAD', 'ACTUALIZ�', CODIGO_ES, DESCRIPCION_ES,
	(SELECT DESCRIPCION_ES FROM deleted), GETDATE() FROM inserted
END;
GO

-- TRIGGER ELIMINAR
CREATE TRIGGER [TR_AuditoriaE_Eliminar]
ON ESPECIALIDAD
FOR DELETE
AS
	BEGIN
	INSERT AUDITORIA SELECT 'DESCONOCIDO', 'ESPECIALIDAD', 'INSERT�', CODIGO_ES, DESCRIPCION_ES,
	'NINGUNA', GETDATE() FROM deleted
	END;

GO
/*==============================================================*/
/* SE INSERTA EN LA TABLA PACIENTE                              */
/*==============================================================*/
INSERT PACIENTE VALUES ('12345','CRISTIAN CAMILO','MOSQUERA LOPEZ','XXXXX','998877')
GO
UPDATE PACIENTE SET NOMBRES='XXXXXXX',APELLIDOS='XXXXXXXX'
					WHERE DOCUMENTO='12345'
GO
DELETE FROM PACIENTE WHERE DOCUMENTO='12345'
GO
/*==============================================================*/
/* SE INSERTA EN LA TABLA ESPECIALIDAS                          */
/*==============================================================*/
INSERT ESPECIALIDAD VALUES ('1','LUNES','CARDIOANGIOLOGIA')
GO
UPDATE ESPECIALIDAD SET DIA_HOR='xxxxx', DESCRIPCION_ES='xxxx'
						WHERE CODIGO_ES='1'
GO
DELETE FROM ESPECIALIDAD WHERE CODIGO_ES='1'
GO

--
SELECT * FROM AUDITORIA

