-- Crea un usuario con los datos enviados.

USE gestion_trabajo;

DELIMITER $$

CREATE PROCEDURE `crear_cliente`(IN var_cuit VARCHAR(50), IN var_nombre VARCHAR(200), IN var_ciudad VARCHAR(50), IN var_provincia VARCHAR(50), IN var_pais VARCHAR(50))

BEGIN
	DECLARE cuit_existente INT;
	DECLARE cuit_existe INT;
	DECLARE nombre_existe INT;
	DECLARE ciudad_existe INT;
	DECLARE provincia_existe INT;
    DECLARE pais_existe INT;
    
    SET cuit_existente = (SELECT COUNT(cuit) FROM clientes WHERE var_cuit = cuit);
   
IF cuit_existente = 0 THEN
 
    SET cuit_existe = campo_existe(var_cuit);
    SET nombre_existe = campo_existe(var_nombre);
    SET ciudad_existe = campo_existe(var_ciudad);
    SET provincia_existe = campo_existe(var_provincia);
    SET pais_existe = campo_existe(var_pais);
    
	SET @columna_insert = "INSERT INTO clientes (";
	SET @var_insert = ") VALUES (";
 
 	IF cuit_existe = 1 THEN
		SET @columna_insert = concat(@columna_insert, "cuit");
		SET @var_insert = concat(@var_insert, "'", var_cuit, "'");
	ELSE
		SET @columna_insert = concat(@columna_insert, "cuit");
		SET @var_insert = concat(@var_insert, "null");
	END IF;

	IF nombre_existe = 1 THEN
		SET @columna_insert = concat(@columna_insert, ", nombre");
		SET @var_insert = concat(@var_insert, ", '", var_nombre, "'");
	ELSE
		SET @columna_insert = concat(@columna_insert, ", nombre");
		SET @var_insert = concat(@var_insert, ", null");
	END IF;

	IF ciudad_existe = 1 THEN
		SET @columna_insert = concat(@columna_insert, ", ciudad");
		SET @var_insert = concat(@var_insert, ", '", var_ciudad, "'");
	END IF;
        
	IF provincia_existe = 1 THEN
		SET @columna_insert = concat(@columna_insert, ", provincia");
		SET @var_insert = concat(@var_insert, ", '", var_provincia, "'");
	END IF;
        
	IF pais_existe = 1 THEN
		SET @columna_insert = concat(@columna_insert, ", pais");
		SET @var_insert = concat(@var_insert, ", '", var_pais, "'");
	END IF;
       
	SET @columna_insert = concat(@columna_insert, @var_insert, ");");

	PREPARE insertar FROM @columna_insert;
    EXECUTE insertar;
    DEALLOCATE PREPARE insertar;
    
	END IF;


END $$

DELIMITER ;