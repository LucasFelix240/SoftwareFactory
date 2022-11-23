-- Active: 1646654372192@@127.0.0.1@3306@softwarefactory
USE SoftwareFactory;
DELIMITER $$
DROP TRIGGER IF EXISTS BeforeInsertTarea;

CREATE TRIGGER BeforeInsertTarea BEFORE INSERT ON Tarea
FOR EACH ROW
BEGIN
        DECLARE varCalificacion TINYINT;
        DECLARE varComplejidad TINYINT;

        SELECT calificacion INTO varCalificacion
        FROM Experiencia E
        INNER JOIN Requerimiento R ON E.idTecnologia = R.idTecnologia
        WHERE E.cuil = NEW.cuil
        AND R.idRequerimiento = NEW.idRequerimiento;

        SELECT complejidad INTO varComplejidad
        FROM Requerimiento
        WHERE idRequerimiento = NEW.idRequerimiento;

        IF(varCalificacion < varComplejidad) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Calificacion insuficiente';
        END IF;
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS AftInsEmpleado;

CREATE TRIGGER AftInsEmpleado AFTER INSERT ON Empleado
FOR EACH ROW
BEGIN
        INSERT INTO Experiencia (cuil, idTecnologia, calificacion)
                        VALUES  (NEW.cuil, idTecnologia, 0);
END $$

-- Trigger para que falle a proposito
