--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

-- Started on 2017-02-12 13:20:14 IST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "poc_bank";
--
-- TOC entry 2316 (class 1262 OID 16384)
-- Name: poc_bank; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "poc_bank" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE "poc_bank" OWNER TO "postgres";

\connect "poc_bank"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2317 (class 1262 OID 16384)
-- Dependencies: 2316
-- Name: poc_bank; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "poc_bank" IS 'sample db for proof of concept bank';


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION "plpgsql"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';


SET search_path = "public", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 192 (class 1259 OID 16416)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "auth_group" (
    "id" integer NOT NULL,
    "name" character varying(80) NOT NULL
);


ALTER TABLE "auth_group" OWNER TO "postgres";

--
-- TOC entry 191 (class 1259 OID 16414)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "auth_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "auth_group_id_seq" OWNER TO "postgres";

--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 191
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "auth_group_id_seq" OWNED BY "auth_group"."id";


--
-- TOC entry 194 (class 1259 OID 16426)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "auth_group_permissions" (
    "id" integer NOT NULL,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL
);


ALTER TABLE "auth_group_permissions" OWNER TO "postgres";

--
-- TOC entry 193 (class 1259 OID 16424)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "auth_group_permissions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "auth_group_permissions_id_seq" OWNER TO "postgres";

--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "auth_group_permissions_id_seq" OWNED BY "auth_group_permissions"."id";


--
-- TOC entry 190 (class 1259 OID 16408)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "auth_permission" (
    "id" integer NOT NULL,
    "name" character varying(255) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" character varying(100) NOT NULL
);


ALTER TABLE "auth_permission" OWNER TO "postgres";

--
-- TOC entry 189 (class 1259 OID 16406)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "auth_permission_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "auth_permission_id_seq" OWNER TO "postgres";

--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "auth_permission_id_seq" OWNED BY "auth_permission"."id";


--
-- TOC entry 196 (class 1259 OID 16434)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "auth_user" (
    "id" integer NOT NULL,
    "password" character varying(128) NOT NULL,
    "last_login" timestamp with time zone,
    "is_superuser" boolean NOT NULL,
    "username" character varying(150) NOT NULL,
    "first_name" character varying(30) NOT NULL,
    "last_name" character varying(30) NOT NULL,
    "email" character varying(254) NOT NULL,
    "is_staff" boolean NOT NULL,
    "is_active" boolean NOT NULL,
    "date_joined" timestamp with time zone NOT NULL
);


ALTER TABLE "auth_user" OWNER TO "postgres";

--
-- TOC entry 198 (class 1259 OID 16444)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "auth_user_groups" (
    "id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL
);


ALTER TABLE "auth_user_groups" OWNER TO "postgres";

--
-- TOC entry 197 (class 1259 OID 16442)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "auth_user_groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "auth_user_groups_id_seq" OWNER TO "postgres";

--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "auth_user_groups_id_seq" OWNED BY "auth_user_groups"."id";


--
-- TOC entry 195 (class 1259 OID 16432)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "auth_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "auth_user_id_seq" OWNER TO "postgres";

--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 195
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "auth_user_id_seq" OWNED BY "auth_user"."id";


--
-- TOC entry 200 (class 1259 OID 16452)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "auth_user_user_permissions" (
    "id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL
);


ALTER TABLE "auth_user_user_permissions" OWNER TO "postgres";

--
-- TOC entry 199 (class 1259 OID 16450)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "auth_user_user_permissions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "auth_user_user_permissions_id_seq" OWNER TO "postgres";

--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "auth_user_user_permissions_id_seq" OWNED BY "auth_user_user_permissions"."id";


--
-- TOC entry 202 (class 1259 OID 16512)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "django_admin_log" (
    "id" integer NOT NULL,
    "action_time" timestamp with time zone NOT NULL,
    "object_id" "text",
    "object_repr" character varying(200) NOT NULL,
    "action_flag" smallint NOT NULL,
    "change_message" "text" NOT NULL,
    "content_type_id" integer,
    "user_id" integer NOT NULL,
    CONSTRAINT "django_admin_log_action_flag_check" CHECK (("action_flag" >= 0))
);


