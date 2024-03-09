-- Visualiza que personal lo realizo realizo un proyecto para cada usuario y entre que fechas.

USE gestion_trabajo;

CREATE OR REPLACE VIEW vw_usuario_personal AS
(SELECT
	cotcli.usuario, CONCAT (per.nombre, ' ', per.apellido) AS personal, cotcli.nro_cotizacion, pro.fecha_inicio, pro.fecha_fin
	FROM
		(proyectos pro
		JOIN
			personal per
			ON
				(pro.legajo_personal = per.legajo)
		JOIN
			(SELECT
				cot.id_cotizacion AS id_cotizacion, u.nombre AS usuario, cot.nro_cotizacion AS nro_cotizacion, cot.descripcion AS descripcion, cot.monto AS monto
				FROM
					(cotizaciones cot
					JOIN
						usuario u
						ON
							(cot.id_usuario = u.id_usuario))) AS cotcli
							ON
								(pro.id_cotizacion = cotcli.id_cotizacion))
	ORDER BY
		usuario ASC);
