CREATE TABLE DistribucionMineral(idDistribucionMineral INTEGER PRIMARY KEY AUTOINCREMENT,silicioPorcentaje REAL NOT NULL,rodioPorcentaje REAL NOT NULL,cobaltoPorcentaje REAL NOT NULL,uranioPorcentaje REAL NOT NULL,platinoPorcentaje REAL NOT NULL,titanioPorcentaje REAL NOT NULL,oroPorcentaje REAL NOT NULL,niquelPorcentaje REAL NOT NULL,litioPorcentaje REAL NOT NULL,otroProcentaje REAL NOT NULL,estatus INTEGER DEFAULT 1 NOT NULL);CREATE TABLE CuerpoCeleste(idCuerpoCeleste INTEGER PRIMARY KEY AUTOINCREMENT,nombre TEXT  NOT NULL,descripcion TEXT NOT NULL,areaSuperficie REAL NOT NULL,diametro REAL NOT NULL,masa REAL NOT NULL,galaxia TEXT NOT NULL,sistemaPlanetario TEXT NOT NULL,estatus INTEGER DEFAULT 1 NOT NULL,idDistribucionMineral INTEGER NOT NULL,FOREIGN KEY (idDistribucionMineral) REFERENCES DistribucionMineral(idDistribucionMineral));CREATE TABLE Mision(idMision INTEGER PRIMARY KEY AUTOINCREMENT,nombre TEXT NOT NULL,descripcion TEXT NOT NULL,nTripulantes INTEGER NOT NULL,nNaves INTEGER NOT NULL,duracionDias INTEGER NOT NULL,estatus INTEGER DEFAULT 1 NOT NULL,idCuerpoCeleste INTEGER NOT NULL,FOREIGN KEY (idCuerpoCeleste) REFERENCES CuerpoCeleste(idCuerpoCeleste));CREATE TABLE Nave(idNave INTEGER PRIMARY KEY AUTOINCREMENT,nombre TEXT NOT NULL,descripcion TEXT NOT NULL,tipoNave TEXT NOT NULL,velocidadMax REAL NOT NULL,cargaMax REAL NOT NULL,combustibleMax REAL NOT NULL,tripulacionMax REAL NOT NULL,capOxigeno REAL NOT NULL,estatus INTEGER DEFAULT 1 NOT NULL,idMision INTEGER NOT NULL,FOREIGN KEY (idMision) REFERENCES Mision(idMision));CREATE TABLE Usuario(idUsuario INTEGER PRIMARY KEY AUTOINCREMENT,nombres TEXT NOT NULL, apellidoPat TEXT NOT NULL, apellidoMat TEXT NOT NULL, ocupacion TEXT NOT NULL, tipoUsuario INTEGER DEFAULT 0,nombreUsuario TEXT NOT NULL, contrasena TEXT NOT NULL, estatus INTEGER DEFAULT 1 NOT NULL,idNave INTEGER NOT NULL, idMision INTEGER NOT NULL,FOREIGN KEY (idNave) REFERENCES Nave(idNave),FOREIGN KEY (idMision) REFERENCES Mision(idMision));CREATE INDEX  IX_CuerpoCeleste ON CuerpoCeleste  (idCuerpoCeleste);CREATE INDEX  IX_DistribucionMineral ON DistribucionMineral  (idDistribucionMineral);CREATE INDEX  IX_Mision ON Mision  (idMision);CREATE INDEX  IX_Nave ON Nave  (idNave);CREATE INDEX  IX_Usuario ON Usuario  (idUsuario);INSERT INTO DistribucionMineral(silicioPorcentaje, rodioPorcentaje, cobaltoPorcentaje, uranioPorcentaje, platinoPorcentaje, titanioPorcentaje, oroPorcentaje, niquelPorcentaje, litioPorcentaje,otroProcentaje)VALUES(10,10,10,10,10,10,10,10,10,10),(10,10,10,10,10,10,10,10,10,10),(0,10,10,20,10,10,10,10,10,10),(10,10,10,10,10,10,10,10,10,10),(5,5,10,10,15,10,15,10,10,10),(10,10,10,10,10,10,0,0,0,30),(10,10,10,10,10,10,10,10,10,10),(10,0,10,10,50,0,0,10,0,0),(10,10,10,10,10,10,10,10,10,10),(10,10,10,0,0,0,0,0,0,70);INSERT INTO CuerpoCeleste(nombre,descripcion,areaSuperficie,diametro,masa,galaxia,sistemaPlanetario,idDistribucionMineral)VALUES('Xenon','Planteta rocoso con actividad volcanica',1022,199,10000,'Galaxia x','sistema solar',1),('Rolxa','Plantea congelado',1022,199,10000,'Galaxia a','sistema axis',1),('Lotz','Meteoro masivo',1022,199,10000,'Galaxia th','sistema fps',1),('Plo','Satelite de Xenon',1022,199,10000,'Galaxia lo','sistema nupton',1),('Rex','Roca enorme',1022,199,10000,'Galaxia io','sistema rolon',1),('Eas','Planeta rocoso mayormente cubierto por agua',1022,199,10000,'Galaxia tr','sistema plom',1),('Trlo','Planeta cubierto de cadenas montanosas',1022,199,10000,'Galaxia wq','sistema elon',1),('Loa','Planeta con gran cantidad de vapor',1022,199,10000,'Galaxia re','sistema musk',1),('Wla','Asteroide metalico',1022,199,10000,'Galaxia vf','sistema polst',1),('lla','Asteroide en rumbo de colision con Plo',1022,199,10000,'Galaxia as','sistema crotz',1);INSERT INTO Mision(nombre, descripcion, nTripulantes, nNaves, duracionDias, idCuerpoCeleste)VALUES('ALFA','Mineria de silicio',10,10,10,1),('BETA','Mineria de uranio',10,10,10,1),('DELTA','Mineria de oro',10,10,10,1),('OMEGA','Mineria de litio',10,10,10,1),('NECTAR','Mineria de platino',10,10,10,1),('OSCAR','Mineria de oro',10,10,10,1),('BRAVO','Mineria de litio',10,10,10,1),('HOTEL','Mineria de uranio',10,10,10,1);INSERT INTO Nave(nombre,descripcion,tipoNave,velocidadMax,cargaMax,combustibleMax,tripulacionMax,capOxigeno,idMision)VALUES('Ishimura','Nave de alta capacidad','Nave minera',560,1000000,1000000,130,100000,1),('A milenario','Nave de alta capacidad','Nave exploradora',560,1000000,1000000,130,100000,1),('Unsa','Nave de alta capacidad','Nave minera',560,1000000,1000000,130,100000,1),('Prometheus','Nave de alta capacidad','Nave exploradora',560,1000000,1000000,130,100000,1),('Nabucodonosor','Nave de alta capacidad','Nave minera',560,1000000,1000000,130,100000,1),('Nave a','Nave de baja capacidad','Nave minera',560,1000000,1000000,130,100000,1),('Nave b','Nave de media capacidad','Nave exploradora',560,1000000,1000000,130,100000,1),('Nave c','Nave de super capacidad','Nave minera',560,1000000,1000000,130,100000,1),('Nave d','Nave de baja capacidad','Nave exploradora',560,1000000,1000000,130,100000,1),('Nave e','Nave de alta capacidad','Nave minera',560,1000000,1000000,130,100000,1);INSERT INTO Usuario(nombres, apellidoPat, apellidoMat, ocupacion, tipoUsuario, nombreUsuario, contrasena, idNave, idMision)VALUES('Andres','Murcia','walker','Piloto',0,'alfa','12345',1,1),('Alondra','Torres','mark','Ingeniero',0,'alfa','54321',1,1),('Sofia','Sanchez','alonso','Minero',0,'alfa','12345',1,1),('Jose','Lopez','Gael','Ingeniero',0,'alfa','54321',1,1),('Luis','Suarez','Castillo','Minero',0,'alfa','12345',1,1),('Ivan','Zapata','Perez','Ingeniero',0,'alfa','54321',1,1),('Ana','Hernandez','Garcia','Piloto',0,'alfa','12345',1,1),('Andre','Lopez','Gael','Ingeniero',0,'alfa','54321',1,1),('Nacimento','Walker','Tom','Minero',0,'alfa','12345',1,1),('Lucas','Zapata','Villa','Piloto',0,'alfa','54321',1,1);