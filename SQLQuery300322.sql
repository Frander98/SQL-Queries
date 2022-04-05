CREATE TABLE editorial(
	id_edit INTEGER NOT NULL PRIMARY KEY,
	nombre_edit VARCHAR(50)
);

CREATE TABLE libro(
	id_libro VARCHAR(10),
	id_edit INTEGER NOT NULL,
	fecha_pub DATE,
	CONSTRAINT fk_id_Edit FOREIGN KEY (id_edit) REFERENCES editorial(id_edit)
)

ALTER TABLE libro ALTER COLUMN id_libro VARCHAR(10) NOT NULL;
ALTER TABLE libro ADD CONSTRAINT  pk_id PRIMARY KEY(id_libro);

CREATE TABLE autor(
	id_autor VARCHAR(15) PRIMARY KEY NOT NULL,
	nombre_autor VARCHAR(50),
	telefono VARCHAR(15)
)

CREATE TABLE autores_x_libro(
	id_libro VARCHAR(10),
	id_autor VARCHAR(15),
	CONSTRAINT fk_id_lib FOREIGN KEY(id_libro) REFERENCES libro(id_libro),
	CONSTRAINT fk_id_aut FOREIGN KEY(id_autor) REFERENCES autor(id_autor)
)