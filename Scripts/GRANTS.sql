-- Active: 1646654372192@@127.0.0.1@3306@softwarefactory
USE SoftwareFactory;

CREATE USER IF NOT EXISTS 'Administrador'@'%' IDENTIFIED BY 'passAdministrador';
GRANT SELECT ON SoftwareFactory.* TO 'Administrador'@'%';
GRANT UPDATE ON SoftwareFactory.Proyecto TO 'Administrador'@'%';

CREATE USER IF NOT EXISTS 'PM'@'10.3.45.%' IDENTIFIED BY 'passPM';
GRANT SELECT ON SoftwareFactory.* TO 'PM'@'10.3.45.%';
GRANT INSERT, UPDATE(calificacion) ON SoftwareFactory.Experiencia TO 'PM'@'10.3.45.%';
GRANT INSERT ON SoftwareFactory.Empleado TO 'PM'@'10.3.45.%';
GRANT INSERT ON SoftwareFactory.Requerimiento TO 'PM'@'10.3.45.%';
GRANT INSERT, UPDATE(fin) ON SoftwareFactory.Tarea TO 'PM'@'10.3.45.%';

CREATE USER IF NOT EXISTS 'Empleado'@'10.3.45.%' IDENTIFIED BY 'passEmpleado';
GRANT SELECT ON SoftwareFactory.* TO 'Empleado'@'10.3.45.%';