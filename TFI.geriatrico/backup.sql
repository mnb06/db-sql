--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2022-06-23 12:00:26

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 838 (class 1247 OID 17133)
-- Name: dep; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.dep AS character varying
	CONSTRAINT dep_check CHECK (((VALUE)::text = ANY ((ARRAY['bañar'::character varying, 'comer'::character varying, 'vestir'::character varying, 'mover'::character varying])::text[])));


ALTER DOMAIN public.dep OWNER TO postgres;

--
-- TOC entry 842 (class 1247 OID 17136)
-- Name: diet; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.diet AS character varying
	CONSTRAINT diet_check CHECK (((VALUE)::text = ANY ((ARRAY['sal'::character varying, 'diabetico'::character varying, 'celiaco'::character varying, 'alergias'::character varying, 'ensure'::character varying])::text[])));


ALTER DOMAIN public.diet OWNER TO postgres;

--
-- TOC entry 834 (class 1247 OID 17130)
-- Name: sn; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.sn AS character varying
	CONSTRAINT sn_check CHECK (((VALUE)::text = ANY ((ARRAY['si'::character varying, 'no'::character varying])::text[])));


ALTER DOMAIN public.sn OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 17138)
-- Name: historia_clinica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historia_clinica (
    idhistorial integer NOT NULL,
    entrada character varying NOT NULL,
    indicaciones character varying,
    diagnostico character varying,
    fecha date NOT NULL,
    idpaciente integer NOT NULL,
    idmedico integer NOT NULL
);


ALTER TABLE public.historia_clinica OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17128)
-- Name: historia_clinica_idhistorial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historia_clinica_idhistorial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historia_clinica_idhistorial_seq OWNER TO postgres;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 209
-- Name: historia_clinica_idhistorial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historia_clinica_idhistorial_seq OWNED BY public.historia_clinica.idhistorial;


--
-- TOC entry 221 (class 1259 OID 17233)
-- Name: log_trigger_pacientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_trigger_pacientes (
    idpaciente integer,
    dni integer,
    nombre character varying,
    num_pami integer,
    medico_cabezera character varying,
    edad integer,
    habitacion integer,
    dependencia public.dep,
    "pañal" public.sn,
    dieta_especial public.diet,
    logged_user character varying,
    fecha date
);


ALTER TABLE public.log_trigger_pacientes OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17147)
-- Name: pacientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pacientes (
    idpaciente integer NOT NULL,
    dni integer NOT NULL,
    nombre character varying NOT NULL,
    num_pami integer,
    medico_cabecera character varying,
    edad integer NOT NULL,
    habitacion integer NOT NULL,
    dependencia public.dep,
    "pañal" public.sn NOT NULL,
    dieta_especial character varying
);


ALTER TABLE public.pacientes OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17146)
-- Name: pacientes_idpaciente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pacientes_idpaciente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pacientes_idpaciente_seq OWNER TO postgres;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 211
-- Name: pacientes_idpaciente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pacientes_idpaciente_seq OWNED BY public.pacientes.idpaciente;


--
-- TOC entry 214 (class 1259 OID 17158)
-- Name: personacargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personacargo (
    idpersona integer NOT NULL,
    nombre character varying NOT NULL,
    relacion character varying NOT NULL,
    direccion character varying DEFAULT 'Hogar'::character varying NOT NULL,
    idpaciente integer NOT NULL
);


ALTER TABLE public.personacargo OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17157)
-- Name: personacargo_idpersona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personacargo_idpersona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personacargo_idpersona_seq OWNER TO postgres;

--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 213
-- Name: personacargo_idpersona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personacargo_idpersona_seq OWNED BY public.personacargo.idpersona;


--
-- TOC entry 216 (class 1259 OID 17168)
-- Name: profesional; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesional (
    idprofesional integer NOT NULL,
    dni integer NOT NULL,
    nombre character varying NOT NULL,
    matricula character varying DEFAULT 0 NOT NULL,
    especialidad character varying NOT NULL,
    cant_horas integer NOT NULL,
    sueldo integer NOT NULL
);


