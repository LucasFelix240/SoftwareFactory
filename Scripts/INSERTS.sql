START TRANSACTION;

    INSERT INTO Cliente (cuit, razonSocial)
        VALUES          (100, 'Unicornio Azul'),
                        (200, 'Yellow Monkey'),
                        (300, 'Tartaruga Vermelha');

    INSERT INTO Empleado    (cuil, nombre, apellido, contratacion)
        VALUES              (1000, 'Lucas', 'Medina', '2015-08-25'),
                            (1100, 'Ezequiel', 'Kippes', '2015-08-25'),
                            (1200, 'Beymar', 'León', '2015-10-5'),
                            (1300, 'Arturo', 'Cruz', '2016-01-15'),
                            (1400, 'Alexis', 'Noguera', '2017-03-22'),
                            (1500, 'Leonardo', 'Farfan', '2018-06-15'),
                            (1600, 'Maria Jose', 'Candia', '2018-06-15');

    INSERT INTO Tecnologia  (idTecnologia, tecnologia, costoBase)
        VALUES              (1,'C#', 15000),
                            (2, 'React', 10000),
                            (3, 'Java', 15000),
                            (4, 'HTML', 8000),
                            (5, 'GIT', 5000),
                            (6, 'Desarrollador MySQL', 8000),
                            (7, 'DBA MySQL', 14000);

    INSERT INTO Experiencia (cuil, idTecnologia, calificacion)
        VALUES              (1000, 1, 2),
                            (1000, 6, 7),
                            (1100, 1, 5),
                            (1100, 6, 6),
                            (1100, 5, 4),
                            (1200, 1, 8),
                            (1200, 6, 8),
                            (1200, 7, 2),
                            (1300, 1, 8),
                            (1300, 3, 2),
                            (1300, 6, 8),
                            (1400, 1, 6),
                            (1400, 5, 4),
                            (1400, 6, 8),
                            (1500, 1, 5),
                            (1500, 2, 4),
                            (1500, 4, 7),
                            (1500, 5, 6),
                            (1500, 6, 6),
                            (1500, 7, 4),
                            (1600, 1, 5),
                            (1600, 2, 3),
                            (1600, 3, 4),
                            (1600, 4, 8),
                            (1600, 5, 5),
                            (1600, 6, 6),
                            (1600, 7, 6);

    INSERT INTO Proyecto    (idProyecto, cuit, descripcion, presupuesto, inicio, fin)
        VALUES              (10, 100, 'Canino APP', 150000, '2020-01-01', '2021-02-15'),
                            (20, 200, 'StockAr', 250000, '2020-01-01', '2021-01-01'),
                            (30, 300, 'Centro Medico', 450000, '2021-09-01', NULL);

    INSERT INTO Requerimiento   (idRequerimiento, idProyecto, idTecnologia, descripcion, complejidad)
        VALUES                  (1, 10, 1, 'Programación BackEnd', 6),
                                (2, 10, 1, 'Programación Razor', 4),
                                (3, 10, 4, 'Programación FrontEnd', 4),
                                (4, 10, 5, 'Versionamiento', 4),
                                (5, 10, 6, 'Persistencia', 5),
                                (6, 20, 1, 'Microservicio de BackEnd', 5),
                                (7, 20, 2, 'Programación FrontEnd', 4),
                                (8, 20, 3, 'Microservicio de Persistencia', 4),
                                (9, 20, 4, 'FrontEnd', 3),
                                (10, 20, 5, 'Versionamiento', 4),
                                (11, 20, 6, 'Optimización Persistencia', 2),
                                (12, 30, 3, 'Microservicio Pacientes', 4),
                                (13, 30, 1, 'Microservicio Medicos', 4),
                                (14, 30, 1, 'Microservicio Turnos', 6),
                                (15, 30, 2, 'FrontEnd Responsive', 6),
                                (16, 30, 4, 'FrontEnd Escritorio', 3),
                                (17, 30, 3, 'Microservicio Persistencia', 4),
                                (18, 30, 5, 'Versionamiento', 6),
                                (19, 30, 6, 'Optimización Persistencia', 4),
                                (20, 30, 7, 'Implementación DB y Administración', 6);

    INSERT INTO Tarea   (idRequerimiento, cuil, inicio, fin)
            VALUES      (1, 1200, '2020-01-01', '2020-04-01'),
                        (1, 1400, '2020-01-01', '2020-04-01'),
                        (2, 1600, '2020-04-01', '2020-08-31'),
                        (3, 1600, '2020-04-01', '2020-08-31'),
                        (4, 1500, '2020-01-01', '2021-02-14'),
                        (5, 1300, '2020-01-01', '2021-02-14'),
                        (6, 1100, '2020-01-01', '2020-07-01'),
                        (7, 1600, '2020-07-01', '2021-01-01'),
                        (8, 1600, '2020-01-01', '2020-07-01'),
                        (9, 1500, '2020-07-01', '2021-01-01'),
                        (10, 1100, '2020-01-01', '2021-01-01'),
                        (10, 1400, '2020-01-01', '2021-01-01'),
                        (11, 1000, '2020-01-01', '2021-01-01'),
                        (11, 1300, '2020-01-01', '2021-01-01');

COMMIT;