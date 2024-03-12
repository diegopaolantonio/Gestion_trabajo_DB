-- Crea un log por cada cotización creada.

USE gestion_trabajo;

CREATE TABLE log_cotizaciones_nuevas(
id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nro_cotizacion VARCHAR(50) NOT NULL,
cuit_cliente VARCHAR(50) NOT NULL,
id_usuario INT NOT NULL,
log_user VARCHAR(100),
fecha_hora TIMESTAMP,
estado INT
);

CREATE TRIGGER tr_log_cotizaciones_nuevas
AFTER INSERT ON cotizaciones
FOR EACH ROW
INSERT INTO log_cotizaciones_nuevas (nro_cotizacion, cuit_cliente, id_usuario, log_user, fecha_hora, estado)
VALUES (NEW.nro_cotizacion, NEW.cuit_cliente, NEW.id_usuario, USER(), CURRENT_TIMESTAMP(), NEW.estado);
