--Vista de todos los participantes del taller de musica con su profesional a cargo.
CREATE VIEW participantes_musica
AS SELECT pa.nombre, pr.fecha, pr.nombre AS taller, pf.nombre AS profesional

FROM ((((pacientes pa NATURAL JOIN proyectos_pacientes ppa ) INNER JOIN proyectos pr ON ppa.idproyecto = pr.idproyecto) INNER JOIN proyectos_profesionales ppf ON ppa.idproyecto = ppf.idproyecto) INNER JOIN profesional pf ON ppf.idprofesional = pf.idprofesional)

WHERE ppa.idproyecto= 1 OR ppa.idproyecto = 4;

--Ver la vista
SELECT *
FROM participantes_musica ORDER BY fecha, nombre;



--Mayores de 90 que no participaron de ningun proyecto y su persona a cargo es la asistente del hogar
SELECT pa.idpaciente, pa.nombre, pa.edad, pc.nombre AS responsable
FROM pacientes pa INNER JOIN personacargo pc ON pa.idpaciente = pc.idpaciente
WHERE (pa.edad > 90) AND pc.relacion LIKE 'Asistente Social' AND NOT EXISTS (SELECT *
     			  															 FROM proyectos_pacientes ppa
   			  															 WHERE pa.idpaciente = ppa.idpaciente);


--Ver historia clinica del paciente solicitado en el where
SELECT pa.nombre AS paciente, hc.entrada, hc. indicaciones, hc.diagnostico, pf.nombre AS profesional, hc.fecha
FROM (historia_clinica hc NATURAL JOIN pacientes pa) INNER JOIN profesional pf ON hc.idprofesional = pf.idprofesional
WHERE idpaciente = 2 ORDER BY fecha, pf.nombre;



-- Profesionales que participaron en la actividad con menor cantidad de pacientes
CREATE FUNCTION menos_participantes() RETURNS INT AS $$
SELECT MIN(count)
FROM (SELECT COUNT (idpaciente)
  	FROM proyectos_pacientes
  	GROUP BY idproyecto
  	ORDER BY idproyecto)
minimo $$ LANGUAGE SQL;

CREATE OR REPLACE VIEW participantes_por_proyecto
AS SELECT COUNT (ppa.idpaciente), ppa.idproyecto
  	FROM proyectos_pacientes ppa
  	GROUP BY ppa.idproyecto
  	ORDER BY idproyecto;

CREATE OR REPLACE VIEW profesionales_por_proyecto
AS SELECT pf.idprofesional, ppf.idproyecto, pf.nombre, pf.especialidad
    FROM proyectos_profesionales ppf NATURAL JOIN profesional pf
    GROUP BY pf.idprofesional, ppf.idproyecto, pf.nombre, pf.especialidad, ppf.idproyecto, pf.nombre, pf.especialidad
    ORDER BY idproyecto;

SELECT pap.idproyecto, pfp.idprofesional, pfp.nombre, pap.count AS cant_participantes
FROM participantes_por_proyecto pap NATURAL JOIN profesionales_por_proyecto pfp
WHERE pap.count = menos_participantes();