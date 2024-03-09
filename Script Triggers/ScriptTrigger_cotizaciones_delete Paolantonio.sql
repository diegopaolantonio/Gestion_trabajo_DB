-- Crea un log por cada cotización eliminada.

USE gestion_trabajo;

CREATE TABLE log_cotizaciones_eliminadas(
id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nro_cotizacion VARCHAR(50) NOT NULL,
cuit_cliente VARCHAR(50) NOT NULL,
id_usuario INT NOT NULL,
monto DECIMAL(10,2) DEFAULT NULL,
log_user VARCHAR(100) DEFAULT NULL,
fecha_hora TIMESTAMP DEFAULT NULL,
estado INT
);

CREATE TRIGGER tr_log_cotizaciones_eliminadas
AFTER DELETE ON cotizaciones
FOR EACH ROW
INSERT INTO log_cotizaciones_eliminadas (nro_cotizacion, cuit_cliente, id_usuario, monto, log_user, fecha_hora, estado)
VALUES (OLD.nro_cotizacion, OLD.cuit_cliente, OLD.id_usuario, OLD.monto, USER(), CURRENT_TIMESTAMP());
