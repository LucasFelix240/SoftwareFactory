-- Active: 1646654372192@@127.0.0.1@3306@softwarefactory
USE SoftwareFactory;
DELIMITER $$
CREATE PROCEDURE altaTecnologia (unidTecnologia TINYINT,
                                unatecnologia VARCHAR(20),
                                uncostoBase DECIMAL(10,2))
BEGIN
        INSERT INTO Tecnologia (idTecnologia, tecnologia, costoBase)
                VALUES      (unidTecnologia, unatecnologia, uncostoBase);
END $$

DELIMITER $$
CREATE PROCEDURE altaRequerimiento (unidRequerimiento INT,
                                        unidProyecto SMALLINT,
                                        unidTecnologia TINYINT,
                                        unadescripcion VARCHAR(45),
                                        unacomplejidad TINYINT UNSIGNED)
BEGIN
        INSERT INTO Requerimiento (idRequerimiento, idProyecto, idTecnologia, descripcion, complejidad)
                VALUES          (unidRequerimiento, unidProyecto, unidTecnologia, unadescripcion, unacomplejidad);
END $$

DELIMITER $$
CREATE PROCEDURE altaTarea (unidRequerimiento INT,
                                uncuil INT,
                                uninicio DATE,
                                unfin DATE)
BEGIN
        INSERT INTO Tarea (idRequerimiento, cuil, inicio, fin)
                VALUES  (unidRequerimiento, uncuil, uninicio, unfin);
END $$

DELIMITER $$
CREATE PROCEDURE altaEmpleado (uncuil INT,
                                unnombre VARCHAR(50),
                                unapellido VARCHAR(50),
                                unacontratacion DATE)
BEGIN
        INSERT INTO Empleado (cuil, nombre, apellido, contratacion)
                VALUES (uncuil, unnombre, unapellido, unacontratacion);
END $$

DELIMITER $$
CREATE PROCEDURE altaProyecto (unidProyecto SMALLINT,
                                uncuit INT,
                                unadescripcion VARCHAR(200),
                                unpresupuesto DECIMAL(10,2),
                                uninicio DATE,
                                unfin DATE)
BEGIN
        INSERT INTO Proyecto (idProyecto, cuit, descripcion, presupuesto, inicio, fin)
                VALUES  (unidProyecto, uncuit, unadescripcion, unpresupuesto, uninicio, unfin);
END $$

DELIMITER $$
CREATE PROCEDURE altaCliente (uncuit INT,
                                unarazonSocial VARCHAR(50))
BEGIN
        INSERT INTO Cliente (cuit, razonSocial)
                VALUES (uncuit, unarazonSocial);
END $$

DELIMITER $$
CREATE PROCEDURE asignarExperiencia (uncuil INT,
                                unidTecnologia TINYINT,
                                unacalifacion TINYINT)
BEGIN
	IF (EXISTS (SELECT * 
                FROM Experiencia 
                WHERE cuil = uncuil 
                AND idTecnologia = unidTecnologia))
                THEN
                UPDATE Experiencia 
                SET calificacion = unacalificacion 
                WHERE cuil = uncuil 
                AND idTecnologia = unidTecnologia;
	ELSE
        INSERT INTO Experiencia (cuil, idTecnologia, calificacion)
		VALUES (uncuil, unidTecnologia, unacalificacion);
        END IF;
END $$

DELIMITER $$
CREATE PROCEDURE finalizarTarea (unidRequerimiento INT, 
                                uncuil INT, 
                                unaFechaFin DATE)
BEGIN
        IF (EXISTS (SELECT *
                        FROM Tarea
                        WHERE idRequerimiento = unidRequerimiento
                        AND cuil = uncuil
                        AND fin = NULL)) 
                        THEN
                        UPDATE Tarea
                        SET fin = unaFechaFin
                        WHERE idTecnologia = unidTecnologia
                        AND cuil = uncuil;
        ELSE
                INSERT INTO Tarea (idRequerimiento, cuil, fin)
                        VALUES (unidRequerimiento, uncuil, unaFechaFin);
        END IF;
END $$