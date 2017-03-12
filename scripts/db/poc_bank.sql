--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

-- Started on 2017-03-11 13:08:43 IST

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
-- TOC entry 2578 (class 1262 OID 25818)
-- Name: poc_bank; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "poc_bank" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


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
-- TOC entry 2579 (class 1262 OID 25818)
-- Dependencies: 2578
-- Name: poc_bank; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "poc_bank" IS 'sample db for proof of concept bank';


--
-- TOC entry 2580 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 12655)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";


--
-- TOC entry 2581 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION "plpgsql"; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';


SET search_path = "public", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 25819)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "auth_group" (
    "id" integer NOT NULL,
    "name" character varying(80) NOT NULL
);


ALTER TABLE "auth_group" OWNER TO "postgres";

--
-- TOC entry 186 (class 1259 OID 25822)
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
-- TOC entry 2582 (class 0 OID 0)
-- Dependencies: 186
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "auth_group_id_seq" OWNED BY "auth_group"."id";


--
-- TOC entry 187 (class 1259 OID 25824)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "auth_group_permissions" (
    "id" integer NOT NULL,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL
);


ALTER TABLE "auth_group_permissions" OWNER TO "postgres";

--
-- TOC entry 188 (class 1259 OID 25827)
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
-- TOC entry 2583 (class 0 OID 0)
-- Dependencies: 188
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "auth_group_permissions_id_seq" OWNED BY "auth_group_permissions"."id";


--
-- TOC entry 189 (class 1259 OID 25829)
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
-- TOC entry 190 (class 1259 OID 25832)
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
-- TOC entry 2584 (class 0 OID 0)
-- Dependencies: 190
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "auth_permission_id_seq" OWNED BY "auth_permission"."id";


--
-- TOC entry 191 (class 1259 OID 25834)
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
-- TOC entry 192 (class 1259 OID 25840)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "auth_user_groups" (
    "id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL
);


ALTER TABLE "auth_user_groups" OWNER TO "postgres";

--
-- TOC entry 193 (class 1259 OID 25843)
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
-- TOC entry 2585 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "auth_user_groups_id_seq" OWNED BY "auth_user_groups"."id";


--
-- TOC entry 194 (class 1259 OID 25845)
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
-- TOC entry 2586 (class 0 OID 0)
-- Dependencies: 194
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "auth_user_id_seq" OWNED BY "auth_user"."id";


--
-- TOC entry 195 (class 1259 OID 25847)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "auth_user_user_permissions" (
    "id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL
);


ALTER TABLE "auth_user_user_permissions" OWNER TO "postgres";

--
-- TOC entry 196 (class 1259 OID 25850)
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
-- TOC entry 2587 (class 0 OID 0)
-- Dependencies: 196
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "auth_user_user_permissions_id_seq" OWNED BY "auth_user_user_permissions"."id";


--
-- TOC entry 197 (class 1259 OID 25852)
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
-- TOC entry 198 (class 1259 OID 25859)
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
-- TOC entry 2588 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "django_admin_log_id_seq" OWNED BY "django_admin_log"."id";


--
-- TOC entry 199 (class 1259 OID 25861)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "django_content_type" (
    "id" integer NOT NULL,
    "app_label" character varying(100) NOT NULL,
    "model" character varying(100) NOT NULL
);


ALTER TABLE "django_content_type" OWNER TO "postgres";

--
-- TOC entry 200 (class 1259 OID 25864)
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
-- TOC entry 2589 (class 0 OID 0)
-- Dependencies: 200
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "django_content_type_id_seq" OWNED BY "django_content_type"."id";


--
-- TOC entry 201 (class 1259 OID 25866)
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
-- TOC entry 202 (class 1259 OID 25872)
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
-- TOC entry 2590 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "django_migrations_id_seq" OWNED BY "django_migrations"."id";


--
-- TOC entry 203 (class 1259 OID 25874)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "django_session" (
    "session_key" character varying(40) NOT NULL,
    "session_data" "text" NOT NULL,
    "expire_date" timestamp with time zone NOT NULL
);


