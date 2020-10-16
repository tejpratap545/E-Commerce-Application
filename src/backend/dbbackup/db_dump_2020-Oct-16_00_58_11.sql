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
-- Name: products_brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_brand (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    tags character varying(200)[] NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.products_brand OWNER TO postgres;

--
-- Name: products_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_brand_id_seq OWNER TO postgres;

--
-- Name: products_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_brand_id_seq OWNED BY public.products_brand.id;


--
-- Name: products_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_category (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    tags character varying(200)[] NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.products_category OWNER TO postgres;

--
-- Name: products_category_brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_category_brand (
    id integer NOT NULL,
    category_id integer NOT NULL,
    brand_id integer NOT NULL
);


ALTER TABLE public.products_category_brand OWNER TO postgres;

--
-- Name: products_category_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_category_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_brand_id_seq OWNER TO postgres;

--
-- Name: products_category_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_category_brand_id_seq OWNED BY public.products_category_brand.id;


--
-- Name: products_category_filter_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_category_filter_category (
    id integer NOT NULL,
    category_id integer NOT NULL,
    filtercategory_id integer NOT NULL
);


ALTER TABLE public.products_category_filter_category OWNER TO postgres;

--
-- Name: products_category_filter_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_category_filter_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_filter_category_id_seq OWNER TO postgres;

--
-- Name: products_category_filter_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_category_filter_category_id_seq OWNED BY public.products_category_filter_category.id;


--
-- Name: products_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_id_seq OWNER TO postgres;

--
-- Name: products_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_category_id_seq OWNED BY public.products_category.id;


--
-- Name: products_category_price_filter_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_category_price_filter_category (
    id integer NOT NULL,
    category_id integer NOT NULL,
    pricefiltercategory_id integer NOT NULL
);


ALTER TABLE public.products_category_price_filter_category OWNER TO postgres;

--
-- Name: products_category_price_filter_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_category_price_filter_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_price_filter_category_id_seq OWNER TO postgres;

--
-- Name: products_category_price_filter_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_category_price_filter_category_id_seq OWNED BY public.products_category_price_filter_category.id;


--
-- Name: products_filtercategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_filtercategory (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.products_filtercategory OWNER TO postgres;

--
-- Name: products_filtercategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_filtercategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_filtercategory_id_seq OWNER TO postgres;

--
-- Name: products_filtercategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_filtercategory_id_seq OWNED BY public.products_filtercategory.id;


--
-- Name: products_filtercategory_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_filtercategory_properties (
    id integer NOT NULL,
    filtercategory_id integer NOT NULL,
    filterproperties_id integer NOT NULL
);


ALTER TABLE public.products_filtercategory_properties OWNER TO postgres;

--
-- Name: products_filtercategory_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_filtercategory_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_filtercategory_properties_id_seq OWNER TO postgres;

--
-- Name: products_filtercategory_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_filtercategory_properties_id_seq OWNED BY public.products_filtercategory_properties.id;


--
-- Name: products_filterproperties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_filterproperties (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    value character varying(30) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.products_filterproperties OWNER TO postgres;

--
-- Name: products_filterproperties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_filterproperties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_filterproperties_id_seq OWNER TO postgres;

--
-- Name: products_filterproperties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_filterproperties_id_seq OWNED BY public.products_filterproperties.id;


--
-- Name: products_middlepricerange; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_middlepricerange (
    id integer NOT NULL,
    name character varying(20),
    start_price_currency character varying(3) NOT NULL,
    start_price numeric(14,2) NOT NULL,
    end_price_currency character varying(3) NOT NULL,
    end_price numeric(14,2) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.products_middlepricerange OWNER TO postgres;

--
-- Name: products_middlepricerange_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_middlepricerange_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_middlepricerange_id_seq OWNER TO postgres;

--
-- Name: products_middlepricerange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_middlepricerange_id_seq OWNED BY public.products_middlepricerange.id;


--
-- Name: products_pricefiltercategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_pricefiltercategory (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    under_price_currency character varying(3) NOT NULL,
    under_price numeric(14,2) NOT NULL,
    middle_price_currency character varying(3) NOT NULL,
    middle_price numeric(14,2) NOT NULL,
    above_price_currency character varying(3) NOT NULL,
    above_price numeric(14,2) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.products_pricefiltercategory OWNER TO postgres;

--
-- Name: products_pricefiltercategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_pricefiltercategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_pricefiltercategory_id_seq OWNER TO postgres;

--
-- Name: products_pricefiltercategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_pricefiltercategory_id_seq OWNED BY public.products_pricefiltercategory.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_product (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    is_available boolean NOT NULL,
    stoke integer NOT NULL,
    description text NOT NULL,
    original_price_currency character varying(3) NOT NULL,
    original_price numeric(14,2) NOT NULL,
    current_price_currency character varying(3) NOT NULL,
    current_price numeric(14,2) NOT NULL,
    tags character varying(200)[] NOT NULL,
    product_detail jsonb NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    brand_id integer
);


ALTER TABLE public.products_product OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;


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
-- Name: users_billingaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_billingaddress (
    id integer NOT NULL,
    room integer,
    address1 text NOT NULL,
    address2 text,
    city character varying(50) NOT NULL,
    state character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    postal_code character varying(10) NOT NULL,
    contact_number character varying(128) NOT NULL,
    fax character varying(30),
    email character varying(30),
    card_number character varying(25) NOT NULL,
    card_expiry date NOT NULL,
    security_field character varying(4) NOT NULL
);


ALTER TABLE public.users_billingaddress OWNER TO postgres;

--
-- Name: users_billingaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_billingaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_billingaddress_id_seq OWNER TO postgres;

--
-- Name: users_billingaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_billingaddress_id_seq OWNED BY public.users_billingaddress.id;


--
-- Name: users_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_customer (
    id integer NOT NULL,
    default_shipping_address smallint NOT NULL,
    default_purchasing_address smallint NOT NULL,
    user_id bigint NOT NULL,
    CONSTRAINT users_customer_default_purchasing_address_check CHECK ((default_purchasing_address >= 0)),
    CONSTRAINT users_customer_default_shipping_address_check CHECK ((default_shipping_address >= 0))
);


ALTER TABLE public.users_customer OWNER TO postgres;

--
-- Name: users_customer_billing_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_customer_billing_address (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    billingaddress_id integer NOT NULL
);


ALTER TABLE public.users_customer_billing_address OWNER TO postgres;

--
-- Name: users_customer_billing_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_customer_billing_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_customer_billing_address_id_seq OWNER TO postgres;

--
-- Name: users_customer_billing_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_customer_billing_address_id_seq OWNED BY public.users_customer_billing_address.id;


--
-- Name: users_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_customer_id_seq OWNER TO postgres;

--
-- Name: users_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_customer_id_seq OWNED BY public.users_customer.id;


--
-- Name: users_customer_shipping_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_customer_shipping_address (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    shippingaddress_id integer NOT NULL
);


ALTER TABLE public.users_customer_shipping_address OWNER TO postgres;

--
-- Name: users_customer_shipping_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_customer_shipping_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_customer_shipping_address_id_seq OWNER TO postgres;

--
-- Name: users_customer_shipping_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_customer_shipping_address_id_seq OWNED BY public.users_customer_shipping_address.id;


--
-- Name: users_shippingaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_shippingaddress (
    id integer NOT NULL,
    room integer,
    address1 text NOT NULL,
    address2 text,
    city character varying(50) NOT NULL,
    state character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    postal_code character varying(10) NOT NULL,
    contact_number character varying(128) NOT NULL,
    fax character varying(30),
    email character varying(30),
    extra_information text
);


ALTER TABLE public.users_shippingaddress OWNER TO postgres;

--
-- Name: users_shippingaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_shippingaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_shippingaddress_id_seq OWNER TO postgres;

--
-- Name: users_shippingaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_shippingaddress_id_seq OWNED BY public.users_shippingaddress.id;


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
    avatar character varying(100),
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
-- Name: products_brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_brand ALTER COLUMN id SET DEFAULT nextval('public.products_brand_id_seq'::regclass);


--
-- Name: products_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category ALTER COLUMN id SET DEFAULT nextval('public.products_category_id_seq'::regclass);


--
-- Name: products_category_brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_brand ALTER COLUMN id SET DEFAULT nextval('public.products_category_brand_id_seq'::regclass);


--
-- Name: products_category_filter_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_filter_category ALTER COLUMN id SET DEFAULT nextval('public.products_category_filter_category_id_seq'::regclass);


--
-- Name: products_category_price_filter_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_price_filter_category ALTER COLUMN id SET DEFAULT nextval('public.products_category_price_filter_category_id_seq'::regclass);


--
-- Name: products_filtercategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_filtercategory ALTER COLUMN id SET DEFAULT nextval('public.products_filtercategory_id_seq'::regclass);


--
-- Name: products_filtercategory_properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_filtercategory_properties ALTER COLUMN id SET DEFAULT nextval('public.products_filtercategory_properties_id_seq'::regclass);


--
-- Name: products_filterproperties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_filterproperties ALTER COLUMN id SET DEFAULT nextval('public.products_filterproperties_id_seq'::regclass);


--
-- Name: products_middlepricerange id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_middlepricerange ALTER COLUMN id SET DEFAULT nextval('public.products_middlepricerange_id_seq'::regclass);


--
-- Name: products_pricefiltercategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_pricefiltercategory ALTER COLUMN id SET DEFAULT nextval('public.products_pricefiltercategory_id_seq'::regclass);


--
-- Name: products_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


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
-- Name: users_billingaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_billingaddress ALTER COLUMN id SET DEFAULT nextval('public.users_billingaddress_id_seq'::regclass);


--
-- Name: users_customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer ALTER COLUMN id SET DEFAULT nextval('public.users_customer_id_seq'::regclass);


--
-- Name: users_customer_billing_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer_billing_address ALTER COLUMN id SET DEFAULT nextval('public.users_customer_billing_address_id_seq'::regclass);


--
-- Name: users_customer_shipping_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer_shipping_address ALTER COLUMN id SET DEFAULT nextval('public.users_customer_shipping_address_id_seq'::regclass);


--
-- Name: users_shippingaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_shippingaddress ALTER COLUMN id SET DEFAULT nextval('public.users_shippingaddress_id_seq'::regclass);


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
85	Can add exchange backend	22	add_exchangebackend
86	Can change exchange backend	22	change_exchangebackend
87	Can delete exchange backend	22	delete_exchangebackend
88	Can view exchange backend	22	view_exchangebackend
89	Can add rate	23	add_rate
90	Can change rate	23	change_rate
91	Can delete rate	23	delete_rate
92	Can view rate	23	view_rate
93	Can add user	24	add_user
94	Can change user	24	change_user
95	Can delete user	24	delete_user
96	Can view user	24	view_user
97	Can add billing address	25	add_billingaddress
98	Can change billing address	25	change_billingaddress
99	Can delete billing address	25	delete_billingaddress
100	Can view billing address	25	view_billingaddress
101	Can add shipping address	26	add_shippingaddress
102	Can change shipping address	26	change_shippingaddress
103	Can delete shipping address	26	delete_shippingaddress
104	Can view shipping address	26	view_shippingaddress
105	Can add customer	27	add_customer
106	Can change customer	27	change_customer
107	Can delete customer	27	delete_customer
108	Can view customer	27	view_customer
109	Can add brand	28	add_brand
110	Can change brand	28	change_brand
111	Can delete brand	28	delete_brand
112	Can view brand	28	view_brand
113	Can add filter properties	29	add_filterproperties
114	Can change filter properties	29	change_filterproperties
115	Can delete filter properties	29	delete_filterproperties
116	Can view filter properties	29	view_filterproperties
117	Can add MiddlePriceRange	30	add_middlepricerange
118	Can change MiddlePriceRange	30	change_middlepricerange
119	Can delete MiddlePriceRange	30	delete_middlepricerange
120	Can view MiddlePriceRange	30	view_middlepricerange
121	Can add PriceFilterCategory	31	add_pricefiltercategory
122	Can change PriceFilterCategory	31	change_pricefiltercategory
123	Can delete PriceFilterCategory	31	delete_pricefiltercategory
124	Can view PriceFilterCategory	31	view_pricefiltercategory
125	Can add product	32	add_product
126	Can change product	32	change_product
127	Can delete product	32	delete_product
128	Can view product	32	view_product
129	Can add FilterCategory	33	add_filtercategory
130	Can change FilterCategory	33	change_filtercategory
131	Can delete FilterCategory	33	delete_filtercategory
132	Can view FilterCategory	33	view_filtercategory
133	Can add Category	34	add_category
134	Can change Category	34	change_category
135	Can delete Category	34	delete_category
136	Can view Category	34	view_category
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
12	2020-10-14 06:42:54.951133+05:30	7	e-commerce-application	1	[{"added": {}}]	13	100
13	2020-10-16 00:56:04.739312+05:30	102	tejpratapsing4h545@gmail.com	3		24	100
14	2020-10-16 00:56:04.77952+05:30	104	tejpratapsingh3545@outllok.com	3		24	100
15	2020-10-16 00:56:04.81708+05:30	1	tejpratapsingh545@gmail.com	3		24	100
16	2020-10-16 00:56:04.857+05:30	98	tejpratapsingh545@gmail.com5	3		24	100
17	2020-10-16 00:56:04.893179+05:30	103	tejpratapsingh545@outllok.com	3		24	100
18	2020-10-16 00:56:04.932732+05:30	2	tejpratapsinsjsgh545@gmail.com	3		24	100
19	2020-10-16 00:56:04.970756+05:30	105	tejprssat@outlook.com	3		24	100
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
22	exchange	exchangebackend
23	exchange	rate
24	users	user
25	users	billingaddress
26	users	shippingaddress
27	users	customer
28	products	brand
29	products	filterproperties
30	products	middlepricerange
31	products	pricefiltercategory
32	products	product
33	products	filtercategory
34	products	category
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-10-14 06:35:30.526847+05:30
2	contenttypes	0002_remove_content_type_name	2020-10-14 06:35:30.538337+05:30
3	auth	0001_initial	2020-10-14 06:35:30.555366+05:30
4	auth	0002_alter_permission_name_max_length	2020-10-14 06:35:30.573854+05:30
5	auth	0003_alter_user_email_max_length	2020-10-14 06:35:30.579081+05:30
6	auth	0004_alter_user_username_opts	2020-10-14 06:35:30.584196+05:30
7	auth	0005_alter_user_last_login_null	2020-10-14 06:35:30.589532+05:30
8	auth	0006_require_contenttypes_0002	2020-10-14 06:35:30.591066+05:30
9	auth	0007_alter_validators_add_error_messages	2020-10-14 06:35:30.596283+05:30
10	auth	0008_alter_user_username_max_length	2020-10-14 06:35:30.601478+05:30
11	auth	0009_alter_user_last_name_max_length	2020-10-14 06:35:30.606865+05:30
12	auth	0010_alter_group_name_max_length	2020-10-14 06:35:30.613522+05:30
13	auth	0011_update_proxy_permissions	2020-10-14 06:35:30.618447+05:30
14	auth	0012_alter_user_first_name_max_length	2020-10-14 06:35:30.675904+05:30
15	users	0001_create_user_model	2020-10-14 06:35:30.694911+05:30
16	admin	0001_initial	2020-10-14 06:35:30.738937+05:30
17	admin	0002_logentry_remove_auto_add	2020-10-14 06:35:30.754411+05:30
18	admin	0003_logentry_add_action_flag_choices	2020-10-14 06:35:30.763092+05:30
19	django_celery_beat	0001_initial	2020-10-14 06:35:30.785551+05:30
20	django_celery_beat	0002_auto_20161118_0346	2020-10-14 06:35:30.802674+05:30
21	django_celery_beat	0003_auto_20161209_0049	2020-10-14 06:35:30.812283+05:30
22	django_celery_beat	0004_auto_20170221_0000	2020-10-14 06:35:30.816429+05:30
23	django_celery_beat	0005_add_solarschedule_events_choices	2020-10-14 06:35:30.820561+05:30
24	django_celery_beat	0006_auto_20180322_0932	2020-10-14 06:35:30.837202+05:30
25	django_celery_beat	0007_auto_20180521_0826	2020-10-14 06:35:30.847427+05:30
26	django_celery_beat	0008_auto_20180914_1922	2020-10-14 06:35:30.862061+05:30
27	django_celery_beat	0006_auto_20180210_1226	2020-10-14 06:35:30.871458+05:30
28	django_celery_beat	0006_periodictask_priority	2020-10-14 06:35:30.877204+05:30
29	django_celery_beat	0009_periodictask_headers	2020-10-14 06:35:30.886044+05:30
30	django_celery_beat	0010_auto_20190429_0326	2020-10-14 06:35:31.039081+05:30
31	django_celery_beat	0011_auto_20190508_0153	2020-10-14 06:35:31.049499+05:30
32	django_celery_beat	0012_periodictask_expire_seconds	2020-10-14 06:35:31.056736+05:30
33	exchange	0001_initial	2020-10-14 06:35:31.072035+05:30
34	oauth2_provider	0001_initial	2020-10-14 06:35:31.154711+05:30
35	oauth2_provider	0002_auto_20190406_1805	2020-10-14 06:35:31.202544+05:30
36	products	0001_initial	2020-10-14 06:35:31.265111+05:30
37	products	0002_auto_20201013_0154	2020-10-14 06:35:31.303306+05:30
38	products	0003_auto_20201013_0240	2020-10-14 06:35:31.321174+05:30
39	sessions	0001_initial	2020-10-14 06:35:31.328032+05:30
40	sites	0001_initial	2020-10-14 06:35:31.338694+05:30
41	sites	0002_alter_domain_unique	2020-10-14 06:35:31.345502+05:30
42	default	0001_initial	2020-10-14 06:35:31.39945+05:30
43	social_auth	0001_initial	2020-10-14 06:35:31.400598+05:30
44	default	0002_add_related_name	2020-10-14 06:35:31.421035+05:30
45	social_auth	0002_add_related_name	2020-10-14 06:35:31.422783+05:30
46	default	0003_alter_email_max_length	2020-10-14 06:35:31.427808+05:30
47	social_auth	0003_alter_email_max_length	2020-10-14 06:35:31.429015+05:30
48	default	0004_auto_20160423_0400	2020-10-14 06:35:31.441966+05:30
49	social_auth	0004_auto_20160423_0400	2020-10-14 06:35:31.443144+05:30
50	social_auth	0005_auto_20160727_2333	2020-10-14 06:35:31.448154+05:30
51	social_django	0006_partial	2020-10-14 06:35:31.457094+05:30
52	social_django	0007_code_timestamp	2020-10-14 06:35:31.46416+05:30
53	social_django	0008_partial_timestamp	2020-10-14 06:35:31.471418+05:30
54	social_django	0009_auto_20191118_0520	2020-10-14 06:35:31.498427+05:30
55	social_django	0010_uid_db_index	2020-10-14 06:35:31.519056+05:30
56	users	0002_alter_contact_field	2020-10-14 06:35:31.598186+05:30
57	users	0003_billingaddress_customer_shippingaddress	2020-10-14 06:35:31.644712+05:30
58	users	0004_chnage_user_avatar_to_blank_and_null_field	2020-10-14 06:35:31.693412+05:30
59	social_django	0001_initial	2020-10-14 06:35:31.697093+05:30
60	social_django	0005_auto_20160727_2333	2020-10-14 06:35:31.698415+05:30
61	social_django	0002_add_related_name	2020-10-14 06:35:31.699578+05:30
62	social_django	0004_auto_20160423_0400	2020-10-14 06:35:31.700866+05:30
63	social_django	0003_alter_email_max_length	2020-10-14 06:35:31.702094+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
j9cdy4bsjurpbrjv3lo8ih8upqyprnp5	.eJxVjMsOwiAQAP-FsyE8WmA9eu83NMsuSNVAUtqT8d9Nkx70OjOZt5hx38q897TOC4ur0EqJyy-NSM9UD8UPrPcmqdVtXaI8EnnaLqfG6XU7279BwV6O8RizZnKQfchWAzunPRoXrDI8EDESRMM2uzER-EH70Q_KQERFIQCLzxcpCjgV:1kSVK5:dtXjYdTiPNZUtZ_Gk5Xihq7BU2WQYQZypPxQCovJCOs	2020-10-28 06:41:21.13593+05:30
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
25	CHKzXnwLl0mV3ZPVGYRnfXnATBoXv5	2020-10-15 02:57:23.071264+05:30	read write	7	99	2020-10-14 16:57:23.074063+05:30	2020-10-14 16:57:23.074105+05:30	\N
26	ftm9eH9veBeTAev3nTOkk1kQ1FvLvm	2020-10-15 03:01:14.035005+05:30	read write	7	99	2020-10-14 17:01:14.041217+05:30	2020-10-14 17:01:14.041259+05:30	\N
27	W2aFBTTz9MNVODnDDikxI7dtbUCRDW	2020-10-15 03:36:29.425517+05:30	read write	7	99	2020-10-14 17:36:29.929348+05:30	2020-10-14 17:36:29.929393+05:30	24
31	6yGo2FRxXgi1IjxrIJEv9jQjjkGoDB	2020-10-16 10:41:33.072641+05:30	read write	7	99	2020-10-16 00:41:33.1044+05:30	2020-10-16 00:41:33.104458+05:30	\N
33	TzqF9TWz5mzeP5Q7KBpijrAWJZQcpH	2020-10-16 10:45:17.591736+05:30	read write	7	99	2020-10-16 00:45:18.116446+05:30	2020-10-16 00:45:18.116599+05:30	32
34	tkdIrNfd5zUpAvJqBuKOZ1NYXa13w3	2020-10-16 10:50:27.883531+05:30	read write	7	99	2020-10-16 00:50:27.885543+05:30	2020-10-16 00:50:27.885586+05:30	\N
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
7	zFCncJkZxUMOWSM50emq8AnQAG66VlXfe8vkJuV6		confidential	password	4BZit68P3ePBZBlIMLKrBV9w9FCwJcu7zHj6WHatmIDSF03LkiQ4IuRTgPrO8xtcjBPL1pVPlPee4Qz9YGgqxkv8YiUxycw1IdCef98OxjVW09KVs3fZQZIpM5MeqdYU	e-commerce-application	100	f	2020-10-14 06:42:54.912787+05:30	2020-10-14 06:42:54.912837+05:30
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
25	SypdH9t5ArYmQZYJtW0N3t7Vgvitk6	25	7	99	2020-10-14 16:57:23.169424+05:30	2020-10-14 16:57:23.169503+05:30	\N
26	yCYyJrU3dbBxu4nPm0CMaGiRxtjGDP	26	7	99	2020-10-14 17:01:14.111894+05:30	2020-10-14 17:01:14.111941+05:30	\N
24	32wL5MdgO6zTaWgkTtN4Df3qR4Xgcs	\N	7	99	2020-10-14 06:43:30.493043+05:30	2020-10-14 17:36:29.839615+05:30	2020-10-14 17:36:29.836572+05:30
27	P0SoHD0SmqoRX3CDBIyqggxEg158BZ	27	7	99	2020-10-14 17:36:29.992905+05:30	2020-10-14 17:36:29.992953+05:30	\N
31	RM0Z4xK5uhg0NxRPHXHvwec8kbthz1	31	7	99	2020-10-16 00:41:33.219519+05:30	2020-10-16 00:41:33.219572+05:30	\N
32	QdcsfQNXYs3YN575bQU4H4odXKlfJj	\N	7	99	2020-10-16 00:43:33.576761+05:30	2020-10-16 00:45:17.9744+05:30	2020-10-16 00:45:17.97404+05:30
33	Jy4aWr98jv9toqNw3ktgW7sPY2HeWF	33	7	99	2020-10-16 00:45:18.1871+05:30	2020-10-16 00:45:18.187146+05:30	\N
34	UkrskQKT8sdmK4v9jnnNRt6lpRXGTQ	34	7	99	2020-10-16 00:50:27.926742+05:30	2020-10-16 00:50:27.92679+05:30	\N
\.


--
-- Data for Name: products_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_brand (id, name, tags, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: products_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_category (id, name, tags, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: products_category_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_category_brand (id, category_id, brand_id) FROM stdin;
\.


--
-- Data for Name: products_category_filter_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_category_filter_category (id, category_id, filtercategory_id) FROM stdin;
\.


--
-- Data for Name: products_category_price_filter_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_category_price_filter_category (id, category_id, pricefiltercategory_id) FROM stdin;
\.


--
-- Data for Name: products_filtercategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_filtercategory (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: products_filtercategory_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_filtercategory_properties (id, filtercategory_id, filterproperties_id) FROM stdin;
\.


--
-- Data for Name: products_filterproperties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_filterproperties (id, name, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: products_middlepricerange; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_middlepricerange (id, name, start_price_currency, start_price, end_price_currency, end_price, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: products_pricefiltercategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_pricefiltercategory (id, name, under_price_currency, under_price, middle_price_currency, middle_price, above_price_currency, above_price, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_product (id, name, is_available, stoke, description, original_price_currency, original_price, current_price_currency, current_price, tags, product_detail, created_at, updated_at, brand_id) FROM stdin;
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
-- Data for Name: users_billingaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_billingaddress (id, room, address1, address2, city, state, country, postal_code, contact_number, fax, email, card_number, card_expiry, security_field) FROM stdin;
\.


--
-- Data for Name: users_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_customer (id, default_shipping_address, default_purchasing_address, user_id) FROM stdin;
\.


--
-- Data for Name: users_customer_billing_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_customer_billing_address (id, customer_id, billingaddress_id) FROM stdin;
\.


--
-- Data for Name: users_customer_shipping_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_customer_shipping_address (id, customer_id, shippingaddress_id) FROM stdin;
\.


--
-- Data for Name: users_shippingaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_shippingaddress (id, room, address1, address2, city, state, country, postal_code, contact_number, fax, email, extra_information) FROM stdin;
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user (id, password, last_login, email, contact_number, first_name, last_name, date_of_birth, avatar, is_active, is_admin, is_superuser, is_email_verified, is_customer, is_seller, date_joined) FROM stdin;
87	argon2$argon2i$v=19$m=512,t=2,p=2$WFRuQ0dPWndSNWdF$ort0tc6uxhnXcmxBfpH/Jw	\N	oballard@gmail.com	(454)240-9955x624	Scott	Pitts	\N		t	f	f	f	f	f	2020-10-07 14:41:22.41724+05:30
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
100	argon2$argon2i$v=19$m=512,t=2,p=2$eDdQM1lIbUp3RkVV$75LGpFqobmwXHlsn/dzXqQ	2020-10-14 06:41:20.876795+05:30	admin@ecommerce.com	+913434564567	\N	\N	\N		t	t	t	f	f	f	2020-10-14 06:40:28.794202+05:30
99	argon2$argon2i$v=19$m=512,t=2,p=2$YXpjdDFFa1U1NHRO$Yk796WWTUCZitsLV9JRqtQ	\N	customer@ecommerce.com	+919345345689	customer	user	1980-10-11	user/avatar/customer_tpvdhOt.jpeg	t	f	f	f	t	f	2020-10-14 06:38:41.526732+05:30
101	argon2$argon2i$v=19$m=512,t=2,p=2$YjJHa2lnc0w3OHgz$urfWqS4LUtjP2zIhTP8CYQ	\N	developer@gmail.com	+918734257394	python	developer	1989-04-23		t	f	f	f	f	t	2020-10-15 04:57:16.636617+05:30
106	argon2$argon2i$v=19$m=512,t=2,p=2$dnNYSklxTDNOZHNO$Mo+6LvnCHE8/B9YbJCQUZA	\N	ankit@gmail.com	+916394782722	Ankit	Mishra	\N		t	f	f	f	t	f	2020-10-15 06:21:59.085985+05:30
107	argon2$argon2i$v=19$m=512,t=2,p=2$N2o5TmNIa3pITTRV$yMUej3TqQXLXuR5clozO9Q	\N	ankita@gmail.com	+916392782722	Ankit	Mishra	\N		t	f	f	f	t	f	2020-10-15 06:23:24.765589+05:30
108	argon2$argon2i$v=19$m=512,t=2,p=2$SmdvWnVubDllUFl3$hIXyquQzR8jimxa+NLDFVA	\N	ank333it@gmail.com	+916382873489	ankit	pal	\N		t	f	f	f	t	f	2020-10-15 06:26:19.357179+05:30
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

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 19, true);


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

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 34, true);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 7, true);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 34, true);


--
-- Name: products_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_brand_id_seq', 1, false);


--
-- Name: products_category_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_category_brand_id_seq', 1, false);


--
-- Name: products_category_filter_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_category_filter_category_id_seq', 1, false);


--
-- Name: products_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_category_id_seq', 1, false);


--
-- Name: products_category_price_filter_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_category_price_filter_category_id_seq', 1, false);


--
-- Name: products_filtercategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_filtercategory_id_seq', 1, false);


--
-- Name: products_filtercategory_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_filtercategory_properties_id_seq', 1, false);


--
-- Name: products_filterproperties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_filterproperties_id_seq', 1, false);


--
-- Name: products_middlepricerange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_middlepricerange_id_seq', 1, false);


--
-- Name: products_pricefiltercategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_pricefiltercategory_id_seq', 1, false);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 1, false);


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
-- Name: users_billingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_billingaddress_id_seq', 1, false);


--
-- Name: users_customer_billing_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_customer_billing_address_id_seq', 1, false);


--
-- Name: users_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_customer_id_seq', 1, false);


--
-- Name: users_customer_shipping_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_customer_shipping_address_id_seq', 1, false);


--
-- Name: users_shippingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_shippingaddress_id_seq', 1, false);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 108, true);


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
-- Name: products_brand products_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_brand
    ADD CONSTRAINT products_brand_pkey PRIMARY KEY (id);


--
-- Name: products_category_brand products_category_brand_category_id_brand_id_8e326425_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_brand
    ADD CONSTRAINT products_category_brand_category_id_brand_id_8e326425_uniq UNIQUE (category_id, brand_id);


--
-- Name: products_category_brand products_category_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_brand
    ADD CONSTRAINT products_category_brand_pkey PRIMARY KEY (id);


--
-- Name: products_category_filter_category products_category_filter_category_id_filtercatego_3e0de7b9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_filter_category
    ADD CONSTRAINT products_category_filter_category_id_filtercatego_3e0de7b9_uniq UNIQUE (category_id, filtercategory_id);


--
-- Name: products_category_filter_category products_category_filter_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_filter_category
    ADD CONSTRAINT products_category_filter_category_pkey PRIMARY KEY (id);


--
-- Name: products_category products_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_pkey PRIMARY KEY (id);


--
-- Name: products_category_price_filter_category products_category_price__category_id_pricefilterc_ef316425_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_price_filter_category
    ADD CONSTRAINT products_category_price__category_id_pricefilterc_ef316425_uniq UNIQUE (category_id, pricefiltercategory_id);


--
-- Name: products_category_price_filter_category products_category_price_filter_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_price_filter_category
    ADD CONSTRAINT products_category_price_filter_category_pkey PRIMARY KEY (id);


--
-- Name: products_filtercategory_properties products_filtercategory__filtercategory_id_filter_98aa11a0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_filtercategory_properties
    ADD CONSTRAINT products_filtercategory__filtercategory_id_filter_98aa11a0_uniq UNIQUE (filtercategory_id, filterproperties_id);


--
-- Name: products_filtercategory products_filtercategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_filtercategory
    ADD CONSTRAINT products_filtercategory_pkey PRIMARY KEY (id);


--
-- Name: products_filtercategory_properties products_filtercategory_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_filtercategory_properties
    ADD CONSTRAINT products_filtercategory_properties_pkey PRIMARY KEY (id);


--
-- Name: products_filterproperties products_filterproperties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_filterproperties
    ADD CONSTRAINT products_filterproperties_pkey PRIMARY KEY (id);


--
-- Name: products_middlepricerange products_middlepricerange_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_middlepricerange
    ADD CONSTRAINT products_middlepricerange_pkey PRIMARY KEY (id);


--
-- Name: products_pricefiltercategory products_pricefiltercategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_pricefiltercategory
    ADD CONSTRAINT products_pricefiltercategory_pkey PRIMARY KEY (id);


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
-- Name: users_billingaddress users_billingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_billingaddress
    ADD CONSTRAINT users_billingaddress_pkey PRIMARY KEY (id);


--
-- Name: users_customer_billing_address users_customer_billing_a_customer_id_billingaddre_268e3a7a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer_billing_address
    ADD CONSTRAINT users_customer_billing_a_customer_id_billingaddre_268e3a7a_uniq UNIQUE (customer_id, billingaddress_id);


--
-- Name: users_customer_billing_address users_customer_billing_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer_billing_address
    ADD CONSTRAINT users_customer_billing_address_pkey PRIMARY KEY (id);


--
-- Name: users_customer users_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer
    ADD CONSTRAINT users_customer_pkey PRIMARY KEY (id);


--
-- Name: users_customer_shipping_address users_customer_shipping__customer_id_shippingaddr_a534859a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer_shipping_address
    ADD CONSTRAINT users_customer_shipping__customer_id_shippingaddr_a534859a_uniq UNIQUE (customer_id, shippingaddress_id);


--
-- Name: users_customer_shipping_address users_customer_shipping_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer_shipping_address
    ADD CONSTRAINT users_customer_shipping_address_pkey PRIMARY KEY (id);


--
-- Name: users_customer users_customer_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer
    ADD CONSTRAINT users_customer_user_id_key UNIQUE (user_id);


--
-- Name: users_shippingaddress users_shippingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_shippingaddress
    ADD CONSTRAINT users_shippingaddress_pkey PRIMARY KEY (id);


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
-- Name: products_category_brand_brand_id_d45cfcda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_brand_brand_id_d45cfcda ON public.products_category_brand USING btree (brand_id);


--
-- Name: products_category_brand_category_id_2f469941; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_brand_category_id_2f469941 ON public.products_category_brand USING btree (category_id);


--
-- Name: products_category_filter_category_category_id_168fc3cc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_filter_category_category_id_168fc3cc ON public.products_category_filter_category USING btree (category_id);


--
-- Name: products_category_filter_category_filtercategory_id_4e1035e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_filter_category_filtercategory_id_4e1035e1 ON public.products_category_filter_category USING btree (filtercategory_id);


--
-- Name: products_category_price_fi_pricefiltercategory_id_bd51b4d6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_price_fi_pricefiltercategory_id_bd51b4d6 ON public.products_category_price_filter_category USING btree (pricefiltercategory_id);


--
-- Name: products_category_price_filter_category_category_id_6ab3ead5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_price_filter_category_category_id_6ab3ead5 ON public.products_category_price_filter_category USING btree (category_id);


--
-- Name: products_filtercategory_properties_filtercategory_id_1d33497f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_filtercategory_properties_filtercategory_id_1d33497f ON public.products_filtercategory_properties USING btree (filtercategory_id);


--
-- Name: products_filtercategory_properties_filterproperties_id_62940e06; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_filtercategory_properties_filterproperties_id_62940e06 ON public.products_filtercategory_properties USING btree (filterproperties_id);


--
-- Name: products_product_brand_id_3e2e8fd1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_product_brand_id_3e2e8fd1 ON public.products_product USING btree (brand_id);


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
-- Name: users_customer_billing_address_billingaddress_id_6df43cc8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_customer_billing_address_billingaddress_id_6df43cc8 ON public.users_customer_billing_address USING btree (billingaddress_id);


--
-- Name: users_customer_billing_address_customer_id_f3f3d29e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_customer_billing_address_customer_id_f3f3d29e ON public.users_customer_billing_address USING btree (customer_id);


--
-- Name: users_customer_shipping_address_customer_id_7fa025b4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_customer_shipping_address_customer_id_7fa025b4 ON public.users_customer_shipping_address USING btree (customer_id);


--
-- Name: users_customer_shipping_address_shippingaddress_id_f378fc53; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_customer_shipping_address_shippingaddress_id_f378fc53 ON public.users_customer_shipping_address USING btree (shippingaddress_id);


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
-- Name: products_category_brand products_category_br_category_id_2f469941_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_brand
    ADD CONSTRAINT products_category_br_category_id_2f469941_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_brand products_category_brand_brand_id_d45cfcda_fk_products_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_brand
    ADD CONSTRAINT products_category_brand_brand_id_d45cfcda_fk_products_brand_id FOREIGN KEY (brand_id) REFERENCES public.products_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_filter_category products_category_fi_category_id_168fc3cc_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_filter_category
    ADD CONSTRAINT products_category_fi_category_id_168fc3cc_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_filter_category products_category_fi_filtercategory_id_4e1035e1_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_filter_category
    ADD CONSTRAINT products_category_fi_filtercategory_id_4e1035e1_fk_products_ FOREIGN KEY (filtercategory_id) REFERENCES public.products_filtercategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_price_filter_category products_category_pr_category_id_6ab3ead5_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_price_filter_category
    ADD CONSTRAINT products_category_pr_category_id_6ab3ead5_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_price_filter_category products_category_pr_pricefiltercategory__bd51b4d6_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_price_filter_category
    ADD CONSTRAINT products_category_pr_pricefiltercategory__bd51b4d6_fk_products_ FOREIGN KEY (pricefiltercategory_id) REFERENCES public.products_pricefiltercategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_filtercategory_properties products_filtercateg_filtercategory_id_1d33497f_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_filtercategory_properties
    ADD CONSTRAINT products_filtercateg_filtercategory_id_1d33497f_fk_products_ FOREIGN KEY (filtercategory_id) REFERENCES public.products_filtercategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_filtercategory_properties products_filtercateg_filterproperties_id_62940e06_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_filtercategory_properties
    ADD CONSTRAINT products_filtercateg_filterproperties_id_62940e06_fk_products_ FOREIGN KEY (filterproperties_id) REFERENCES public.products_filterproperties(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product products_product_brand_id_3e2e8fd1_fk_products_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_brand_id_3e2e8fd1_fk_products_brand_id FOREIGN KEY (brand_id) REFERENCES public.products_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_customer_billing_address users_customer_billi_billingaddress_id_6df43cc8_fk_users_bil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer_billing_address
    ADD CONSTRAINT users_customer_billi_billingaddress_id_6df43cc8_fk_users_bil FOREIGN KEY (billingaddress_id) REFERENCES public.users_billingaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_customer_billing_address users_customer_billi_customer_id_f3f3d29e_fk_users_cus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer_billing_address
    ADD CONSTRAINT users_customer_billi_customer_id_f3f3d29e_fk_users_cus FOREIGN KEY (customer_id) REFERENCES public.users_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_customer_shipping_address users_customer_shipp_customer_id_7fa025b4_fk_users_cus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer_shipping_address
    ADD CONSTRAINT users_customer_shipp_customer_id_7fa025b4_fk_users_cus FOREIGN KEY (customer_id) REFERENCES public.users_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_customer_shipping_address users_customer_shipp_shippingaddress_id_f378fc53_fk_users_shi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer_shipping_address
    ADD CONSTRAINT users_customer_shipp_shippingaddress_id_f378fc53_fk_users_shi FOREIGN KEY (shippingaddress_id) REFERENCES public.users_shippingaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_customer users_customer_user_id_a09bb4be_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_customer
    ADD CONSTRAINT users_customer_user_id_a09bb4be_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


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

