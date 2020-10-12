--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.0

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO postgres;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_clockedschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO postgres;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_crontabschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO postgres;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_intervalschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO postgres;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_periodictask_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_solarschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: exchange_exchangebackend; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exchange_exchangebackend (
    name character varying(255) NOT NULL,
    last_update timestamp with time zone NOT NULL,
    base_currency character varying(3) NOT NULL
);


ALTER TABLE public.exchange_exchangebackend OWNER TO postgres;

--
-- Name: exchange_rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exchange_rate (
    id integer NOT NULL,
    currency character varying(3) NOT NULL,
    value numeric(20,6) NOT NULL,
    backend_id character varying(255) NOT NULL
);


ALTER TABLE public.exchange_rate OWNER TO postgres;

--
-- Name: exchange_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exchange_rate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exchange_rate_id_seq OWNER TO postgres;

--
-- Name: exchange_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exchange_rate_id_seq OWNED BY public.exchange_rate.id;


--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id bigint,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    source_refresh_token_id bigint
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_accesstoken_id_seq OWNED BY public.oauth2_provider_accesstoken.id;


--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_application (
    id bigint NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id bigint,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_application_id_seq OWNED BY public.oauth2_provider_application.id;


--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    code_challenge character varying(128) NOT NULL,
    code_challenge_method character varying(10) NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_grant_id_seq OWNED BY public.oauth2_provider_grant.id;


--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint,
    application_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    revoked timestamp with time zone
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth2_provider_refreshtoken_id_seq OWNED BY public.oauth2_provider_refreshtoken.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_product (
    id bigint NOT NULL,
    name character varying(500) NOT NULL,
    description text NOT NULL,
    original_price_currency character varying(3) NOT NULL,
    original_price numeric(14,2) NOT NULL,
    current_price_currency character varying(3) NOT NULL,
    current_price numeric(14,2) NOT NULL
);


ALTER TABLE public.products_product OWNER TO postgres;

--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    email character varying(30) NOT NULL,
    contact_number character varying(128),
    first_name character varying(50),
    last_name character varying(50),
    date_of_birth date,
    avatar character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    is_admin boolean NOT NULL,
    is_superuser boolean NOT NULL,
    is_email_verified boolean NOT NULL,
    is_customer boolean NOT NULL,
    is_seller boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.users_user OWNER TO postgres;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_beat_clockedschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);


--
-- Name: django_celery_beat_solarschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: exchange_rate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange_rate ALTER COLUMN id SET DEFAULT nextval('public.exchange_rate_id_seq'::regclass);


--
-- Name: oauth2_provider_accesstoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass);


--
-- Name: oauth2_provider_application id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass);


--
-- Name: oauth2_provider_grant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass);