ALTER TABLE public.profesional OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17167)
-- Name: profesional_idmedico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profesional_idmedico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profesional_idmedico_seq OWNER TO postgres;

--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 215
-- Name: profesional_idmedico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profesional_idmedico_seq OWNED BY public.profesional.idprofesional;


--
-- TOC entry 218 (class 1259 OID 17180)
-- Name: proyectos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proyectos (
    idproyecto integer NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.proyectos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17179)
-- Name: proyectos_idproyecto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proyectos_idproyecto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyectos_idproyecto_seq OWNER TO postgres;

--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 217
-- Name: proyectos_idproyecto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proyectos_idproyecto_seq OWNED BY public.proyectos.idproyecto;


--
-- TOC entry 219 (class 1259 OID 17188)
-- Name: proyectos_pacientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proyectos_pacientes (
    idproyecto integer NOT NULL,
    idpaciente integer NOT NULL
);


ALTER TABLE public.proyectos_pacientes OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17193)
-- Name: proyectos_profesionales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proyectos_profesionales (
    idproyecto integer NOT NULL,
    idprofesional integer NOT NULL
);


ALTER TABLE public.proyectos_profesionales OWNER TO postgres;

--
-- TOC entry 3208 (class 2604 OID 17141)
-- Name: historia_clinica idhistorial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_clinica ALTER COLUMN idhistorial SET DEFAULT nextval('public.historia_clinica_idhistorial_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 17150)
-- Name: pacientes idpaciente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes ALTER COLUMN idpaciente SET DEFAULT nextval('public.pacientes_idpaciente_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 17161)
-- Name: personacargo idpersona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personacargo ALTER COLUMN idpersona SET DEFAULT nextval('public.personacargo_idpersona_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 17171)
-- Name: profesional idprofesional; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesional ALTER COLUMN idprofesional SET DEFAULT nextval('public.profesional_idmedico_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 17183)
-- Name: proyectos idproyecto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos ALTER COLUMN idproyecto SET DEFAULT nextval('public.proyectos_idproyecto_seq'::regclass);


--
-- TOC entry 3380 (class 0 OID 17138)
-- Dependencies: 210
-- Data for Name: historia_clinica; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historia_clinica (idhistorial, entrada, indicaciones, diagnostico, fecha, idpaciente, idmedico) VALUES (1, 'Dificultades en el equilibrio', 'Intentar pararse una vez al dia', NULL, '2022-04-20', 2, 5);
INSERT INTO public.historia_clinica (idhistorial, entrada, indicaciones, diagnostico, fecha, idpaciente, idmedico) VALUES (2, 'Discurso coherente pero al desarrollarlo se torna inconsistente. Evidencio fallas de memoria', NULL, NULL, '2022-04-20', 2, 4);
INSERT INTO public.historia_clinica (idhistorial, entrada, indicaciones, diagnostico, fecha, idpaciente, idmedico) VALUES (3, 'Se contactó con su familiar debido a que fue derivado a Hospital General', NULL, NULL, '2022-04-20', 1, 2);
INSERT INTO public.historia_clinica (idhistorial, entrada, indicaciones, diagnostico, fecha, idpaciente, idmedico) VALUES (4, 'Dificultades en la respiracion, fiebre alta', 'Amoxicilina 100mg cada 8 hs', 'Gripe', '2022-06-15', 6, 1);
INSERT INTO public.historia_clinica (idhistorial, entrada, indicaciones, diagnostico, fecha, idpaciente, idmedico) VALUES (5, 'Caída desde su propia altura. Refiere dolor en pierna derecha', 'Reposo por 24 hs. Diclofenac 50mg cada 6 hs', NULL, '2022-05-02', 3, 1);
INSERT INTO public.historia_clinica (idhistorial, entrada, indicaciones, diagnostico, fecha, idpaciente, idmedico) VALUES (6, 'Se deja constancia que durante el acompañamiento al banco se comportó de manera agresiva.', NULL, NULL, '2022-02-28', 2, 6);
INSERT INTO public.historia_clinica (idhistorial, entrada, indicaciones, diagnostico, fecha, idpaciente, idmedico) VALUES (7, 'Refirió malestar estomacal tras comer verduras de hoja verde', 'Retirar verduras de hoja verde de la dieta', NULL, '2022-05-20', 3, 7);
INSERT INTO public.historia_clinica (idhistorial, entrada, indicaciones, diagnostico, fecha, idpaciente, idmedico) VALUES (8, 'Disminuyó su peso el último mes en 5kg, se encuentra bajo peso', 'Dieta hipercalórica, insistir en que se alimente', NULL, '2022-05-20', 3, 7);
INSERT INTO public.historia_clinica (idhistorial, entrada, indicaciones, diagnostico, fecha, idpaciente, idmedico) VALUES (9, 'Se intervino en situación donde se comportaba agresivamente, se contuvo afectivamente', NULL, 'Trastorno disocial de la Personalidad', '2022-03-29', 8, 4);
INSERT INTO public.historia_clinica (idhistorial, entrada, indicaciones, diagnostico, fecha, idpaciente, idmedico) VALUES (10, 'Presentó niveles altos de glucemia', 'Derivar a hospital general', 'Diabetes', '2022-01-20', 1, 1);
INSERT INTO public.historia_clinica (idhistorial, entrada, indicaciones, diagnostico, fecha, idpaciente, idmedico) VALUES (11, 'Se le entregó la suma de $5000 para que adminsitre como crea conveniente', NULL, NULL, '2022-05-11', 6, 2);


--
-- TOC entry 3391 (class 0 OID 17233)
-- Dependencies: 221
-- Data for Name: log_trigger_pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3382 (class 0 OID 17147)
-- Dependencies: 212
-- Data for Name: pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pacientes (idpaciente, dni, nombre, num_pami, medico_cabecera, edad, habitacion, dependencia, "pañal", dieta_especial) VALUES (1, 23758331, 'Eduardo Gomez', NULL, NULL, 89, 1, NULL, 'no', 'sal');
INSERT INTO public.pacientes (idpaciente, dni, nombre, num_pami, medico_cabecera, edad, habitacion, dependencia, "pañal", dieta_especial) VALUES (2, 22759489, 'Ana Rodriguez', NULL, NULL, 81, 2, 'comer', 'si', NULL);
INSERT INTO public.pacientes (idpaciente, dni, nombre, num_pami, medico_cabecera, edad, habitacion, dependencia, "pañal", dieta_especial) VALUES (3, 23149578, 'Alberto Lopez', 1306, NULL, 91, 1, NULL, 'si', 'celiaco');
INSERT INTO public.pacientes (idpaciente, dni, nombre, num_pami, medico_cabecera, edad, habitacion, dependencia, "pañal", dieta_especial) VALUES (4, 19755367, 'Alfredo Hernandez', NULL, NULL, 89, 3, 'vestir', 'si', NULL);
INSERT INTO public.pacientes (idpaciente, dni, nombre, num_pami, medico_cabecera, edad, habitacion, dependencia, "pañal", dieta_especial) VALUES (5, 19318331, 'Alexis Garcia', NULL, NULL, 79, 4, 'vestir', 'no', NULL);
INSERT INTO public.pacientes (idpaciente, dni, nombre, num_pami, medico_cabecera, edad, habitacion, dependencia, "pañal", dieta_especial) VALUES (6, 18699431, 'Maria Avalos', 783, NULL, 80, 2, 'mover', 'si', NULL);
INSERT INTO public.pacientes (idpaciente, dni, nombre, num_pami, medico_cabecera, edad, habitacion, dependencia, "pañal", dieta_especial) VALUES (7, 19724687, 'Carmen Celli', NULL, NULL, 84, 4, NULL, 'no', NULL);
INSERT INTO public.pacientes (idpaciente, dni, nombre, num_pami, medico_cabecera, edad, habitacion, dependencia, "pañal", dieta_especial) VALUES (8, 18054069, 'Rosa Garmendi', 1640, NULL, 93, 3, 'mover', 'si', 'sal');
INSERT INTO public.pacientes (idpaciente, dni, nombre, num_pami, medico_cabecera, edad, habitacion, dependencia, "pañal", dieta_especial) VALUES (9, 17723051, 'Liliana Rampetti', NULL, NULL, 95, 5, 'comer', 'si', NULL);
INSERT INTO public.pacientes (idpaciente, dni, nombre, num_pami, medico_cabecera, edad, habitacion, dependencia, "pañal", dieta_especial) VALUES (10, 18394578, 'Ignacio Sciachi', 1501, NULL, 83, 5, NULL, 'no', 'diabetico');


--
-- TOC entry 3384 (class 0 OID 17158)
-- Dependencies: 214
-- Data for Name: personacargo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personacargo (idpersona, nombre, relacion, direccion, idpaciente) VALUES (3, 'Emiliano Martinez', 'Hijo', 'Calle falsa 123', 1);
INSERT INTO public.personacargo (idpersona, nombre, relacion, direccion, idpaciente) VALUES (4, 'Soledad Silveyra', 'Asistente Social', 'Hogar', 2);
INSERT INTO public.personacargo (idpersona, nombre, relacion, direccion, idpaciente) VALUES (5, 'Rogelio Funes Mori', 'Sobrino', 'Avenida 22 numero 698', 3);
INSERT INTO public.personacargo (idpersona, nombre, relacion, direccion, idpaciente) VALUES (6, 'Camila Almiron', 'Nieta', 'Entre Rios 2319', 4);
INSERT INTO public.personacargo (idpersona, nombre, relacion, direccion, idpaciente) VALUES (7, 'Yesica Lima', 'Amiga', 'Castelli 2987', 5);
INSERT INTO public.personacargo (idpersona, nombre, relacion, direccion, idpaciente) VALUES (8, 'Soledad Silveyra', 'Asistente Social', 'Hogar', 6);
INSERT INTO public.personacargo (idpersona, nombre, relacion, direccion, idpaciente) VALUES (9, 'Noelia Cabrera', 'Esposa', 'Necochea 322', 7);
INSERT INTO public.personacargo (idpersona, nombre, relacion, direccion, idpaciente) VALUES (10, 'Soledad Silveyra', 'Asistente Social', 'Hogar', 8);
INSERT INTO public.personacargo (idpersona, nombre, relacion, direccion, idpaciente) VALUES (11, 'Clara Daniela Saltana', 'Hija', 'Jujuy 322', 9);
INSERT INTO public.personacargo (idpersona, nombre, relacion, direccion, idpaciente) VALUES (12, 'Soledad Silveyra', 'Asistente Social', 'Hogar', 10);


--
-- TOC entry 3386 (class 0 OID 17168)
-- Dependencies: 216
-- Data for Name: profesional; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profesional (idprofesional, dni, nombre, matricula, especialidad, cant_horas, sueldo) VALUES (1, 28345982, 'Marcelo Gallardo', '91218', 'Medico', 50, 100000);
INSERT INTO public.profesional (idprofesional, dni, nombre, matricula, especialidad, cant_horas, sueldo) VALUES (2, 34659894, 'Soledad Silveyra', '18', 'Asistente Social', 40, 40000);
INSERT INTO public.profesional (idprofesional, dni, nombre, matricula, especialidad, cant_horas, sueldo) VALUES (3, 37898776, 'Sebastian Estevanez', '6877', 'Psiquiatra', 50, 25000);
INSERT INTO public.profesional (idprofesional, dni, nombre, matricula, especialidad, cant_horas, sueldo) VALUES (4, 35353535, 'Osvaldo Laport', '79722', 'Psicologo', 40, 40000);
INSERT INTO public.profesional (idprofesional, dni, nombre, matricula, especialidad, cant_horas, sueldo) VALUES (5, 34253555, 'Carina Zampini', '1218', 'Kinesiologa', 60, 36000);
INSERT INTO public.profesional (idprofesional, dni, nombre, matricula, especialidad, cant_horas, sueldo) VALUES (6, 34984789, 'Sol Estevanez', '0', 'Acompañante Terapeutico', 20, 10000);
INSERT INTO public.profesional (idprofesional, dni, nombre, matricula, especialidad, cant_horas, sueldo) VALUES (7, 37846378, 'Lucia Galan', '8181', 'Nutricionista', 30, 36000);


--
-- TOC entry 3388 (class 0 OID 17180)
-- Dependencies: 218
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.proyectos (idproyecto, nombre, descripcion, fecha) VALUES (1, 'Taller de musica', 'Se escucharon ritmos latinos, la mayoría de los pacientes bailaba en el lugar', '2022-05-05');
INSERT INTO public.proyectos (idproyecto, nombre, descripcion, fecha) VALUES (2, 'Taller psicomotriz', 'Se jugó a la lotería en el comedor', '2022-04-05');
INSERT INTO public.proyectos (idproyecto, nombre, descripcion, fecha) VALUES (3, 'Taller de movimiento', 'Se practicaron ejercicos de brazos', '2022-05-19');
INSERT INTO public.proyectos (idproyecto, nombre, descripcion, fecha) VALUES (4, 'Taller de musica', 'Se escucharon tangos, les agradó mucho', '2022-01-31');
INSERT INTO public.proyectos (idproyecto, nombre, descripcion, fecha) VALUES (5, 'Taller de dibujo', 'Se repartieron mandalas para pintar, les agradó mucho', '2022-05-15');


--
-- TOC entry 3389 (class 0 OID 17188)
-- Dependencies: 219
-- Data for Name: proyectos_pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (1, 1);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (1, 3);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (1, 5);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (1, 7);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (2, 1);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (2, 2);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (2, 3);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (2, 4);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (3, 1);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (3, 2);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (3, 4);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (3, 6);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (4, 3);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (4, 4);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (4, 1);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (5, 4);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (5, 6);
INSERT INTO public.proyectos_pacientes (idproyecto, idpaciente) VALUES (4, 2);


--
-- TOC entry 3390 (class 0 OID 17193)
-- Dependencies: 220
-- Data for Name: proyectos_profesionales; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.proyectos_profesionales (idproyecto, idprofesional) VALUES (1, 1);
INSERT INTO public.proyectos_profesionales (idproyecto, idprofesional) VALUES (2, 2);
INSERT INTO public.proyectos_profesionales (idproyecto, idprofesional) VALUES (2, 3);
INSERT INTO public.proyectos_profesionales (idproyecto, idprofesional) VALUES (3, 4);
INSERT INTO public.proyectos_profesionales (idproyecto, idprofesional) VALUES (3, 5);
INSERT INTO public.proyectos_profesionales (idproyecto, idprofesional) VALUES (4, 6);
INSERT INTO public.proyectos_profesionales (idproyecto, idprofesional) VALUES (5, 7);
INSERT INTO public.proyectos_profesionales (idproyecto, idprofesional) VALUES (5, 1);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 209
-- Name: historia_clinica_idhistorial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historia_clinica_idhistorial_seq', 11, true);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 211
-- Name: pacientes_idpaciente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pacientes_idpaciente_seq', 10, true);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 213
-- Name: personacargo_idpersona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personacargo_idpersona_seq', 12, true);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 215
-- Name: profesional_idmedico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesional_idmedico_seq', 7, true);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 217
-- Name: proyectos_idproyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proyectos_idproyecto_seq', 5, true);


--
-- TOC entry 3216 (class 2606 OID 17145)
-- Name: historia_clinica historia_clinica_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_clinica
    ADD CONSTRAINT historia_clinica_pk PRIMARY KEY (idhistorial);


--
-- TOC entry 3218 (class 2606 OID 17156)
-- Name: pacientes pacientes_dni_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_dni_key UNIQUE (dni);


--
-- TOC entry 3220 (class 2606 OID 17154)
-- Name: pacientes pacientes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pk PRIMARY KEY (idpaciente);


--
-- TOC entry 3222 (class 2606 OID 17166)
-- Name: personacargo personacargo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personacargo
    ADD CONSTRAINT personacargo_pk PRIMARY KEY (idpersona);


--
-- TOC entry 3224 (class 2606 OID 17178)
-- Name: profesional profesional_dni_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesional
    ADD CONSTRAINT profesional_dni_key UNIQUE (dni);


--
-- TOC entry 3226 (class 2606 OID 17176)
-- Name: profesional profesional_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesional
    ADD CONSTRAINT profesional_pk PRIMARY KEY (idprofesional);


--
-- TOC entry 3230 (class 2606 OID 17192)
-- Name: proyectos_pacientes proyectos_pacientes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos_pacientes
    ADD CONSTRAINT proyectos_pacientes_pk PRIMARY KEY (idproyecto, idpaciente);


--
-- TOC entry 3228 (class 2606 OID 17187)
-- Name: proyectos proyectos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos
    ADD CONSTRAINT proyectos_pk PRIMARY KEY (idproyecto);


--
-- TOC entry 3232 (class 2606 OID 17197)
-- Name: proyectos_profesionales proyectos_profesionales_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos_profesionales
    ADD CONSTRAINT proyectos_profesionales_pk PRIMARY KEY (idproyecto, idprofesional);


--
-- TOC entry 3233 (class 2606 OID 17198)
-- Name: historia_clinica pacientes_historial_clinico_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_clinica
    ADD CONSTRAINT pacientes_historial_clinico_fk FOREIGN KEY (idpaciente) REFERENCES public.pacientes(idpaciente);


--
-- TOC entry 3235 (class 2606 OID 17203)
-- Name: personacargo pacientes_personacargo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personacargo
    ADD CONSTRAINT pacientes_personacargo_fk FOREIGN KEY (idpaciente) REFERENCES public.pacientes(idpaciente);


--
-- TOC entry 3236 (class 2606 OID 17208)
-- Name: proyectos_pacientes pacientes_proyectos_pacientes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos_pacientes
    ADD CONSTRAINT pacientes_proyectos_pacientes_fk FOREIGN KEY (idpaciente) REFERENCES public.pacientes(idpaciente);


--
-- TOC entry 3234 (class 2606 OID 17213)
-- Name: historia_clinica profesional_historia_clinica_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_clinica
    ADD CONSTRAINT profesional_historia_clinica_fk FOREIGN KEY (idmedico) REFERENCES public.profesional(idprofesional);


--
-- TOC entry 3238 (class 2606 OID 17218)
-- Name: proyectos_profesionales profesional_proyectos_profesionales_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos_profesionales
    ADD CONSTRAINT profesional_proyectos_profesionales_fk FOREIGN KEY (idprofesional) REFERENCES public.profesional(idprofesional);


--
-- TOC entry 3237 (class 2606 OID 17223)
-- Name: proyectos_pacientes proyectos_proyectos_pacientes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos_pacientes
    ADD CONSTRAINT proyectos_proyectos_pacientes_fk FOREIGN KEY (idproyecto) REFERENCES public.proyectos(idproyecto);


--
-- TOC entry 3239 (class 2606 OID 17228)
-- Name: proyectos_profesionales proyectos_proyectos_profesionales_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos_profesionales
    ADD CONSTRAINT proyectos_proyectos_profesionales_fk FOREIGN KEY (idproyecto) REFERENCES public.proyectos(idproyecto);


-- Completed on 2022-06-23 12:00:26

--
-- PostgreSQL database dump complete
--

