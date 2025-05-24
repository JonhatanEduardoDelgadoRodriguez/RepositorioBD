--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.campus VALUES (1, 'Instituto Tecnológico de Mexicali', 'Av. Instituto Politécnico Nacional S/N, Col. Plutarco Elías Calles');


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carreras VALUES (1, 'Ingeniería en Sistemas Computacionales', 'Ingeniero en Sistemas Computacionales');
INSERT INTO public.carreras VALUES (2, 'Ingeniería Industrial', 'Ingeniero Industrial');
INSERT INTO public.carreras VALUES (3, 'Licenciatura en Administración', 'Licenciado en Administración');
INSERT INTO public.carreras VALUES (4, 'Ingeniería Electromecánica', 'Ingeniero Electromecánico');
INSERT INTO public.carreras VALUES (5, 'Contador Público', 'Licenciado en Contaduría');


--
-- Data for Name: estudiante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estudiante VALUES (1, 'Alejandro', 'Gómez', '2000-01-15', 'Col. Pueblo Nuevo #123', 'alejandro.gomez@itmexicali.edu.mx', 1);
INSERT INTO public.estudiante VALUES (2, 'María', 'Luna', '1999-12-05', 'Col. Independencia #456', 'maria.luna@itmexicali.edu.mx', 2);
INSERT INTO public.estudiante VALUES (3, 'Luis', 'Hernández', '2001-05-21', 'Col. Robledo #789', 'luis.hernandez@itmexicali.edu.mx', 3);
INSERT INTO public.estudiante VALUES (5, 'Jorge', 'Ruiz', '2000-03-30', 'Col. Jardines del Lago #654', 'jorge.ruiz@itmexicali.edu.mx', 5);
INSERT INTO public.estudiante VALUES (4, 'Carmen', 'Salazar', '2000-07-03', 'CALLE NOVENA #9', 'carmen.salazar@itmexicali.edu.mx', 4);
INSERT INTO public.estudiante VALUES (99, 'Carlos', 'Ruiz', '2000-05-10', 'Col. Hidalgo #500', 'CarloRuiz@itmexicali.edu.mx', NULL);
INSERT INTO public.estudiante VALUES (7, 'Dario', 'Ramírez', '1997-11-02', 'Calle Luna 456', 'carlos.ramirez@email.com', 2);
INSERT INTO public.estudiante VALUES (8, 'Laura', 'González', '1996-05-14', 'Av. Siempre Viva 123', 'laura.gonzalez@email.com', 1);


--
-- Data for Name: carrerasestudiante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carrerasestudiante VALUES (1, 1, 1);
INSERT INTO public.carrerasestudiante VALUES (2, 2, 2);
INSERT INTO public.carrerasestudiante VALUES (3, 3, 3);
INSERT INTO public.carrerasestudiante VALUES (4, 4, 4);
INSERT INTO public.carrerasestudiante VALUES (5, 5, 5);


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamento VALUES (1, 'Ingeniería en Sistemas', 'Edificio A1');
INSERT INTO public.departamento VALUES (2, 'Ingeniería Industrial', 'Edificio B1');
INSERT INTO public.departamento VALUES (3, 'Ciencias Básicas', 'Edificio C1');
INSERT INTO public.departamento VALUES (4, 'Administración', 'Edificio D1');
INSERT INTO public.departamento VALUES (5, 'Electromecánica', 'Edificio E1');


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cursos VALUES (1, 'Estructura de Datos', 'Manejo de estructuras lineales y no lineales', 5, 4, 1, 1);
INSERT INTO public.cursos VALUES (2, 'Estadística', 'Probabilidad y estadística aplicada', 4, 3, 2, 1);
INSERT INTO public.cursos VALUES (3, 'Contabilidad Financiera', 'Fundamentos de contabilidad básica', 4, 2, 4, 1);
INSERT INTO public.cursos VALUES (4, 'Circuitos Eléctricos', 'Análisis de circuitos eléctricos de CD y CA', 5, 3, 5, 1);
INSERT INTO public.cursos VALUES (5, 'Álgebra Lineal', 'Espacios vectoriales, matrices, determinantes', 4, 1, 3, 1);
INSERT INTO public.cursos VALUES (6, 'Bases de Datos', 'Introducción a los sistemas de bases de datos relacionales.', 3, 5, NULL, NULL);
INSERT INTO public.cursos VALUES (7, 'Redes de Computadoras', 'Fundamentos de redes, modelos OSI y TCP/IP.', 3, 6, NULL, NULL);


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profesores VALUES (1, 'Víctor', 'Medina', 'Doctor en Ciencias de la Computación', 1, 'victor.medina@itmexicali.edu.mx');
INSERT INTO public.profesores VALUES (3, 'Arturo', 'Meza', 'Licenciado en Matemáticas', 3, 'arturo.meza@itmexicali.edu.mx');
INSERT INTO public.profesores VALUES (4, 'Rosa', 'Hernández', 'Maestra en Administración', 4, 'rosa.hernandez@itmexicali.edu.mx');
INSERT INTO public.profesores VALUES (5, 'Luis', 'Escobar', 'Doctor en Ingeniería Eléctrica', 5, 'luis.escobar@itmexicali.edu.mx');
INSERT INTO public.profesores VALUES (2, 'Silvia', 'Ramírez', 'Maestra en Ingeniería Industrial', 2, 'SilviaRamírez@tecnologico.mx');


