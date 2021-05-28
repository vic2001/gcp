--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

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
-- Name: app_adresse; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_adresse (
    id bigint NOT NULL,
    rue character varying(250) NOT NULL,
    cp character varying(10) NOT NULL,
    ville character varying(100) NOT NULL,
    etage integer,
    comp_adr text,
    enseigne_id bigint,
    client_id bigint,
    tel character varying(10)
);


ALTER TABLE public.app_adresse OWNER TO admin;

--
-- Name: app_adresse_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.app_adresse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_adresse_id_seq OWNER TO admin;

--
-- Name: app_adresse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.app_adresse_id_seq OWNED BY public.app_adresse.id;


--
-- Name: app_article; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_article (
    id bigint NOT NULL,
    designation character varying(100) NOT NULL,
    categorie character varying(100) NOT NULL,
    description text,
    prix double precision NOT NULL,
    photo character varying(100) NOT NULL
);


ALTER TABLE public.app_article OWNER TO admin;

--
-- Name: app_article_enseigne; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_article_enseigne (
    id bigint NOT NULL,
    article_id bigint NOT NULL,
    enseigne_id bigint NOT NULL
);


ALTER TABLE public.app_article_enseigne OWNER TO admin;

--
-- Name: app_article_enseigne_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.app_article_enseigne_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_article_enseigne_id_seq OWNER TO admin;

--
-- Name: app_article_enseigne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.app_article_enseigne_id_seq OWNED BY public.app_article_enseigne.id;


--
-- Name: app_article_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.app_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_article_id_seq OWNER TO admin;

--
-- Name: app_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.app_article_id_seq OWNED BY public.app_article.id;


