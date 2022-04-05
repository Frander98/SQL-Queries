--Ejercicios pr�ctica 3

--Listar todas las tablas de la base de datos 
SELECT * FROM SYS.tables ORDER BY name;

--1. �Cu�ntos empleados hay en la compa��a?
SELECT COUNT(nombre) cantidad_empleados FROM empleado;

--2. �Cu�ntos clientes tiene cada pa�s?
SELECT * FROM cliente
SELECT COUNT(pais) AS clientes_por_pais, 
	pais AS pais 
	FROM cliente GROUP BY pais
	ORDER BY clientes_por_pais DESC;

--3. �Cu�l fue el pago medio en 2009?
SELECT * FROM pago;
SELECT AVG(total) AS pago_medio
	FROM pago
	WHERE DATEPART(YEAR, fecha_pago) = 2009;

--4. �Cu�ntos pedidos hay en cada estado? Ordena el resultado de forma
--    descendente por el n�mero de pedidos.
SELECT COUNT(1) as cantidad,  estado 
	FROM pedido
	GROUP BY estado 
	ORDER BY cantidad ASC;

--5. Calcula el precio de venta del producto m�s caro y m�s barato en una misma
--   consulta.
SELECT * FROM producto;

SELECT MAX(precio_venta) AS MAXIMO,
	MIN(precio_venta) AS MINIMO
	FROM producto;

--6. Calcula el n�mero de clientes que tiene la empresa.
SELECT DISTINCT(COUNT(1)) AS cantidad_clientes
	FROM cliente;


--7. �Cu�ntos clientes tiene la ciudad de Madrid?
SELECT COUNT(1) cantidad, ciudad
	FROM cliente
	WHERE ciudad = 'Madrid'
	GROUP BY ciudad;