-- Funcion para obtener el total facturado por el usuario especificado por el id, para cada el cliente especificado por su cuit, y en el año especificado

USE `gestion_trabajo`;
DROP FUNCTION IF EXISTS `facturas_usuario_cliente`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `facturas_usuario_cliente`(usuario INT, cliente VARCHAR(50), anio INT)
RETURNS FLOAT
    DETERMINISTIC
BEGIN
	DECLARE total FLOAT;
	SET total = (SELECT SUM(monto) FROM (SELECT f.id_usuario, procot.cuit_cliente, f.monto, f.vencimiento
		FROM
			(facturas f
			JOIN
				(SELECT
					pro.id_proyecto, cot.cuit_cliente
					FROM
						(proyectos pro
						JOIN
							cotizaciones cot
							ON
								(pro.id_cotizacion = cot.id_cotizacion) AND cuit_cliente = cliente)) AS procot
								ON
									(f.id_proyecto = procot.id_proyecto))) AS tabla
                                    WHERE YEAR(vencimiento) = anio AND id_usuario = usuario);
RETURN total;
END; $$

DELIMITER ;