--
-- Data for Name: cursosprofesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cursosprofesores VALUES (1, 1, 1);
INSERT INTO public.cursosprofesores VALUES (2, 2, 2);
INSERT INTO public.cursosprofesores VALUES (3, 3, 4);
INSERT INTO public.cursosprofesores VALUES (4, 4, 5);
INSERT INTO public.cursosprofesores VALUES (5, 5, 3);
INSERT INTO public.cursosprofesores VALUES (6, 2, 1);
INSERT INTO public.cursosprofesores VALUES (7, 3, 1);
INSERT INTO public.cursosprofesores VALUES (8, 5, 2);
INSERT INTO public.cursosprofesores VALUES (9, 1, 2);
INSERT INTO public.cursosprofesores VALUES (10, 4, 3);


--
-- Data for Name: horarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.horarios VALUES (1, 1, '2025-01-22', '2025-06-10', '08:00:00', '10:00:00');
INSERT INTO public.horarios VALUES (3, 3, '2025-01-22', '2025-06-10', '13:00:00', '15:00:00');
INSERT INTO public.horarios VALUES (4, 4, '2025-01-22', '2025-06-10', '15:00:00', '17:00:00');
INSERT INTO public.horarios VALUES (5, 5, '2025-01-22', '2025-06-10', '17:00:00', '19:00:00');
INSERT INTO public.horarios VALUES (2, 2, '2025-01-22', '2025-06-10', '09:00:00', '11:00:00');


--
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inscripciones VALUES (1, 1, 1, '2025-01-10', 95.00);
INSERT INTO public.inscripciones VALUES (2, 2, 2, '2025-01-11', 89.50);
INSERT INTO public.inscripciones VALUES (3, 3, 3, '2025-01-12', 92.00);
INSERT INTO public.inscripciones VALUES (4, 4, 4, '2025-01-13', 85.00);
INSERT INTO public.inscripciones VALUES (5, 5, 5, '2025-01-14', 90.50);


--
-- Data for Name: programasestudio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.programasestudio VALUES (1, 'Plan 2015 ISC', 'Programa educativo de Ingeniería en Sistemas 2015');
INSERT INTO public.programasestudio VALUES (2, 'Plan 2018 II', 'Programa educativo de Ingeniería Industrial 2018');
INSERT INTO public.programasestudio VALUES (3, 'Plan 2016 ADM', 'Programa educativo de Administración 2016');
INSERT INTO public.programasestudio VALUES (4, 'Plan 2017 ELEC', 'Programa educativo de Electromecánica 2017');
INSERT INTO public.programasestudio VALUES (5, 'Plan 2019 CP', 'Programa educativo de Contaduría Pública 2019');


--
-- Data for Name: programascursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.programascursos VALUES (1, 1, 1);
INSERT INTO public.programascursos VALUES (2, 2, 2);
INSERT INTO public.programascursos VALUES (3, 3, 3);
INSERT INTO public.programascursos VALUES (4, 4, 4);
INSERT INTO public.programascursos VALUES (5, 1, 5);


--
-- Name: campus_id_campus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_id_campus_seq', 1, false);


--
-- Name: carreras_id_carrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_id_carrera_seq', 1, false);


--
-- Name: carrerasestudiante_id_carrerasestudiantes_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrerasestudiante_id_carrerasestudiantes_seq', 1, false);


--
-- Name: cursos_id_cursos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_id_cursos_seq', 1, false);


--
-- Name: cursosprofesores_id_cursoprofesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursosprofesores_id_cursoprofesor_seq', 1, true);


--
-- Name: departamento_id_departamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamento_id_departamento_seq', 1, false);


--
-- Name: estudiante_id_estudiante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiante_id_estudiante_seq', 3, true);


--
-- Name: horarios_id_horario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horarios_id_horario_seq', 1, false);


--
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_id_inscripcion_seq', 1, false);


--
-- Name: profesores_id_profesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesores_id_profesor_seq', 1, false);


--
-- Name: programascursos_id_programacurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programascursos_id_programacurso_seq', 1, false);


--
-- Name: programasestudio_id_programa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programasestudio_id_programa_seq', 1, false);


--
-- PostgreSQL database dump complete
--

