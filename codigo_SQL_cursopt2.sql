USE db_practicas;

SELECT * FROM ventas
WHERE ID_local IN (2, 3);
SELECT * FROM ventas
WHERE clave_producto IN ('clz', 'pzz');

SELECT * FROM ventas 
WHERE venta >= 800 AND venta <= 1500;

SELECT * FROM ventas 
WHERE venta BETWEEN 1000 AND 1200;

SELECT * FROM ventas 
WHERE clave_producto LIKE "p%";

SELECT * FROM ventas WHERE ID_Zona = 2;
SELECT * FROM ventas 
WHERE Venta > 2000000;

SELECT * FROM ventas 
WHERE ID_Cliente = 7;

SELECT SUM(Venta) AS ventasClienteID7 FROM ventas
WHERE ID_Cliente = 7;

SELECT * FROM ventas 
WHERE Venta >= 1500000 
AND ID_Zona = 2;

SELECT * FROM ventas 
WHERE Venta < 500000 
AND ID_Zona = 2
AND ID_Vendedor = 2;

SELECT * FROM ventas 
WHERE Venta > 999999 
OR ID_Vendedor = 13;

SELECT * FROM ventas 
WHERE NOT ID_Vendedor = 10;

SELECT * FROM ventas 
	WHERE ID_Zona IN (1, 4);

SELECT * FROM ventas 
	WHERE ID_Vendedor NOT IN (1, 15, 21, 35);
	
	
--Criterios de seleccion y ordenamiento
SELECT * FROM datos.empleados;

SELECT * FROM empleados
WHERE Apellido LIKE "%ez";

#--Todo lo que empieza con "Lo"
SELECT * FROM empleados
WHERE Apellido REGEXP "^Lo";

#--Todo lo que termina con "iz"
SELECT * FROM empleados
WHERE Apellido REGEXP "iz$";

#--Varios criteros REGEXP, todo lo que termina con "iz" y todo lo que lleva "Go"
SELECT * FROM empleados
WHERE Apellido REGEXP "iz$|Go";

#--Ordenar la salida de datos DESCENDENTE por determinada columna
SELECT * FROM empleados 
ORDER BY Edad DESC;

#--Ordenar la salida de datos ASCENDENTE por determinada columna
SELECT * FROM empleados 
ORDER BY Edad ASC;

#--Ordenar la salida de datos mediante varias columnas como criterio
SELECT * FROM empleados 
ORDER BY Nombre, Apellido;

#--Filtrar valores NULL (EN CASO DE QUE LOS HAYA)
SELECT * FROM empleados 
where Domicilio IS NULL;

#--Limitar la cantidad de valores mostrados en la cosulta
SELECT * FROM empleados 
LIMIT 5;

#--Limita desde el registro 5 los 9 siguientes registros
SELECT * FROM empleados 
LIMIT 5,9;

--Practicas

SELECT * FROM db_practicas.clientes;

SELECT * FROM Vendedor;
SELECT * FROM Vendedor
	WHERE Apellido REGEXP "ez%"
    AND Nombre REGEXP "ez%";
    
SELECT * FROM Vendedor
	WHERE Apellido REGEXP "ez$|%sa";
    
USE db_practicas;
SELECT * FROM clientes
	WHERE Telefono IS NULL;
    
SELECT * FROM vendedor
	ORDER BY Nombre DESC; 
    
SELECT * FROM ventas 
	LIMIT 10; 

SELECT * FROM ventas 
	LIMIT 50, 100;
	
--Columas calculadas

SELECT * FROM clientes;
SELECT * FROM ventas;
SELECT ID_Zona, Venta, ID_Cliente FROM ventas;
SELECT Venta AS filtroVenta FROM ventas;
SELECT Venta AS filtroVenta, Venta * 0.16 AS VentaConIVA FROM ventas;