--
-- Name: app_client; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_client (
    id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.app_client OWNER TO admin;

--
-- Name: app_client_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.app_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_client_id_seq OWNER TO admin;

--
-- Name: app_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.app_client_id_seq OWNED BY public.app_client.id;


--
-- Name: app_commande; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_commande (
    id bigint NOT NULL,
    num_cde character varying(20) NOT NULL,
    date_cde date NOT NULL,
    heure_cde time without time zone NOT NULL,
    client_id bigint NOT NULL,
    enseigne_id bigint NOT NULL
);


ALTER TABLE public.app_commande OWNER TO admin;

--
-- Name: app_commande_articles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_commande_articles (
    id bigint NOT NULL,
    commande_id bigint NOT NULL,
    article_id bigint NOT NULL
);


ALTER TABLE public.app_commande_articles OWNER TO admin;

--
-- Name: app_commande_articles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.app_commande_articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_commande_articles_id_seq OWNER TO admin;

--
-- Name: app_commande_articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.app_commande_articles_id_seq OWNED BY public.app_commande_articles.id;


--
-- Name: app_commande_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.app_commande_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_commande_id_seq OWNER TO admin;

--
-- Name: app_commande_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.app_commande_id_seq OWNED BY public.app_commande.id;


--
-- Name: app_commercant; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_commercant (
    id bigint NOT NULL,
    siret character varying(14) NOT NULL,
    iban character varying(15) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.app_commercant OWNER TO admin;

--
-- Name: app_commercant_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.app_commercant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_commercant_id_seq OWNER TO admin;

--
-- Name: app_commercant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.app_commercant_id_seq OWNED BY public.app_commercant.id;


--
-- Name: app_enseigne; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_enseigne (
    id bigint NOT NULL,
    nom character varying(100) NOT NULL,
    type character varying(100) NOT NULL,
    description text NOT NULL,
    photo character varying(100) NOT NULL
);


ALTER TABLE public.app_enseigne OWNER TO admin;

--
-- Name: app_enseigne_commercant; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_enseigne_commercant (
    id bigint NOT NULL,
    enseigne_id bigint NOT NULL,
    commercant_id bigint NOT NULL
);


ALTER TABLE public.app_enseigne_commercant OWNER TO admin;

--
-- Name: app_enseigne_commercant_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.app_enseigne_commercant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_enseigne_commercant_id_seq OWNER TO admin;

--
-- Name: app_enseigne_commercant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.app_enseigne_commercant_id_seq OWNED BY public.app_enseigne_commercant.id;


--
-- Name: app_enseigne_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.app_enseigne_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_enseigne_id_seq OWNER TO admin;

--
-- Name: app_enseigne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.app_enseigne_id_seq OWNED BY public.app_enseigne.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin;

--
-- Name: app_adresse id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_adresse ALTER COLUMN id SET DEFAULT nextval('public.app_adresse_id_seq'::regclass);


--
-- Name: app_article id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_article ALTER COLUMN id SET DEFAULT nextval('public.app_article_id_seq'::regclass);


--
-- Name: app_article_enseigne id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_article_enseigne ALTER COLUMN id SET DEFAULT nextval('public.app_article_enseigne_id_seq'::regclass);


--
-- Name: app_client id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_client ALTER COLUMN id SET DEFAULT nextval('public.app_client_id_seq'::regclass);


--
-- Name: app_commande id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_commande ALTER COLUMN id SET DEFAULT nextval('public.app_commande_id_seq'::regclass);


--
-- Name: app_commande_articles id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_commande_articles ALTER COLUMN id SET DEFAULT nextval('public.app_commande_articles_id_seq'::regclass);


--
-- Name: app_commercant id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_commercant ALTER COLUMN id SET DEFAULT nextval('public.app_commercant_id_seq'::regclass);


--
-- Name: app_enseigne id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_enseigne ALTER COLUMN id SET DEFAULT nextval('public.app_enseigne_id_seq'::regclass);


--
-- Name: app_enseigne_commercant id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_enseigne_commercant ALTER COLUMN id SET DEFAULT nextval('public.app_enseigne_commercant_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: app_adresse; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_adresse (id, rue, cp, ville, etage, comp_adr, enseigne_id, client_id, tel) FROM stdin;
2	17 rue du Midi	75014	Paris	\N		1	\N	\N
\.


--
-- Data for Name: app_article; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_article (id, designation, categorie, description, prix, photo) FROM stdin;
1	Super tapenade	Menu	La super tapenade	13.5	super_tapenade.jpeg
2	Tapas Blaricon	Entrée	blabla	5	tapas_blaricon.jpeg
3	Cheeseburger	Burgers	notre cheeseburger	3.5	cheese_burger.jpeg
4	Frites	Accompagnement	Nos super frites maison	2	frites.jpeg
\.


--
-- Data for Name: app_article_enseigne; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_article_enseigne (id, article_id, enseigne_id) FROM stdin;
1	1	1
2	2	1
3	3	2
4	4	2
\.


--
-- Data for Name: app_client; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_client (id, user_id) FROM stdin;
\.


--
-- Data for Name: app_commande; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_commande (id, num_cde, date_cde, heure_cde, client_id, enseigne_id) FROM stdin;
\.


--
-- Data for Name: app_commande_articles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_commande_articles (id, commande_id, article_id) FROM stdin;
\.


--
-- Data for Name: app_commercant; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_commercant (id, siret, iban, user_id) FROM stdin;
4	1234	5432	2
5	6789	9876	3
6	L90KI9	FR12345432	5
\.


--
-- Data for Name: app_enseigne; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_enseigne (id, nom, type, description, photo) FROM stdin;
3	Pizzeria Napoli	Pizzeria	Pizza et autres spécialités italiennes	images/pizzeria_napoli.jpeg
2	Magic Burger	Restaurant Burger	Le roi du Burger	images/magic_burger.jpeg
1	La Tapenade	Restaurant	L'équipe du traiteur La Tapenade saura vous conseiller et vous accompagner pour mener à bien vos projets.\r\nDécouvrez notre talent dans l’endroit de votre choix.	images/la_tapenade.jpeg
\.


--
-- Data for Name: app_enseigne_commercant; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.app_enseigne_commercant (id, enseigne_id, commercant_id) FROM stdin;
1	1	4
2	2	5
3	3	6
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add client	1	add_client
2	Can change client	1	change_client
3	Can delete client	1	delete_client
4	Can view client	1	view_client
5	Can add commercant	2	add_commercant
6	Can change commercant	2	change_commercant
7	Can delete commercant	2	delete_commercant
8	Can view commercant	2	view_commercant
9	Can add enseigne	3	add_enseigne
10	Can change enseigne	3	change_enseigne
11	Can delete enseigne	3	delete_enseigne
12	Can view enseigne	3	view_enseigne
13	Can add article	4	add_article
14	Can change article	4	change_article
15	Can delete article	4	delete_article
16	Can view article	4	view_article
17	Can add commande	5	add_commande
18	Can change commande	5	change_commande
19	Can delete commande	5	delete_commande
20	Can view commande	5	view_commande
21	Can add adresse	6	add_adresse
22	Can change adresse	6	change_adresse
23	Can delete adresse	6	delete_adresse
24	Can view adresse	6	view_adresse
25	Can add log entry	7	add_logentry
26	Can change log entry	7	change_logentry
27	Can delete log entry	7	delete_logentry
28	Can view log entry	7	view_logentry
29	Can add permission	8	add_permission
30	Can change permission	8	change_permission
31	Can delete permission	8	delete_permission
32	Can view permission	8	view_permission
33	Can add group	9	add_group
34	Can change group	9	change_group
35	Can delete group	9	delete_group
36	Can view group	9	view_group
37	Can add user	10	add_user
38	Can change user	10	change_user
39	Can delete user	10	delete_user
40	Can view user	10	view_user
41	Can add content type	11	add_contenttype
42	Can change content type	11	change_contenttype
43	Can delete content type	11	delete_contenttype
44	Can view content type	11	view_contenttype
45	Can add session	12	add_session
46	Can change session	12	change_session
47	Can delete session	12	delete_session
48	Can view session	12	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$260000$ZrOtl6bNTS58dIXs9y0cMQ$G+UfK+a+SnldtDhlBhAPzi0+yMnkBkg+jBMLyrIkGp8=	\N	f	Bigchief				f	t	2021-05-26 16:37:52.921611+02
3	pbkdf2_sha256$260000$KTe0uTFP6wIKPFE0N3vrdT$iGQrC6qkXug4rLy72M0eeM3Z7O/3VEhYDA6Ed/97qa8=	\N	f	Alfred75				f	t	2021-05-26 17:14:13.551278+02
1	pbkdf2_sha256$260000$3Zjwv0dCCRwfdpu4PCj9Fu$RcWsG7KtqiK2OKyG1g6dUpHI6d4oirfxYLu1oV7tgF0=	2021-05-27 11:43:09.188206+02	t	admin				t	t	2021-05-26 16:35:55.804449+02
4	pbkdf2_sha256$260000$9W59D2fJ92KjACvQf6ixBa$46fzPZgvmJHLctmgnS7ZlkF8kwSDW1AK6yQFk9NWP80=	2021-05-27 11:48:47.279131+02	t	cecile				t	t	2021-05-27 11:48:04.036703+02
5	pbkdf2_sha256$260000$T40IEZIFSfOTPRWtxxcC4A$sm/i68cbWHHAEJcJJC8yQEMncrxwmrHjhrSbI8vUi64=	\N	f	JojoLeResto				f	t	2021-05-27 11:53:01.187609+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-05-26 16:37:53.111569+02	2	Bigchief	1	[{"added": {}}]	10	1
2	2021-05-26 16:40:53.92222+02	4	Bigchief	1	[{"added": {}}]	2	1
3	2021-05-26 16:41:09.347877+02	4	Bigchief	2	[]	2	1
4	2021-05-26 16:49:16.911488+02	1	La Tapenade	1	[{"added": {}}]	3	1
5	2021-05-26 17:03:29.809129+02	2	Adresse object (2)	1	[{"added": {}}]	6	1
6	2021-05-26 17:08:54.548592+02	1	Article object (1)	1	[{"added": {}}]	4	1
7	2021-05-26 17:12:17.454619+02	2	Tapas Blaricon	1	[{"added": {}}]	4	1
8	2021-05-26 17:14:13.731095+02	3	Alfred75	1	[{"added": {}}]	10	1
9	2021-05-26 17:14:27.504687+02	5	Alfred75	1	[{"added": {}}]	2	1
10	2021-05-26 17:16:38.991298+02	2	Magic Burger	1	[{"added": {}}]	3	1
11	2021-05-26 17:18:00.505417+02	3	Cheeseburger	1	[{"added": {}}]	4	1
12	2021-05-26 17:19:38.480136+02	4	Frites	1	[{"added": {}}]	4	1
13	2021-05-27 11:53:01.364378+02	5	JojoLeResto	1	[{"added": {}}]	10	4
14	2021-05-27 11:53:16.918349+02	6	JojoLeResto	1	[{"added": {}}]	2	4
15	2021-05-27 11:57:00.39598+02	3	Pizzeria Napoli	1	[{"added": {}}]	3	4
16	2021-05-28 09:40:42.760427+02	3	Pizzeria Napoli	2	[{"changed": {"fields": ["Photo"]}}]	3	4
17	2021-05-28 09:41:43.925432+02	2	Magic Burger	2	[{"changed": {"fields": ["Photo"]}}]	3	4
18	2021-05-28 09:43:33.73978+02	1	La Tapenade	2	[{"changed": {"fields": ["Photo"]}}]	3	4
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	app	client
2	app	commercant
3	app	enseigne
4	app	article
5	app	commande
6	app	adresse
7	admin	logentry
8	auth	permission
9	auth	group
10	auth	user
11	contenttypes	contenttype
12	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-05-26 16:35:08.941823+02
2	auth	0001_initial	2021-05-26 16:35:09.124443+02
3	admin	0001_initial	2021-05-26 16:35:09.17384+02
4	admin	0002_logentry_remove_auto_add	2021-05-26 16:35:09.188212+02
5	admin	0003_logentry_add_action_flag_choices	2021-05-26 16:35:09.204681+02
6	contenttypes	0002_remove_content_type_name	2021-05-26 16:35:09.234433+02
7	auth	0002_alter_permission_name_max_length	2021-05-26 16:35:09.24884+02
8	auth	0003_alter_user_email_max_length	2021-05-26 16:35:09.262944+02
9	auth	0004_alter_user_username_opts	2021-05-26 16:35:09.279602+02
10	auth	0005_alter_user_last_login_null	2021-05-26 16:35:09.297116+02
11	auth	0006_require_contenttypes_0002	2021-05-26 16:35:09.301511+02
12	auth	0007_alter_validators_add_error_messages	2021-05-26 16:35:09.313919+02
13	auth	0008_alter_user_username_max_length	2021-05-26 16:35:09.33629+02
14	auth	0009_alter_user_last_name_max_length	2021-05-26 16:35:09.350725+02
15	auth	0010_alter_group_name_max_length	2021-05-26 16:35:09.365002+02
16	auth	0011_update_proxy_permissions	2021-05-26 16:35:09.388572+02
17	auth	0012_alter_user_first_name_max_length	2021-05-26 16:35:09.404575+02
18	sessions	0001_initial	2021-05-26 16:35:09.438215+02
19	app	0001_initial	2021-05-26 16:37:07.937374+02
20	app	0002_auto_20210526_1651	2021-05-26 16:51:25.015931+02
21	app	0003_auto_20210526_1658	2021-05-26 16:58:04.511948+02
22	app	0004_alter_adresse_comp_adr	2021-05-26 17:02:01.915922+02
23	app	0005_alter_adresse_etage	2021-05-26 17:02:57.050791+02
24	app	0006_auto_20210527_0930	2021-05-27 09:30:46.224563+02
25	app	0002_auto_20210527_1140	2021-05-27 11:40:50.302103+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
67x9zgyehikf2simix102x6ue31wkop1	.eJxVjDsOwjAQBe_iGlmx4y8lPWewdr0bHEC2FCcV4u4QKQW0b2beSyTY1pK2zkuaSZyFEqffDSE_uO6A7lBvTeZW12VGuSvyoF1eG_Hzcrh_BwV6-dY6UNbs_YQ-RmtCAIvookZHbDwNDAw4ojPGjNbZwKwiKCLjB1RaT-L9Ae4oOA4:1lludn:qkFIAk3pyL1-Vk5Ra4VdY2InO9hu8aQWCvYglPPP4DQ	2021-06-09 16:36:11.037221+02
fybiofg3ce5fmys3eezfjc4r6xap53co	.eJxVjEEOwiAQRe_C2pBSKAwu3XsGwjCDVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnEWRpx-N4zpwXUHdI_11mRqdV1mlLsiD9rltRE_L4f7d1BiL9_aDy5rqzMpmLQmz9GNWuEQM4weHCRkyJiATHJkJsoIpEz2VrMlpUi8P-SbOFE:1lmCdD:FXBGsffsGzQKWNd41Ro_dpLpglulmlFk3wtuuPz20rM	2021-06-10 11:48:47.282909+02
\.


--
-- Name: app_adresse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.app_adresse_id_seq', 2, true);


--
-- Name: app_article_enseigne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.app_article_enseigne_id_seq', 4, true);


--
-- Name: app_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.app_article_id_seq', 4, true);


--
-- Name: app_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.app_client_id_seq', 1, false);


--
-- Name: app_commande_articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.app_commande_articles_id_seq', 1, false);


--
-- Name: app_commande_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.app_commande_id_seq', 1, false);


--
-- Name: app_commercant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.app_commercant_id_seq', 6, true);


--
-- Name: app_enseigne_commercant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.app_enseigne_commercant_id_seq', 3, true);


--
-- Name: app_enseigne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.app_enseigne_id_seq', 3, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 18, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: app_adresse app_adresse_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_adresse
    ADD CONSTRAINT app_adresse_pkey PRIMARY KEY (id);


--
-- Name: app_article_enseigne app_article_enseigne_article_id_enseigne_id_8332b1f5_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_article_enseigne
    ADD CONSTRAINT app_article_enseigne_article_id_enseigne_id_8332b1f5_uniq UNIQUE (article_id, enseigne_id);


--
-- Name: app_article_enseigne app_article_enseigne_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_article_enseigne
    ADD CONSTRAINT app_article_enseigne_pkey PRIMARY KEY (id);


--
-- Name: app_article app_article_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_article
    ADD CONSTRAINT app_article_pkey PRIMARY KEY (id);


--
-- Name: app_client app_client_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_client
    ADD CONSTRAINT app_client_pkey PRIMARY KEY (id);


--
-- Name: app_client app_client_user_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_client
    ADD CONSTRAINT app_client_user_id_key UNIQUE (user_id);


--
-- Name: app_commande_articles app_commande_articles_commande_id_article_id_415cc955_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_commande_articles
    ADD CONSTRAINT app_commande_articles_commande_id_article_id_415cc955_uniq UNIQUE (commande_id, article_id);


--
-- Name: app_commande_articles app_commande_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_commande_articles
    ADD CONSTRAINT app_commande_articles_pkey PRIMARY KEY (id);


--
-- Name: app_commande app_commande_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_commande
    ADD CONSTRAINT app_commande_pkey PRIMARY KEY (id);


--
-- Name: app_commercant app_commercant_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_commercant
    ADD CONSTRAINT app_commercant_pkey PRIMARY KEY (id);


--
-- Name: app_commercant app_commercant_user_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_commercant
    ADD CONSTRAINT app_commercant_user_id_key UNIQUE (user_id);


--
-- Name: app_enseigne_commercant app_enseigne_commercant_enseigne_id_commercant_id_ef1c8d21_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_enseigne_commercant
    ADD CONSTRAINT app_enseigne_commercant_enseigne_id_commercant_id_ef1c8d21_uniq UNIQUE (enseigne_id, commercant_id);


--
-- Name: app_enseigne_commercant app_enseigne_commercant_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_enseigne_commercant
    ADD CONSTRAINT app_enseigne_commercant_pkey PRIMARY KEY (id);


--
-- Name: app_enseigne app_enseigne_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_enseigne
    ADD CONSTRAINT app_enseigne_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: app_adresse_client_id_ca2a11b3; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX app_adresse_client_id_ca2a11b3 ON public.app_adresse USING btree (client_id);


--
-- Name: app_adresse_enseigne_id_887e546f; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX app_adresse_enseigne_id_887e546f ON public.app_adresse USING btree (enseigne_id);


--
-- Name: app_article_enseigne_article_id_c9a24c87; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX app_article_enseigne_article_id_c9a24c87 ON public.app_article_enseigne USING btree (article_id);


--
-- Name: app_article_enseigne_enseigne_id_f71d25d1; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX app_article_enseigne_enseigne_id_f71d25d1 ON public.app_article_enseigne USING btree (enseigne_id);


--
-- Name: app_commande_articles_article_id_5c0f486e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX app_commande_articles_article_id_5c0f486e ON public.app_commande_articles USING btree (article_id);


--
-- Name: app_commande_articles_commande_id_ebb7c2a0; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX app_commande_articles_commande_id_ebb7c2a0 ON public.app_commande_articles USING btree (commande_id);


--
-- Name: app_commande_client_id_965a2ec0; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX app_commande_client_id_965a2ec0 ON public.app_commande USING btree (client_id);


--
-- Name: app_commande_enseigne_id_7316b9eb; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX app_commande_enseigne_id_7316b9eb ON public.app_commande USING btree (enseigne_id);


--
-- Name: app_enseigne_commercant_commercant_id_b08f9d8a; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX app_enseigne_commercant_commercant_id_b08f9d8a ON public.app_enseigne_commercant USING btree (commercant_id);


--
-- Name: app_enseigne_commercant_enseigne_id_8b9b31e0; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX app_enseigne_commercant_enseigne_id_8b9b31e0 ON public.app_enseigne_commercant USING btree (enseigne_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: app_adresse app_adresse_client_id_ca2a11b3_fk_app_client_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_adresse
    ADD CONSTRAINT app_adresse_client_id_ca2a11b3_fk_app_client_id FOREIGN KEY (client_id) REFERENCES public.app_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_adresse app_adresse_enseigne_id_887e546f_fk_app_enseigne_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_adresse
    ADD CONSTRAINT app_adresse_enseigne_id_887e546f_fk_app_enseigne_id FOREIGN KEY (enseigne_id) REFERENCES public.app_enseigne(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_article_enseigne app_article_enseigne_article_id_c9a24c87_fk_app_article_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_article_enseigne
    ADD CONSTRAINT app_article_enseigne_article_id_c9a24c87_fk_app_article_id FOREIGN KEY (article_id) REFERENCES public.app_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_article_enseigne app_article_enseigne_enseigne_id_f71d25d1_fk_app_enseigne_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_article_enseigne
    ADD CONSTRAINT app_article_enseigne_enseigne_id_f71d25d1_fk_app_enseigne_id FOREIGN KEY (enseigne_id) REFERENCES public.app_enseigne(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_client app_client_user_id_df70f6f4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_client
    ADD CONSTRAINT app_client_user_id_df70f6f4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_commande_articles app_commande_articles_article_id_5c0f486e_fk_app_article_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_commande_articles
    ADD CONSTRAINT app_commande_articles_article_id_5c0f486e_fk_app_article_id FOREIGN KEY (article_id) REFERENCES public.app_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_commande_articles app_commande_articles_commande_id_ebb7c2a0_fk_app_commande_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_commande_articles
    ADD CONSTRAINT app_commande_articles_commande_id_ebb7c2a0_fk_app_commande_id FOREIGN KEY (commande_id) REFERENCES public.app_commande(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_commande app_commande_client_id_965a2ec0_fk_app_client_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_commande
    ADD CONSTRAINT app_commande_client_id_965a2ec0_fk_app_client_id FOREIGN KEY (client_id) REFERENCES public.app_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_commande app_commande_enseigne_id_7316b9eb_fk_app_enseigne_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_commande
    ADD CONSTRAINT app_commande_enseigne_id_7316b9eb_fk_app_enseigne_id FOREIGN KEY (enseigne_id) REFERENCES public.app_enseigne(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_commercant app_commercant_user_id_cbf8e4ba_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_commercant
    ADD CONSTRAINT app_commercant_user_id_cbf8e4ba_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_enseigne_commercant app_enseigne_commerc_commercant_id_b08f9d8a_fk_app_comme; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_enseigne_commercant
    ADD CONSTRAINT app_enseigne_commerc_commercant_id_b08f9d8a_fk_app_comme FOREIGN KEY (commercant_id) REFERENCES public.app_commercant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_enseigne_commercant app_enseigne_commercant_enseigne_id_8b9b31e0_fk_app_enseigne_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_enseigne_commercant
    ADD CONSTRAINT app_enseigne_commercant_enseigne_id_8b9b31e0_fk_app_enseigne_id FOREIGN KEY (enseigne_id) REFERENCES public.app_enseigne(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

