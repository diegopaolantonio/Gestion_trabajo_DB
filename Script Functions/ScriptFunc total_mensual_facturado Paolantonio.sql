-- Funcion para obtener el total facturado por el usuario especificado por su id, en un año y mes especifico

USE `gestion_trabajo`;
DROP FUNCTION IF EXISTS `total_mensual_facturado`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `total_mensual_facturado`(usuario INT, anio INT, mes INT)
RETURNS FLOAT
    DETERMINISTIC
BEGIN
	DECLARE total FLOAT;
    SET total = (SELECT SUM(monto) FROM facturas WHERE id_usuario = usuario AND YEAR(vencimiento) = anio AND MONTH(vencimiento) = mes);
RETURN total;
END; $$

DELIMITER ;