ALTER TABLE "django_session" OWNER TO "postgres";

--
-- TOC entry 204 (class 1259 OID 25880)
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
-- TOC entry 205 (class 1259 OID 25883)
-- Name: fund_transfer_customeraccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "fund_transfer_customeraccount" (
    "id" integer NOT NULL,
    "account_number" character varying(35) NOT NULL,
    "account_type" character varying(2) NOT NULL,
    "balance" numeric(14,2) NOT NULL,
    "created_on" timestamp with time zone NOT NULL,
    "updated_on" timestamp with time zone NOT NULL,
    "customer_id" integer NOT NULL
);


ALTER TABLE "fund_transfer_customeraccount" OWNER TO "postgres";

--
-- TOC entry 206 (class 1259 OID 25886)
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
-- TOC entry 2591 (class 0 OID 0)
-- Dependencies: 206
-- Name: fund_transfer_customeraccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "fund_transfer_customeraccount_id_seq" OWNED BY "fund_transfer_customeraccount"."id";


--
-- TOC entry 207 (class 1259 OID 25888)
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
-- TOC entry 208 (class 1259 OID 25891)
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
-- TOC entry 2592 (class 0 OID 0)
-- Dependencies: 208
-- Name: fund_transfer_fundtransfer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "fund_transfer_fundtransfer_id_seq" OWNED BY "fund_transfer_fundtransfer"."id";


