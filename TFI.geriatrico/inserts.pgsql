--Pacientes
INSERT INTO pacientes (dni, nombre, edad, habitacion,  pañal, dieta_especial) VALUES (23758331, 'Eduardo Gomez', 89, 1,'no', 'sal');
INSERT INTO pacientes (dni, nombre, edad, habitacion, dependencia, pañal) VALUES (22759489, 'Ana Rodriguez', 81, 2, 'comer', 'si');
INSERT INTO pacientes (dni, nombre, num_pami, edad, habitacion, pañal, dieta_especial) VALUES (23149578, 'Alberto Lopez', 1306, 91, 1, 'si', 'celiaco');
INSERT INTO pacientes (dni, nombre, edad, habitacion, dependencia, pañal) VALUES (19755367, 'Alfredo Hernandez', 89, 3, 'vestir', 'si');
INSERT INTO pacientes (dni, nombre, edad, habitacion, dependencia, pañal) VALUES (19318331, 'Alexis Garcia', 79, 4, 'vestir', 'no');
INSERT INTO pacientes (dni, nombre, num_pami, edad, habitacion, dependencia, pañal) VALUES (18699431, 'Maria Avalos',783, 80, 2, 'mover', 'si');
INSERT INTO pacientes (dni, nombre, edad, habitacion, pañal) VALUES (19724687, 'Carmen Celli', 84, 4, 'no');
INSERT INTO pacientes (dni, nombre, num_pami, edad, habitacion, dependencia, pañal, dieta_especial) VALUES (18054069, 'Rosa Garmendi', 1640, 93, 3, 'mover', 'si', 'sal');
INSERT INTO pacientes (dni, nombre, edad, habitacion, dependencia, pañal) VALUES (17723051, 'Liliana Rampetti', 95, 5, 'comer', 'si');
INSERT INTO pacientes (dni, nombre, num_pami, edad, habitacion,  pañal, dieta_especial) VALUES (18394578, 'Ignacio Sciachi',1501 , 83, 5, 'no', 'diabetico');



--Profesional
INSERT INTO profesional (dni, nombre, matricula, especialidad, cant_horas, sueldo) VALUES (28345982, 'Marcelo Gallardo', '91218', 'Medico', 50, 100000);
INSERT INTO profesional (dni, nombre, matricula, especialidad, cant_horas, sueldo) VALUES (34659894, 'Soledad Silveyra', '18', 'Asistente Social', 40, 40000);
INSERT INTO profesional (dni, nombre, matricula, especialidad, cant_horas, sueldo) VALUES (37898776, 'Sebastian Estevanez', '6877', 'Psiquiatra', 50, 25000);
INSERT INTO profesional (dni, nombre, matricula, especialidad, cant_horas, sueldo) VALUES (35353535, 'Osvaldo Laport', '79722', 'Psicologo', 40, 40000);
INSERT INTO profesional (dni, nombre, matricula, especialidad, cant_horas, sueldo) VALUES (34253555, 'Carina Zampini', '1218', 'Kinesiologa', 60, 36000);
INSERT INTO profesional (dni, nombre, especialidad, cant_horas, sueldo) VALUES (34984789, 'Sol Estevanez', 'Acompañante Terapeutico', 20, 10000);
INSERT INTO profesional (dni, nombre, matricula, especialidad, cant_horas, sueldo) VALUES (37846378, 'Lucia Galan', '8181', 'Nutricionista', 30, 36000);


--Historial
INSERT INTO historia_clinica (entrada, indicaciones, diagnostico, idpaciente, idprofesional, fecha) VALUES ('Dificultades en el equilibrio', 'Intentar pararse una vez al dia', NULL, 2, 5, '2022-04-20');
INSERT INTO historia_clinica (entrada, indicaciones, diagnostico, idpaciente, idprofesional, fecha) VALUES ('Discurso coherente pero al desarrollarlo se torna inconsistente. Evidencio fallas de memoria', NULL, NULL, 2, 4, '2022-04-20');
INSERT INTO historia_clinica (entrada, indicaciones, diagnostico, idpaciente, idprofesional, fecha) VALUES ('Se contactó con su familiar debido a que fue derivado a Hospital General', NULL, NULL, 1, 2, '2022-04-20');
INSERT INTO historia_clinica (entrada, indicaciones, diagnostico, idpaciente, idprofesional, fecha) VALUES ('Dificultades en la respiracion, fiebre alta', 'Amoxicilina 100mg cada 8 hs', 'Gripe', 6, 1, '2022-06-15');
INSERT INTO historia_clinica (entrada, indicaciones, diagnostico, idpaciente, idprofesional, fecha) VALUES ('Caída desde su propia altura. Refiere dolor en pierna derecha', 'Reposo por 24 hs. Diclofenac 50mg cada 6 hs', NULL, 3, 1, '2022-05-02');
INSERT INTO historia_clinica (entrada, indicaciones, diagnostico, idpaciente, idprofesional, fecha) VALUES ('Se deja constancia que durante el acompañamiento al banco se comportó de manera agresiva.', NULL, NULL, 2, 6, '2022-02-28');
INSERT INTO historia_clinica (entrada, indicaciones, diagnostico, idpaciente, idprofesional, fecha) VALUES ('Refirió malestar estomacal tras comer verduras de hoja verde', 'Retirar verduras de hoja verde de la dieta', NULL, 3, 7, '2022-05-20');
INSERT INTO historia_clinica (entrada, indicaciones, diagnostico, idpaciente, idprofesional, fecha) VALUES ('Disminuyó su peso el último mes en 5kg, se encuentra bajo peso', 'Dieta hipercalórica, insistir en que se alimente', NULL, 3, 7, '2022-05-20');
INSERT INTO historia_clinica (entrada, indicaciones, diagnostico, idpaciente, idprofesional, fecha) VALUES ('Se intervino en situación donde se comportaba agresivamente, se contuvo afectivamente', NULL, 'Trastorno disocial de la Personalidad', 8, 4, '2022-03-29');
INSERT INTO historia_clinica (entrada, indicaciones, diagnostico, idpaciente, idprofesional, fecha) VALUES ('Presentó niveles altos de glucemia', 'Derivar a hospital general', 'Diabetes', 1, 1, '2022-01-20');
INSERT INTO historia_clinica (entrada, indicaciones, diagnostico, idpaciente, idprofesional, fecha) VALUES ('Se le entregó la suma de $5000 para que adminsitre como crea conveniente', NULL, NULL, 6, 2, '2022-05-11');


