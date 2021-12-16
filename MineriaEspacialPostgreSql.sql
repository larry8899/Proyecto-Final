
-- -----------------------TABLAS DE LA BASE DE DATOS------------------------
CREATE TABLE CuerpoCeleste
(
idCuerpoCeleste SERIAL PRIMARY KEY,
nombre VARCHAR (20) NOT NULL,
descripcion VARCHAR (2000) NOT NULL,
areaSuperficie FLOAT NOT NULL,
diametro FLOAT NOT NULL,
masa FLOAT NOT NULL,
galaxia VARCHAR (20) NOT NULL,
sistemaPlanetario VARCHAR (20) NOT NULL,
estatus BOOLEAN DEFAULT true NOT NULL,
idDistribucionMineral INT NOT NULL
);

CREATE TABLE DistribucionMineral
(
idDistribucionMineral SERIAL PRIMARY KEY,
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
estatus BOOLEAN DEFAULT true NOT NULL
);

CREATE TABLE Mision
(
idMision SERIAL PRIMARY KEY,
nombre VARCHAR (20) NOT NULL,
descripcion VARCHAR (2000) NOT NULL,
nTripulantes INT NOT NULL,
nNaves INT NOT NULL,
duracionDias INT NOT NULL,
estatus BOOLEAN DEFAULT true NOT NULL,
idCuerpoCeleste INT NOT NULL
);

CREATE TABLE Nave
(
idNave SERIAL PRIMARY KEY,
nombre VARCHAR (20) NOT NULL,
descripcion VARCHAR (2000) NOT NULL,
tipoNave VARCHAR (20) NOT NULL,
velocidadMax FLOAT NOT NULL,
cargaMax FLOAT NOT NULL,
combustibleMax FLOAT NOT NULL,
tripulacionMax FLOAT NOT NULL,
capOxigeno FLOAT NOT NULL,
estatus BOOLEAN DEFAULT true NOT NULL,
idMision INT NOT NULL
);

CREATE TABLE Usuario
(
idUsuario SERIAL PRIMARY KEY,
nombres VARCHAR (20) NOT NULL, 
apellidoPat VARCHAR (20) NOT NULL, 
apellidoMat VARCHAR (20) NOT NULL, 
ocupacion VARCHAR (20) NOT NULL, 
tipoUsuario BOOLEAN DEFAULT false NOT NULL,
nombreUsuario VARCHAR (20) NOT NULL, 
contrasena VARCHAR (20) NOT NULL, 
estatus BOOLEAN DEFAULT true NOT NULL,
idNave INT NOT NULL, 
idMision INT NOT NULL
);

-- -----------------INDICES DE LAS TABLAS --------------------------
CREATE INDEX  IX_CuerpoCeleste ON CuerpoCeleste  (idCuerpoCeleste);
CREATE INDEX  IX_DistribucionMineral ON DistribucionMineral  (idDistribucionMineral);
CREATE INDEX  IX_Mision ON Mision  (idMision);
CREATE INDEX  IX_Nave ON Nave  (idNave);
CREATE INDEX  IX_Usuario ON Usuario  (idUsuario);

-- -------------RELACIONES DE LAS TABLAS ----------------------------

ALTER TABLE CuerpoCeleste
ADD CONSTRAINT FK_CuerpoCelesteDistribucionMineral
FOREIGN KEY (idDistribucionMineral) REFERENCES DistribucionMineral(idDistribucionMineral);
ALTER TABLE Mision
ADD CONSTRAINT FK_MisionCuerpoCeleste
FOREIGN KEY (idCuerpoCeleste) REFERENCES CuerpoCeleste(idCuerpoCeleste);

ALTER TABLE Nave
ADD CONSTRAINT FK_NaveMision
FOREIGN KEY (idMision) REFERENCES Mision(idMision);

ALTER TABLE Usuario
ADD CONSTRAINT FK_UsuarioNave
FOREIGN KEY (idNave) REFERENCES Nave(idNave);

ALTER TABLE Usuario
ADD CONSTRAINT FK_UsuarioMision
FOREIGN KEY (idMision) REFERENCES Mision(idMision);

-- --------------INSERT A LAS TABLAS ----------------------------

INSERT INTO DistribucionMineral(silicioPorcentaje, rodioPorcentaje, cobaltoPorcentaje, uranioPorcentaje, platinoPorcentaje, 
titanioPorcentaje, oroPorcentaje, niquelPorcentaje, litioPorcentaje,otroProcentaje)
VALUES
(10,10,10,10,10,10,10,10,10,10),
(10,10,10,10,10,10,10,10,10,10),
(0,10,10,20,10,10,10,10,10,10),
(10,10,10,10,10,10,10,10,10,10),
(5,5,10,10,15,10,15,10,10,10),
(10,10,10,10,10,10,0,0,0,30),
(10,10,10,10,10,10,10,10,10,10),
(10,0,10,10,50,0,0,10,0,0),
(10,10,10,10,10,10,10,10,10,10),
(10,10,10,0,0,0,0,0,0,70);