--
-- TOC entry 209 (class 1259 OID 25893)
-- Name: fund_transfer_payee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "fund_transfer_payee" (
    "id" integer NOT NULL,
    "name" character varying(50) NOT NULL,
    "nickname" character varying(30) NOT NULL,
    "account_number" character varying(35) NOT NULL,
    "account_type" character varying(2) NOT NULL,
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
-- TOC entry 210 (class 1259 OID 25896)
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
-- TOC entry 2593 (class 0 OID 0)
-- Dependencies: 210
-- Name: fund_transfer_payee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "fund_transfer_payee_id_seq" OWNED BY "fund_transfer_payee"."id";


--
-- TOC entry 2345 (class 2604 OID 25898)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth_group_id_seq"'::"regclass");


--
-- TOC entry 2346 (class 2604 OID 25899)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group_permissions" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth_group_permissions_id_seq"'::"regclass");


--
-- TOC entry 2347 (class 2604 OID 25900)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_permission" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth_permission_id_seq"'::"regclass");


--
-- TOC entry 2348 (class 2604 OID 25901)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth_user_id_seq"'::"regclass");


--
-- TOC entry 2349 (class 2604 OID 25902)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_groups" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth_user_groups_id_seq"'::"regclass");


--
-- TOC entry 2350 (class 2604 OID 25903)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_user_permissions" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth_user_user_permissions_id_seq"'::"regclass");


--
-- TOC entry 2351 (class 2604 OID 25904)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_admin_log" ALTER COLUMN "id" SET DEFAULT "nextval"('"django_admin_log_id_seq"'::"regclass");


--
-- TOC entry 2353 (class 2604 OID 25905)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_content_type" ALTER COLUMN "id" SET DEFAULT "nextval"('"django_content_type_id_seq"'::"regclass");


--
-- TOC entry 2354 (class 2604 OID 25906)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_migrations" ALTER COLUMN "id" SET DEFAULT "nextval"('"django_migrations_id_seq"'::"regclass");


--
-- TOC entry 2355 (class 2604 OID 25907)
-- Name: fund_transfer_customeraccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_customeraccount" ALTER COLUMN "id" SET DEFAULT "nextval"('"fund_transfer_customeraccount_id_seq"'::"regclass");


--
-- TOC entry 2356 (class 2604 OID 25908)
-- Name: fund_transfer_fundtransfer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_fundtransfer" ALTER COLUMN "id" SET DEFAULT "nextval"('"fund_transfer_fundtransfer_id_seq"'::"regclass");


--
-- TOC entry 2357 (class 2604 OID 25909)
-- Name: fund_transfer_payee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_payee" ALTER COLUMN "id" SET DEFAULT "nextval"('"fund_transfer_payee_id_seq"'::"regclass");


--
-- TOC entry 2548 (class 0 OID 25819)
-- Dependencies: 185
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2594 (class 0 OID 0)
-- Dependencies: 186
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"auth_group_id_seq"', 1, false);


--
-- TOC entry 2550 (class 0 OID 25824)
-- Dependencies: 187
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2595 (class 0 OID 0)
-- Dependencies: 188
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"auth_group_permissions_id_seq"', 1, false);


--
-- TOC entry 2552 (class 0 OID 25829)
-- Dependencies: 189
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
-- TOC entry 2596 (class 0 OID 0)
-- Dependencies: 190
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"auth_permission_id_seq"', 30, true);


--
-- TOC entry 2554 (class 0 OID 25834)
-- Dependencies: 191
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "auth_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined") VALUES (3, 'pbkdf2_sha256$30000$4MlS8l8Ew3JC$uL6WjuVmZXS0bV6hFbrsUHQBjYg8EYVeC1j4xtrZIzs=', NULL, false, 'testuser3', 'test', 'user3', 'user3@test.com', false, true, '2017-02-12 11:20:04+05:30');
INSERT INTO "auth_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined") VALUES (4, 'pbkdf2_sha256$30000$72k34trfLS3z$bxFGzzwOSEA+rSFwSoz4FBjP9xcyQDKn1zOIUS2MoE8=', NULL, false, 'testuser4', 'test', 'user4', 'user4@test.com', false, true, '2017-02-12 11:20:33+05:30');
INSERT INTO "auth_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined") VALUES (1, 'pbkdf2_sha256$30000$VnawIPmqXtQK$VH2259uTtmKhpHUqQ4Z8LfOG7pqkpNh1bYPiCMTctmM=', '2017-02-12 11:34:00.246255+05:30', true, 'admin', '', '', '', true, true, '2017-02-12 11:17:16.94416+05:30');
INSERT INTO "auth_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined") VALUES (2, 'pbkdf2_sha256$30000$aONkohQtfjNR$3g4QVD8160nbP1cYuledoVhe26ZWCb1jm+XzEWSLnX0=', '2017-03-11 12:50:06.941306+05:30', false, 'testuser2', 'test', 'user2', 'user2@test.com', false, true, '2017-02-12 11:18:15+05:30');


--
-- TOC entry 2555 (class 0 OID 25840)
-- Dependencies: 192
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2597 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"auth_user_groups_id_seq"', 1, false);


--
-- TOC entry 2598 (class 0 OID 0)
-- Dependencies: 194
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"auth_user_id_seq"', 4, true);


--
-- TOC entry 2558 (class 0 OID 25847)
-- Dependencies: 195
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2599 (class 0 OID 0)
-- Dependencies: 196
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"auth_user_user_permissions_id_seq"', 1, false);


