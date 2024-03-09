-- Visualiza las facturas emitidas por los usuarios a los clientes con los datos de los proyectos.

USE gestion_trabajo;

CREATE OR REPLACE VIEW vw_facturas AS
(SELECT
	f.nro_factura, u.nombre AS usuario, pc.cliente AS cliente, pc.nro_cotizacion, pc.nro_orden, f.monto, f.fecha, f.vencimiento, f.estado
	FROM
		(facturas f
		JOIN
			usuario u
			ON
				(f.id_usuario = u.id_usuario)
		JOIN
			(SELECT
				pro.id_proyecto AS id_proyecto, cotcli.cliente AS cliente, cotcli.nro_cotizacion AS nro_cotizacion, pro.nro_orden AS nro_orden
                FROM
					(proyectos pro
					JOIN
						(SELECT
							cot.id_cotizacion AS id_cotizacion, cli.nombre AS cliente, cot.nro_cotizacion AS nro_cotizacion
							FROM
								(cotizaciones cot
								JOIN
									clientes cli
                                    ON
										(cot.cuit_cliente = cli.cuit))) AS cotcli
										ON
										(pro.id_cotizacion = cotcli.id_cotizacion))) AS pc
											ON
											(f.id_proyecto = pc.id_proyecto))
	ORDER BY
		usuario ASC);