INSERT INTO CuerpoCeleste(nombre,descripcion,areaSuperficie,diametro,masa,galaxia,sistemaPlanetario,idDistribucionMineral)
VALUES
('Xenon','Planteta rocoso con actividad volcanica',1022,199,10000,'Galaxia x','sistema solar',1),
('Rolxa','Plantea congelado',1022,199,10000,'Galaxia a','sistema axis',1),
('Lotz','Meteoro masivo',1022,199,10000,'Galaxia th','sistema fps',1),
('Plo','Satelite de Xenon',1022,199,10000,'Galaxia lo','sistema nupton',1),
('Rex','Roca enorme',1022,199,10000,'Galaxia io','sistema rolon',1),
('Eas','Planeta rocoso mayormente cubierto por agua',1022,199,10000,'Galaxia tr','sistema plom',1),
('Trlo','Planeta cubierto de cadenas montanosas',1022,199,10000,'Galaxia wq','sistema elon',1),
('Loa','Planeta con gran cantidad de vapor',1022,199,10000,'Galaxia re','sistema musk',1),
('Wla','Asteroide metalico',1022,199,10000,'Galaxia vf','sistema polst',1),
('lla','Asteroide en rumbo de colision con Plo',1022,199,10000,'Galaxia as','sistema crotz',1);

INSERT INTO Mision(nombre, descripcion, nTripulantes, nNaves, duracionDias, idCuerpoCeleste)
VALUES
('ALFA','Mineria de silicio',10,10,10,1),
('BETA','Mineria de uranio',10,10,10,1),
('DELTA','Mineria de oro',10,10,10,1),
('OMEGA','Mineria de litio',10,10,10,1),
('NECTAR','Mineria de platino',10,10,10,1),
('OSCAR','Mineria de oro',10,10,10,1),
('BRAVO','Mineria de litio',10,10,10,1),
('HOTEL','Mineria de uranio',10,10,10,1);

INSERT INTO Nave(nombre,descripcion,tipoNave,velocidadMax,cargaMax,combustibleMax,tripulacionMax,capOxigeno,idMision)
VALUES
('Ishimura','Nave de alta capacidad','Nave minera',560,1000000,1000000,130,100000,1),
('A milenario','Nave de alta capacidad','Nave exploradora',560,1000000,1000000,130,100000,1),
('Unsa','Nave de alta capacidad','Nave minera',560,1000000,1000000,130,100000,1),
('Prometheus','Nave de alta capacidad','Nave exploradora',560,1000000,1000000,130,100000,1),
('Nabucodonosor','Nave de alta capacidad','Nave minera',560,1000000,1000000,130,100000,1),
('Nave a','Nave de baja capacidad','Nave minera',560,1000000,1000000,130,100000,1),
('Nave b','Nave de media capacidad','Nave exploradora',560,1000000,1000000,130,100000,1),
('Nave c','Nave de super capacidad','Nave minera',560,1000000,1000000,130,100000,1),
('Nave d','Nave de baja capacidad','Nave exploradora',560,1000000,1000000,130,100000,1),
('Nave e','Nave de alta capacidad','Nave minera',560,1000000,1000000,130,100000,1);

INSERT INTO Usuario(nombres, apellidoPat, apellidoMat, ocupacion, tipoUsuario, nombreUsuario, contrasena, idNave, idMision)
VALUES
('Andres','Murcia','walker','Piloto',false,'alfa','12345',1,1),
('Alondra','Torres','mark','Ingeniero',false,'alfa','54321',1,1),
('Sofia','Sanchez','alonso','Minero',false,'alfa','12345',1,1),
('Jose','Lopez','Gael','Ingeniero',false,'alfa','54321',1,1),
('Luis','Suarez','Castillo','Minero',false,'alfa','12345',1,1),
('Ivan','Zapata','Perez','Ingeniero',false,'alfa','54321',1,1),
('Ana','Hernandez','Garcia','Piloto',false,'alfa','12345',1,1),
('Andre','Lopez','Gael','Ingeniero',false,'alfa','54321',1,1),
('Nacimento','Walker','Tom','Minero',false,'alfa','12345',1,1),
('Lucas','Zapata','Villa','Piloto',false,'alfa','54321',1,1);

SELECT * FROM Usuario;
SELECT * FROM DistribucionMineral;
SELECT * FROM CuerpoCeleste;
SELECT * FROM Mision;
SELECT * FROM Nave;