--
-- TOC entry 2560 (class 0 OID 25852)
-- Dependencies: 197
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (1, '2017-02-12 11:18:15.222961+05:30', '2', 'testuser2', 1, '[{"added": {}}]', 2, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (2, '2017-02-12 11:19:14.98863+05:30', '2', 'testuser2', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 2, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (3, '2017-02-12 11:19:48.756653+05:30', '2', '2 | testuser2 | test | user2 | 222 | user2@test.com', 1, '[{"added": {}}]', 7, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (4, '2017-02-12 11:20:04.848531+05:30', '3', 'testuser3', 1, '[{"added": {}}]', 2, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (5, '2017-02-12 11:20:08.847285+05:30', '3', '3 | testuser3 |  |  | 333 | ', 1, '[{"added": {}}]', 7, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (6, '2017-02-12 11:20:33.145858+05:30', '4', 'testuser4', 1, '[{"added": {}}]', 2, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (7, '2017-02-12 11:20:37.320399+05:30', '4', '4 | testuser4 |  |  | 444 | ', 1, '[{"added": {}}]', 7, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (8, '2017-02-12 11:20:54.093582+05:30', '3', 'testuser3', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 2, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (9, '2017-02-12 11:20:58.609501+05:30', '3', '3 | testuser3 | test | user3 | 333 | user3@test.com', 2, '[]', 7, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (10, '2017-02-12 11:21:24.491844+05:30', '4', 'testuser4', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 2, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (11, '2017-02-12 11:21:26.250546+05:30', '4', '4 | testuser4 | test | user4 | 444 | user4@test.com', 2, '[]', 7, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (12, '2017-02-12 11:23:59.181379+05:30', '1', 'testuser2 | 222444 | s | 20200 | 2017-02-12 05:53:59.179574+00:00 | 2017-02-12 05:53:59.179602+00:00', 1, '[{"added": {}}]', 8, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (13, '2017-02-12 11:24:22.115801+05:30', '2', 'testuser3 | 333666 | s | 30300 | 2017-02-12 05:54:22.113412+00:00 | 2017-02-12 05:54:22.113440+00:00', 1, '[{"added": {}}]', 8, 1);
INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES (14, '2017-02-12 11:24:52.802052+05:30', '3', 'testuser4 | 444888 | c | 40400 | 2017-02-12 05:54:52.800477+00:00 | 2017-02-12 05:54:52.800503+00:00', 1, '[{"added": {}}]', 8, 1);


--
-- TOC entry 2600 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"django_admin_log_id_seq"', 14, true);


--
-- TOC entry 2562 (class 0 OID 25861)
-- Dependencies: 199
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
-- TOC entry 2601 (class 0 OID 0)
-- Dependencies: 200
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"django_content_type_id_seq"', 10, true);


--
-- TOC entry 2564 (class 0 OID 25866)
-- Dependencies: 201
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (1, 'contenttypes', '0001_initial', '2017-02-12 11:16:12.025322+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (2, 'auth', '0001_initial', '2017-02-12 11:16:12.733708+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (3, 'admin', '0001_initial', '2017-02-12 11:16:12.887084+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2017-02-12 11:16:12.929076+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2017-02-12 11:16:12.980937+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2017-02-12 11:16:13.020414+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (7, 'auth', '0003_alter_user_email_max_length', '2017-02-12 11:16:13.058048+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (8, 'auth', '0004_alter_user_username_opts', '2017-02-12 11:16:13.083097+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (9, 'auth', '0005_alter_user_last_login_null', '2017-02-12 11:16:13.120257+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (10, 'auth', '0006_require_contenttypes_0002', '2017-02-12 11:16:13.134609+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2017-02-12 11:16:13.158224+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (12, 'auth', '0008_alter_user_username_max_length', '2017-02-12 11:16:13.224302+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (13, 'fund_transfer', '0001_initial', '2017-02-12 11:16:13.549661+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (14, 'sessions', '0001_initial', '2017-02-12 11:16:13.695404+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (15, 'fund_transfer', '0002_auto_20170307_1735', '2017-03-07 23:07:08.478446+05:30');
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES (16, 'fund_transfer', '0003_auto_20170307_1736', '2017-03-07 23:07:08.498938+05:30');


--
-- TOC entry 2602 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"django_migrations_id_seq"', 16, true);


--
-- TOC entry 2566 (class 0 OID 25874)
-- Dependencies: 203
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "django_session" ("session_key", "session_data", "expire_date") VALUES ('f5z1a2h404e2s7nyc9655s3fmahut4tl', 'MmI3ZjkxMzkzMmMzZDMzZjZkMmM3YTcxNDhlNzJiMjJiYWY4ZDViMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMGFiNDNkZGNkZGYzOTM2NjJlZjI4MmFiZjA2MTg0YzkxYTY1NDE0In0=', '2017-02-26 11:34:00.261781+05:30');
INSERT INTO "django_session" ("session_key", "session_data", "expire_date") VALUES ('y2ixnz48lpsv4ecqm9m6d13h2i18keko', 'YWYyYmM2MGIxYzk1ZDdiZjU4ZDUxZDE5M2FmOWE1NzI4Njk4ZDI0NDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMmU4Mjc2MTJlZmE5Yzk0MTc4OTkxNWM3Nzk5YjBlMTk3NGZlYTUzIn0=', '2017-03-19 21:19:44.608715+05:30');
INSERT INTO "django_session" ("session_key", "session_data", "expire_date") VALUES ('wid0igatzxnd77yhjf1gydby0g0yszza', 'YWYyYmM2MGIxYzk1ZDdiZjU4ZDUxZDE5M2FmOWE1NzI4Njk4ZDI0NDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMmU4Mjc2MTJlZmE5Yzk0MTc4OTkxNWM3Nzk5YjBlMTk3NGZlYTUzIn0=', '2017-03-25 12:50:06.944051+05:30');


--
-- TOC entry 2567 (class 0 OID 25880)
-- Dependencies: 204
-- Data for Name: fund_transfer_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "fund_transfer_customer" ("user_id", "phone", "created_on", "updated_on") VALUES (2, '222', '2017-02-12 11:19:48.755885+05:30', '2017-02-12 11:19:48.755906+05:30');
INSERT INTO "fund_transfer_customer" ("user_id", "phone", "created_on", "updated_on") VALUES (3, '333', '2017-02-12 11:20:08.846775+05:30', '2017-02-12 11:20:58.60858+05:30');
INSERT INTO "fund_transfer_customer" ("user_id", "phone", "created_on", "updated_on") VALUES (4, '444', '2017-02-12 11:20:37.319885+05:30', '2017-02-12 11:21:26.249626+05:30');


--
-- TOC entry 2568 (class 0 OID 25883)
-- Dependencies: 205
-- Data for Name: fund_transfer_customeraccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "fund_transfer_customeraccount" ("id", "account_number", "account_type", "balance", "created_on", "updated_on", "customer_id") VALUES (1, '222444', 's', 20200.00, '2017-02-12 11:23:59.179574+05:30', '2017-02-12 11:23:59.179602+05:30', 2);
INSERT INTO "fund_transfer_customeraccount" ("id", "account_number", "account_type", "balance", "created_on", "updated_on", "customer_id") VALUES (2, '333666', 's', 30300.00, '2017-02-12 11:24:22.113412+05:30', '2017-02-12 11:24:22.11344+05:30', 3);
INSERT INTO "fund_transfer_customeraccount" ("id", "account_number", "account_type", "balance", "created_on", "updated_on", "customer_id") VALUES (3, '444888', 'c', 40400.00, '2017-02-12 11:24:52.800477+05:30', '2017-02-12 11:24:52.800503+05:30', 4);


--
-- TOC entry 2603 (class 0 OID 0)
-- Dependencies: 206
-- Name: fund_transfer_customeraccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"fund_transfer_customeraccount_id_seq"', 3, true);


--
-- TOC entry 2570 (class 0 OID 25888)
-- Dependencies: 207
-- Data for Name: fund_transfer_fundtransfer; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2604 (class 0 OID 0)
-- Dependencies: 208
-- Name: fund_transfer_fundtransfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"fund_transfer_fundtransfer_id_seq"', 1, false);


--
-- TOC entry 2572 (class 0 OID 25893)
-- Dependencies: 209
-- Data for Name: fund_transfer_payee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (1, 'TEST-USER-3', 'T3', '333666', 'sa', '1234', 'POC Bank', 'Chennai', 'Branch X', '2017-02-12 11:27:17.236875+05:30', '2017-02-12 11:27:17.236899+05:30', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (2, 'TEST-USER-4', 'T4', '444888', 'ca', '1234', 'POC Bank', 'Chennai', 'Branch X', '2017-02-12 11:28:07.465981+05:30', '2017-02-12 11:28:07.466004+05:30', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (5, 'TEST-USER-5', 'T5', '555000', 'sa', '1234', 'POC Bank', 'Chennai', 'Branch X', '2017-03-06 06:48:02.401575+05:30', '2017-03-06 06:48:02.401597+05:30', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (6, 'TEST-USER-6', 'T6', '666333', 'sa', '1234', 'POC Bank', 'Chennai', 'Branch X', '2017-03-06 21:23:32.798538+05:30', '2017-03-06 21:23:32.798557+05:30', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (7, 'Another-Bank-User-3', 'ABS3', '777666', 'cc', '4321', 'Another Bank', 'Mumbai', 'Branch 1', '2017-03-06 21:31:57.4382+05:30', '2017-03-06 21:31:57.438225+05:30', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (3, 'Another-Bank-User-1', 'ABS1', '999888', 'sa', '4321', 'Another Bank', 'Mumbai', 'Branch 1', '2017-02-12 11:29:30.989238+05:30', '2017-02-12 11:29:30.989261+05:30', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (8, 'Another-Bank-User-4', 'ABS4', '666555', 'cc', '4321', 'Another Bank', 'Mumbai', 'Branch 1', '2017-03-08 19:26:17.511798+05:30', '2017-03-08 19:26:17.511816+05:30', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (4, 'Another-Bank-User-2', 'ABS2', '888777', 'ca', '4321', 'Another Bank', 'Mumbai', 'Branch 1', '2017-02-12 11:30:26.336826+05:30', '2017-02-12 11:30:26.336849+05:30', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (9, 'TEST-USER-7', 'T7', '777444', 'ca', '1234', 'POC Bank', 'Chennai', 'Branch X', '2017-03-08 19:28:32.942426+05:30', '2017-03-08 19:28:32.942444+05:30', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (10, 'TEST-USER-8', 'T8', '888555', 'cc', '1234', 'POC Bank', 'Chennai', 'Branch X', '2017-03-10 21:36:39.381929+05:30', '2017-03-10 21:36:39.381948+05:30', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (11, 'Another-Bank-User-5', 'ABS5', '555444', 'ca', '4321', 'Another Bank', 'Mumbai', 'Branch 1', '2017-03-10 21:37:52.193879+05:30', '2017-03-10 21:37:52.193902+05:30', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (12, 'Another-Bank-User-6', 'ABS6', '444333', 'sa', '4321', 'Another Bank', 'Mumbai', 'Branch 1', '2017-03-11 10:24:22.232331+05:30', '2017-03-11 10:24:22.232349+05:30', 2);
INSERT INTO "fund_transfer_payee" ("id", "name", "nickname", "account_number", "account_type", "bank_code", "bank_name", "bank_city", "bank_branch", "created_on", "updated_on", "customer_id") VALUES (13, 'TEST-USER-9', 'T9', '999555', 'sa', '1234', 'POC Bank', 'Chennai', 'Branch X', '2017-03-11 10:25:11.284867+05:30', '2017-03-11 10:25:11.284886+05:30', 2);


--
-- TOC entry 2605 (class 0 OID 0)
-- Dependencies: 210
-- Name: fund_transfer_payee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"fund_transfer_payee_id_seq"', 13, true);


--
-- TOC entry 2360 (class 2606 OID 25911)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group"
    ADD CONSTRAINT "auth_group_name_key" UNIQUE ("name");


--
-- TOC entry 2366 (class 2606 OID 25913)
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_group_id_0cd325b0_uniq" UNIQUE ("group_id", "permission_id");


--
-- TOC entry 2368 (class 2606 OID 25915)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2362 (class 2606 OID 25917)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group"
    ADD CONSTRAINT "auth_group_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2371 (class 2606 OID 25919)
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_permission"
    ADD CONSTRAINT "auth_permission_content_type_id_01ab375a_uniq" UNIQUE ("content_type_id", "codename");


--
-- TOC entry 2373 (class 2606 OID 25921)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_permission"
    ADD CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2382 (class 2606 OID 25923)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2384 (class 2606 OID 25925)
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_user_id_94350c0c_uniq" UNIQUE ("user_id", "group_id");


--
-- TOC entry 2375 (class 2606 OID 25927)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user"
    ADD CONSTRAINT "auth_user_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2388 (class 2606 OID 25929)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permissions_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2390 (class 2606 OID 25931)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permissions_user_id_14a6b632_uniq" UNIQUE ("user_id", "permission_id");


--
-- TOC entry 2378 (class 2606 OID 25933)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user"
    ADD CONSTRAINT "auth_user_username_key" UNIQUE ("username");


--
-- TOC entry 2394 (class 2606 OID 25935)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_admin_log"
    ADD CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2396 (class 2606 OID 25937)
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_content_type"
    ADD CONSTRAINT "django_content_type_app_label_76bd3d3b_uniq" UNIQUE ("app_label", "model");


--
-- TOC entry 2398 (class 2606 OID 25939)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_content_type"
    ADD CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2400 (class 2606 OID 25941)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_migrations"
    ADD CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2403 (class 2606 OID 25943)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_session"
    ADD CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key");


--
-- TOC entry 2406 (class 2606 OID 25945)
-- Name: fund_transfer_customer fund_transfer_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_customer"
    ADD CONSTRAINT "fund_transfer_customer_pkey" PRIMARY KEY ("user_id");


--
-- TOC entry 2409 (class 2606 OID 25947)
-- Name: fund_transfer_customeraccount fund_transfer_customeraccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_customeraccount"
    ADD CONSTRAINT "fund_transfer_customeraccount_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2413 (class 2606 OID 25949)
-- Name: fund_transfer_fundtransfer fund_transfer_fundtransfer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_fundtransfer"
    ADD CONSTRAINT "fund_transfer_fundtransfer_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2416 (class 2606 OID 25951)
-- Name: fund_transfer_payee fund_transfer_payee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_payee"
    ADD CONSTRAINT "fund_transfer_payee_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2358 (class 1259 OID 25952)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_group_name_a6ea08ec_like" ON "auth_group" USING "btree" ("name" "varchar_pattern_ops");


--
-- TOC entry 2363 (class 1259 OID 25953)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_group_permissions_0e939a4f" ON "auth_group_permissions" USING "btree" ("group_id");


--
-- TOC entry 2364 (class 1259 OID 25954)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_group_permissions_8373b171" ON "auth_group_permissions" USING "btree" ("permission_id");


--
-- TOC entry 2369 (class 1259 OID 25955)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_permission_417f1b1c" ON "auth_permission" USING "btree" ("content_type_id");


--
-- TOC entry 2379 (class 1259 OID 25956)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_user_groups_0e939a4f" ON "auth_user_groups" USING "btree" ("group_id");


--
-- TOC entry 2380 (class 1259 OID 25957)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_user_groups_e8701ad4" ON "auth_user_groups" USING "btree" ("user_id");


--
-- TOC entry 2385 (class 1259 OID 25958)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_user_user_permissions_8373b171" ON "auth_user_user_permissions" USING "btree" ("permission_id");


--
-- TOC entry 2386 (class 1259 OID 25959)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_user_user_permissions_e8701ad4" ON "auth_user_user_permissions" USING "btree" ("user_id");


--
-- TOC entry 2376 (class 1259 OID 25960)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_user_username_6821ab7c_like" ON "auth_user" USING "btree" ("username" "varchar_pattern_ops");


--
-- TOC entry 2391 (class 1259 OID 25961)
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_admin_log_417f1b1c" ON "django_admin_log" USING "btree" ("content_type_id");


--
-- TOC entry 2392 (class 1259 OID 25962)
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_admin_log_e8701ad4" ON "django_admin_log" USING "btree" ("user_id");


--
-- TOC entry 2401 (class 1259 OID 25963)
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_session_de54fa62" ON "django_session" USING "btree" ("expire_date");


--
-- TOC entry 2404 (class 1259 OID 25964)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_session_session_key_c0390e0f_like" ON "django_session" USING "btree" ("session_key" "varchar_pattern_ops");


--
-- TOC entry 2407 (class 1259 OID 25965)
-- Name: fund_transfer_customeraccount_cb24373b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fund_transfer_customeraccount_cb24373b" ON "fund_transfer_customeraccount" USING "btree" ("customer_id");


--
-- TOC entry 2410 (class 1259 OID 25966)
-- Name: fund_transfer_fundtransfer_2737f573; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fund_transfer_fundtransfer_2737f573" ON "fund_transfer_fundtransfer" USING "btree" ("customer_account_id");


--
-- TOC entry 2411 (class 1259 OID 25967)
-- Name: fund_transfer_fundtransfer_afff1bcc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fund_transfer_fundtransfer_afff1bcc" ON "fund_transfer_fundtransfer" USING "btree" ("payee_id");


--
-- TOC entry 2414 (class 1259 OID 25968)
-- Name: fund_transfer_payee_cb24373b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fund_transfer_payee_cb24373b" ON "fund_transfer_payee" USING "btree" ("customer_id");


--
-- TOC entry 2417 (class 2606 OID 25969)
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group_permissions"
    ADD CONSTRAINT "auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id" FOREIGN KEY ("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2418 (class 2606 OID 25974)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2419 (class 2606 OID 25979)
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_permission"
    ADD CONSTRAINT "auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2420 (class 2606 OID 25984)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2421 (class 2606 OID 25989)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2422 (class 2606 OID 25994)
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id" FOREIGN KEY ("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2423 (class 2606 OID 25999)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2428 (class 2606 OID 26004)
-- Name: fund_transfer_fundtransfer cfab8ed1af581959029e30660bd0f5f5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_fundtransfer"
    ADD CONSTRAINT "cfab8ed1af581959029e30660bd0f5f5" FOREIGN KEY ("customer_account_id") REFERENCES "fund_transfer_customeraccount"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2424 (class 2606 OID 26009)
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_admin_log"
    ADD CONSTRAINT "django_admin_content_type_id_c4bce8eb_fk_django_content_type_id" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2425 (class 2606 OID 26014)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "django_admin_log"
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2430 (class 2606 OID 26019)
-- Name: fund_transfer_payee fund_tra_customer_id_17c50942_fk_fund_transfer_customer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_payee"
    ADD CONSTRAINT "fund_tra_customer_id_17c50942_fk_fund_transfer_customer_user_id" FOREIGN KEY ("customer_id") REFERENCES "fund_transfer_customer"("user_id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2427 (class 2606 OID 26024)
-- Name: fund_transfer_customeraccount fund_tra_customer_id_2e77ff8e_fk_fund_transfer_customer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_customeraccount"
    ADD CONSTRAINT "fund_tra_customer_id_2e77ff8e_fk_fund_transfer_customer_user_id" FOREIGN KEY ("customer_id") REFERENCES "fund_transfer_customer"("user_id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2426 (class 2606 OID 26029)
-- Name: fund_transfer_customer fund_transfer_customer_user_id_72cf02ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_customer"
    ADD CONSTRAINT "fund_transfer_customer_user_id_72cf02ab_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2429 (class 2606 OID 26034)
-- Name: fund_transfer_fundtransfer fund_transfer_fundt_payee_id_0309f5dc_fk_fund_transfer_payee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "fund_transfer_fundtransfer"
    ADD CONSTRAINT "fund_transfer_fundt_payee_id_0309f5dc_fk_fund_transfer_payee_id" FOREIGN KEY ("payee_id") REFERENCES "fund_transfer_payee"("id") DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2017-03-11 13:08:43 IST

--
-- PostgreSQL database dump complete
--

