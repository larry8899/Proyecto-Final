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

CREATE TABLE Usuario(idUsuario INT IDENTITY (1,1), nombres VARCHAR (20) NOT NULL, apellidoPat VARCHAR (20) NOT NULL, apellidoMat VARCHAR (20) NOT NULL, ocupacion VARCHAR (20) NOT NULL, tipoUsuario BIT NOT NULL, nombreUsuario VARCHAR (20) NOT NULL, contrasena VARCHAR (20) NOT NULL, estatus BIT DEFAULT 1 NOT NULL, idNave INT NOT NULL, idMision INT NOT NULL
CONSTRAINT PK_Nave PRIMARY KEY (idUsuario));-------------------INDICES DE LAS TABLAS --------------------------
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
INSERT INTO DistribucionMineral(silicioPorcentaje, rodioPorcentaje, cobaltoPorcentaje, uranioPorcentaje, platinoPorcentaje, titanioPorcentaje, oroPorcentaje, niquelPorcentaje, litioPorcentaje,otroProcentaje)VALUES(10,10,10,10,10,10,10,10,10,10),(10,10,10,10,10,10,10,10,10,10),(0,10,10,20,10,10,10,10,10,10),(10,10,10,10,10,10,10,10,10,10),(5,5,10,10,15,10,15,10,10,10),(10,10,10,10,10,10,0,0,0,30),(10,10,10,10,10,10,10,10,10,10),(10,0,10,10,50,0,0,10,0,0),(10,10,10,10,10,10,10,10,10,10),(10,10,10,0,0,0,0,0,0,70)INSERT INTO CuerpoCeleste(nombre,descripcion,areaSuperficie,diametro,masa,galaxia,sistemaPlanetario,idDistribucionMineral)VALUES('Xenon','Planteta rocoso con actividad volcanica',1022,199,10000,'Galaxia x','sistema solar',1),('Rolxa','Plantea congelado',1022,199,10000,'Galaxia a','sistema axis',1),('Lotz','Meteoro masivo',1022,199,10000,'Galaxia th','sistema fps',1),('Plo','Satelite de Xenon',1022,199,10000,'Galaxia lo','sistema nupton',1),('Rex','Roca enorme',1022,199,10000,'Galaxia io','sistema rolon',1),('Eas','Planeta rocoso mayormente cubierto por agua',1022,199,10000,'Galaxia tr','sistema plom',1),('Trlo','Planeta cubierto de cadenas montanosas',1022,199,10000,'Galaxia wq','sistema elon',1),('Loa','Planeta con gran cantidad de vapor',1022,199,10000,'Galaxia re','sistema musk',1),('Wla','Asteroide metalico',1022,199,10000,'Galaxia vf','sistema polst',1),('lla','Asteroide en rumbo de colision con Plo',1022,199,10000,'Galaxia as','sistema crotz',1)INSERT INTO Mision(nombre, descripcion, nTripulantes, nNaves, duracionDias, idCuerpoCeleste)VALUES('ALFA','Mineria de silicio',10,10,10,1),('BETA','Mineria de uranio',10,10,10,1),('DELTA','Mineria de oro',10,10,10,1),('OMEGA','Mineria de litio',10,10,10,1),('NECTAR','Mineria de platino',10,10,10,1),('OSCAR','Mineria de oro',10,10,10,1),('BRAVO','Mineria de litio',10,10,10,1),('HOTEL','Mineria de uranio',10,10,10,1)INSERT INTO Nave(nombre,descripcion,tipoNave,velocidadMax,cargaMax,combustibleMax,tripulacionMax,capOxigeno,idMision)VALUES('Ishimura','Nave de alta capacidad','Nave minera',560,1000000,1000000,130,100000,1),('A milenario','Nave de alta capacidad','Nave exploradora',560,1000000,1000000,130,100000,1),('Unsa','Nave de alta capacidad','Nave minera',560,1000000,1000000,130,100000,1),('Prometheus','Nave de alta capacidad','Nave exploradora',560,1000000,1000000,130,100000,1),('Nabucodonosor','Nave de alta capacidad','Nave minera',560,1000000,1000000,130,100000,1),('Nave a','Nave de baja capacidad','Nave minera',560,1000000,1000000,130,100000,1),('Nave b','Nave de media capacidad','Nave exploradora',560,1000000,1000000,130,100000,1),('Nave c','Nave de super capacidad','Nave minera',560,1000000,1000000,130,100000,1),('Nave d','Nave de baja capacidad','Nave exploradora',560,1000000,1000000,130,100000,1),('Nave e','Nave de alta capacidad','Nave minera',560,1000000,1000000,130,100000,1)INSERT INTO Usuario(nombres, apellidoPat, apellidoMat, ocupacion, tipoUsuario, nombreUsuario, contrasena, idNave, idMision)VALUES('Andres','Murcia','walker','Piloto',0,'alfa','12345',1,1),('Alondra','Torres','mark','Ingeniero',0,'alfa','54321',1,1),('Sofia','Sanchez','alonso','Minero',0,'alfa','12345',1,1),('Jose','Lopez','Gael','Ingeniero',0,'alfa','54321',1,1),('Luis','Suarez','Castillo','Minero',0,'alfa','12345',1,1),('Ivan','Zapata','Perez','Ingeniero',0,'alfa','54321',1,1),('Ana','Hernandez','Garcia','Piloto',0,'alfa','12345',1,1),('Andre','Lopez','Gael','Ingeniero',0,'alfa','54321',1,1),('Nacimento','Walker','Tom','Minero',0,'alfa','12345',1,1),('Lucas','Zapata','Villa','Piloto',0,'alfa','54321',1,1)