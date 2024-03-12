-- Crea un log por cada factura creada.

USE gestion_trabajo;

CREATE TABLE log_facturas_nuevas(
id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nro_factura VARCHAR(50) NOT NULL,
id_proyecto INT NOT NULL,
monto DECIMAL(10,2),
log_user VARCHAR(100),
fecha_hora TIMESTAMP,
estado INT
);

CREATE TRIGGER tr_log_facturas_nuevas
AFTER INSERT ON facturas
FOR EACH ROW
INSERT INTO log_facturas_nuevas (nro_factura, id_proyecto, monto, log_user, fecha_hora, estado)
VALUES (NEW.nro_factura, NEW.id_proyecto, NEW.monto, USER(), CURRENT_TIMESTAMP(), NEW.estado);
