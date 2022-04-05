USE ISW312;

--CONSULTA 1
--Devolver un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. 
--Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos
SELECT DISTINCT(codigo_cliente)
FROM pago
WHERE YEAR(fecha_pago) = 2008;

--CONSULTA 2
--Devolver un listado con el código de pedido(tabla pedido), nombre del cliente(tabla cliente), 
--fecha esperada(tabla pedido) y fecha de entrega(tabla pedido) de los pedidos cuya fecha de entrega 
--ha sido al menos dos días antes de la fecha esperada.
-- o sea la fecha de entrega debe ser al menos 2 dias menor que la fecha esperada
--Exploracion de tablas
SELECT * FROM cliente;
SELECT * FROM pedido;

--Solucion
SELECT p.codigo_cliente, c.nombre_cliente, p.fecha_entrega, p.fecha_esperada, p.comentarios
FROM pedido p
INNER JOIN cliente c
ON p.codigo_cliente = c.codigo_cliente
WHERE DATEDIFF(DAY, p.fecha_entrega, p.fecha_esperada) >= 2;

--CONSULTA 3
-- Devolver un listado con todos los productos que pertenecen a la gama Ornamentales y que 
--tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, 
--mostrando en primer lugar los de mayor precio.
SELECT * FROM producto;
SELECT DISTINCT(gama) FROM producto;
SELECT p.codigo_producto, p.nombre, p.cantidad_en_stock, p.precio_venta
FROM producto p
WHERE p.cantidad_en_stock > 100
ORDER BY p.precio_venta DESC;


--CONSULTA 4
--Lista las ventas totales de los productos que hayan facturado más de $3000. Se mostrará el 
--nombre, unidades vendidas, total facturado y total facturado con impuestos (13% IVA).
SELECT * FROM producto;
SELECT * FROM detalle_pedido;

select p.nombre, dp.codigo_producto, dp.cantidad, SUM((dp.cantidad*dp.precio_unidad)) total_facturado, SUM((dp.cantidad*dp.precio_unidad))* 1.13 total_con_iva
FROM detalle_pedido dp
INNER JOIN producto p
ON dp.codigo_producto = p.codigo_producto
GROUP BY dp.codigo_producto, dp.cantidad, p.nombre
HAVING SUM((dp.cantidad*dp.precio_unidad)) > 3000;


--CONSULTA 5
--Devolver el listado de clientes indicando el nombre del cliente y cuantos pedidos ha realizado y 
--el total pagado, Tenga en cuenta que pueden existir clientes que no han realizado ningún 
--pedido y también que hay clientes que realizaron pedidos, pero no han pagado
SELECT codigo_cliente, nombre_cliente FROM cliente;
SELECT * FROM detalle_pedido;
SELECT * FROM pedido;
SELECT * FROM pago;

SELECT c.codigo_cliente, c.nombre_cliente, COUNT(p.codigo_cliente) cantidad_pedidos, SUM(pg.total) total_pagado
FROM cliente c
INNER JOIN pedido p
ON c.codigo_cliente = p.codigo_cliente
INNER JOIN pago pg
ON p.codigo_cliente = pg.codigo_cliente
GROUP BY c.nombre_cliente, c.codigo_cliente,  p.codigo_cliente;


--Estudiar bien esta consulta hecha por Veronica
SELECT c.nombre_cliente, COUNT(p.codigo_cliente) cantidad_pedidos, SUM(pg.total) total_pagado
FROM cliente c
LEFT JOIN pedido p 
ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN pago pg 
ON c.codigo_cliente = pg.codigo_cliente
GROUP BY c.nombre_cliente;



