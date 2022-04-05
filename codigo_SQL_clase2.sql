--DDL
--CREATE / DROP / ALTER

CREATE TABLE proveedor(
id_proveedor INT,
identificacion VARCHAR(15),
tipo CHAR(1),
nombre_proveedor VARCHAR(80),
presupuesto DECIMAL(20, 2),
);

--DROP ELIMINATES THE OBJECT
DROP TABLE proveedor;

--ALTER, TO MODIFY THINGS OF THE DB OBJECT
ALTER TABLE proveedor ADD FECHA_INGRESO DATE;

--DML 
--INSERT / DELETE / UPDATE / MERGE 


--INSERT
--PRIMERA FORMA: INSERTAR TODOS LOS VALORES DE LOS CAMPOS RESPECTIVOS
INSERT INTO proveedor (id_proveedor, identificacion, tipo, nombre_proveedor, presupuesto, fecha_ingreso)
VALUES (22222,  '205860', 'J', 'GUAYABAS DEL NORTE SA', 12000000, '2022-01-01');
--SEGUNDA FORMA:INSERTAR SOLO ALGUNOS VALORES, SE OMITE PRESUPUESTO PORQUE NO LO SABEMOS
INSERT INTO proveedor (id_proveedor, identificacion, tipo, nombre_proveedor, fecha_ingreso)
VALUES (3333,  '278056', 'J', 'GUAYABAS DEL SUR SA','2022-01-01');
--TERCERA FORMA: SE COLOCA EN EL ORDEN DE LOS ATRIBUTOS SIN NECESIDAD DE COLOCAR ARRIBA LOS ATRIBUTOS
INSERT INTO proveedor VALUES (5555,  '14752', 'J', 'GUAYABAS DEL ESTE SA', 50000000, '2021-12-08');
INSERT INTO proveedor VALUES (520545,  '14752', 'P', 'JOSÉ CORONADO DÍAZ', 50000000, '2021-11-09');

--DELETE: DELETE FROM TABLA WHERE CONDICION AND CONDICIONES ...
DELETE FROM proveedor; -- Borra todos los registros de la tabla
DELETE FROM proveedor WHERE id_proveedor = 22222;


--UPDATE TABLA SET ATRIBUTO =NUEVO_VALOR WHERE CONDICION AND CONDICIONES
UPDATE proveedor SET id_proveedor=7777 WHERE id_proveedor = 3333;
UPDATE proveedor SET presupuesto=48000000 WHERE presupuesto IS NULL;


--DQL
--SELECT 

--la siguiente sentencia no es recomendable a menos que se quiera ver toda la tabla, lo mejor es especificar las 
--columnas que se quieren ver
SELECT * FROM proveedor; 
SELECT id_proveedor, tipo, presupuesto FROM proveedor; 