--
-- Name: oauth2_provider_refreshtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
1	test-group
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	96
2	1	97
3	1	98
4	1	99
5	1	100
6	1	51
7	1	52
8	1	56
9	1	88
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add content type	3	add_contenttype
10	Can change content type	3	change_contenttype
11	Can delete content type	3	delete_contenttype
12	Can view content type	3	view_contenttype
13	Can add session	4	add_session
14	Can change session	4	change_session
15	Can delete session	4	delete_session
16	Can view session	4	view_session
17	Can add site	5	add_site
18	Can change site	5	change_site
19	Can delete site	5	delete_site
20	Can view site	5	view_site
21	Can add log entry	6	add_logentry
22	Can change log entry	6	change_logentry
23	Can delete log entry	6	delete_logentry
24	Can view log entry	6	view_logentry
25	Can add crontab	7	add_crontabschedule
26	Can change crontab	7	change_crontabschedule
27	Can delete crontab	7	delete_crontabschedule
28	Can view crontab	7	view_crontabschedule
29	Can add interval	8	add_intervalschedule
30	Can change interval	8	change_intervalschedule
31	Can delete interval	8	delete_intervalschedule
32	Can view interval	8	view_intervalschedule
33	Can add periodic task	9	add_periodictask
34	Can change periodic task	9	change_periodictask
35	Can delete periodic task	9	delete_periodictask
36	Can view periodic task	9	view_periodictask
37	Can add periodic tasks	10	add_periodictasks
38	Can change periodic tasks	10	change_periodictasks
39	Can delete periodic tasks	10	delete_periodictasks
40	Can view periodic tasks	10	view_periodictasks
41	Can add solar event	11	add_solarschedule
42	Can change solar event	11	change_solarschedule
43	Can delete solar event	11	delete_solarschedule
44	Can view solar event	11	view_solarschedule
45	Can add clocked	12	add_clockedschedule
46	Can change clocked	12	change_clockedschedule
47	Can delete clocked	12	delete_clockedschedule
48	Can view clocked	12	view_clockedschedule
49	Can add application	13	add_application
50	Can change application	13	change_application
51	Can delete application	13	delete_application
52	Can view application	13	view_application
53	Can add access token	14	add_accesstoken
54	Can change access token	14	change_accesstoken
55	Can delete access token	14	delete_accesstoken
56	Can view access token	14	view_accesstoken
57	Can add grant	15	add_grant
58	Can change grant	15	change_grant
59	Can delete grant	15	delete_grant
60	Can view grant	15	view_grant
61	Can add refresh token	16	add_refreshtoken
62	Can change refresh token	16	change_refreshtoken
63	Can delete refresh token	16	delete_refreshtoken
64	Can view refresh token	16	view_refreshtoken
65	Can add association	17	add_association
66	Can change association	17	change_association
67	Can delete association	17	delete_association
68	Can view association	17	view_association
69	Can add code	18	add_code
70	Can change code	18	change_code
71	Can delete code	18	delete_code
72	Can view code	18	view_code
73	Can add nonce	19	add_nonce
74	Can change nonce	19	change_nonce
75	Can delete nonce	19	delete_nonce
76	Can view nonce	19	view_nonce
77	Can add user social auth	20	add_usersocialauth
78	Can change user social auth	20	change_usersocialauth
79	Can delete user social auth	20	delete_usersocialauth
80	Can view user social auth	20	view_usersocialauth
81	Can add partial	21	add_partial
82	Can change partial	21	change_partial
83	Can delete partial	21	delete_partial
84	Can view partial	21	view_partial
85	Can add user	22	add_user
86	Can change user	22	change_user
87	Can delete user	22	delete_user
88	Can view user	22	view_user
89	Can add exchange backend	23	add_exchangebackend
90	Can change exchange backend	23	change_exchangebackend
91	Can delete exchange backend	23	delete_exchangebackend
92	Can view exchange backend	23	view_exchangebackend
93	Can add rate	24	add_rate
94	Can change rate	24	change_rate
95	Can delete rate	24	delete_rate
96	Can view rate	24	view_rate
97	Can add product	25	add_product
98	Can change product	25	change_product
99	Can delete product	25	delete_product
100	Can view product	25	view_product
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-10-06 18:25:53.374646+05:30	1	e-commerce-application	1	[{"added": {}}]	13	1
2	2020-10-06 18:28:41.291096+05:30	1	FfJw0wdzOgKzShBvfgzPaRsTNLrt9d	2	[{"changed": {"fields": ["Revoked"]}}]	16	1
3	2020-10-06 18:29:22.429867+05:30	1	7OzUBDKdvQczb0n6ug4a3NFFPqPBZT	2	[{"changed": {"fields": ["Expires"]}}]	14	1
4	2020-10-06 18:29:47.455998+05:30	1	FfJw0wdzOgKzShBvfgzPaRsTNLrt9d	2	[{"changed": {"fields": ["Revoked"]}}]	16	1
5	2020-10-06 18:52:19.997029+05:30	1	7OzUBDKdvQczb0n6ug4a3NFFPqPBZT	2	[]	14	1
6	2020-10-10 02:53:14.994983+05:30	1	Product object (1)	1	[{"added": {}}]	25	1
7	2020-10-10 02:54:36.612434+05:30	1	Product object (1)	2	[]	25	1
8	2020-10-10 02:57:04.692129+05:30	98	tejpratapsingh545@gmail.com5	1	[{"added": {}}]	22	1
9	2020-10-10 02:58:43.19134+05:30	1	test-group	1	[{"added": {}}]	2	1
10	2020-10-10 03:14:21.821245+05:30	1	Product object (1)	3		25	1
11	2020-10-10 03:32:28.925332+05:30	1	* * * * * (m/h/d/dM/MY) UTC	1	[{"added": {}}]	7	1
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time, enabled) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
1	*	*	*	*	*	UTC
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
1	2020-10-10 03:32:28.765679+05:30
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	sites	site
6	admin	logentry
7	django_celery_beat	crontabschedule
8	django_celery_beat	intervalschedule
9	django_celery_beat	periodictask
10	django_celery_beat	periodictasks
11	django_celery_beat	solarschedule
12	django_celery_beat	clockedschedule
13	oauth2_provider	application
14	oauth2_provider	accesstoken
15	oauth2_provider	grant
16	oauth2_provider	refreshtoken
17	social_django	association
18	social_django	code
19	social_django	nonce
20	social_django	usersocialauth
21	social_django	partial
22	users	user
23	exchange	exchangebackend
24	exchange	rate
25	products	product
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-10-06 18:04:53.393892+05:30
2	contenttypes	0002_remove_content_type_name	2020-10-06 18:04:53.412898+05:30
3	auth	0001_initial	2020-10-06 18:04:53.44459+05:30
4	auth	0002_alter_permission_name_max_length	2020-10-06 18:04:53.469236+05:30
5	auth	0003_alter_user_email_max_length	2020-10-06 18:04:53.474322+05:30
6	auth	0004_alter_user_username_opts	2020-10-06 18:04:53.480442+05:30
7	auth	0005_alter_user_last_login_null	2020-10-06 18:04:53.487781+05:30
8	auth	0006_require_contenttypes_0002	2020-10-06 18:04:53.489476+05:30
9	auth	0007_alter_validators_add_error_messages	2020-10-06 18:04:53.499832+05:30
10	auth	0008_alter_user_username_max_length	2020-10-06 18:04:53.508893+05:30
11	auth	0009_alter_user_last_name_max_length	2020-10-06 18:04:53.51455+05:30
12	auth	0010_alter_group_name_max_length	2020-10-06 18:04:53.520238+05:30
13	auth	0011_update_proxy_permissions	2020-10-06 18:04:53.525257+05:30
14	auth	0012_alter_user_first_name_max_length	2020-10-06 18:04:53.534956+05:30
15	users	0001_create_user_model	2020-10-06 18:04:53.597508+05:30
16	admin	0001_initial	2020-10-06 18:04:53.637333+05:30
17	admin	0002_logentry_remove_auto_add	2020-10-06 18:04:53.654547+05:30
18	admin	0003_logentry_add_action_flag_choices	2020-10-06 18:04:53.662896+05:30
19	django_celery_beat	0001_initial	2020-10-06 18:04:53.69299+05:30
20	django_celery_beat	0002_auto_20161118_0346	2020-10-06 18:04:53.71832+05:30
21	django_celery_beat	0003_auto_20161209_0049	2020-10-06 18:04:53.728711+05:30
22	django_celery_beat	0004_auto_20170221_0000	2020-10-06 18:04:53.732858+05:30
23	django_celery_beat	0005_add_solarschedule_events_choices	2020-10-06 18:04:53.736567+05:30
24	django_celery_beat	0006_auto_20180322_0932	2020-10-06 18:04:53.756035+05:30
25	django_celery_beat	0007_auto_20180521_0826	2020-10-06 18:04:53.765976+05:30
26	django_celery_beat	0008_auto_20180914_1922	2020-10-06 18:04:53.779481+05:30
27	django_celery_beat	0006_auto_20180210_1226	2020-10-06 18:04:53.788179+05:30
28	django_celery_beat	0006_periodictask_priority	2020-10-06 18:04:53.793397+05:30
29	django_celery_beat	0009_periodictask_headers	2020-10-06 18:04:53.798996+05:30
30	django_celery_beat	0010_auto_20190429_0326	2020-10-06 18:04:54.012126+05:30
31	django_celery_beat	0011_auto_20190508_0153	2020-10-06 18:04:54.022418+05:30
32	django_celery_beat	0012_periodictask_expire_seconds	2020-10-06 18:04:54.03068+05:30
33	oauth2_provider	0001_initial	2020-10-06 18:04:54.106981+05:30
34	oauth2_provider	0002_auto_20190406_1805	2020-10-06 18:04:54.32848+05:30
35	sessions	0001_initial	2020-10-06 18:04:54.334181+05:30
36	sites	0001_initial	2020-10-06 18:04:54.395464+05:30
37	sites	0002_alter_domain_unique	2020-10-06 18:04:54.462447+05:30
38	default	0001_initial	2020-10-06 18:04:54.535691+05:30
39	social_auth	0001_initial	2020-10-06 18:04:54.53673+05:30
40	default	0002_add_related_name	2020-10-06 18:04:54.559724+05:30
41	social_auth	0002_add_related_name	2020-10-06 18:04:54.561592+05:30
42	default	0003_alter_email_max_length	2020-10-06 18:04:54.567896+05:30
43	social_auth	0003_alter_email_max_length	2020-10-06 18:04:54.569547+05:30
44	default	0004_auto_20160423_0400	2020-10-06 18:04:54.58479+05:30
45	social_auth	0004_auto_20160423_0400	2020-10-06 18:04:54.586143+05:30
46	social_auth	0005_auto_20160727_2333	2020-10-06 18:04:54.650647+05:30
47	social_django	0006_partial	2020-10-06 18:04:54.660972+05:30
48	social_django	0007_code_timestamp	2020-10-06 18:04:54.675095+05:30
49	social_django	0008_partial_timestamp	2020-10-06 18:04:54.683105+05:30
50	social_django	0009_auto_20191118_0520	2020-10-06 18:04:54.717318+05:30
51	social_django	0010_uid_db_index	2020-10-06 18:04:54.732456+05:30
52	social_django	0004_auto_20160423_0400	2020-10-06 18:04:54.736841+05:30
53	social_django	0002_add_related_name	2020-10-06 18:04:54.738172+05:30
54	social_django	0003_alter_email_max_length	2020-10-06 18:04:54.739228+05:30
55	social_django	0001_initial	2020-10-06 18:04:54.740623+05:30
56	social_django	0005_auto_20160727_2333	2020-10-06 18:04:54.741758+05:30
57	users	0002_alter_contact_field	2020-10-07 14:16:03.675165+05:30
58	exchange	0001_initial	2020-10-09 23:02:42.78208+05:30
59	products	0001_initial	2020-10-10 02:50:24.233105+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: exchange_exchangebackend; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exchange_exchangebackend (name, last_update, base_currency) FROM stdin;
openexchangerates.org	2020-10-10 03:16:07.329431+05:30	USD
\.


