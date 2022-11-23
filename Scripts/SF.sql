-- Active: 1646654372192@@127.0.0.1@3306@softwarefactory
USE SoftwareFactory;
DELIMITER $$
DROP FUNCTION IF EXISTS complejidadPromedio;

CREATE FUNCTION complejidadPromedio (unidProyecto SMALLINT) 
                                        RETURNS FLOAT
                                        READS SQL DATA
BEGIN
        DECLARE Resultado FLOAT;

        SELECT AVG(R.complejidad) INTO Resultado
        FROM Proyecto P
        INNER JOIN Requerimiento R ON P.idProyecto = R.idProyecto
        WHERE P.idProyecto = R.idProyecto;

        RETURN Resultado;
END $$

DELIMITER $$
DROP FUNCTION IF EXISTS sueldoMensual;

CREATE FUNCTION sueldoMensual (uncuil INT) 
                        RETURNS DECIMAL(10,2)
                        READS SQL DATA
BEGIN
        DECLARE Resultado DECIMAL(10,2);

        SELECT (TIMESTAMPDIFF(YEAR, contratacion, curdate()) * 1000 +
                SUM(calificacion * costobase)) INTO Resultado
        FROM Empleado E
        INNER JOIN Experiencia EX ON E.cuil = EX.cuil
        INNER JOIN Tecnologia T ON EX.idTecnologia = T.idTecnologia
        WHERE E.cuil = EX.uncuil
        AND EX.idTecnologia = T.idTecnologia;

        RETURN Resultado;
END $$

DELIMITER $$
DROP FUNCTION IF EXISTS costoProyecto;

CREATE FUNCTION costoProyecto (unidProyecto INT) 
                                RETURNS DECIMAL(10,2) 
                                READS SQL DATA
BEGIN
        DECLARE Resultado DECIMAL(10,2);

        SELECT SUM(R.complejidad * T.costoBase) INTO Resultado
        FROM Tecnologia T
        INNER JOIN Requerimiento R ON T.idTecnologia = R.idTecnologia
        WHERE T.idTecnologia = R.idTecnologia;

        RETURN Resultado;
END $$