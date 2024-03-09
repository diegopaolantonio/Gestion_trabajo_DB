-- Ordena la tabla cliente con por el campo especificado y de manera ascendente o descendente según se envíe ASC o DESC.

USE gestion_trabajo;

DELIMITER $$

CREATE PROCEDURE `ordenar_clientes`(IN campo VARCHAR(20), IN tipo_orden VARCHAR(10))
BEGIN
	DECLARE existe_campo INT;
    IF (campo = "nombre" OR campo = "cuit" OR campo = "ciudad" OR campo = "provincia" OR campo = "pais") THEN
		SET existe_campo = 1;
	ELSE
		SET existe_campo = 0;
	END IF;
	IF (existe_campo = 1 AND (tipo_orden = "asc" OR tipo_orden = "desc")) THEN
		SET @clientes_orden = concat(" ORDER BY ", campo, " ", tipo_orden);
	ELSE
		SET @clientes_orden = "";
	END IF;

	SET @result = concat("SELECT * FROM clientes", @clientes_orden);
	PREPARE runSQL FROM @result;
	EXECUTE runSQL;
	DEALLOCATE PREPARE runSQL;
END $$

DELIMITER ;