--
-- Data for Name: exchange_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exchange_rate (id, currency, value, backend_id) FROM stdin;
6	CZK	25.670833	openexchangerates.org
7	EUR	0.949713	openexchangerates.org
8	INR	67.956337	openexchangerates.org
9	NOK	8.635580	openexchangerates.org
10	SEK	9.100513	openexchangerates.org
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated, source_refresh_token_id) FROM stdin;
3	BhWYHd6SwtBUaezGvQEO8Ccfc8goKS	2020-10-08 00:53:25.349415+05:30	read write	1	1	2020-10-07 14:53:25.351321+05:30	2020-10-07 14:53:25.351364+05:30	\N
5	G2MRHLiicehm0SElHpKnMcLZjQijHs	2020-10-08 01:07:31.99916+05:30	read write	1	1	2020-10-07 15:07:32.50686+05:30	2020-10-07 15:07:32.506902+05:30	4
6	1pdV9tIsRaP3sOPAxI4J4FT0reYJvK	2020-10-08 03:49:52.27335+05:30	read write	1	1	2020-10-07 17:49:52.288587+05:30	2020-10-07 17:49:52.288641+05:30	\N
7	9eBnBHd8mHxrnZdX2xbHViRP1OL6Tq	2020-10-08 03:51:17.576689+05:30	read write	1	1	2020-10-07 17:51:17.578313+05:30	2020-10-07 17:51:17.578353+05:30	\N
9	3p6LtHlD3EFtWs0RwAkTdiWedHGAw9	2020-10-08 04:10:30.48656+05:30	read write	1	1	2020-10-07 18:10:30.492422+05:30	2020-10-07 18:10:30.492515+05:30	\N
11	MlYdMQAdfCj6MS75DftYSsDIJr5YLl	2020-10-08 04:30:05.975998+05:30	read write	1	1	2020-10-07 18:30:06.358007+05:30	2020-10-07 18:30:06.358049+05:30	10
13	nt6SRKMcicDLGT4Lw1nnYl6oG32IOV	2020-10-08 06:17:06.845681+05:30	read write	1	1	2020-10-07 20:17:06.847093+05:30	2020-10-07 20:17:06.847133+05:30	\N
14	6asVQfAqKGgYsVhU6dqZBG8wOo9B1w	2020-10-08 06:17:27.592699+05:30	read write	1	1	2020-10-07 20:17:27.593699+05:30	2020-10-07 20:17:27.593737+05:30	\N
16	2lKBrKjBC5WiL3d30FfqJkHiMKsDem	2020-10-08 06:42:58.044215+05:30	read write	1	1	2020-10-07 20:42:58.503023+05:30	2020-10-07 20:42:58.503066+05:30	15
17	nlX6W6qOsSppX56DLGaHQIl1v9r0uH	2020-10-08 07:24:37.335972+05:30	read write	1	1	2020-10-07 21:24:37.33765+05:30	2020-10-07 21:24:37.337694+05:30	\N
18	fXNn3Wq4cJUJyy0Fmd0OMD4LynydEp	2020-10-08 07:26:28.800888+05:30	read write	1	1	2020-10-07 21:26:28.802782+05:30	2020-10-07 21:26:28.802825+05:30	\N
20	axMJNMRSByWTkoncp2vi33gOt6dAjb	2020-10-08 09:09:58.856987+05:30	read write	1	1	2020-10-07 23:09:59.34625+05:30	2020-10-07 23:09:59.346293+05:30	19
21	84oVovvGQjsc5BLwbUtIe8n0WmEiDN	2020-10-08 09:17:15.2646+05:30	read write	1	1	2020-10-07 23:17:15.267301+05:30	2020-10-07 23:17:15.267416+05:30	\N
23	6tv9ZRSw53eysLITFhYWoff2QcHyqC	2020-10-08 14:36:26.023787+05:30	read write	1	1	2020-10-08 04:36:26.421575+05:30	2020-10-08 04:36:26.421614+05:30	22
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
1	0XeYvuJLfNkT6VwLQMMb587Fq2sBTmBaBavAohr0		confidential	password	GQvlGwUTCAQMWp4m5iPeUpaHwrZXZbdjz66B463qA0yDNpvdevdgpxGJZ0HwXNz6n8yuX5ZcKZfPHNlEVE5GNDR7x61TmzlKi4smYad1g30FROHWYrjJzTRwI7qEng8A	e-commerce-application	1	f	2020-10-06 18:25:53.333116+05:30	2020-10-06 18:25:53.333164+05:30
2	MFWWyxuaTyJPgAhNDGsdigYaAYZqUUHk3i2Cqg9p			Resource owner password-based	cQ3r9eYcNUIPOgVUctLnBsk2UXIOCNzhWXSfeppHoMUF5tXG49TX0CEAm3bo45A0zIdRDj3PKmgBNi2ct6i1cqtfTv9OwLWN18kRJfadCwb9mLLAhmTzx4HsJJ16h5sh	Kenneth Woods	93	f	2020-10-08 01:07:11.702829+05:30	2020-10-08 01:07:11.702858+05:30
3	HdyaqscDXDaRMfrBmvVJvFNFQjvRA4E0xI3NffD1		confidential	Resource owner password-based	WQ4wE9GKNG6xEh9W42wfnrE3Y1btMyVmHrkLh2La5QChNy6Po6OuZm3NhFLmfheYBLtykNonLhdNWl77zvl4GXqnkcsYlcwx9hOB2Bt10T8fvY03qow10zdev5xMybbL	Erika Sanchez	94	f	2020-10-08 03:03:01.787343+05:30	2020-10-08 03:03:01.787361+05:30
4	pJgLo6V8Ia4MhFt8vhpJMmMJIZQVe9sNDrkhrfqq		confidential	3	HCsLMUbB3T9EmrIDdnDjVhKAhigWIjGrI1XNLsCsKc4g4Qw9T5ZAUSZvgdZsu39Z9Q66JJkt9LrAPg1fX5cdSZ8p1UG2ca13e1znmdeiJtye0K9gTCj1WTtUiFmQWUQo	David Richmond	95	f	2020-10-08 03:04:55.826199+05:30	2020-10-08 03:04:55.826218+05:30
5	PnLHzWDLaCWg9B2WGGgV6veSb2nxZGTTeZRwIsdA		confidential	Resource owner password-based	YenyZdacnjVjQto4LdL0Qz2HQjWl6hjqsyY78kgNkMayhj34wGZ6tvmewKRAkEaj2vo7GNf8ilVL1XRtwek0jgE2EnoVXzsPdVPQ67sau9ylrVgHF7i0aaYQLY3XnYOX	Chad Smith	96	f	2020-10-08 03:06:17.977019+05:30	2020-10-08 03:06:17.977037+05:30
6	3SYdxKWR6yfaZ2wUeMf6uzwZGmBaFueD1KtmTasq		confidential	password	grVT96yck5I9SsfrYCzENGNb6leh7BDDwYcWLyeD4NPwI33YhCja3XkmGa3kXPorSpddLUO3dTWSl054Deesk42nItQepwROnCg6TlPiuxQm3rTOSW1SWHj6r1XjT5NU	Adam Davis	97	f	2020-10-08 03:08:42.732782+05:30	2020-10-08 03:08:42.7328+05:30
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated, code_challenge, code_challenge_method) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated, revoked) FROM stdin;
3	KaqNHimjkuRzXyXHE6H1RpfMGq3aTn	3	1	1	2020-10-07 14:53:25.490506+05:30	2020-10-07 14:53:25.490551+05:30	\N
1	FfJw0wdzOgKzShBvfgzPaRsTNLrt9d	\N	1	1	2020-10-06 18:26:37.558809+05:30	2020-10-06 18:29:47.41986+05:30	2020-10-05 18:28:33+05:30
2	mKgyiwq5TZEHmQ9lN4eh0NCKMGbSq0	\N	1	1	2020-10-06 18:52:32.698915+05:30	2020-10-06 18:52:32.698967+05:30	\N
4	tKp8XYPIwuqN0ld31MIg9CJ23Zt5x2	\N	1	1	2020-10-07 15:06:38.185866+05:30	2020-10-07 15:07:32.41398+05:30	2020-10-07 15:07:32.413534+05:30
5	ltY0UodZt8hb92pQSu9rxnz3QpKKgk	5	1	1	2020-10-07 15:07:32.545652+05:30	2020-10-07 15:07:32.545708+05:30	\N
6	kavkV3PqSMtAvnsKmU82h27SATgpSX	6	1	1	2020-10-07 17:49:52.343166+05:30	2020-10-07 17:49:52.343212+05:30	\N
7	IvSuOsa8o4j3ceK91h1n1tzYOLsCTB	7	1	1	2020-10-07 17:51:17.616968+05:30	2020-10-07 17:51:17.617016+05:30	\N
9	oBUccQzxwOYlNHAOUI8zN8vQIb1f1n	9	1	1	2020-10-07 18:10:30.72175+05:30	2020-10-07 18:10:30.721803+05:30	\N
10	pP4MOTq9W2w28lN0SI4iI2HL6NXddg	\N	1	1	2020-10-07 18:28:28.449522+05:30	2020-10-07 18:30:06.280226+05:30	2020-10-07 18:30:06.279894+05:30
11	TuVNeYnxj22nTEr7bULDmOjviCWBqh	11	1	1	2020-10-07 18:30:06.396989+05:30	2020-10-07 18:30:06.397039+05:30	\N
13	TEbMbSjNhbuSpGEDbEwfnaNg3ay1fg	13	1	1	2020-10-07 20:17:06.886306+05:30	2020-10-07 20:17:06.886353+05:30	\N
14	mMfnOlm9iyXc8TW3YT5YrSnrYYd1mM	14	1	1	2020-10-07 20:17:27.639569+05:30	2020-10-07 20:17:27.639696+05:30	\N
15	fxCKGHHLOfQVbFAdAsonrP1NRr7ENR	\N	1	1	2020-10-07 20:39:04.109683+05:30	2020-10-07 20:42:58.406788+05:30	2020-10-07 20:42:58.406311+05:30
16	1rTA3YNvyw1BvkFfS7gGXUuJFzQ7ta	16	1	1	2020-10-07 20:42:58.542421+05:30	2020-10-07 20:42:58.542469+05:30	\N
17	mGEmFCooKf0XcNwCYKQdnU2w4kZ3IP	17	1	1	2020-10-07 21:24:37.391175+05:30	2020-10-07 21:24:37.391225+05:30	\N
18	Aow7uut9VlDNagCQLoIxbioOgktMgY	18	1	1	2020-10-07 21:26:28.842068+05:30	2020-10-07 21:26:28.842113+05:30	\N
19	ZOYfMNl1SoOY4CJRucnCpM5mUbHLYv	\N	1	1	2020-10-07 21:47:53.231052+05:30	2020-10-07 23:09:59.271724+05:30	2020-10-07 23:09:59.271358+05:30
20	NQNesN2gezHBdHqA5IeDYFHoLERmWT	20	1	1	2020-10-07 23:09:59.389823+05:30	2020-10-07 23:09:59.389878+05:30	\N
21	uIKNaWkjNgO1Z6Ip3XrOxCCWoZ4iZt	21	1	1	2020-10-07 23:17:15.327328+05:30	2020-10-07 23:17:15.327375+05:30	\N
22	zMYktzVqq19PM1RrEedPU4Ky95xkIX	\N	1	1	2020-10-08 04:35:54.401431+05:30	2020-10-08 04:36:26.349765+05:30	2020-10-08 04:36:26.349498+05:30
23	iw0qHFCQVL0id5ylD7L33Msi5Y4xix	23	1	1	2020-10-08 04:36:26.458363+05:30	2020-10-08 04:36:26.458408+05:30	\N
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_product (id, name, description, original_price_currency, original_price, current_price_currency, current_price) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user (id, password, last_login, email, contact_number, first_name, last_name, date_of_birth, avatar, is_active, is_admin, is_superuser, is_email_verified, is_customer, is_seller, date_joined) FROM stdin;
87	argon2$argon2i$v=19$m=512,t=2,p=2$WFRuQ0dPWndSNWdF$ort0tc6uxhnXcmxBfpH/Jw	\N	oballard@gmail.com	(454)240-9955x624	Scott	Pitts	\N		t	f	f	f	f	f	2020-10-07 14:41:22.41724+05:30
2	argon2$argon2i$v=19$m=512,t=2,p=2$Z1M5bHRDd2hmcERq$lLP3YcBMC/r+QTYRCuA42g	\N	tejpratapsinsjsgh545@gmail.com	99359703033863	\N	\N	\N		t	t	t	f	f	f	2020-10-06 18:08:05.427302+05:30
1	argon2$argon2i$v=19$m=512,t=2,p=2$d3RONkVqdnFtdldk$NgqW2h8wb62mzgDiGGHBDg	2020-10-06 18:25:06.259383+05:30	tejpratapsingh545@gmail.com	9935973863	\N	\N	\N		t	t	t	f	f	f	2020-10-06 18:07:59.286384+05:30
35		\N	ysmith@newman.biz	22992929	Joseph Ray	\N	\N		t	f	f	f	f	f	2020-10-07 01:47:01.122218+05:30
37		\N	john03@gmail.com	8292929	Joseph Figueroa	\N	\N		t	f	f	f	f	f	2020-10-07 01:47:44.917897+05:30
39		\N	duanejackson@reed.com	292929299292929	George Henson	\N	\N		t	f	f	f	f	f	2020-10-07 01:49:19.133669+05:30
40		\N	jenniferberger@kane.com	4593995505	David Yates	\N	\N		t	f	f	f	f	f	2020-10-07 01:52:30.3304+05:30
41		\N	ysmith@brown.biz	(369)622-8647	Jessica Carter	\N	\N		t	f	f	f	f	f	2020-10-07 01:53:43.544696+05:30
42	kLn2Wy2w6D	\N	unewman@reyes.com	+1-459-401-1762	Tanya Melton	\N	\N		t	f	f	f	f	f	2020-10-07 02:01:59.949486+05:30
43	kLn2Wy2w6D	\N	garzamaria@gmail.com	+1-426-219-2924	Tara Dunn	\N	\N		t	f	f	f	f	f	2020-10-07 02:02:15.495602+05:30
44	argon2$argon2i$v=19$m=512,t=2,p=2$TXdtUEFZM0RkSk5K$j9PSZ7BAI/Rb8mgBZbHpEw	\N	leejared@gmail.com	142.345.0480	Karen Nash	\N	\N		t	f	f	f	f	f	2020-10-07 02:05:30.030391+05:30
45	argon2$argon2i$v=19$m=512,t=2,p=2$dWF2emE4QkRXem42$eTkYVpIQKgEP16GE7Bli4w	\N	carrcatherine@yahoo.com	(980)635-3466	Christopher	Oconnor	\N		t	f	f	f	f	f	2020-10-07 02:24:49.180803+05:30
46		\N	scott68@perry.org	976-065-8043	Jennifer	Smith	\N		t	f	f	f	f	f	2020-10-07 02:34:04.79622+05:30
47		\N	shawn72@gmail.com	+1-438-112-0335	Christopher	Hodges	\N		t	f	f	f	f	f	2020-10-07 02:34:53.570192+05:30
48		\N	ihammond@yahoo.com	441.848.1277	Kathryn	Kelley	\N		t	f	f	f	f	f	2020-10-07 02:35:34.807811+05:30
49		\N	reneechang@harris.org	2874805583	Amanda	Cross	\N		t	f	f	f	f	f	2020-10-07 02:39:56.599638+05:30
50		\N	stephenmills@hotmail.com	(608)368-5702	Matthew	Stevens	\N		t	f	f	f	f	f	2020-10-07 02:40:53.93997+05:30
51		\N	kathryntucker@sanders.com	639.096.7399	Todd	Burch	\N		t	f	f	f	f	f	2020-10-07 02:40:56.610511+05:30
52		\N	rojaseric@tucker.com	857.152.0136	Gloria	Simmons	\N		t	f	f	f	f	f	2020-10-07 02:40:58.475791+05:30
53		\N	estradashannon@yahoo.com	992-689-8043	Steve	Miller	\N		t	f	f	f	f	f	2020-10-07 02:41:04.210143+05:30
54		\N	smithsheri@gmail.com	0636079567	Sarah	Jones	\N		t	f	f	f	f	f	2020-10-07 02:41:09.943097+05:30
55		\N	anna16@king.com	7224036238	Nichole	Shaw	\N		t	f	f	f	f	f	2020-10-07 02:41:14.403641+05:30
56		\N	foxjulie@bishop.biz	(650)957-2966	Raymond	Liu	\N		t	f	f	f	f	f	2020-10-07 02:41:17.171842+05:30
57		\N	thomas66@yahoo.com	925.951.2035	Christina	Jenkins	\N		t	f	f	f	f	f	2020-10-07 02:41:20.80692+05:30
58		\N	sarahhernandez@hotmail.com	608-232-6920	Sean	Gonzalez	\N		t	f	f	f	f	f	2020-10-07 02:41:23.13727+05:30
59		\N	oflores@yahoo.com	+1-298-284-6689	Crystal	Brown	\N		t	f	f	f	f	f	2020-10-07 02:41:24.133863+05:30
60		\N	kathryn35@hotmail.com	1256569986	Richard	Mcclure	\N		t	f	f	f	f	f	2020-10-07 02:41:27.57581+05:30
61		\N	melliott@yahoo.com	(617)344-4234	Christy	Torres	\N		t	f	f	f	f	f	2020-10-07 02:41:28.42034+05:30
62		\N	sanderskayla@wright.com	206-057-1995	Jeffrey	Mclaughlin	\N		t	f	f	f	f	f	2020-10-07 02:41:31.060852+05:30
63		\N	amanda79@gonzalez.net	969-142-0715	Sherri	Lopez	\N		t	f	f	f	f	f	2020-10-07 02:42:08.104925+05:30
64		\N	hamiltondaniel@gmail.com	216-933-2265	Tasha	Moreno	\N		t	f	f	f	f	f	2020-10-07 02:42:10.59752+05:30
65		\N	melissaroman@yahoo.com	100.156.4709	Connor	Gonzalez	\N		t	f	f	f	f	f	2020-10-07 14:10:28.172165+05:30
66		\N	xgomez@hoffman.net	(187)595-7372	Jennifer	Murray	\N		t	f	f	f	f	f	2020-10-07 14:10:35.198897+05:30
67		\N	xhansen@yahoo.com	422-366-6147	Christina	Chen	\N		t	f	f	f	f	f	2020-10-07 14:10:37.59451+05:30
68		\N	ishepherd@yahoo.com	382-380-7542	Mary	Lee	\N		t	f	f	f	f	f	2020-10-07 14:10:44.053472+05:30
69		\N	halldebra@hotmail.com	(718)086-0353	David	Dominguez	\N		t	f	f	f	f	f	2020-10-07 14:10:45.004472+05:30
70		\N	qjones@melton-baker.com	(886)379-8851	Danielle	Richards	\N		t	f	f	f	f	f	2020-10-07 14:10:49.476851+05:30
71		\N	alexandra56@rhodes-walker.org	262.362.1952	April	Lawson	\N		t	f	f	f	f	f	2020-10-07 14:16:18.676438+05:30
72		\N	robertmassey@barnett.com	8900036545	Amy	Lewis	\N		t	f	f	f	f	f	2020-10-07 14:16:20.49521+05:30
73		\N	jacobwoodward@gmail.com	+18493654708	Anna	Vasquez	\N		t	f	f	f	f	f	2020-10-07 14:16:22.177747+05:30
74		\N	williambrown@gmail.com	+1-183-185-0979x24301	Lisa	Oliver	\N		t	f	f	f	f	f	2020-10-07 14:16:23.397173+05:30
75		\N	alicia35@gmail.com	001-993-216-8294x22444	Michael	Dyer	\N		t	f	f	f	f	f	2020-10-07 14:16:24.42765+05:30
76		\N	rebecca69@hotmail.com	+1-887-093-4981x3259	Donald	Avila	\N		t	f	f	f	f	f	2020-10-07 14:16:27.050387+05:30
77		\N	hchambers@gmail.com	838.709.7920	Heather	Baker	\N		t	f	f	f	f	f	2020-10-07 14:16:28.107437+05:30
78		\N	kyle44@hotmail.com	947.748.2047x52859	Jose	Newton	\N		t	f	f	f	f	f	2020-10-07 14:16:29.065736+05:30
79		\N	mcmahonanthony@johnson.net	160.425.6397x7545	Rhonda	Smith	\N		t	f	f	f	f	f	2020-10-07 14:16:30.123156+05:30
80		\N	jesse46@hotmail.com	+1-730-884-8780	Roberta	Bartlett	\N		t	f	f	f	f	f	2020-10-07 14:29:20.403668+05:30
81		\N	reevesjames@hotmail.com	(302)228-1124	David	Ramirez	\N		t	f	f	f	f	f	2020-10-07 14:35:14.38089+05:30
82		\N	monica01@yahoo.com	8065121270	Paul	Adams	\N		t	f	f	f	f	f	2020-10-07 14:35:54.514408+05:30
83		\N	jessica51@gmail.com	(164)047-7361x552	Judy	Miller	\N		t	f	f	f	f	f	2020-10-07 14:37:05.463533+05:30
84		\N	claudiabrown@yahoo.com	+1-447-092-5657	Paul	Palmer	\N		t	f	f	f	f	f	2020-10-07 14:37:24.937474+05:30
85		\N	marialewis@yahoo.com	(468)785-9843x986	George	Moore	\N		t	f	f	f	f	f	2020-10-07 14:37:39.403535+05:30
86	argon2$argon2i$v=19$m=512,t=2,p=2$U0FTZGs0THlzNDlk$XG9c1icYNKy1+ChWixaQvw	\N	sbriggs@kennedy.com	+1-163-310-3595x103	Robert	Gonzalez	\N		t	f	f	f	f	f	2020-10-07 14:40:36.878224+05:30
88	argon2$argon2i$v=19$m=512,t=2,p=2$MXlwMUhJTDRKaFlP$q6sP9/O1OhBruGKLqsZz4g	\N	moyermargaret@yahoo.com	240-065-2840x78134	Lori	Cooley	1969-11-08		t	f	f	f	f	f	2020-10-07 14:48:54.737591+05:30
89	argon2$argon2i$v=19$m=512,t=2,p=2$U3RObEFDdmY2Qmhl$GhUBZd+Nuc/Z3eGKv2WojQ	\N	angel04@lee-hill.info	001-013-041-4690x9070	Kevin	Johnson	1988-02-12		t	f	f	f	f	f	2020-10-07 14:54:10.552452+05:30
90	argon2$argon2i$v=19$m=512,t=2,p=2$TFpIZDl2TWFpc1g1$qNGZBf6tFFztAR6mNsnrig	\N	ssjsjsj@gmail.com	+919029299292929	\N	\N	\N		t	f	f	f	t	f	2020-10-07 23:45:10.62711+05:30
91	argon2$argon2i$v=19$m=512,t=2,p=2$SzUyTEFFeDA0S1Q0$TlKC4T7d5wFQZfHd04SlFg	\N	ssjsskssjsj@gmail.com	+41524204242	\N	\N	\N		t	f	f	f	t	f	2020-10-07 23:48:34.912424+05:30
92	argon2$argon2i$v=19$m=512,t=2,p=2$NWxyNXNZNmdRYmRS$Dli7v6egELvF3DcAp+Fe4w	\N	ssjsskaaanssjsj@gmail.com	+919935973863	\N	\N	\N		t	f	f	f	t	f	2020-10-07 23:49:29.508863+05:30
93	argon2$argon2i$v=19$m=512,t=2,p=2$U3k4MXdLcE5NREVN$8NoRhiOoc2kFvTyIxv7EUA	\N	josephwang@yahoo.com	567.057.8104x817	Kim	Cross	2012-04-20		t	t	t	f	f	f	2020-10-08 01:07:11.550253+05:30
94	argon2$argon2i$v=19$m=512,t=2,p=2$aTFTcm9ISEtCcWpy$SXs0xS3kQMpznQJe+5qAjA	\N	bdiaz@yahoo.com	001-096-984-8377x58115	Tony	Mayo	2005-02-08		t	f	t	f	f	f	2020-10-08 03:03:01.671282+05:30
95	argon2$argon2i$v=19$m=512,t=2,p=2$SzNYY2xMRW5hSTFT$xHSEL2XrwaLTogjOWSDCcw	\N	rhondabrock@yahoo.com	001-774-467-1913x281	Kathryn	Rosario	2001-02-14		t	f	t	f	f	f	2020-10-08 03:04:55.752203+05:30
96	argon2$argon2i$v=19$m=512,t=2,p=2$RmdsRm80Ukt0Mjcx$tqp4KV74A1qk6sdZh85Llw	\N	imckenzie@stone-brown.biz	001-955-794-0222x252	Julian	Hernandez	1918-09-09		t	f	t	f	f	f	2020-10-08 03:06:17.908781+05:30
97	argon2$argon2i$v=19$m=512,t=2,p=2$R25tdmlqSUh4ZE14$4LW3ZEHuqzWnwwWanwkM7Q	\N	smartin@gmail.com	(815)351-9093x0833	Judith	Martin	1955-04-10		t	f	t	f	f	f	2020-10-08 03:08:42.637913+05:30
98	argon2$argon2i$v=19$m=512,t=2,p=2$Nkl3N3VudDNyb0xs$/NJKEKcGuavmTrZsC/Y/NQ	\N	tejpratapsingh545@gmail.com5	+916394906992	\N	\N	\N		t	t	f	f	f	f	2020-10-10 02:57:04.583808+05:30
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 9, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 100, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 11, true);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, true);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 1, false);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 25, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 59, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: exchange_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exchange_rate_id_seq', 10, true);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 23, true);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 6, true);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 23, true);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 98, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: exchange_exchangebackend exchange_exchangebackend_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange_exchangebackend
    ADD CONSTRAINT exchange_exchangebackend_pkey PRIMARY KEY (name);


