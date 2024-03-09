CREATE SCHEMA gestion_trabajo;
USE gestion_trabajo;

CREATE TABLE usuario (
id_usuario INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
ciudad VARCHAR(50),
provincia VARCHAR(50),
pais VARCHAR(50),
fecha_inicio DATE,
PRIMARY KEY (id_usuario)
);

CREATE TABLE gastos (
id_gastos INT NOT NULL AUTO_INCREMENT,
id_usuario INT NOT NULL,
descripcion VARCHAR(200) NOT NULL,
monto DECIMAL(10,2) NOT NULL,
periodo VARCHAR(20),
vencimiento DATE,
periodicidad VARCHAR(20),
estado INT NOT NULL DEFAULT 0,
PRIMARY KEY (id_gastos),
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE clientes (
cuit VARCHAR(50) NOT NULL,
nombre VARCHAR(200) NOT NULL,
ciudad VARCHAR(50),
provincia VARCHAR(50),
pais VARCHAR(50),
PRIMARY KEY (cuit)
);

CREATE TABLE cotizaciones (
id_cotizacion INT NOT NULL AUTO_INCREMENT,
nro_cotizacion VARCHAR(50) NOT NULL,
cuit_cliente VARCHAR(50) NOT NULL,
id_usuario INT NOT NULL,
descripcion VARCHAR(500) NOT NULL,
monto DECIMAL(10,2) NOT NULL,
comentarios VARCHAR(500),
estado INT NOT NULL DEFAULT 0,
PRIMARY KEY (id_cotizacion),
FOREIGN KEY (cuit_cliente) REFERENCES clientes (cuit),
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE personal (
legajo INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
especialidad VARCHAR(100),
PRIMARY KEY (legajo)
);

CREATE TABLE proyectos (
id_proyecto INT NOT NULL AUTO_INCREMENT,
id_cotizacion INT NOT NULL,
legajo_personal INT NOT NULL,
comentarios VARCHAR(200),
fecha_inicio DATE,
fecha_fin DATE,
sector VARCHAR(50),
nro_orden VARCHAR(50),
PRIMARY KEY (id_proyecto),
FOREIGN KEY (id_cotizacion) REFERENCES cotizaciones (id_cotizacion),
FOREIGN KEY (legajo_personal) REFERENCES personal (legajo)
);

CREATE TABLE facturas (
id_factura INT NOT NULL AUTO_INCREMENT,
nro_factura VARCHAR(50) NOT NULL,
id_usuario INT NOT NULL,
id_proyecto INT NOT NULL,
monto DECIMAL(10,2) NOT NULL,
fecha DATE,
vencimiento DATE,
estado INT NOT NULL DEFAULT 0,
PRIMARY KEY (id_factura),
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
FOREIGN KEY (id_proyecto) REFERENCES proyectos (id_proyecto)
);