-- Elimina el cliente con el “cuit” especificado.

USE gestion_trabajo;

DELIMITER $$

CREATE PROCEDURE `eliminar_cliente_cuit` (IN var_cuit VARCHAR(50))
BEGIN
	DECLARE cuit_existe INT;
    
    SET cuit_existe = campo_existe(var_cuit);

	IF cuit_existe = 1 THEN
		SET @orden_delete = concat("DELETE FROM clientes WHERE cuit LIKE '", var_cuit ,"';");
    END IF;
    
	PREPARE eliminar FROM @orden_delete;
    EXECUTE eliminar;
    DEALLOCATE PREPARE eliminar;
END $$

DELIMITER ;