INSERT INTO aerolínea VALUES(NULL, 'Aerolineas Argentinas');
INSERT INTO pasajero VALUES(22345190, 'Hugo', 'Lopez', '2245237817', 'hugolopez@gamil.com', 1);
INSERT INTO tipo_documento VALUES(null, 'Dni');
INSERT INTO pasajero VALUES(22363190, 'Sandra', 'Lopez', '2245233017', 'sandra1213lopez@gamil.com', 1);
INSERT INTO pasajero VALUES(223145190, 'Santigo', 'Montana', '1545237817', 'santimmontana@gmail.com', 1);
SELECT * FROM pasajero;
INSERT INTO tipo_vuelo VALUES (NULL, 'Business');
INSERT INTO ciudad VALUES('MAD', 'Madrid'), ('EZE','Ezeiza'), ('TUC', 'Tucuman');
SELECT * FROM ciudad;
INSERT INTO aeropuerto VALUES(1, 'EZE'),(2,'MAD');
INSERT INTO pista VALUES(1,1),(2,1),(1,2),(2,2);
INSERT INTO tipo_pista VALUES(1,'Comercial'),(2,'Privada');
INSERT INTO tipo_avión VALUES(null, 'Comercial'),(NULL, 'Privado'),(NULL, 'Militar');
INSERT INTO avión VALUES (1,1,1),(2,1,1),(3,2,1),(4,1,1);
insert into vuelo VALUES(NULL,1,1,1,3),(NULL,1,1,1,3),(NULL,1,1,1,3);
INSERT INTO pasajero_has_vuelo VALUES(22345190,6),(223145190, 6);
INSERT INTO vuelo_has_pista VALUES (2,1,1),(1,3,2);
INSERT INTO vuelo_has_origen VALUES(NOW(),1, 'EZE', 1);
INSERT INTO vuelo_has_destino VALUES('2011-03-02 15:25:58',6, 'MAD', 2);
DELIMITER :
CREATE FUNCTION insert_vuelo
(dni INT ,  avion INT, tipovuelo INT , pista INT, tipoPista INT, fechaSalida DATE, fechaLlegada DATE, salida VARCHAR(3),llegada VARCHAR(3), aerolinea INT, aeropuertoSalida INT, aeropuertoLlegada INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE  idvuelo INT;
    INSERT INTO vuelo VALUES(NULL, aerolinea, tipovuelo, aeropuertoSalida, avion);
    SET idvuelo =  LAST_INSERT_ID();
    INSERT INTO pasajero_has_vuelo VALUES(dni,idvuelo);
    INSERT INTO vuelo_has_pista VALUES (pista,idvuelo,tipoPista);
    INSERT INTO vuelo_has_origen VALUES(fechaSalida,idvuelo, salida, aeropuertoSalida);
	INSERT INTO vuelo_has_destino VALUES(fechaLlegada,idvuelo, llegada, aeropuertoLlegada);
    return idvuelo;
END :
DELIMITER :
UPDATE pasajero_has_vuelo SET vuelo_vuelo_id = 4 WHERE  vuelo_vuelo_id = 1;
SELECT * FROM vuelo_has_destino;
SELECT * FROM (pasajero_has_vuelo INNER JOIN vuelo ON pasajero_has_vuelo.vuelo_vuelo_id = vuelo.vuelo_id) INNER JOIN vuelo_has_destino ON vuelo.vuelo_id = vuelo_has_destino.vuelo_id 
WHERE vuelo_has_destino.código_IATA = 'MAD' AND vuelo_has_destino.fecha_llegada LIKE  '%2011-03%';
SELECT * FROM (pasajero INNER JOIN pasajero_has_vuelo ON pasajero.dni = pasajero_has_vuelo.pasajero_dni)  INNER JOIN (vuelo INNER JOIN tipo_vuelo ON vuelo.tipo_vuelo_id = tipo_vuelo.tipo_vuelo_id) ON pasajero_has_vuelo.vuelo_vuelo_id = vuelo.vuelo_id WHERE tipo_vuelo.nombre = 'Business';
SELECT * FROM pasajero;
INSERT INTO pasajero VALUES(91067456,'Hannah', 'Montana','3627136718', 'hannahmontana@gmail.com', 1);
SELECT * FROM pasajero;
DELETE FROM pasajero WHERE pasajero.dni = 91067456;
SELECT * FROM pasajero;
SELECT * FROM pasajero ORDER BY(telefono);
SELECT pasajero.dni, COUNT(pasajero_has_vuelo.vuelo_vuelo_id) FROM (pasajero INNER JOIN pasajero_has_vuelo ON pasajero.dni = pasajero_has_vuelo.pasajero_dni)  INNER JOIN (vuelo INNER JOIN tipo_vuelo ON vuelo.tipo_vuelo_id = tipo_vuelo.tipo_vuelo_id) ON pasajero_has_vuelo.vuelo_vuelo_id = vuelo.vuelo_id
GROUP BY (pasajero.dni) ORDER BY pasajero.dni DESC;
SELECT pasajero.dni, pasajero.nombre, pasajero.apellido, vuelo.vuelo_id FROM (pasajero INNER JOIN pasajero_has_vuelo ON pasajero.dni = pasajero_has_vuelo.pasajero_dni)  LEFT JOIN (vuelo INNER JOIN tipo_vuelo ON vuelo.tipo_vuelo_id = tipo_vuelo.tipo_vuelo_id) ON pasajero_has_vuelo.vuelo_vuelo_id = vuelo.vuelo_id WHERE tipo_vuelo.nombre = 'Business';