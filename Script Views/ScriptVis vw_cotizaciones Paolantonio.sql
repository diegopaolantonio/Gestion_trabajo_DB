-- Visualiza las cotizaciones que hizo cada usuario a los clientes.

USE gestion_trabajo;

CREATE OR REPLACE VIEW vw_cotizaciones AS
(SELECT
	cot.nro_cotizacion, u.nombre AS usuario, cli.nombre AS cliente, cot.descripcion, cot.monto, cot.comentarios, cot.estado
	FROM
		(cotizaciones cot
		JOIN
			clientes cli
			ON
				(cot.cuit_cliente = cli.cuit)
		JOIN
			usuario u
            ON
				(cot.id_usuario = u.id_usuario)));