ALTER TABLE "django_admin_log" OWNER TO "postgres";

--
-- TOC entry 201 (class 1259 OID 16510)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "django_admin_log_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "django_admin_log_id_seq" OWNER TO "postgres";

--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "django_admin_log_id_seq" OWNED BY "django_admin_log"."id";


--
-- TOC entry 188 (class 1259 OID 16398)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "django_content_type" (
    "id" integer NOT NULL,
    "app_label" character varying(100) NOT NULL,
    "model" character varying(100) NOT NULL
);


ALTER TABLE "django_content_type" OWNER TO "postgres";

--
-- TOC entry 187 (class 1259 OID 16396)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "django_content_type_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "django_content_type_id_seq" OWNER TO "postgres";

--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 187
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "django_content_type_id_seq" OWNED BY "django_content_type"."id";


--
-- TOC entry 186 (class 1259 OID 16387)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "django_migrations" (
    "id" integer NOT NULL,
    "app" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "applied" timestamp with time zone NOT NULL
);


ALTER TABLE "django_migrations" OWNER TO "postgres";

--
-- TOC entry 185 (class 1259 OID 16385)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "django_migrations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "django_migrations_id_seq" OWNER TO "postgres";

--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 185
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "django_migrations_id_seq" OWNED BY "django_migrations"."id";


--
-- TOC entry 210 (class 1259 OID 16599)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "django_session" (
    "session_key" character varying(40) NOT NULL,
    "session_data" "text" NOT NULL,
    "expire_date" timestamp with time zone NOT NULL
);


ALTER TABLE "django_session" OWNER TO "postgres";

--
-- TOC entry 203 (class 1259 OID 16541)
-- Name: fund_transfer_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "fund_transfer_customer" (
    "user_id" integer NOT NULL,
    "phone" character varying(15) NOT NULL,
    "created_on" timestamp with time zone NOT NULL,
    "updated_on" timestamp with time zone NOT NULL
);


ALTER TABLE "fund_transfer_customer" OWNER TO "postgres";

--
-- TOC entry 205 (class 1259 OID 16548)
-- Name: fund_transfer_customeraccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "fund_transfer_customeraccount" (
    "id" integer NOT NULL,
    "account_number" character varying(35) NOT NULL,
    "account_type" character varying(1) NOT NULL,
    "balance" numeric(14,2) NOT NULL,
    "created_on" timestamp with time zone NOT NULL,
    "updated_on" timestamp with time zone NOT NULL,
    "customer_id" integer NOT NULL
);


ALTER TABLE "fund_transfer_customeraccount" OWNER TO "postgres";

--
-- TOC entry 204 (class 1259 OID 16546)
-- Name: fund_transfer_customeraccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "fund_transfer_customeraccount_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "fund_transfer_customeraccount_id_seq" OWNER TO "postgres";

--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 204
-- Name: fund_transfer_customeraccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "fund_transfer_customeraccount_id_seq" OWNED BY "fund_transfer_customeraccount"."id";


--
-- TOC entry 207 (class 1259 OID 16556)
-- Name: fund_transfer_fundtransfer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "fund_transfer_fundtransfer" (
    "id" integer NOT NULL,
    "narration" character varying(100) NOT NULL,
    "amount" numeric(14,2) NOT NULL,
    "balance" numeric(14,2) NOT NULL,
    "created_on" timestamp with time zone NOT NULL,
    "customer_account_id" integer NOT NULL,
    "payee_id" integer NOT NULL
);


ALTER TABLE "fund_transfer_fundtransfer" OWNER TO "postgres";

--
-- TOC entry 206 (class 1259 OID 16554)
-- Name: fund_transfer_fundtransfer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "fund_transfer_fundtransfer_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "fund_transfer_fundtransfer_id_seq" OWNER TO "postgres";

