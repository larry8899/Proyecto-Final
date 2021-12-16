USE MASTER;
GO
IF DB_ID (N'MineriaEspacial') IS NOT NULL
DROP DATABASE MineriaEspacial;
GO
CREATE DATABASE MineriaEspacial
ON 
(NAME = MineriaEspacial_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MineriaEspacial.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH =5)
LOG ON
(NAME = MineriaEspacial_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MineriaEspacial.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH =5MB);
GO
USE MineriaEspacial;
GO
-------------------------TABLAS DE LA BASE DE DATOS------------------------
CREATE TABLE CuerpoCeleste
(
idCuerpoCeleste INT IDENTITY(1,1),
nombre VARCHAR (20) NOT NULL,
descripcion VARCHAR (2000) NOT NULL,
areaSuperficie FLOAT NOT NULL,
diametro FLOAT NOT NULL,
masa FLOAT NOT NULL,
galaxia VARCHAR (20) NOT NULL,
sistemaPlanetario VARCHAR (20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
idDistribucionMineral INT NOT NULL
CONSTRAINT PK_CuerpoCeleste PRIMARY KEY (idCuerpoCeleste)
);

CREATE TABLE DistribucionMineral
(
idDistribucionMineral INT IDENTITY (1,1),
silicioPorcentaje FLOAT NOT NULL,
rodioPorcentaje FLOAT NOT NULL,
cobaltoPorcentaje FLOAT NOT NULL,
uranioPorcentaje FLOAT NOT NULL,
platinoPorcentaje FLOAT NOT NULL,
titanioPorcentaje FLOAT NOT NULL,
oroPorcentaje FLOAT NOT NULL,
niquelPorcentaje FLOAT NOT NULL,
litioPorcentaje FLOAT NOT NULL,
otroProcentaje FLOAT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
CONSTRAINT PK_DistribucionMineral PRIMARY KEY (idDistribucionMineral)
);

CREATE TABLE Mision
(
idMision INT IDENTITY (1,1),
nombre VARCHAR (20) NOT NULL,
descripcion VARCHAR (2000) NOT NULL,
nTripulantes INT NOT NULL,
nNaves INT NOT NULL,
duracionDias INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
idCuerpoCeleste INT NOT NULL
CONSTRAINT PK_Mision PRIMARY KEY (idMision)
);

CREATE TABLE Nave
(
idNave INT IDENTITY (1,1),
nombre VARCHAR (20) NOT NULL,
descripcion VARCHAR (2000) NOT NULL,
tipoNave VARCHAR (20) NOT NULL,
velocidadMax FLOAT NOT NULL,
cargaMax FLOAT NOT NULL,
combustibleMax FLOAT NOT NULL,
tripulacionMax FLOAT NOT NULL,
capOxigeno FLOAT NOT NULL,
estatus BIT DEFAULT 1,
idMision INT NOT NULL
CONSTRAINT PK_Nave PRIMARY KEY (idNave)
);

CREATE TABLE Usuario
CONSTRAINT PK_Nave PRIMARY KEY (idUsuario)
CREATE INDEX  IX_CuerpoCeleste ON CuerpoCeleste  (idCuerpoCeleste);
GO
CREATE INDEX  IX_DistribucionMineral ON DistribucionMineral  (idDistribucionMineral);
GO
CREATE INDEX  IX_Mision ON Mision  (idMision);
GO
CREATE INDEX  IX_Nave ON Nave  (idNave);
GO
CREATE INDEX  IX_Usuario ON Usuario  (idUsuario);
GO

----------------RELACIONES DE LAS TABLAS ----------------------------

ALTER TABLE CuerpoCeleste
ADD CONSTRAINT FK_CuerpoCelesteDistribucionMineral
FOREIGN KEY (idDistribucionMineral) REFERENCES DistribucionMineral(idDistribucionMineral);
GO

ALTER TABLE Mision
ADD CONSTRAINT FK_MisionCuerpoCeleste
FOREIGN KEY (idCuerpoCeleste) REFERENCES CuerpoCeleste(idCuerpoCeleste);
GO


ALTER TABLE Nave
ADD CONSTRAINT FK_NaveMision
FOREIGN KEY (idMision) REFERENCES Mision(idMision);
GO

ALTER TABLE Usuario
ADD CONSTRAINT FK_UsuarioNave
FOREIGN KEY (idNave) REFERENCES Nave(idNave);
GO

ALTER TABLE Usuario
ADD CONSTRAINT FK_UsuarioMision
FOREIGN KEY (idMision) REFERENCES Mision(idMision);
GO

----------------INSERT A LAS TABLAS ----------------------------
