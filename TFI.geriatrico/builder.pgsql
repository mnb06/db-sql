
CREATE SEQUENCE geriatrico.public.historia_clinica_idhistorial_seq;

CREATE DOMAIN sn VARCHAR CHECK(value in ('si','no'));
CREATE DOMAIN dep VARCHAR CHECK(value in ('bañar','comer','vestir','mover'));
CREATE DOMAIN diet VARCHAR CHECK(value in ('sal','diabetico','celiaco','alergias','ensure'));


CREATE TABLE geriatrico.public.Historia_clinica (
                idhistorial INTEGER NOT NULL DEFAULT nextval('geriatrico.public.historia_clinica_idhistorial_seq'),
                entrada VARCHAR NOT NULL,
                indicaciones VARCHAR,
                diagnostico VARCHAR,
                fecha DATE NOT NULL,
                idpaciente INTEGER NOT NULL,
                idprofesional INTEGER NOT NULL,
                CONSTRAINT historia_clinica_pk PRIMARY KEY (idhistorial)
);


ALTER SEQUENCE geriatrico.public.historia_clinica_idhistorial_seq OWNED BY geriatrico.public.Historia_clinica.idhistorial;

CREATE SEQUENCE geriatrico.public.pacientes_idpaciente_seq;

CREATE TABLE geriatrico.public.Pacientes (
                idpaciente INTEGER NOT NULL DEFAULT nextval('geriatrico.public.pacientes_idpaciente_seq'),
                dni INTEGER NOT NULL UNIQUE,
                nombre VARCHAR NOT NULL,
                num_pami INTEGER,
                medico_cabecera VARCHAR,
                edad INTEGER NOT NULL,
                habitacion INTEGER NOT NULL,
                dependencia dep,
                pañal sn NOT NULL,
                dieta_especial diet,
                CONSTRAINT pacientes_pk PRIMARY KEY (idpaciente)
);


ALTER SEQUENCE geriatrico.public.pacientes_idpaciente_seq OWNED BY geriatrico.public.Pacientes.idpaciente;

CREATE SEQUENCE geriatrico.public.personacargo_idpersona_seq;

CREATE TABLE geriatrico.public.PersonaCargo (
                idpersona INTEGER NOT NULL DEFAULT nextval('geriatrico.public.personacargo_idpersona_seq'),
                nombre VARCHAR NOT NULL,
                relacion VARCHAR NOT NULL,
                direccion VARCHAR NOT NULL DEFAULT 'Hogar',
                idpaciente INTEGER NOT NULL,
                CONSTRAINT personacargo_pk PRIMARY KEY (idpersona)
);


ALTER SEQUENCE geriatrico.public.personacargo_idpersona_seq OWNED BY geriatrico.public.PersonaCargo.idpersona;

CREATE SEQUENCE geriatrico.public.profesional_idprofesional_seq;

CREATE TABLE geriatrico.public.Profesional (
                idprofesional INTEGER NOT NULL DEFAULT nextval('geriatrico.public.profesional_idprofesional_seq'),
                dni INTEGER NOT NULL UNIQUE,
                nombre VARCHAR NOT NULL,
                matricula VARCHAR NOT NULL DEFAULT 0,
                especialidad VARCHAR NOT NULL,
                cant_horas INTEGER NOT NULL,
                sueldo INTEGER NOT NULL,
                CONSTRAINT profesional_pk PRIMARY KEY (idprofesional)
);


ALTER SEQUENCE geriatrico.public.profesional_idprofesional_seq OWNED BY geriatrico.public.Profesional.idprofesional;

CREATE SEQUENCE geriatrico.public.proyectos_idproyecto_seq;

CREATE TABLE geriatrico.public.Proyectos (
                idproyecto INTEGER NOT NULL DEFAULT nextval('geriatrico.public.proyectos_idproyecto_seq'),
                nombre VARCHAR NOT NULL,
                descripcion VARCHAR NOT NULL,
                fecha DATE NOT NULL,
                CONSTRAINT proyectos_pk PRIMARY KEY (idproyecto)
);


ALTER SEQUENCE geriatrico.public.proyectos_idproyecto_seq OWNED BY geriatrico.public.Proyectos.idproyecto;

CREATE TABLE geriatrico.public.proyectos_pacientes (
                idproyecto INTEGER NOT NULL,
                idpaciente INTEGER NOT NULL,
                CONSTRAINT proyectos_pacientes_pk PRIMARY KEY (idproyecto, idpaciente)
);


CREATE TABLE geriatrico.public.proyectos_profesionales (
                idproyecto INTEGER NOT NULL,
                idprofesional INTEGER NOT NULL,
                CONSTRAINT proyectos_profesionales_pk PRIMARY KEY (idproyecto, idprofesional)
);

CREATE TABLE LOG_TRIGGER_PACIENTES (
    idpaciente int,
    dni int, 
    nombre varchar, 
    num_pami int, 
    medico_cabezera varchar, 
    edad int, 
    habitacion int,
    dependencia dep,
  	pañal sn,
  	dieta_especial diet, 
    logged_user varchar, 
    fecha DATE
);


ALTER TABLE geriatrico.public.Historia_clinica ADD CONSTRAINT pacientes_historial_clinico_fk
FOREIGN KEY (idpaciente)
REFERENCES geriatrico.public.Pacientes (idpaciente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE geriatrico.public.PersonaCargo ADD CONSTRAINT pacientes_personacargo_fk
FOREIGN KEY (idpaciente)
REFERENCES geriatrico.public.Pacientes (idpaciente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE geriatrico.public.proyectos_pacientes ADD CONSTRAINT pacientes_proyectos_pacientes_fk
FOREIGN KEY (idpaciente)
REFERENCES geriatrico.public.Pacientes (idpaciente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE geriatrico.public.Historia_clinica ADD CONSTRAINT profesional_historia_clinica_fk
FOREIGN KEY (idprofesional)
REFERENCES geriatrico.public.Profesional (idprofesional)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE geriatrico.public.proyectos_profesionales ADD CONSTRAINT profesional_proyectos_profesionales_fk
FOREIGN KEY (idprofesional)
REFERENCES geriatrico.public.Profesional (idprofesional)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE geriatrico.public.proyectos_pacientes ADD CONSTRAINT proyectos_proyectos_pacientes_fk
FOREIGN KEY (idproyecto)
REFERENCES geriatrico.public.Proyectos (idproyecto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE geriatrico.public.proyectos_profesionales ADD CONSTRAINT proyectos_proyectos_profesionales_fk
FOREIGN KEY (idproyecto)
REFERENCES geriatrico.public.Proyectos (idproyecto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
