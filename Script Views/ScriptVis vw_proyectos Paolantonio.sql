-- Visualiza los proyectos de cada cliente y que personal lo realizo.

USE gestion_trabajo;

CREATE OR REPLACE VIEW vw_proyectos AS
(SELECT
	cotcli.cliente, cotcli.nro_cotizacion, CONCAT (per.nombre, ' ', per.apellido) AS personal, cotcli.descripcion, pro.fecha_inicio, pro.fecha_fin, pro.comentarios, cotcli.monto
	FROM
		(proyectos pro
		JOIN
			personal per
			ON
				(pro.legajo_personal = per.legajo)
		JOIN
			(SELECT
				cot.id_cotizacion AS id_cotizacion, cli.nombre AS cliente, cot.nro_cotizacion AS nro_cotizacion, cot.descripcion AS descripcion, cot.monto AS monto
				FROM
					(cotizaciones cot
					JOIN
						clientes cli
						ON
							(cot.cuit_cliente = cli.cuit))) AS cotcli
							ON
								(pro.id_cotizacion = cotcli.id_cotizacion))
	ORDER BY
		cliente ASC);