--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 206
-- Name: fund_transfer_fundtransfer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "fund_transfer_fundtransfer_id_seq" OWNED BY "fund_transfer_fundtransfer"."id";


--
-- TOC entry 209 (class 1259 OID 16564)
-- Name: fund_transfer_payee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "fund_transfer_payee" (
    "id" integer NOT NULL,
    "name" character varying(50) NOT NULL,
    "nickname" character varying(30) NOT NULL,
    "account_number" character varying(35) NOT NULL,
    "account_type" character varying(1) NOT NULL,
    "bank_code" character varying(50) NOT NULL,
    "bank_name" character varying(50) NOT NULL,
    "bank_city" character varying(50) NOT NULL,
    "bank_branch" character varying(50) NOT NULL,
    "created_on" timestamp with time zone NOT NULL,
    "updated_on" timestamp with time zone NOT NULL,
    "customer_id" integer NOT NULL
);


ALTER TABLE "fund_transfer_payee" OWNER TO "postgres";

--
-- TOC entry 208 (class 1259 OID 16562)
-- Name: fund_transfer_payee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "fund_transfer_payee_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "fund_transfer_payee_id_seq" OWNER TO "postgres";

--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 208
-- Name: fund_transfer_payee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "fund_transfer_payee_id_seq" OWNED BY "fund_transfer_payee"."id";


--
-- TOC entry 2086 (class 2604 OID 16419)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth_group_id_seq"'::"regclass");


--
-- TOC entry 2087 (class 2604 OID 16429)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group_permissions" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth_group_permissions_id_seq"'::"regclass");


--
-- TOC entry 2085 (class 2604 OID 16411)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_permission" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth_permission_id_seq"'::"regclass");


--
-- TOC entry 2088 (class 2604 OID 16437)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth_user_id_seq"'::"regclass");


--
-- TOC entry 2089 (class 2604 OID 16447)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_groups" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth_user_groups_id_seq"'::"regclass");


--
-- TOC entry 2090 (class 2604 OID 16455)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_user_permissions" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth_user_user_permissions_id_seq"'::"regclass");


--
-- TOC entry 2091 (class 2604 OID 16515)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_admin_log" ALTER COLUMN "id" SET DEFAULT "nextval"('"django_admin_log_id_seq"'::"regclass");


--
-- TOC entry 2084 (class 2604 OID 16401)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_content_type" ALTER COLUMN "id" SET DEFAULT "nextval"('"django_content_type_id_seq"'::"regclass");


--
-- TOC entry 2083 (class 2604 OID 16390)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_migrations" ALTER COLUMN "id" SET DEFAULT "nextval"('"django_migrations_id_seq"'::"regclass");


--
-- TOC entry 2093 (class 2604 OID 16551)
-- Name: fund_transfer_customeraccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_customeraccount" ALTER COLUMN "id" SET DEFAULT "nextval"('"fund_transfer_customeraccount_id_seq"'::"regclass");


--
-- TOC entry 2094 (class 2604 OID 16559)
-- Name: fund_transfer_fundtransfer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_fundtransfer" ALTER COLUMN "id" SET DEFAULT "nextval"('"fund_transfer_fundtransfer_id_seq"'::"regclass");


--
-- TOC entry 2095 (class 2604 OID 16567)
-- Name: fund_transfer_payee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_payee" ALTER COLUMN "id" SET DEFAULT "nextval"('"fund_transfer_payee_id_seq"'::"regclass");


--
-- TOC entry 2293 (class 0 OID 16416)
-- Dependencies: 192
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 191
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"auth_group_id_seq"', 1, false);


--
-- TOC entry 2295 (class 0 OID 16426)
-- Dependencies: 194
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"auth_group_permissions_id_seq"', 1, false);


