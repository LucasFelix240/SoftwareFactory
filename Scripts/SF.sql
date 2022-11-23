DELIMITER $$
CREATE FUNCTION complejidadPromedio (unidProyecto SMALLINT) 
                                RETURN FLOAT READS SQL DATA
BEGIN
        DECLARE Resultado FLOAT;

        SELECT AVG(R.complejidad) INTO Resultado
        FROM Proyecto P
        INNER JOIN Requerimiento R ON P.idProyecto = R.idProyecto
        WHERE P.idProyecto = R.idProyecto

        RETURN Resultado;
END $$

DELIMITER $$
CREATE FUNCTION sueldoMensual (uncuil INT) 
                                RETURN (DECIMAL(10,2)) READS SQL DATA
BEGIN
        DECLARE Resultado (DECIMAL(10,2));

        SELECT (timestampdiff(YEAR, contratacion, curdate()) * 1000 +
                SUM(calificacion * costobase)) INTO Resultado
        FROM Empleado E
        INNER JOIN Experiencia USING (cuil)
        INNER JOIN Tecnologia USING (idTecnologia)
        WHERE E.cuil = uncuil;
        RETURN Resultado;
END $$

DELIMITER $$
CREATE FUNCTION costoProyecto (unidProyecto INT) 
                                RETURN (DECIMAL(10,2)) READS SQL DATA
BEGIN
        DECLARE Resultado (DECIMAL(10,2));

        SELECT SUM(R.complejidad * T.costoBase) INTO Resultado
        FROM Tecnologia T
        INNER JOIN Requerimiento R ON T.idTecnologia = R.idTecnologia
        WHERE T.idTecnologia = R.idTecnologia
        RETURN Resultado;
END $$