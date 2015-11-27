--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-27 11:10:58 GMT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE locust;
--
-- TOC entry 2122 (class 1262 OID 16385)
-- Name: locust; Type: DATABASE; Schema: -; Owner: locust
--

CREATE DATABASE locust WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_GB.UTF-8' LC_CTYPE = 'en_GB.UTF-8';


ALTER DATABASE locust OWNER TO "locust";

\connect locust

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 191 (class 3079 OID 11787)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 191
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


--
-- TOC entry 177 (class 1259 OID 16419)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: locust; Tablespace:
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "locust";

--
-- TOC entry 176 (class 1259 OID 16417)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: locust
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO "locust";

--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: locust
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 179 (class 1259 OID 16429)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: locust; Tablespace:
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "locust";

--
-- TOC entry 178 (class 1259 OID 16427)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: locust
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO "locust";

--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: locust
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 175 (class 1259 OID 16409)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: locust; Tablespace:
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "locust";

--
-- TOC entry 174 (class 1259 OID 16407)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: locust
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO "locust";

--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 174
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: locust
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 181 (class 1259 OID 16439)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: locust; Tablespace:
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO "locust";

--
-- TOC entry 183 (class 1259 OID 16449)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: locust; Tablespace:
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO "locust";

--
-- TOC entry 182 (class 1259 OID 16447)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: locust
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO "locust";

--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: locust
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 180 (class 1259 OID 16437)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: locust
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO "locust";

--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 180
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: locust
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 185 (class 1259 OID 16459)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: locust; Tablespace:
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO "locust";

--
-- TOC entry 184 (class 1259 OID 16457)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: locust
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO "locust";

--
-- TOC entry 2132 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: locust
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 187 (class 1259 OID 16513)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: locust; Tablespace:
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO "locust";

--
-- TOC entry 186 (class 1259 OID 16511)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: locust
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO "locust";

--
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 186
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: locust
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 173 (class 1259 OID 16399)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: locust; Tablespace:
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "locust";

--
-- TOC entry 172 (class 1259 OID 16397)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: locust
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO "locust";

--
-- TOC entry 2134 (class 0 OID 0)
-- Dependencies: 172
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: locust
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 171 (class 1259 OID 16388)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: locust; Tablespace:
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "locust";

--
-- TOC entry 170 (class 1259 OID 16386)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: locust
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO "locust";

--
-- TOC entry 2135 (class 0 OID 0)
-- Dependencies: 170
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: locust
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 188 (class 1259 OID 16535)
-- Name: django_session; Type: TABLE; Schema: public; Owner: locust; Tablespace:
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "locust";


--
-- TOC entry 1924 (class 2604 OID 16422)
-- Name: id; Type: DEFAULT; Schema: public; Owner: locust
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 1925 (class 2604 OID 16432)
-- Name: id; Type: DEFAULT; Schema: public; Owner: locust
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 1923 (class 2604 OID 16412)
-- Name: id; Type: DEFAULT; Schema: public; Owner: locust
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 1926 (class 2604 OID 16442)
-- Name: id; Type: DEFAULT; Schema: public; Owner: locust
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 1927 (class 2604 OID 16452)
-- Name: id; Type: DEFAULT; Schema: public; Owner: locust
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 1928 (class 2604 OID 16462)
-- Name: id; Type: DEFAULT; Schema: public; Owner: locust
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 1929 (class 2604 OID 16516)
-- Name: id; Type: DEFAULT; Schema: public; Owner: locust
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 1922 (class 2604 OID 16402)
-- Name: id; Type: DEFAULT; Schema: public; Owner: locust
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 1921 (class 2604 OID 16391)
-- Name: id; Type: DEFAULT; Schema: public; Owner: locust
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 2104 (class 0 OID 16419)
-- Dependencies: 177
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: locust
--



--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2106 (class 0 OID 16429)
-- Dependencies: 179
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: locust
--



--
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2102 (class 0 OID 16409)
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
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add record', 7, 'add_record');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change record', 7, 'change_record');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete record', 7, 'delete_record');


--
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 174
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('auth_permission_id_seq', 21, true);


--
-- TOC entry 2108 (class 0 OID 16439)
-- Dependencies: 181
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: locust
--

INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$20000$mfoa3tal3mfX$IMih8IBZau+p1L6mQr8vdufeKawgefQuIt8xzSQodlE=', '2015-11-18 10:53:01.174468+00', true, 'locust', '', '', '', true, true, '2015-11-17 12:59:44.68738+00');


--
-- TOC entry 2110 (class 0 OID 16449)
-- Dependencies: 183
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: locust
--



--
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2141 (class 0 OID 0)
-- Dependencies: 180
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- TOC entry 2112 (class 0 OID 16459)
-- Dependencies: 185
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: locust
--



--
-- TOC entry 2142 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2114 (class 0 OID 16513)
-- Dependencies: 187
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: locust
--



--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 186
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- TOC entry 2100 (class 0 OID 16399)
-- Dependencies: 173
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: locust
--

INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'api', 'record');


--
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 172
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('django_content_type_id_seq', 7, true);


--
-- TOC entry 2098 (class 0 OID 16388)
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
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'api', '0001_initial', '2015-11-18 14:42:40.233593+00');


--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 170
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locust
--

SELECT pg_catalog.setval('django_migrations_id_seq', 11, true);


--
-- TOC entry 2115 (class 0 OID 16535)
-- Dependencies: 188
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: locust
--

INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('1197m6vby18y9y1aqhjnioh1teq7m2sr', 'MmQ0ZjU5YmU0ZTliYzdhYTZmOTY5Yjk1YWI5NWI0NGU0YmEyNjZhZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUyM2ZjOGE4OWMyY2Y5ZDM2NjA1NThkY2E0MDMzMGM3MDg5N2VhMmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-12-02 10:53:01.180999+00');


--
-- TOC entry 1945 (class 2606 OID 16426)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 1951 (class 2606 OID 16436)
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- TOC entry 1953 (class 2606 OID 16434)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1947 (class 2606 OID 16424)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 1940 (class 2606 OID 16416)
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- TOC entry 1942 (class 2606 OID 16414)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 1962 (class 2606 OID 16454)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 1964 (class 2606 OID 16456)
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- TOC entry 1955 (class 2606 OID 16444)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 1968 (class 2606 OID 16464)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1970 (class 2606 OID 16466)
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 1958 (class 2606 OID 16446)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 1974 (class 2606 OID 16522)
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 1935 (class 2606 OID 16406)
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- TOC entry 1937 (class 2606 OID 16404)
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 1933 (class 2606 OID 16396)
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 1977 (class 2606 OID 16542)
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: locust; Tablespace:
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 1943 (class 1259 OID 16473)
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: locust; Tablespace:
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 1948 (class 1259 OID 16484)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: locust; Tablespace:
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 1949 (class 1259 OID 16485)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: locust; Tablespace:
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 1938 (class 1259 OID 16472)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: locust; Tablespace:
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- TOC entry 1959 (class 1259 OID 16498)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: locust; Tablespace:
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- TOC entry 1960 (class 1259 OID 16497)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: locust; Tablespace:
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- TOC entry 1965 (class 1259 OID 16510)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: locust; Tablespace:
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 1966 (class 1259 OID 16509)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: locust; Tablespace:
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 1956 (class 1259 OID 16486)
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: locust; Tablespace:
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 1971 (class 1259 OID 16533)
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: locust; Tablespace:
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 1972 (class 1259 OID 16534)
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: locust; Tablespace:
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- TOC entry 1975 (class 1259 OID 16543)
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: locust; Tablespace:
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- TOC entry 1978 (class 1259 OID 16544)
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: locust; Tablespace:
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 1981 (class 2606 OID 16467)
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: locust
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1982 (class 2606 OID 16474)
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: locust
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1983 (class 2606 OID 16479)
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: locust
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1987 (class 2606 OID 16504)
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: locust
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1985 (class 2606 OID 16492)
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: locust
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1984 (class 2606 OID 16487)
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: locust
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1986 (class 2606 OID 16499)
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: locust
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1988 (class 2606 OID 16523)
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: locust
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1989 (class 2606 OID 16528)
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: locust
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-11-27 11:10:58 GMT

--
-- PostgreSQL database dump complete
--

