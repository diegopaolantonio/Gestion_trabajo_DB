-- 

USE `gestion_trabajo`;
DROP FUNCTION IF EXISTS `suma_facturas`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `suma_facturas`(usuario INT) RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE total FLOAT;
	SET total = (
		SELECT SUM(monto) 
			FROM facturas 
				WHERE estado = 1
	);
		RETURN total;
END