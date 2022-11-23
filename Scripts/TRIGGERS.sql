USE SoftwareFactory;
DELIMITER $$
CREATE TRIGGER BeforeInsertTarea BEFORE INSERT ON Tarea
FOR EACH ROW
BEGIN
        IF(NEW.calificacion < OLD.complejidad) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Calificación insuficiente';
END $$

DELIMITER $$
CREATE TRIGGER AftInsEmpleado AFTER INSERT ON Empleado
FOR EACH ROW
BEGIN
        INSERT INTO Experiencia (cuil, idTecnologia, calificacion)
                        VALUES  (NEW.cuil, NEW.idTecnologia, 0);
END $$