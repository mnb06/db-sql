--a
/*SELECT * FROM parcelas 
WHERE fecha_siembra is not null 
    AND fecha_cosecha is null
;
*/

--b
/*SELECT sum(m.precipitacion), p.nom_parcela, p.idparcela, p.idestacion
FROM mediciones m, parcelas p
WHERE m.idestacion =  p.idestacion
    AND m.fecha between '2014-01-01' and '2014-12-31'

GROUP BY p.idparcela, p.nom_parcela, p.idestacion
;
*/

--c

/*CREATE VIEW datos AS 
SELECT p.nom_parcela, c.idcultivo, c.nombre, c.duracion, c.profundidad_raiz, e.idestacion, e. provincia 
FROM cultivos c, estaciones e, parcelas p
WHERE p.idcultivo = c.idcultivo and p.idestacion = e.idestacion
;
*/


--d
/*SELECT e.idestacion, e.codigo, e.nombre, count(m) as cant_med
FROM estaciones e, mediciones m
WHERE e.idestacion = m.idestacion
GROUP BY e.idestacion
ORDER BY e.idestacion ASC
;
*/

--e
/*SELECT c.idcultivo, c.nombre, p.idparcela, p.nom_parcela
FROM cultivos c LEFT JOIN parcelas p ON p.idcultivo = c.idcultivo
;
*/


select * from parcelas; 


--8a
ALTER TABLE parcelas ADD COLUMN total_precipitaciones NUMERIC(5,2)
; --Añade el atributo calculado


UPDATE parcelas p
SET total_precipitaciones = 
        (SELECT sum(m.precipitacion)
        from mediciones m 
        where (m.idestacion = p.idestacion) and (p.fecha_siembra is not null) and m.fecha > p.fecha_siembra 
         and (m.fecha < p.fecha_cosecha or p.fecha_cosecha is null)); --Update al atributo
        



-- Funcion
CREATE OR REPLACE FUNCTION trg_totalprecip()
    RETURNS TRIGGER AS
$$
BEGIN
UPDATE parcelas p
SET total_precipitaciones = 
        (SELECT sum(m.precipitacion)
        from mediciones m 
        where (m.idestacion = p.idestacion) and (p.fecha_siembra is not null) and m.fecha > p.fecha_siembra 
         and (m.fecha < p.fecha_cosecha or p.fecha_cosecha is null));
         RETURN NULL;
         --Update al atributo
 
END;
$$
LANGUAGE plpgsql;



-- Trigger
CREATE TRIGGER update_precipitaciones
    AFTER UPDATE
    ON mediciones
    FOR EACH STATEMENT
    EXECUTE PROCEDURE trg_totalprecip();

