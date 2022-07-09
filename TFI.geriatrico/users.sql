CREATE USER admin PASSWORD '1234';
CREATE ROLE rol_admin;
ALTER USER admin WITH LOGIN;

CREATE USER usuario;
CREATE ROLE rol_usuario;

GRANT rol_admin TO admin;
GRANT rol_usuario TO usuario;


GRANT ALL PRIVILEGES ON DATABASE geriatrico to rol_admin;


GRANT INSERT, UPDATE, SELECT
    ON pacientes, personacargo, profesional, proyectos, proyectos_pacientes, proyectos_profesionales, historia_clinica
    TO rol_usuario;