--Ejercicios práctica 3

--Listar todas las tablas de la base de datos 
SELECT * FROM SYS.tables ORDER BY name;

--1. ¿Cuántos empleados hay en la compañía?
SELECT COUNT(nombre) cantidad_empleados FROM empleado;

--2. ¿Cuántos clientes tiene cada país?
SELECT * FROM cliente
SELECT COUNT(pais) AS clientes_por_pais, 
	pais AS pais 
	FROM cliente GROUP BY pais
	ORDER BY clientes_por_pais DESC;

--3. ¿Cuál fue el pago medio en 2009?
SELECT * FROM pago;
SELECT AVG(total) AS pago_medio
	FROM pago
	WHERE DATEPART(YEAR, fecha_pago) = 2009;

--4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
--    descendente por el número de pedidos.
SELECT COUNT(1) as cantidad,  estado 
	FROM pedido
	GROUP BY estado 
	ORDER BY cantidad ASC;

--5. Calcula el precio de venta del producto más caro y más barato en una misma
--   consulta.
SELECT * FROM producto;

SELECT MAX(precio_venta) AS MAXIMO,
	MIN(precio_venta) AS MINIMO
	FROM producto;

--6. Calcula el número de clientes que tiene la empresa.
SELECT DISTINCT(COUNT(1)) AS cantidad_clientes
	FROM cliente;


--7. ¿Cuántos clientes tiene la ciudad de Madrid?
SELECT COUNT(1) cantidad, ciudad
	FROM cliente
	WHERE ciudad = 'Madrid'
	GROUP BY ciudad;