/*
--Vista de todos los participantes del taller de musica con su profesional a cargo.

CREATE VIEW participantes_musica
AS SELECT pa.nombre, pr.fecha, pr.nombre AS taller, pf.nombre AS profesional

FROM ((((pacientes pa NATURAL JOIN proyectos_pacientes ppa ) INNER JOIN proyectos pr ON ppa.idproyecto = pr.idproyecto) INNER JOIN proyectos_profesionales ppf ON ppa.idproyecto = ppf.idproyecto) INNER JOIN profesional pf ON ppf.idmedico = pf.idmedico)

WHERE ppa.idproyecto= 1 OR ppa.idproyecto = 4;

—Ver la vista
SELECT *
FROM participantes_musica ORDER BY fecha, nombre;


--Mayores de 90 que no participaron de ningun proyecto y su persona a cargo es la asistente del hogar

SELECT pa.idpaciente, pa.nombre, pa.edad, pc.nombre AS responsable
FROM pacientes pa INNER JOIN personacargo pc ON pa.idpaciente = pc.idpaciente
WHERE (pa.edad > 90) AND pc.relacion LIKE 'Asistente Social' AND NOT EXISTS (SELECT *
     			  															 FROM proyectos_pacientes ppa
   			  															 WHERE pa.idpaciente = ppa.idpaciente);

ALTER TABLE pacientes ALTER COLUMN edad TYPE INTEGER USING edad::integer;

*/


-- Profesionales que participaron en la actividad con menor cantidad de pacientes

SELECT * FROM PROFESIONAL

SELECT P.idprofesional, P.nombre, P.especialidad
FROM profesional P INNER JOIN proyectos_profesionales a on p.idprofesional = a.idprofesional 
                     INNER JOIN proyectos_pacientes c on a.idproyecto = c.idproyecto
WHERE(
   (SELECT count(idpaciente)
    FROM proyectos_pacientes
    GROUP BY idproyecto
    ORDER BY idproyecto
    )
     
      
      =(
-- CALCULA CUAL FUE EL MENOR NUMERO DE PARTICIPANTES          
SELECT MIN(count) 
FROM (SELECT COUNT (idpaciente)
      FROM proyectos_pacientes
      GROUP BY idproyecto
      ORDER BY idproyecto) 
minimo
))




