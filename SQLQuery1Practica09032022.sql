--Filename: SQLQuery1Practica09032022
USE Practica09032022;

--Crear la tabla Rentas
CREATE TABLE Rentas(
	ID_renta INTEGER NOT NULL  PRIMARY KEY,
	fecha DATE,
	id_cliente INTEGER
);

INSERT INTO Rentas (ID_renta, fecha, id_cliente) VALUES (2301, '2015-03-28', 101); 
INSERT INTO Rentas (ID_renta, fecha, id_cliente) VALUES (2302, '2015-05-16', 107); 
INSERT INTO Rentas (ID_renta, fecha, id_cliente) VALUES (2303, '2015-07-21', 110); 

ALTER TABLE Rentas
	ADD CONSTRAINT fk_id_cliente FOREIGN KEY(id_cliente)
	REFERENCES Clientes(ID_cliente);
SELECT * FROM Rentas;

--Crear la tabla Peliculas
CREATE TABLE Peliculas(
	COD_peli INTEGER NOT NULL  PRIMARY KEY,
	nom_peli VARCHAR(30),
	precio  DECIMAL(10, 2)
);
INSERT INTO Peliculas(COD_peli, nom_peli, precio) VALUES (3786, 'HULK', 1000); 
INSERT INTO Peliculas(COD_peli, nom_peli, precio) VALUES (9132, 'IRON MAN', 1000); 
INSERT INTO Peliculas(COD_peli, nom_peli, precio) VALUES (5794, 'SPIDER', 1000); 
INSERT INTO Peliculas(COD_peli, nom_peli, precio) VALUES (4011, 'THOR I', 1000); 
INSERT INTO Peliculas(COD_peli, nom_peli, precio) VALUES (3141, 'FUNDA', 2000); 
UPDATE Peliculas SET precio = 1000 WHERE COD_peli = 3141 ;
SELECT * FROM Peliculas;

--Crear la tabla Clientes
CREATE TABLE Clientes(
	ID_cliente INTEGER NOT NULL  PRIMARY KEY,
	nom_cliente VARCHAR(30),
	ciudad  VARCHAR(10)
);
INSERT INTO Clientes(ID_cliente, nom_cliente, ciudad) VALUES (101, 'MARTI', 'SJ');
INSERT INTO Clientes(ID_cliente, nom_cliente, ciudad) VALUES (107, 'HERMAN', 'AL'); 
INSERT INTO Clientes(ID_cliente, nom_cliente, ciudad) VALUES (110, 'WE-SPORTS', 'CQ'); 

SELECT * FROM Clientes;

--Crear la tabla de Rentas_x_pelicula
CREATE TABLE Rentas_x_pelicula(
	ID_renta INTEGER NOT NULL,
	cod_pelicula INTEGER,
	cantidad  INTEGER
);
INSERT INTO Rentas_x_pelicula(ID_renta, cod_pelicula, cantidad) VALUES (2301, 3786, 1);
INSERT INTO Rentas_x_pelicula(ID_renta, cod_pelicula, cantidad) VALUES (2301, 4011, 2);
INSERT INTO Rentas_x_pelicula(ID_renta, cod_pelicula, cantidad) VALUES (2301, 9132, 1);
INSERT INTO Rentas_x_pelicula(ID_renta, cod_pelicula, cantidad) VALUES (2302, 5794, 1);
INSERT INTO Rentas_x_pelicula(ID_renta, cod_pelicula, cantidad) VALUES (2303, 4011, 1);
INSERT INTO Rentas_x_pelicula(ID_renta, cod_pelicula, cantidad) VALUES (2303, 3141, 2);

DROP TABLE Rentas_x_pelicula;

SELECT * FROM Rentas_x_pelicula;


--Queda pendiente añadir los FK constraints y tirar el reporte original

--Constraint de FK a la tabla RentasxPelicula
ALTER TABLE Rentas_x_pelicula 
	ADD CONSTRAINT fk_cod_pel FOREIGN KEY(cod_pelicula)
	REFERENCES Peliculas(COD_peli);

ALTER TABLE Rentas_x_pelicula 
	ADD CONSTRAINT fk_id_renta FOREIGN KEY(ID_renta)
	REFERENCES Rentas(ID_renta);

--Reporte union de tablas- CONSULTA
SELECT RT.ID_renta, RT.fecha, C.ID_cliente, C.nom_cliente, C.ciudad, PL.COD_peli, PL.nom_peli, RP.cantidad,PL.precio, RP.cantidad*PL.precio TOTAL 
FROM Rentas_x_pelicula RP
INNER JOIN Peliculas PL
ON RP.cod_pelicula = PL.COD_peli	
INNER JOIN Rentas RT
ON RP.ID_renta = RT.ID_renta
INNER JOIN Clientes C
ON C.ID_cliente = RT.id_cliente;


--TABLA DE EJERCICIO 1, pacientes y doctores
CREATE TABLE rutas_x_paciente(
	id_ruta INTEGER NOT NULL PRIMARY KEY,
	ruta_paciente INTEGER UNIQUE,
);
INSERT INTO rutas_x_paciente(id_ruta, ruta_paciente) VALUES (1, 112);
INSERT INTO rutas_x_paciente(id_ruta, ruta_paciente) VALUES (2, 113);
INSERT INTO rutas_x_paciente(id_ruta, ruta_paciente) VALUES (3, 114);
INSERT INTO rutas_x_paciente(id_ruta, ruta_paciente) VALUES (4, 115);
SELECT * FROM rutas_x_paciente





CREATE TABLE doctores(
	id_doctor INTEGER NOT NULL PRIMARY KEY,
	nom_doctor VARCHAR(12),
	apell_doctor VARCHAR(12),
	dir_doctor VARCHAR(35),
	tel_doctor VARCHAR(25)
)
INSERT INTO doctores(id_doctor,nom_doctor, apell_doctor, dir_doctor, tel_doctor) VALUES (1,'Juan','Mendez','Alajuela, 500 N Estadio','2244-1500');
INSERT INTO doctores(id_doctor,nom_doctor, apell_doctor, dir_doctor, tel_doctor) VALUES (2,	'Dario', 	'Ortiz',	'San Jose, 350 E Catedral',	'2232-8500, 8888-8401');
INSERT INTO doctores(id_doctor,nom_doctor, apell_doctor, dir_doctor, tel_doctor) VALUES (3,	'Jorge',	'Urial',	'Heredia,250 S Rosabal','2268-4588, 2268-3589')
SELECT * FROM doctores

--Pendiente crear 2 tablas (ver el excel ) y hacer los JOINS
