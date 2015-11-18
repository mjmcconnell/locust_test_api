--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-17 13:01:29 GMT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2094 (class 0 OID 16419)
-- Dependencies: 177
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: locust
--



--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2096 (class 0 OID 16429)
-- Dependencies: 179
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: locust
--



--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2092 (class 0 OID 16409)
-- Dependencies: 175
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: locust
--

INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete session', 6, 'delete_session');


--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 174
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('auth_permission_id_seq', 18, true);


--
-- TOC entry 2098 (class 0 OID 16439)
-- Dependencies: 181
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: locust
--

INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$20000$mfoa3tal3mfX$IMih8IBZau+p1L6mQr8vdufeKawgefQuIt8xzSQodlE=', NULL, true, 'locust', '', '', '', true, true, '2015-11-17 12:59:44.68738+00');


--
-- TOC entry 2100 (class 0 OID 16449)
-- Dependencies: 183
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: locust
--



--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 180
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- TOC entry 2102 (class 0 OID 16459)
-- Dependencies: 185
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: locust
--



--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2104 (class 0 OID 16513)
-- Dependencies: 187
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: locust
--



--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 186
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- TOC entry 2090 (class 0 OID 16399)
-- Dependencies: 173
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: locust
--

INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');


--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 172
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('django_content_type_id_seq', 6, true);


--
-- TOC entry 2088 (class 0 OID 16388)
-- Dependencies: 171
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: locust
--

INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2015-11-17 12:58:53.548466+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2015-11-17 12:58:53.689808+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2015-11-17 12:58:53.731452+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'contenttypes', '0002_remove_content_type_name', '2015-11-17 12:58:53.778853+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'auth', '0002_alter_permission_name_max_length', '2015-11-17 12:58:53.795863+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'auth', '0003_alter_user_email_max_length', '2015-11-17 12:58:53.815571+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0004_alter_user_username_opts', '2015-11-17 12:58:53.832259+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0005_alter_user_last_login_null', '2015-11-17 12:58:53.852343+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0006_require_contenttypes_0002', '2015-11-17 12:58:53.856798+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'sessions', '0001_initial', '2015-11-17 12:58:53.885694+00');


--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 170
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('django_migrations_id_seq', 10, true);


--
-- TOC entry 2105 (class 0 OID 16535)
-- Dependencies: 188
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: locust
--



-- Completed on 2015-11-17 13:01:29 GMT

--
-- PostgreSQL database dump complete
--

