-- Funcion auxiliar para detectar si los campos ingresados tienen informacion, usada en los Stored Procedures

USE `gestion_trabajo`;
DROP FUNCTION IF EXISTS `campo_existe`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `campo_existe`(campo VARCHAR(200)) RETURNS int
    NO SQL
BEGIN
	DECLARE existe INT;
	IF ((campo <> "") AND (campo <> "null")) THEN
		SET existe = 1;
	ELSE
		SET existe = 0;
	END IF;
RETURN existe;
END $$

DELIMITER ;