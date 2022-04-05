USE ISW312;
--Ejercicios practica 3
--1.¿Cuántos empleados hay en la compañía? 
SELECT COUNT(*) cantidad_empleados FROM empleado;

--2.¿Cuántos clientes tiene cada país?
SELECT * FROM cliente; 
SELECT pais, COUNT(*) cantidad_clientes FROM cliente GROUP BY pais;

--3.¿Cuál fue el pago medio en 2009?
SELECT * FROM pago;
SELECT AVG(total) pago_medio_2009 FROM pago 
WHERE YEAR(fecha_pago) = 2009;

--4.¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos
SELECT * FROM pedido;
SELECT estado, COUNT(*) cantidad_por_estado_entrega FROM pedido GROUP BY estado
ORDER BY cantidad_por_estado_entrega DESC;

--5.Calcula el precio de venta del producto más caro y más barato en una misma consulta. 
SELECT * FROM producto; 
SELECT MAX(precio_venta) p_mas_caro, MIN(precio_venta) p_mas_barato  
FROM producto;

--6.Calcula el número de clientes que tiene la empresa. 
SELECT COUNT(*) cantidad_clientes FROM cliente;

--7.¿Cuántos clientes tiene la ciudad de Madrid? 
SELECT * FROM cliente;
SELECT COUNT(ciudad) c_clientes_madrid FROM cliente
WHERE ciudad = 'Madrid';

--8.Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M
--Nota: esto lo puedo hacer de 2 maneras: SUBSTRING o expresion regular.s
--Con SUBSTRING
SELECT * FROM cliente;
SELECT COUNT(ciudad) c_clientes_m1, ciudad FROM cliente
WHERE SUBSTRING(ciudad, 1,1) = UPPER('M')
GROUP BY ciudad;
--Con LIKE
SELECT COUNT(ciudad) c_clientes_m2, ciudad FROM cliente
WHERE ciudad LIKE 'M%'
GROUP BY ciudad;

--9.Devuelve el nombre de los representantes de ventas y el numero de clientes al 
--que atiende cada uno
SELECT * FROM cliente; --en cliente aparece el cod representante de ventas que pertenece a empleados
SELECT * FROM empleado;

SELECT  e.codigo_empleado, e.nombre, e.apellido1, e.apellido2, COUNT(c.codigo_empleado_rep_ventas) numero_clientes_atiende
FROM cliente c
INNER JOIN empleado e
ON c.codigo_empleado_rep_ventas = e.codigo_empleado
GROUP BY e.codigo_empleado,e.nombre, e.apellido1, e.apellido2;