--
-- TOC entry 2291 (class 0 OID 16408)
-- Dependencies: 190
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (4, 'Can add user', 2, 'add_user');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (5, 'Can change user', 2, 'change_user');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (6, 'Can delete user', 2, 'delete_user');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (10, 'Can add permission', 4, 'add_permission');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (11, 'Can change permission', 4, 'change_permission');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (12, 'Can delete permission', 4, 'delete_permission');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (19, 'Can add customer', 7, 'add_customer');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (20, 'Can change customer', 7, 'change_customer');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (21, 'Can delete customer', 7, 'delete_customer');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (22, 'Can add customer account', 8, 'add_customeraccount');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (23, 'Can change customer account', 8, 'change_customeraccount');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (24, 'Can delete customer account', 8, 'delete_customeraccount');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (25, 'Can add payee', 9, 'add_payee');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (26, 'Can change payee', 9, 'change_payee');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (27, 'Can delete payee', 9, 'delete_payee');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (28, 'Can add fund transfer', 10, 'add_fundtransfer');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (29, 'Can change fund transfer', 10, 'change_fundtransfer');
INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES (30, 'Can delete fund transfer', 10, 'delete_fundtransfer');


--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"auth_permission_id_seq"', 30, true);


--
-- TOC entry 2297 (class 0 OID 16434)
-- Dependencies: 196
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "auth_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined") VALUES (3, 'pbkdf2_sha256$30000$4MlS8l8Ew3JC$uL6WjuVmZXS0bV6hFbrsUHQBjYg8EYVeC1j4xtrZIzs=', NULL, false, 'testuser3', 'test', 'user3', 'user3@test.com', false, true, '2017-02-12 05:50:04+00');
INSERT INTO "auth_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined") VALUES (4, 'pbkdf2_sha256$30000$72k34trfLS3z$bxFGzzwOSEA+rSFwSoz4FBjP9xcyQDKn1zOIUS2MoE8=', NULL, false, 'testuser4', 'test', 'user4', 'user4@test.com', false, true, '2017-02-12 05:50:33+00');
INSERT INTO "auth_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined") VALUES (2, 'pbkdf2_sha256$30000$aONkohQtfjNR$3g4QVD8160nbP1cYuledoVhe26ZWCb1jm+XzEWSLnX0=', '2017-02-12 05:56:00.588387+00', false, 'testuser2', 'test', 'user2', 'user2@test.com', false, true, '2017-02-12 05:48:15+00');
INSERT INTO "auth_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined") VALUES (1, 'pbkdf2_sha256$30000$VnawIPmqXtQK$VH2259uTtmKhpHUqQ4Z8LfOG7pqkpNh1bYPiCMTctmM=', '2017-02-12 06:04:00.246255+00', true, 'admin', '', '', '', true, true, '2017-02-12 05:47:16.94416+00');


--
-- TOC entry 2299 (class 0 OID 16444)
-- Dependencies: 198
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"auth_user_groups_id_seq"', 1, false);


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 195
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"auth_user_id_seq"', 4, true);


--
-- TOC entry 2301 (class 0 OID 16452)
-- Dependencies: 200
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"auth_user_user_permissions_id_seq"', 1, false);


