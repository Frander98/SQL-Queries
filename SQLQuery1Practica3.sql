USE DDBBSistemaVentas;

--entidad fuerte
CREATE TABLE proveedores(
	id_proveedor INTEGER NOT NULL PRIMARY KEY,
	nom_proveedor VARCHAR(15),
	apell_1_proveedor VARCHAR(15),
	apell_2_proveedor VARCHAR(15),
	dir_nom_calle VARCHAR(20),
	dir_num_calle VARCHAR(10),
	dir_nom_comuna VARCHAR(20),
	dir_nom_ciudad VARCHAR(20),
	tel_proveedor VARCHAR(20),
	pag_web_prov VARCHAR(30)
)
SELECT * FROM proveedores;

--entidad fuerte
CREATE table telefonos(
	id_telefono INTEGER NOT NULL PRIMARY KEY,
	telefonos VARCHAR(60)
)
SELECT * FROM telefonos;


--entidad debil
CREATE TABLE clientes(
	id_cliente INTEGER NOT NULL PRIMARY KEY,
	nom_cliente VARCHAR(15),
	apell_1_cliente VARCHAR(15),
	apell_2_cliente VARCHAR(15),
	dir_nom_calle VARCHAR(20),
	dir_num_calle VARCHAR(10),
	dir_nom_comuna VARCHAR(20),
	dir_nom_ciudad VARCHAR(20),
	tel_s_cliente INTEGER,
	CONSTRAINT fk_id_tel FOREIGN KEY(tel_s_cliente) REFERENCES telefonos(id_telefono)
)
SELECT * FROM clientes;

--entidad fuerte
CREATE TABLE categorias(
	id_categoria INTEGER NOT NULL PRIMARY KEY,
	nom_categoria VARCHAR(15),
	desc_categoria VARCHAR(50)
)
ALTER TABLE categorias ADD CONSTRAINT u_categoria UNIQUE(nom_categoria);
SELECT * FROM categorias;

--entidad debil
CREATE TABLE productos(
	id_producto INTEGER NOT NULL PRIMARY KEY,
	nom_producto VARCHAR(15),
	precio_actual DECIMAL(10,2),
	stock DECIMAL(8,2),
	id_proveedor INTEGER NOT NULL,
	id_categoria INTEGER NOT NULL,
	CONSTRAINT fk_proveedor FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor),
	CONSTRAINT fk_categoria FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria)
)
SELECT * FROM productos;

--entidad debil
CREATE TABLE ventas(
	id_venta INTEGER NOT NULL PRIMARY KEY,
	fecha_venta DATETIME NOT NULL,
	cliente INTEGER,
	id_producto INTEGER,
	cantidad DECIMAL(10,2),
	descuento DECIMAL(5,2),
	monto_final DECIMAL(15,2),
	CONSTRAINT fk_cliente FOREIGN KEY(cliente) REFERENCES clientes(id_cliente),
	CONSTRAINT fk_producto FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
)
SELECT * FROM ventas;

