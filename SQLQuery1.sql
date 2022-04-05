USE ISW312;

--Recurrente 
SELECT * FROM dbo.oficina;

--1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT codigo_oficina,ciudad 
	FROM dbo.oficina;

--2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT ciudad,telefono 
	FROM dbo.oficina
	WHERE pais='España';

--3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo 
--   jefe tiene un código de jefe igual a 7.
SELECT nombre,apellido1,apellido2,email,codigo_jefe
	FROM dbo.empleado
	WHERE codigo_jefe=7;

--4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
SELECT nombre,apellido1,apellido2,email,puesto
	FROM dbo.empleado
	WHERE puesto='Director General';

--5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados 
--   que no sean representantes de ventas.
SELECT nombre,apellido1,apellido2,puesto 
	FROM dbo.empleado
	WHERE puesto != 'Representante Ventas';

--Es más recomendado para un conjunto de valores, para uno solo es mejor el operador !=
SELECT nombre,apellido1,apellido2,puesto 
	FROM dbo.empleado
	WHERE puesto NOT IN('Representante Ventas');

--6. Devuelve un listado con el nombre de los todos los clientes de USA.
SELECT nombre_cliente,pais
	FROM dbo.cliente
	WHERE pais='USA';

--7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
SELECT DISTINCT(estado) FROM pedido
	ORDER BY estado ASC;

--8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron
--   algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de
--   cliente que aparezcan repetidos. Resuelva la consulta:
SELECT DISTINCT(codigo_cliente) 
	FROM pago
	WHERE fecha_pago BETWEEN '2008-01-01'
	AND '2008-12-31'; 

SELECT DISTINCT(codigo_cliente) 
	FROM pago
	WHERE DATEPART(YEAR, fecha_pago) = '2008';

--9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada
--   y fecha de entrega de los pedidos que no han sido entregados a tiempo.
SELECT codigo_pedido, codigo_cliente, fecha_esperada,fecha_entrega
	FROM pedido
	WHERE CAST(fecha_entrega AS DATE) > CAST(fecha_esperada AS DATE);

--10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada
--    y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos
--    días antes de la fecha esperada.

--INT, INI, FIN
SELECT codigo_pedido,codigo_cliente,fecha_esperada,fecha_entrega
	FROM pedido
	WHERE DATEDIFF(DAY, fecha_entrega, fecha_esperada) >= 2;