--
-- Name: exchange_rate exchange_rate_currency_backend_id_c6037b21_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange_rate
    ADD CONSTRAINT exchange_rate_currency_backend_id_c6037b21_uniq UNIQUE (currency, backend_id);


--
-- Name: exchange_rate exchange_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange_rate
    ADD CONSTRAINT exchange_rate_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_source_refresh_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_source_refresh_token_id_key UNIQUE (source_refresh_token_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_key UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_key UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq UNIQUE (token, revoked);


--
-- Name: products_product products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: exchange_exchangebackend_name_8f97aa6b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exchange_exchangebackend_name_8f97aa6b_like ON public.exchange_exchangebackend USING btree (name varchar_pattern_ops);


--
-- Name: exchange_rate_backend_id_d57e3a62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exchange_rate_backend_id_d57e3a62 ON public.exchange_rate USING btree (backend_id);


--
-- Name: exchange_rate_backend_id_d57e3a62_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exchange_rate_backend_id_d57e3a62_like ON public.exchange_rate USING btree (backend_id varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_uid_796e51dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);


--
-- Name: social_auth_usersocialauth_uid_796e51dc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exchange_rate exchange_rate_backend_id_d57e3a62_fk_exchange_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange_rate
    ADD CONSTRAINT exchange_rate_backend_id_d57e3a62_fk_exchange_ FOREIGN KEY (backend_id) REFERENCES public.exchange_exchangebackend(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr FOREIGN KEY (source_refresh_token_id) REFERENCES public.oauth2_provider_refreshtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_gran_application_id_81923564_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_gran_application_id_81923564_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