--
-- TOC entry 2303 (class 0 OID 16512)
-- Dependencies: 202
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (1, '2017-02-12 05:48:15.222961+00', '2', 'testuser2', 1, '[{"added": {}}]', 2, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (2, '2017-02-12 05:49:14.98863+00', '2', 'testuser2', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 2, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (3, '2017-02-12 05:49:48.756653+00', '2', '2 | testuser2 | test | user2 | 222 | user2@test.com', 1, '[{"added": {}}]', 7, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (4, '2017-02-12 05:50:04.848531+00', '3', 'testuser3', 1, '[{"added": {}}]', 2, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (5, '2017-02-12 05:50:08.847285+00', '3', '3 | testuser3 |  |  | 333 | ', 1, '[{"added": {}}]', 7, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (6, '2017-02-12 05:50:33.145858+00', '4', 'testuser4', 1, '[{"added": {}}]', 2, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (7, '2017-02-12 05:50:37.320399+00', '4', '4 | testuser4 |  |  | 444 | ', 1, '[{"added": {}}]', 7, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (8, '2017-02-12 05:50:54.093582+00', '3', 'testuser3', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 2, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (9, '2017-02-12 05:50:58.609501+00', '3', '3 | testuser3 | test | user3 | 333 | user3@test.com', 2, '[]', 7, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (10, '2017-02-12 05:51:24.491844+00', '4', 'testuser4', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 2, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (11, '2017-02-12 05:51:26.250546+00', '4', '4 | testuser4 | test | user4 | 444 | user4@test.com', 2, '[]', 7, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (12, '2017-02-12 05:53:59.181379+00', '1', 'testuser2 | 222444 | s | 20200 | 2017-02-12 05:53:59.179574+00:00 | 2017-02-12 05:53:59.179602+00:00', 1, '[{"added": {}}]', 8, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (13, '2017-02-12 05:54:22.115801+00', '2', 'testuser3 | 333666 | s | 30300 | 2017-02-12 05:54:22.113412+00:00 | 2017-02-12 05:54:22.113440+00:00', 1, '[{"added": {}}]', 8, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (14, '2017-02-12 05:54:52.802052+00', '3', 'testuser4 | 444888 | c | 40400 | 2017-02-12 05:54:52.800477+00:00 | 2017-02-12 05:54:52.800503+00:00', 1, '[{"added": {}}]', 8, 1);


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"django_admin_log_id_seq"', 14, true);


--
-- TOC entry 2289 (class 0 OID 16398)
-- Dependencies: 188
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES (1, 'admin', 'logentry');
INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES (2, 'auth', 'user');
INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES (3, 'auth', 'group');
INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES (4, 'auth', 'permission');
INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES (6, 'sessions', 'session');
INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES (7, 'fund_transfer', 'customer');
INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES (8, 'fund_transfer', 'customeraccount');
INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES (9, 'fund_transfer', 'payee');
INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES (10, 'fund_transfer', 'fundtransfer');


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 187
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"django_content_type_id_seq"', 10, true);


--
-- TOC entry 2287 (class 0 OID 16387)
-- Dependencies: 186
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (1, 'contenttypes', '0001_initial', '2017-02-12 05:46:12.025322+00');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (2, 'auth', '0001_initial', '2017-02-12 05:46:12.733708+00');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (3, 'admin', '0001_initial', '2017-02-12 05:46:12.887084+00');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2017-02-12 05:46:12.929076+00');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2017-02-12 05:46:12.980937+00');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2017-02-12 05:46:13.020414+00');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (7, 'auth', '0003_alter_user_email_max_length', '2017-02-12 05:46:13.058048+00');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (8, 'auth', '0004_alter_user_username_opts', '2017-02-12 05:46:13.083097+00');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (9, 'auth', '0005_alter_user_last_login_null', '2017-02-12 05:46:13.120257+00');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (10, 'auth', '0006_require_contenttypes_0002', '2017-02-12 05:46:13.134609+00');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2017-02-12 05:46:13.158224+00');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (12, 'auth', '0008_alter_user_username_max_length', '2017-02-12 05:46:13.224302+00');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (13, 'fund_transfer', '0001_initial', '2017-02-12 05:46:13.549661+00');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (14, 'sessions', '0001_initial', '2017-02-12 05:46:13.695404+00');


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 185
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"django_migrations_id_seq"', 14, true);


--
-- TOC entry 2311 (class 0 OID 16599)
-- Dependencies: 210
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "django_session" ("session_key", "session_data", "expire_date") VALUES ('f5z1a2h404e2s7nyc9655s3fmahut4tl', 'MmI3ZjkxMzkzMmMzZDMzZjZkMmM3YTcxNDhlNzJiMjJiYWY4ZDViMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMGFiNDNkZGNkZGYzOTM2NjJlZjI4MmFiZjA2MTg0YzkxYTY1NDE0In0=', '2017-02-26 06:04:00.261781+00');


--
-- TOC entry 2304 (class 0 OID 16541)
-- Dependencies: 203
-- Data for Name: fund_transfer_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "fund_transfer_customer" ("user_id", "phone", "created_on", "updated_on") VALUES (2, '222', '2017-02-12 05:49:48.755885+00', '2017-02-12 05:49:48.755906+00');
INSERT INTO "fund_transfer_customer" ("user_id", "phone", "created_on", "updated_on") VALUES (3, '333', '2017-02-12 05:50:08.846775+00', '2017-02-12 05:50:58.60858+00');
INSERT INTO "fund_transfer_customer" ("user_id", "phone", "created_on", "updated_on") VALUES (4, '444', '2017-02-12 05:50:37.319885+00', '2017-02-12 05:51:26.249626+00');


--
-- TOC entry 2306 (class 0 OID 16548)
-- Dependencies: 205
-- Data for Name: fund_transfer_customeraccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "fund_transfer_customeraccount" ("id", "account_number", "account_type", "balance", "created_on", "updated_on", "customer_id") VALUES (1, '222444', 's', 20200.00, '2017-02-12 05:53:59.179574+00', '2017-02-12 05:53:59.179602+00', 2);
INSERT INTO "fund_transfer_customeraccount" ("id", "account_number", "account_type", "balance", "created_on", "updated_on", "customer_id") VALUES (2, '333666', 's', 30300.00, '2017-02-12 05:54:22.113412+00', '2017-02-12 05:54:22.11344+00', 3);
INSERT INTO "fund_transfer_customeraccount" ("id", "account_number", "account_type", "balance", "created_on", "updated_on", "customer_id") VALUES (3, '444888', 'c', 40400.00, '2017-02-12 05:54:52.800477+00', '2017-02-12 05:54:52.800503+00', 4);


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 204
-- Name: fund_transfer_customeraccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"fund_transfer_customeraccount_id_seq"', 3, true);


--
-- TOC entry 2308 (class 0 OID 16556)
-- Dependencies: 207
-- Data for Name: fund_transfer_fundtransfer; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 206
-- Name: fund_transfer_fundtransfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"fund_transfer_fundtransfer_id_seq"', 1, false);


--
-- TOC entry 2310 (class 0 OID 16564)
-- Dependencies: 209
-- Data for Name: fund_transfer_payee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (1, 'TEST-USER-3', 'T3', '333666', 's', '1234', '', 'Chennai', '', '2017-02-12 05:57:17.236875+00', '2017-02-12 05:57:17.236899+00', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (2, 'TEST-USER-4', 'T4', '444888', 'c', '1234', '', 'Chennai', '', '2017-02-12 05:58:07.465981+00', '2017-02-12 05:58:07.466004+00', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (3, 'Another-Bank-User1', 'ABS1', '999888', 's', '4321', 'Another Bank', 'Mumbai', 'Branch1', '2017-02-12 05:59:30.989238+00', '2017-02-12 05:59:30.989261+00', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (4, 'Another-Bank-User2', 'ABS2', '888777', 'c', '4321', 'Another Bank', 'Mumbai', 'Branch1', '2017-02-12 06:00:26.336826+00', '2017-02-12 06:00:26.336849+00', 2);


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 208
-- Name: fund_transfer_payee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"fund_transfer_payee_id_seq"', 4, true);


--
-- TOC entry 2109 (class 2606 OID 16423)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group"
    ADD CONSTRAINT "auth_group_name_key" UNIQUE ("name");


--
-- TOC entry 2115 (class 2606 OID 16478)
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_group_id_0cd325b0_uniq" UNIQUE ("group_id", "permission_id");


--
-- TOC entry 2117 (class 2606 OID 16431)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2111 (class 2606 OID 16421)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group"
    ADD CONSTRAINT "auth_group_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2104 (class 2606 OID 16464)
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_permission"
    ADD CONSTRAINT "auth_permission_content_type_id_01ab375a_uniq" UNIQUE ("content_type_id", "codename");


--
-- TOC entry 2106 (class 2606 OID 16413)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_permission"
    ADD CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2126 (class 2606 OID 16449)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2128 (class 2606 OID 16493)
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_user_id_94350c0c_uniq" UNIQUE ("user_id", "group_id");


--
-- TOC entry 2119 (class 2606 OID 16439)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user"
    ADD CONSTRAINT "auth_user_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2132 (class 2606 OID 16457)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permissions_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2134 (class 2606 OID 16507)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permissions_user_id_14a6b632_uniq" UNIQUE ("user_id", "permission_id");


--
-- TOC entry 2122 (class 2606 OID 16536)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user"
    ADD CONSTRAINT "auth_user_username_key" UNIQUE ("username");


--
-- TOC entry 2138 (class 2606 OID 16521)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_admin_log"
    ADD CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2099 (class 2606 OID 16405)
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_content_type"
    ADD CONSTRAINT "django_content_type_app_label_76bd3d3b_uniq" UNIQUE ("app_label", "model");


--
-- TOC entry 2101 (class 2606 OID 16403)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_content_type"
    ADD CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2097 (class 2606 OID 16395)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_migrations"
    ADD CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2153 (class 2606 OID 16606)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_session"
    ADD CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key");


--
-- TOC entry 2140 (class 2606 OID 16545)
-- Name: fund_transfer_customer fund_transfer_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_customer"
    ADD CONSTRAINT "fund_transfer_customer_pkey" PRIMARY KEY ("user_id");


--
-- TOC entry 2143 (class 2606 OID 16553)
-- Name: fund_transfer_customeraccount fund_transfer_customeraccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_customeraccount"
    ADD CONSTRAINT "fund_transfer_customeraccount_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2147 (class 2606 OID 16561)
-- Name: fund_transfer_fundtransfer fund_transfer_fundtransfer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_fundtransfer"
    ADD CONSTRAINT "fund_transfer_fundtransfer_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2150 (class 2606 OID 16569)
-- Name: fund_transfer_payee fund_transfer_payee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_payee"
    ADD CONSTRAINT "fund_transfer_payee_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2107 (class 1259 OID 16466)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_group_name_a6ea08ec_like" ON "auth_group" USING "btree" ("name" "varchar_pattern_ops");


--
-- TOC entry 2112 (class 1259 OID 16479)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_group_permissions_0e939a4f" ON "auth_group_permissions" USING "btree" ("group_id");


--
-- TOC entry 2113 (class 1259 OID 16480)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_group_permissions_8373b171" ON "auth_group_permissions" USING "btree" ("permission_id");


--
-- TOC entry 2102 (class 1259 OID 16465)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_permission_417f1b1c" ON "auth_permission" USING "btree" ("content_type_id");


--
-- TOC entry 2123 (class 1259 OID 16495)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_user_groups_0e939a4f" ON "auth_user_groups" USING "btree" ("group_id");


--
-- TOC entry 2124 (class 1259 OID 16494)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_user_groups_e8701ad4" ON "auth_user_groups" USING "btree" ("user_id");


--
-- TOC entry 2129 (class 1259 OID 16509)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_user_user_permissions_8373b171" ON "auth_user_user_permissions" USING "btree" ("permission_id");


--
-- TOC entry 2130 (class 1259 OID 16508)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_user_user_permissions_e8701ad4" ON "auth_user_user_permissions" USING "btree" ("user_id");


--
-- TOC entry 2120 (class 1259 OID 16537)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_user_username_6821ab7c_like" ON "auth_user" USING "btree" ("username" "varchar_pattern_ops");


--
-- TOC entry 2135 (class 1259 OID 16532)
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_admin_log_417f1b1c" ON "django_admin_log" USING "btree" ("content_type_id");


--
-- TOC entry 2136 (class 1259 OID 16533)
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_admin_log_e8701ad4" ON "django_admin_log" USING "btree" ("user_id");


--
-- TOC entry 2151 (class 1259 OID 16607)
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_session_de54fa62" ON "django_session" USING "btree" ("expire_date");


--
-- TOC entry 2154 (class 1259 OID 16608)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_session_session_key_c0390e0f_like" ON "django_session" USING "btree" ("session_key" "varchar_pattern_ops");


--
-- TOC entry 2141 (class 1259 OID 16580)
-- Name: fund_transfer_customeraccount_cb24373b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fund_transfer_customeraccount_cb24373b" ON "fund_transfer_customeraccount" USING "btree" ("customer_id");


--
-- TOC entry 2144 (class 1259 OID 16586)
-- Name: fund_transfer_fundtransfer_2737f573; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fund_transfer_fundtransfer_2737f573" ON "fund_transfer_fundtransfer" USING "btree" ("customer_account_id");


--
-- TOC entry 2145 (class 1259 OID 16593)
-- Name: fund_transfer_fundtransfer_afff1bcc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fund_transfer_fundtransfer_afff1bcc" ON "fund_transfer_fundtransfer" USING "btree" ("payee_id");


--
-- TOC entry 2148 (class 1259 OID 16592)
-- Name: fund_transfer_payee_cb24373b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fund_transfer_payee_cb24373b" ON "fund_transfer_payee" USING "btree" ("customer_id");


--
-- TOC entry 2157 (class 2606 OID 16472)
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group_permissions"
    ADD CONSTRAINT "auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id" FOREIGN KEY ("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2156 (class 2606 OID 16467)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2155 (class 2606 OID 16458)
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_permission"
    ADD CONSTRAINT "auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2159 (class 2606 OID 16487)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2158 (class 2606 OID 16482)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2161 (class 2606 OID 16501)
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id" FOREIGN KEY ("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2160 (class 2606 OID 16496)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2166 (class 2606 OID 16581)
-- Name: fund_transfer_fundtransfer cfab8ed1af581959029e30660bd0f5f5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_fundtransfer"
    ADD CONSTRAINT "cfab8ed1af581959029e30660bd0f5f5" FOREIGN KEY ("customer_account_id") REFERENCES "fund_transfer_customeraccount"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2162 (class 2606 OID 16522)
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_admin_log"
    ADD CONSTRAINT "django_admin_content_type_id_c4bce8eb_fk_django_content_type_id" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2163 (class 2606 OID 16527)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_admin_log"
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2168 (class 2606 OID 16587)
-- Name: fund_transfer_payee fund_tra_customer_id_17c50942_fk_fund_transfer_customer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_payee"
    ADD CONSTRAINT "fund_tra_customer_id_17c50942_fk_fund_transfer_customer_user_id" FOREIGN KEY ("customer_id") REFERENCES "fund_transfer_customer"("user_id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2165 (class 2606 OID 16575)
-- Name: fund_transfer_customeraccount fund_tra_customer_id_2e77ff8e_fk_fund_transfer_customer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_customeraccount"
    ADD CONSTRAINT "fund_tra_customer_id_2e77ff8e_fk_fund_transfer_customer_user_id" FOREIGN KEY ("customer_id") REFERENCES "fund_transfer_customer"("user_id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2164 (class 2606 OID 16570)
-- Name: fund_transfer_customer fund_transfer_customer_user_id_72cf02ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_customer"
    ADD CONSTRAINT "fund_transfer_customer_user_id_72cf02ab_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2167 (class 2606 OID 16594)
-- Name: fund_transfer_fundtransfer fund_transfer_fundt_payee_id_0309f5dc_fk_fund_transfer_payee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_fundtransfer"
    ADD CONSTRAINT "fund_transfer_fundt_payee_id_0309f5dc_fk_fund_transfer_payee_id" FOREIGN KEY ("payee_id") REFERENCES "fund_transfer_payee"("id") DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2017-02-12 13:20:15 IST

--
-- PostgreSQL database dump complete
--