--Proyectos
INSERT INTO proyectos (nombre, descripcion, fecha) VALUES ('Taller de musica', 'Se escucharon ritmos latinos, la mayoría de los pacientes bailaba en el lugar', '2022-05-05');
INSERT INTO proyectos (nombre, descripcion, fecha) VALUES ('Taller psicomotriz', 'Se jugó a la lotería en el comedor', '2022-04-05');
INSERT INTO proyectos (nombre, descripcion, fecha) VALUES ('Taller de movimiento', 'Se practicaron ejercicos de brazos', '2022-05-19');
INSERT INTO proyectos (nombre, descripcion, fecha) VALUES ('Taller de musica', 'Se escucharon tangos, les agradó mucho', '2022-01-31');
INSERT INTO proyectos (nombre, descripcion, fecha) VALUES ('Taller de dibujo', 'Se repartieron mandalas para pintar, les agradó mucho', '2022-05-15');


INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (1, 1);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (1, 3);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (1, 5);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (1, 7);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (2, 1);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (2, 2);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (2, 3);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (2, 4);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (3, 1);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (3, 2);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (3, 4);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (3, 6);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (4, 3);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (4, 4);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (4, 1);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (5, 2);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (5, 4);
INSERT INTO proyectos_pacientes (idproyecto, idpaciente) VALUES (5, 6);


INSERT INTO proyectos_profesionales (idproyecto, idprofesional) VALUES (1, 1);
INSERT INTO proyectos_profesionales (idproyecto, idprofesional) VALUES (2, 2);
INSERT INTO proyectos_profesionales (idproyecto, idprofesional) VALUES (2, 3);
INSERT INTO proyectos_profesionales (idproyecto, idprofesional) VALUES (3, 4);
INSERT INTO proyectos_profesionales (idproyecto, idprofesional) VALUES (3, 5);
INSERT INTO proyectos_profesionales (idproyecto, idprofesional) VALUES (4, 6);
INSERT INTO proyectos_profesionales (idproyecto, idprofesional) VALUES (5, 7);
INSERT INTO proyectos_profesionales (idproyecto, idprofesional) VALUES (5, 1);


--PersonaCargo
INSERT INTO personacargo (nombre, relacion, direccion, idpaciente) VALUES ('Emiliano Martinez', 'Hijo', 'Calle falsa 123', 1);
INSERT INTO personacargo (nombre, relacion, idpaciente) VALUES ('Soledad Silveyra', 'Asistente Social', 2);
INSERT INTO personacargo (nombre, relacion, direccion, idpaciente) VALUES ('Rogelio Funes Mori', 'Sobrino', 'Avenida 22 numero 698', 3);
INSERT INTO personacargo (nombre, relacion, direccion, idpaciente) VALUES ('Camila Almiron', 'Nieta', 'Entre Rios 2319', 4);
INSERT INTO personacargo (nombre, relacion, direccion, idpaciente) VALUES ('Yesica Lima', 'Amiga', 'Castelli 2987', 5);
INSERT INTO personacargo (nombre, relacion, idpaciente) VALUES ('Soledad Silveyra', 'Asistente Social', 6);
INSERT INTO personacargo (nombre, relacion, direccion, idpaciente) VALUES ('Noelia Cabrera', 'Esposa', 'Necochea 322', 7);
INSERT INTO personacargo (nombre, relacion, idpaciente) VALUES ('Soledad Silveyra', 'Asistente Social', 8);
INSERT INTO personacargo (nombre, relacion, direccion, idpaciente) VALUES ('Clara Daniela Saltana', 'Hija', 'Jujuy 322', 9);
INSERT INTO personacargo (nombre, relacion, idpaciente) VALUES ('Soledad Silveyra', 'Asistente Social', 10);
