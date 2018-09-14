--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 10.1

-- Started on 2018-09-14 20:40:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 202 (class 1259 OID 20343)
-- Name: adres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE adres (
    id integer NOT NULL,
    miejscowosc character varying(50) NOT NULL,
    kod_pocztowy character varying(6) NOT NULL,
    ulica character varying(50) NOT NULL,
    nr_domu character varying(5) NOT NULL,
    nr_mieszkania character varying(5) DEFAULT '-'::character varying
);


ALTER TABLE adres OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 20341)
-- Name: adres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE adres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adres_id_seq OWNER TO postgres;

--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 201
-- Name: adres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE adres_id_seq OWNED BY adres.id;


--
-- TOC entry 186 (class 1259 OID 20241)
-- Name: dyscyplina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dyscyplina (
    id integer NOT NULL,
    nazwa character varying(50) NOT NULL
);


ALTER TABLE dyscyplina OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 20239)
-- Name: dyscyplina_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dyscyplina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dyscyplina_id_seq OWNER TO postgres;

--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 185
-- Name: dyscyplina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dyscyplina_id_seq OWNED BY dyscyplina.id;


--
-- TOC entry 184 (class 1259 OID 20233)
-- Name: grupa_typu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE grupa_typu (
    id integer NOT NULL,
    nazwa character varying(40) NOT NULL
);


ALTER TABLE grupa_typu OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 20231)
-- Name: grupa_typu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE grupa_typu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grupa_typu_id_seq OWNER TO postgres;

--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 183
-- Name: grupa_typu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE grupa_typu_id_seq OWNED BY grupa_typu.id;


--
-- TOC entry 205 (class 1259 OID 20369)
-- Name: kupon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kupon (
    id bigint NOT NULL,
    uzytkownik_id character varying(30) NOT NULL,
    stawka_calkowita numeric NOT NULL,
    data_kuponu date DEFAULT now() NOT NULL,
    rodzaj_kuponu_id smallint NOT NULL,
    status character varying(20) DEFAULT 'aktywny'::character varying NOT NULL
);


ALTER TABLE kupon OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 20367)
-- Name: kupon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kupon_id_seq OWNER TO postgres;

--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 204
-- Name: kupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kupon_id_seq OWNED BY kupon.id;


--
-- TOC entry 207 (class 1259 OID 20390)
-- Name: kupon_szczegol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kupon_szczegol (
    id bigint NOT NULL,
    kupon_id bigint NOT NULL,
    wariant_id bigint NOT NULL,
    kurs numeric NOT NULL
);


ALTER TABLE kupon_szczegol OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 20388)
-- Name: kupon_szczegol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kupon_szczegol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kupon_szczegol_id_seq OWNER TO postgres;

--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 206
-- Name: kupon_szczegol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kupon_szczegol_id_seq OWNED BY kupon_szczegol.id;


--
-- TOC entry 188 (class 1259 OID 20249)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE region (
    id integer NOT NULL,
    nazwa character varying(50) NOT NULL
);


ALTER TABLE region OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 20247)
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE region_id_seq OWNER TO postgres;

--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 187
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE region_id_seq OWNED BY region.id;


--
-- TOC entry 190 (class 1259 OID 20257)
-- Name: rodzaj_kuponu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rodzaj_kuponu (
    id integer NOT NULL,
    nazwa character varying(20) NOT NULL
);


ALTER TABLE rodzaj_kuponu OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 20255)
-- Name: rodzaj_kuponu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rodzaj_kuponu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rodzaj_kuponu_id_seq OWNER TO postgres;

--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 189
-- Name: rodzaj_kuponu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rodzaj_kuponu_id_seq OWNED BY rodzaj_kuponu.id;


--
-- TOC entry 194 (class 1259 OID 20278)
-- Name: rozgrywki; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rozgrywki (
    id integer NOT NULL,
    nazwa character varying(50) NOT NULL,
    region_id smallint,
    dyscyplina_id smallint
);


ALTER TABLE rozgrywki OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 20276)
-- Name: rozgrywki_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rozgrywki_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rozgrywki_id_seq OWNER TO postgres;

--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 193
-- Name: rozgrywki_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rozgrywki_id_seq OWNED BY rozgrywki.id;


--
-- TOC entry 192 (class 1259 OID 20265)
-- Name: typ_zdarzenia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE typ_zdarzenia (
    id integer NOT NULL,
    nazwa character varying(50) NOT NULL,
    grupa_typu_id smallint
);


ALTER TABLE typ_zdarzenia OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 20263)
-- Name: typ_zdarzenia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE typ_zdarzenia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE typ_zdarzenia_id_seq OWNER TO postgres;

--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 191
-- Name: typ_zdarzenia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE typ_zdarzenia_id_seq OWNED BY typ_zdarzenia.id;


--
-- TOC entry 182 (class 1259 OID 20225)
-- Name: uprawnienia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE uprawnienia (
    id integer NOT NULL,
    nazwa character varying(20) NOT NULL
);


ALTER TABLE uprawnienia OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 20223)
-- Name: uprawnienia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE uprawnienia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE uprawnienia_id_seq OWNER TO postgres;

--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 181
-- Name: uprawnienia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE uprawnienia_id_seq OWNED BY uprawnienia.id;


--
-- TOC entry 203 (class 1259 OID 20349)
-- Name: uzytkownik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE uzytkownik (
    login character varying(30) NOT NULL,
    haslo character varying(30) NOT NULL,
    imie character varying(30) NOT NULL,
    nazwisko character varying(30) NOT NULL,
    e_mail character varying(30) NOT NULL,
    telefon character varying(11) NOT NULL,
    konto numeric DEFAULT 100 NOT NULL,
    adres_id smallint DEFAULT 1 NOT NULL,
    uprawnienia_id smallint DEFAULT 3 NOT NULL
);


ALTER TABLE uzytkownik OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 20327)
-- Name: wariant_zdarzenia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE wariant_zdarzenia (
    id bigint NOT NULL,
    zdarzenie_id bigint NOT NULL,
    nazwa character varying(50) NOT NULL,
    aktualny_kurs numeric NOT NULL,
    status character varying(20) DEFAULT 'aktywne'::character varying NOT NULL
);


ALTER TABLE wariant_zdarzenia OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 20325)
-- Name: wariant_zdarzenia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wariant_zdarzenia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wariant_zdarzenia_id_seq OWNER TO postgres;

--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 199
-- Name: wariant_zdarzenia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wariant_zdarzenia_id_seq OWNED BY wariant_zdarzenia.id;


--
-- TOC entry 196 (class 1259 OID 20296)
-- Name: wydarzenie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE wydarzenie (
    id bigint NOT NULL,
    nazwa character varying(50) NOT NULL,
    data_wydarzenia timestamp without time zone NOT NULL,
    rozgrywki_id integer NOT NULL,
    status character varying(20) DEFAULT 'aktywne'::character varying NOT NULL
);


ALTER TABLE wydarzenie OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 20294)
-- Name: wydarzenie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wydarzenie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wydarzenie_id_seq OWNER TO postgres;

--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 195
-- Name: wydarzenie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wydarzenie_id_seq OWNED BY wydarzenie.id;


--
-- TOC entry 198 (class 1259 OID 20309)
-- Name: zdarzenie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE zdarzenie (
    id bigint NOT NULL,
    typ_zdarzenia_id smallint NOT NULL,
    wydarzenie_id bigint NOT NULL,
    status character varying(20) DEFAULT 'aktywne'::character varying NOT NULL
);


ALTER TABLE zdarzenie OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 20307)
-- Name: zdarzenie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zdarzenie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zdarzenie_id_seq OWNER TO postgres;

--
-- TOC entry 3203 (class 0 OID 0)
-- Dependencies: 197
-- Name: zdarzenie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zdarzenie_id_seq OWNED BY zdarzenie.id;


--
-- TOC entry 2994 (class 2604 OID 20346)
-- Name: adres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adres ALTER COLUMN id SET DEFAULT nextval('adres_id_seq'::regclass);


--
-- TOC entry 2983 (class 2604 OID 20244)
-- Name: dyscyplina id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dyscyplina ALTER COLUMN id SET DEFAULT nextval('dyscyplina_id_seq'::regclass);


--
-- TOC entry 2982 (class 2604 OID 20236)
-- Name: grupa_typu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupa_typu ALTER COLUMN id SET DEFAULT nextval('grupa_typu_id_seq'::regclass);


--
-- TOC entry 2999 (class 2604 OID 20372)
-- Name: kupon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kupon ALTER COLUMN id SET DEFAULT nextval('kupon_id_seq'::regclass);


--
-- TOC entry 3002 (class 2604 OID 20393)
-- Name: kupon_szczegol id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kupon_szczegol ALTER COLUMN id SET DEFAULT nextval('kupon_szczegol_id_seq'::regclass);


--
-- TOC entry 2984 (class 2604 OID 20252)
-- Name: region id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY region ALTER COLUMN id SET DEFAULT nextval('region_id_seq'::regclass);


--
-- TOC entry 2985 (class 2604 OID 20260)
-- Name: rodzaj_kuponu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rodzaj_kuponu ALTER COLUMN id SET DEFAULT nextval('rodzaj_kuponu_id_seq'::regclass);


--
-- TOC entry 2987 (class 2604 OID 20281)
-- Name: rozgrywki id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rozgrywki ALTER COLUMN id SET DEFAULT nextval('rozgrywki_id_seq'::regclass);


--
-- TOC entry 2986 (class 2604 OID 20268)
-- Name: typ_zdarzenia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY typ_zdarzenia ALTER COLUMN id SET DEFAULT nextval('typ_zdarzenia_id_seq'::regclass);


--
-- TOC entry 2981 (class 2604 OID 20228)
-- Name: uprawnienia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY uprawnienia ALTER COLUMN id SET DEFAULT nextval('uprawnienia_id_seq'::regclass);


--
-- TOC entry 2992 (class 2604 OID 20330)
-- Name: wariant_zdarzenia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wariant_zdarzenia ALTER COLUMN id SET DEFAULT nextval('wariant_zdarzenia_id_seq'::regclass);


--
-- TOC entry 2988 (class 2604 OID 20299)
-- Name: wydarzenie id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wydarzenie ALTER COLUMN id SET DEFAULT nextval('wydarzenie_id_seq'::regclass);


--
-- TOC entry 2990 (class 2604 OID 20312)
-- Name: zdarzenie id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zdarzenie ALTER COLUMN id SET DEFAULT nextval('zdarzenie_id_seq'::regclass);


--
-- TOC entry 3179 (class 0 OID 20343)
-- Dependencies: 202
-- Data for Name: adres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO adres VALUES (8, 'Kielce', '25-852', 'Olkuska', '129', '12');
INSERT INTO adres VALUES (6, 'Kolędnicza', '31-999', 'Kolędnicza', '121', '21');
INSERT INTO adres VALUES (3, 'Białystok', '15-571', 'Ostróżki', '11', '31');
INSERT INTO adres VALUES (1, '-', '-', '-', '-', '-');
INSERT INTO adres VALUES (2, 'Krosno', '38-400', 'Grodzka', '302', '-');
INSERT INTO adres VALUES (4, 'Warszawa', '02-968', 'Drewny Łukasza', '82', '-');
INSERT INTO adres VALUES (5, 'Zawiercie', '42-400', 'Okólna', '69', '-');
INSERT INTO adres VALUES (7, 'Łódź', '91-495', 'Zgierska', '123', '-');
INSERT INTO adres VALUES (9, 'Elbląg', '82-300', 'Pl. Słowiański', '33', '-');
INSERT INTO adres VALUES (10, 'Poznań', '61-608', 'Bolka', '98', '-');
INSERT INTO adres VALUES (11, 'Kraków', '38-400', 'Grodzka', '302', '2');
INSERT INTO adres VALUES (12, 'Kraków', '38-400', 'Grodzkiego', '30', '2');


--
-- TOC entry 3163 (class 0 OID 20241)
-- Dependencies: 186
-- Data for Name: dyscyplina; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO dyscyplina VALUES (1, 'Piłka nożna');
INSERT INTO dyscyplina VALUES (2, 'Koszykówka');
INSERT INTO dyscyplina VALUES (3, 'Tenis');
INSERT INTO dyscyplina VALUES (4, 'Hokej');
INSERT INTO dyscyplina VALUES (5, 'Siatkówka');
INSERT INTO dyscyplina VALUES (6, 'Piłka ręczna');
INSERT INTO dyscyplina VALUES (8, 'Boks');
INSERT INTO dyscyplina VALUES (9, 'MMA');
INSERT INTO dyscyplina VALUES (10, 'League of legends');
INSERT INTO dyscyplina VALUES (11, 'Golf');
INSERT INTO dyscyplina VALUES (12, 'Lekkoatletyka');
INSERT INTO dyscyplina VALUES (13, 'Szachy');
INSERT INTO dyscyplina VALUES (14, 'Dota 2');
INSERT INTO dyscyplina VALUES (15, 'Skoki narciarskie');
INSERT INTO dyscyplina VALUES (16, 'Kolarstwo');
INSERT INTO dyscyplina VALUES (17, 'Biegi narciarskie');
INSERT INTO dyscyplina VALUES (18, 'Formuła 1');
INSERT INTO dyscyplina VALUES (19, 'Snooker');
INSERT INTO dyscyplina VALUES (20, 'Futsal');
INSERT INTO dyscyplina VALUES (7, 'Żużel');


--
-- TOC entry 3161 (class 0 OID 20233)
-- Dependencies: 184
-- Data for Name: grupa_typu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO grupa_typu VALUES (2, 'handicap');
INSERT INTO grupa_typu VALUES (3, 'handicap azjatycki');
INSERT INTO grupa_typu VALUES (4, 'suma');
INSERT INTO grupa_typu VALUES (5, 'suma azjatycka');
INSERT INTO grupa_typu VALUES (6, '1. połowa');
INSERT INTO grupa_typu VALUES (8, '2. połowa');
INSERT INTO grupa_typu VALUES (10, 'strzelec bramki');
INSERT INTO grupa_typu VALUES (11, 'dokładny wynik');
INSERT INTO grupa_typu VALUES (12, 'rzuty rożne');
INSERT INTO grupa_typu VALUES (13, 'kartki');
INSERT INTO grupa_typu VALUES (14, 'faule');
INSERT INTO grupa_typu VALUES (15, 'spalone');
INSERT INTO grupa_typu VALUES (16, 'przedział czasowy');
INSERT INTO grupa_typu VALUES (17, 'zakłady specjalne');
INSERT INTO grupa_typu VALUES (18, 'inne');
INSERT INTO grupa_typu VALUES (19, 'zwycięzca');
INSERT INTO grupa_typu VALUES (20, 'zakłady na set');
INSERT INTO grupa_typu VALUES (21, 'kwarty');
INSERT INTO grupa_typu VALUES (22, 'suma drużyny');
INSERT INTO grupa_typu VALUES (7, 'do przerwy/koniec meczu');
INSERT INTO grupa_typu VALUES (24, 'zakłady specjalne - drużyna 2');
INSERT INTO grupa_typu VALUES (1, 'RYNKI GŁÓWNE');
INSERT INTO grupa_typu VALUES (9, 'BRAMKI');
INSERT INTO grupa_typu VALUES (23, 'ZAKŁADY SPECJALNE - DRUŻYNA 1');


--
-- TOC entry 3182 (class 0 OID 20369)
-- Dependencies: 205
-- Data for Name: kupon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO kupon VALUES (21, 'admin', 20.0, '2018-09-14', 2, 'aktywny');
INSERT INTO kupon VALUES (23, 'admin', 11.0, '2018-09-14', 1, 'aktywny');
INSERT INTO kupon VALUES (15, 'Editor1', 2.0, '2018-09-13', 2, 'aktywny');
INSERT INTO kupon VALUES (24, 'admin', 2.0, '2018-09-14', 1, 'aktywny');
INSERT INTO kupon VALUES (10, 'admin', 1.0, '2018-09-13', 2, 'aktywny');
INSERT INTO kupon VALUES (11, 'Editor1', 2.0, '2018-09-13', 2, 'aktywny');
INSERT INTO kupon VALUES (13, 'Editor1', 2.0, '2018-09-13', 2, 'aktywny');
INSERT INTO kupon VALUES (17, 'admin', 2.0, '2018-09-13', 2, 'aktywny');
INSERT INTO kupon VALUES (14, 'Editor1', 1.0, '2018-09-13', 2, 'aktywny');
INSERT INTO kupon VALUES (20, 'admin', 2.0, '2018-09-14', 2, 'aktywny');
INSERT INTO kupon VALUES (12, 'Editor1', 2.0, '2018-09-13', 2, 'aktywny');
INSERT INTO kupon VALUES (18, 'admin', 2.0, '2018-09-13', 2, 'aktywny');
INSERT INTO kupon VALUES (22, 'admin', 3.0, '2018-09-14', 1, 'aktywny');
INSERT INTO kupon VALUES (16, 'Editor1', 1.0, '2018-09-13', 1, 'aktywny');
INSERT INTO kupon VALUES (19, 'Krzychu', 2.0, '2018-09-13', 1, 'aktywny');


--
-- TOC entry 3184 (class 0 OID 20390)
-- Dependencies: 207
-- Data for Name: kupon_szczegol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO kupon_szczegol VALUES (8, 10, 55, 1.99);
INSERT INTO kupon_szczegol VALUES (10, 11, 40, 3.11);
INSERT INTO kupon_szczegol VALUES (11, 11, 33, 2.0);
INSERT INTO kupon_szczegol VALUES (12, 11, 24, 3.5);
INSERT INTO kupon_szczegol VALUES (13, 12, 35, 3.11);
INSERT INTO kupon_szczegol VALUES (14, 12, 36, 2.22);
INSERT INTO kupon_szczegol VALUES (15, 12, 40, 3.11);
INSERT INTO kupon_szczegol VALUES (16, 12, 47, 3.33);
INSERT INTO kupon_szczegol VALUES (17, 12, 49, 1.99);
INSERT INTO kupon_szczegol VALUES (18, 13, 33, 2.0);
INSERT INTO kupon_szczegol VALUES (19, 13, 38, 2.66);
INSERT INTO kupon_szczegol VALUES (20, 14, 32, 1.89);
INSERT INTO kupon_szczegol VALUES (21, 14, 36, 2.22);
INSERT INTO kupon_szczegol VALUES (22, 14, 39, 2.22);
INSERT INTO kupon_szczegol VALUES (23, 14, 43, 1.01);
INSERT INTO kupon_szczegol VALUES (24, 14, 54, 3.78);
INSERT INTO kupon_szczegol VALUES (25, 14, 57, 2.88);
INSERT INTO kupon_szczegol VALUES (26, 14, 29, 3.33);
INSERT INTO kupon_szczegol VALUES (27, 15, 48, 2.22);
INSERT INTO kupon_szczegol VALUES (28, 15, 44, 3.01);
INSERT INTO kupon_szczegol VALUES (29, 15, 35, 3.11);
INSERT INTO kupon_szczegol VALUES (30, 16, 35, 3.11);
INSERT INTO kupon_szczegol VALUES (31, 17, 33, 2.0);
INSERT INTO kupon_szczegol VALUES (32, 17, 37, 3.33);
INSERT INTO kupon_szczegol VALUES (33, 18, 35, 3.11);
INSERT INTO kupon_szczegol VALUES (34, 18, 21, 1.89);
INSERT INTO kupon_szczegol VALUES (35, 18, 53, 3.43);
INSERT INTO kupon_szczegol VALUES (36, 19, 35, 3.11);
INSERT INTO kupon_szczegol VALUES (37, 20, 33, 2.0);
INSERT INTO kupon_szczegol VALUES (38, 20, 53, 3.43);
INSERT INTO kupon_szczegol VALUES (39, 21, 18, 1.31);
INSERT INTO kupon_szczegol VALUES (40, 21, 48, 2.22);
INSERT INTO kupon_szczegol VALUES (41, 22, 31, 2.22);
INSERT INTO kupon_szczegol VALUES (42, 23, 48, 2.22);
INSERT INTO kupon_szczegol VALUES (43, 24, 44, 3.01);


--
-- TOC entry 3165 (class 0 OID 20249)
-- Dependencies: 188
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO region VALUES (1, 'Polska');
INSERT INTO region VALUES (2, 'Niemcy');
INSERT INTO region VALUES (3, 'Rosja');
INSERT INTO region VALUES (4, 'USA');
INSERT INTO region VALUES (5, 'Fracja');
INSERT INTO region VALUES (6, 'Włochy');
INSERT INTO region VALUES (7, 'Wielka Brytania');
INSERT INTO region VALUES (8, 'Japonia');
INSERT INTO region VALUES (9, 'Kanada');
INSERT INTO region VALUES (10, 'Hiszpania');
INSERT INTO region VALUES (11, 'Europa');
INSERT INTO region VALUES (12, 'Australia');
INSERT INTO region VALUES (13, 'Azja');
INSERT INTO region VALUES (14, 'Ameryka Północna');
INSERT INTO region VALUES (15, 'Ameryka Południowa');
INSERT INTO region VALUES (16, 'Świat');
INSERT INTO region VALUES (17, 'Portugalia');
INSERT INTO region VALUES (18, 'Holandia');
INSERT INTO region VALUES (19, 'Belgia');
INSERT INTO region VALUES (20, 'Brazylia');
INSERT INTO region VALUES (21, 'Anglia');


--
-- TOC entry 3167 (class 0 OID 20257)
-- Dependencies: 190
-- Data for Name: rodzaj_kuponu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO rodzaj_kuponu VALUES (1, 'single');
INSERT INTO rodzaj_kuponu VALUES (2, 'combi');
INSERT INTO rodzaj_kuponu VALUES (3, 'system');


--
-- TOC entry 3171 (class 0 OID 20278)
-- Dependencies: 194
-- Data for Name: rozgrywki; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO rozgrywki VALUES (1, 'Lotto Ekstraklasa', 1, 1);
INSERT INTO rozgrywki VALUES (2, 'Nice 1. Liga', 1, 1);
INSERT INTO rozgrywki VALUES (3, '2. Liga', 1, 1);
INSERT INTO rozgrywki VALUES (4, 'LaLiga', 10, 1);
INSERT INTO rozgrywki VALUES (5, 'Serie A', 6, 1);
INSERT INTO rozgrywki VALUES (6, 'Bundesliga', 2, 1);
INSERT INTO rozgrywki VALUES (7, 'Ligue 1', 5, 1);
INSERT INTO rozgrywki VALUES (8, 'Premier League', 21, 1);
INSERT INTO rozgrywki VALUES (9, 'Liga Mistrzów', 11, 1);
INSERT INTO rozgrywki VALUES (10, 'Liga Europy', 11, 1);
INSERT INTO rozgrywki VALUES (13, 'US Open', 4, 3);
INSERT INTO rozgrywki VALUES (14, 'Final Six Liga Narodów', 16, 5);
INSERT INTO rozgrywki VALUES (15, 'Tour de France', 5, 16);
INSERT INTO rozgrywki VALUES (16, 'Vuelta a Espana', 10, 16);
INSERT INTO rozgrywki VALUES (11, 'Puchar Świata', 16, 15);
INSERT INTO rozgrywki VALUES (17, 'Mistrzostwa Europy Kobiet', 11, 6);
INSERT INTO rozgrywki VALUES (18, 'Mistrzostwa Świata', 16, 7);
INSERT INTO rozgrywki VALUES (19, 'UFC', 16, 9);
INSERT INTO rozgrywki VALUES (20, 'Liga Kontynentalna', 3, 4);
INSERT INTO rozgrywki VALUES (21, 'AHL', 14, 4);
INSERT INTO rozgrywki VALUES (22, 'Liga ACB', 10, 2);
INSERT INTO rozgrywki VALUES (23, 'Mistrzostwa Świata', 16, 18);
INSERT INTO rozgrywki VALUES (24, 'Mistrzostwa Świata', 16, 1);
INSERT INTO rozgrywki VALUES (25, 'Liga Narodów', 11, 1);
INSERT INTO rozgrywki VALUES (12, 'NBA', 4, 2);
INSERT INTO rozgrywki VALUES (26, 'NHL', 14, 4);


--
-- TOC entry 3169 (class 0 OID 20265)
-- Dependencies: 192
-- Data for Name: typ_zdarzenia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO typ_zdarzenia VALUES (4, 'obie drużyny strzelą', 1);
INSERT INTO typ_zdarzenia VALUES (5, 'handicap 3-drogowo', 2);
INSERT INTO typ_zdarzenia VALUES (6, 'handicap azjatycki', 3);
INSERT INTO typ_zdarzenia VALUES (7, 'liczba bramek (przedział)', 4);
INSERT INTO typ_zdarzenia VALUES (8, 'dokładna liczba goli', 4);
INSERT INTO typ_zdarzenia VALUES (9, 'azjatycka liczba goli', 5);
INSERT INTO typ_zdarzenia VALUES (10, '1. połowa - zwycięzca', 6);
INSERT INTO typ_zdarzenia VALUES (11, '1. połowa - podwójna szansa', 6);
INSERT INTO typ_zdarzenia VALUES (12, '1. połowa - liczba bramek', 6);
INSERT INTO typ_zdarzenia VALUES (13, '1. połowa - handicap', 6);
INSERT INTO typ_zdarzenia VALUES (14, '1. połowa - obie strzelą', 6);
INSERT INTO typ_zdarzenia VALUES (15, 'do przerwy/koniec meczu - wynik', 7);
INSERT INTO typ_zdarzenia VALUES (16, 'do przerwy/koniec meczu - podwójna szansa', 7);
INSERT INTO typ_zdarzenia VALUES (17, '2. połowa - zwycięzca', 8);
INSERT INTO typ_zdarzenia VALUES (18, '2. połowa - podwójna szansa', 8);
INSERT INTO typ_zdarzenia VALUES (19, '2. połowa - liczba bramek', 8);
INSERT INTO typ_zdarzenia VALUES (20, '2. połowa - handicap', 8);
INSERT INTO typ_zdarzenia VALUES (21, '2. połowa - obie strzelą', 8);
INSERT INTO typ_zdarzenia VALUES (22, 'pierwsza druzyna, która zdobędzie gola', 9);
INSERT INTO typ_zdarzenia VALUES (23, 'gol w pierwszej połowie', 9);
INSERT INTO typ_zdarzenia VALUES (24, 'połowa z większą liczbą goli', 9);
INSERT INTO typ_zdarzenia VALUES (25, 'gol w drugiej połowie', 9);
INSERT INTO typ_zdarzenia VALUES (26, 'gole w obu połowach', 9);
INSERT INTO typ_zdarzenia VALUES (27, 'obydwie drużyny strzelą gola w obydwu połowach', 9);
INSERT INTO typ_zdarzenia VALUES (28, 'Robert Lewandowski', 10);
INSERT INTO typ_zdarzenia VALUES (29, 'Arkadiusz Milik', 10);
INSERT INTO typ_zdarzenia VALUES (30, 'Kamil Grosicki', 10);
INSERT INTO typ_zdarzenia VALUES (31, 'Sadio Mane', 10);
INSERT INTO typ_zdarzenia VALUES (32, 'Piotr Zieliński', 10);
INSERT INTO typ_zdarzenia VALUES (33, 'Grzegorz Krychowiak', 10);
INSERT INTO typ_zdarzenia VALUES (34, 'Łukasz Teodorczyk', 10);
INSERT INTO typ_zdarzenia VALUES (35, 'Edinson Cavani', 10);
INSERT INTO typ_zdarzenia VALUES (36, 'Luis Suarez', 10);
INSERT INTO typ_zdarzenia VALUES (37, 'Cristiano Ronaldo', 10);
INSERT INTO typ_zdarzenia VALUES (38, 'Lionel Messi', 10);
INSERT INTO typ_zdarzenia VALUES (39, 'dokładny wynik', 11);
INSERT INTO typ_zdarzenia VALUES (40, '1. połowa - dokładny wynik', 11);
INSERT INTO typ_zdarzenia VALUES (41, '2. połowa - dokładny wynik', 11);
INSERT INTO typ_zdarzenia VALUES (42, 'wynik - kombinacje', 11);
INSERT INTO typ_zdarzenia VALUES (43, 'rzuty rożne - wynik', 12);
INSERT INTO typ_zdarzenia VALUES (44, 'liczba rzutów rożnych', 12);
INSERT INTO typ_zdarzenia VALUES (45, 'rzuty rożne - 1. połowa', 12);
INSERT INTO typ_zdarzenia VALUES (46, 'rzuty rożne - 2. połowa', 12);
INSERT INTO typ_zdarzenia VALUES (47, 'żółte kartki - suma', 13);
INSERT INTO typ_zdarzenia VALUES (48, 'czerwona kartka', 13);
INSERT INTO typ_zdarzenia VALUES (49, 'żółte kartki - wynik', 13);
INSERT INTO typ_zdarzenia VALUES (51, 'liczba fauli', 14);
INSERT INTO typ_zdarzenia VALUES (50, 'faule - wynik', 14);
INSERT INTO typ_zdarzenia VALUES (52, 'spalone - wynik', 15);
INSERT INTO typ_zdarzenia VALUES (53, 'liczba spalonych', 15);
INSERT INTO typ_zdarzenia VALUES (54, 'zwycięzca: 1-15min.', 16);
INSERT INTO typ_zdarzenia VALUES (55, 'zwycięzca: 1-30min.', 16);
INSERT INTO typ_zdarzenia VALUES (56, 'zwycięzca: 1-60min.', 16);
INSERT INTO typ_zdarzenia VALUES (57, 'zwycięzca: 1-75min.', 16);
INSERT INTO typ_zdarzenia VALUES (58, 'gol: 1-15min.', 16);
INSERT INTO typ_zdarzenia VALUES (59, 'gol: 16-30min.', 16);
INSERT INTO typ_zdarzenia VALUES (60, 'gol: 31-45+min.', 16);
INSERT INTO typ_zdarzenia VALUES (61, 'gol: 46-60min.', 16);
INSERT INTO typ_zdarzenia VALUES (62, 'gol: 61-75min.', 16);
INSERT INTO typ_zdarzenia VALUES (63, 'gol: 76-90+min.', 16);
INSERT INTO typ_zdarzenia VALUES (64, 'mix szans', 17);
INSERT INTO typ_zdarzenia VALUES (65, 'wynik i onie strzelą', 17);
INSERT INTO typ_zdarzenia VALUES (66, 'wynik i liczba bramek 1.5', 17);
INSERT INTO typ_zdarzenia VALUES (67, 'wynik i liczba bramek 2.5', 17);
INSERT INTO typ_zdarzenia VALUES (68, 'rzut karny', 17);
INSERT INTO typ_zdarzenia VALUES (69, 'bramka samobójcza', 17);
INSERT INTO typ_zdarzenia VALUES (70, 'nagi kibic na boisku', 18);
INSERT INTO typ_zdarzenia VALUES (71, 'strzały obroniowe - suma', 18);
INSERT INTO typ_zdarzenia VALUES (73, 'drużyna 1 - wygra do zera', 23);
INSERT INTO typ_zdarzenia VALUES (74, 'drużyna 1 - wygra obie połowy', 23);
INSERT INTO typ_zdarzenia VALUES (75, 'drużyna 2 - liczba goli', 24);
INSERT INTO typ_zdarzenia VALUES (76, 'drużyna 2 - wygra do zera', 24);
INSERT INTO typ_zdarzenia VALUES (77, 'drużyna 2 - wygra obie połowy', 24);
INSERT INTO typ_zdarzenia VALUES (3, 'LICZBA GOLI', 1);
INSERT INTO typ_zdarzenia VALUES (2, 'PODWÓJNA SZANSA', 1);
INSERT INTO typ_zdarzenia VALUES (1, 'ZWYCIĘZCA MECZU', 1);
INSERT INTO typ_zdarzenia VALUES (72, 'DRUŻYNA 1 - LICZBA GOLI', 23);


--
-- TOC entry 3159 (class 0 OID 20225)
-- Dependencies: 182
-- Data for Name: uprawnienia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO uprawnienia VALUES (1, 'Admin');
INSERT INTO uprawnienia VALUES (2, 'Editor');
INSERT INTO uprawnienia VALUES (3, 'Player');


--
-- TOC entry 3180 (class 0 OID 20349)
-- Dependencies: 203
-- Data for Name: uzytkownik; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO uzytkownik VALUES ('Dal', 'Laaa', 'Laaa', 'Laa', 'maaa@o2.pl', '123456789', 100, 1, 3);
INSERT INTO uzytkownik VALUES ('admin', 'admin', 'Bartek', 'Zając', 'goracytyp11@kroliczek.pl', '666666666', 1000, 12, 1);
INSERT INTO uzytkownik VALUES ('Editor1', 'Editor1', 'Edyta', 'Kilar', 'helooo@hej.pl', '987789987', 100, 5, 2);
INSERT INTO uzytkownik VALUES ('Krzychu', '12345', 'Krzysztof', 'Nowak', 'cris@o2.pl', '321412567', 100, 4, 3);
INSERT INTO uzytkownik VALUES ('mma', 'mma', 'Mat', 'Mat', 'mat@o2.pl', '111111111', 100, 2, 1);
INSERT INTO uzytkownik VALUES ('Nan', '1234', 'Mati', 'Guz', 'mak@o2.pl', '666444555', 100, 1, 3);


--
-- TOC entry 3177 (class 0 OID 20327)
-- Dependencies: 200
-- Data for Name: wariant_zdarzenia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO wariant_zdarzenia VALUES (8, 34, 'Włochy', 1.87, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (9, 34, 'Remis', 3.15, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (10, 34, 'Polska', 4.05, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (13, 35, 'Drużyna 1 lub Drużyna 2', 1.27, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (14, 35, 'Druzyna 2 lub remis', 1.74, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (12, 35, 'Drużyna 1 lub remis', 1.18, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (15, 42, 'Powyżej (1.5)', 2.18, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (16, 42, 'Poniżej (1.5)', 1.52, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (3, 1, 'Senegal', 3.25, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (20, 37, 'Powyżej (2.5)', 1.98, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (21, 37, 'Poniżej (2.5)', 1.89, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (22, 45, 'Polska', 2.00, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (23, 45, 'Remis', 3.00, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (24, 45, 'Niemcy', 3.50, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (25, 48, 'Niemcy', 2.00, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (31, 54, 'Kolumbia', 2.22, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (19, 36, 'Poniżej (1.5)', 2.50, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (26, 48, 'Remis', 3.00, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (27, 48, 'Włochy', 3.55, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (28, 54, 'Polska', 2.12, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (29, 54, 'Remis', 3.33, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (32, 60, 'Zagłębie Lubin', 1.89, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (33, 60, 'Remis', 2.00, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (36, 63, 'Jagiellonia Białystok', 2.22, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (37, 63, 'Remis', 3.33, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (38, 63, 'Cracovia', 2.66, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (39, 67, 'Wisła Płock', 2.22, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (40, 67, 'Remis', 3.11, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (42, 67, 'Miedź Legnica', 3.34, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (43, 70, 'Wisła Kraków', 1.01, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (45, 70, 'Lechia Gdańsk', 151.00, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (46, 76, 'Legia Warszawa', 2.22, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (47, 76, 'Remis ', 3.33, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (49, 81, 'GKS Katowice', 1.99, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (50, 81, 'Remis', 3.11, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (51, 81, 'Odra Opole', 4.34, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (52, 82, 'Stal Mielec', 1.98, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (53, 82, 'Remis', 3.43, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (54, 82, 'Wigry Suwałki', 3.78, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (55, 83, 'Radomiak Radom', 1.99, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (56, 83, 'Remis', 3.21, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (57, 83, 'Resovia Rzeszów', 2.88, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (58, 85, 'Chicago Bulls', 1.79, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (59, 85, 'New Orleans Pelicans', 1.98, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (60, 86, 'Philadelhia 76ers', 1.64, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (61, 86, 'Orlando Magic', 2.11, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (62, 87, 'Charlotte Hornets', 1.43, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (63, 87, 'Boston Celtics', 3.11, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (65, 90, 'Kamil Stoch', 1.60, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (67, 90, 'Daniel Andre Tande', 4.50, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (68, 90, 'Piotr Żyła', 9.00, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (66, 90, 'Stefan Kraft', 2.10, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (70, 91, 'Stefan Kraft', 2.10, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (71, 91, 'Daniel Andre Tande', 4.50, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (69, 91, 'Kamil Stoch', 1.60, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (35, 60, 'Śląsk Wrocław', 3.11, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (18, 36, 'Powyżej (1.5)', 1.31, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (48, 76, 'Lech Poznań', 2.22, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (44, 70, 'Remis', 3.01, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (1, 1, 'Polska', 2.35, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (2, 1, 'Remis', 3.20, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (5, 2, 'Drużyna 1 lub remis', 1.31, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (6, 2, 'Drużyna 1 lub Drużyna 2', 1.32, 'aktywne');
INSERT INTO wariant_zdarzenia VALUES (7, 2, 'Drużyna 2 lub remis', 1.54, 'aktywne');


--
-- TOC entry 3173 (class 0 OID 20296)
-- Dependencies: 196
-- Data for Name: wydarzenie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO wydarzenie VALUES (7, 'Zagłębie Lubin - Śląsk Wrocław', '2018-09-14 18:00:00', 1, 'aktywne');
INSERT INTO wydarzenie VALUES (10, 'Wisła Płock - Miedź Legnica', '2018-09-15 15:30:00', 1, 'aktywne');
INSERT INTO wydarzenie VALUES (11, 'Wisła Kraków - Lechia Gdańsk', '2018-09-15 20:30:00', 1, 'aktywne');
INSERT INTO wydarzenie VALUES (8, 'Jagiellonia Białystok - Cracovia', '2018-09-14 20:30:00', 1, 'aktywne');
INSERT INTO wydarzenie VALUES (15, 'GKS Katowice - Odra Opole', '2018-09-18 12:45:00', 2, 'aktywne');
INSERT INTO wydarzenie VALUES (16, 'Stal Mielec - Wigry Suwałki', '2018-09-19 19:00:00', 2, 'aktywne');
INSERT INTO wydarzenie VALUES (17, 'Radomiak Radom - Resovia Rzeszów', '2018-09-22 16:00:00', 3, 'aktywne');
INSERT INTO wydarzenie VALUES (14, 'Legia Warszawa - Lech Poznań', '2018-09-16 18:00:00', 1, 'aktywne');
INSERT INTO wydarzenie VALUES (18, 'Chicago Bulls - New Orleans Pelicans', '2018-10-01 01:00:00', 12, 'aktywne');
INSERT INTO wydarzenie VALUES (19, 'Philadelhia 76ers - Orlando Magic', '2018-10-02 01:00:00', 12, 'aktywne');
INSERT INTO wydarzenie VALUES (20, 'Charlotte Hornets - Boston Celtics', '2018-09-29 01:00:00', 12, 'aktywne');
INSERT INTO wydarzenie VALUES (21, 'Puchar Świata w Zakopanem', '2019-01-24 17:00:00', 11, 'aktywne');
INSERT INTO wydarzenie VALUES (22, 'Puchar Świata w Obersdorfie', '2018-12-30 15:30:00', 11, 'aktywne');
INSERT INTO wydarzenie VALUES (2, 'Niemcy - Włochy', '2019-03-03 18:20:00', 25, 'aktywne');
INSERT INTO wydarzenie VALUES (1, 'Polska - Niemcy', '2018-09-18 20:25:00', 25, 'aktywne');
INSERT INTO wydarzenie VALUES (4, 'Polska - Kolumbia', '2018-06-24 20:00:00', 24, 'aktywne');
INSERT INTO wydarzenie VALUES (3, 'Polska - Senegal', '2018-06-19 17:00:00', 24, 'aktywne');
INSERT INTO wydarzenie VALUES (6, 'Włochy - Polska', '2018-09-07 20:45:00', 25, 'aktywne');


--
-- TOC entry 3175 (class 0 OID 20309)
-- Dependencies: 198
-- Data for Name: zdarzenie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO zdarzenie VALUES (1, 1, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (2, 2, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (3, 3, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (4, 3, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (5, 3, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (6, 3, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (7, 3, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (8, 3, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (9, 4, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (10, 5, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (11, 5, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (12, 5, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (13, 5, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (14, 6, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (16, 6, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (17, 6, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (19, 6, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (20, 6, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (21, 7, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (23, 8, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (24, 9, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (25, 9, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (26, 9, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (27, 9, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (28, 10, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (29, 11, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (30, 12, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (31, 12, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (32, 12, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (33, 14, 3, 'aktywne');
INSERT INTO zdarzenie VALUES (34, 1, 6, 'aktywne');
INSERT INTO zdarzenie VALUES (35, 2, 6, 'aktywne');
INSERT INTO zdarzenie VALUES (36, 3, 6, 'aktywne');
INSERT INTO zdarzenie VALUES (37, 3, 6, 'aktywne');
INSERT INTO zdarzenie VALUES (38, 4, 6, 'aktywne');
INSERT INTO zdarzenie VALUES (39, 6, 6, 'aktywne');
INSERT INTO zdarzenie VALUES (40, 6, 6, 'aktywne');
INSERT INTO zdarzenie VALUES (41, 6, 6, 'aktywne');
INSERT INTO zdarzenie VALUES (42, 72, 6, 'aktywne');
INSERT INTO zdarzenie VALUES (43, 75, 6, 'aktywne');
INSERT INTO zdarzenie VALUES (44, 39, 6, 'aktywne');
INSERT INTO zdarzenie VALUES (45, 1, 1, 'aktywne');
INSERT INTO zdarzenie VALUES (48, 1, 2, 'aktywne');
INSERT INTO zdarzenie VALUES (54, 1, 4, 'aktywne');
INSERT INTO zdarzenie VALUES (60, 1, 7, 'aktywne');
INSERT INTO zdarzenie VALUES (63, 1, 8, 'aktywne');
INSERT INTO zdarzenie VALUES (67, 1, 10, 'aktywne');
INSERT INTO zdarzenie VALUES (70, 1, 11, 'aktywne');
INSERT INTO zdarzenie VALUES (76, 1, 14, 'aktywne');
INSERT INTO zdarzenie VALUES (81, 1, 15, 'aktywne');
INSERT INTO zdarzenie VALUES (82, 1, 16, 'aktywne');
INSERT INTO zdarzenie VALUES (83, 1, 17, 'aktywne');
INSERT INTO zdarzenie VALUES (85, 1, 18, 'aktywne');
INSERT INTO zdarzenie VALUES (86, 1, 19, 'aktywne');
INSERT INTO zdarzenie VALUES (87, 1, 20, 'aktywne');
INSERT INTO zdarzenie VALUES (90, 1, 21, 'aktywne');
INSERT INTO zdarzenie VALUES (91, 1, 22, 'aktywne');


--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 201
-- Name: adres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('adres_id_seq', 12, true);


--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 185
-- Name: dyscyplina_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dyscyplina_id_seq', 20, true);


--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 183
-- Name: grupa_typu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('grupa_typu_id_seq', 24, true);


--
-- TOC entry 3207 (class 0 OID 0)
-- Dependencies: 204
-- Name: kupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kupon_id_seq', 24, true);


--
-- TOC entry 3208 (class 0 OID 0)
-- Dependencies: 206
-- Name: kupon_szczegol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kupon_szczegol_id_seq', 43, true);


--
-- TOC entry 3209 (class 0 OID 0)
-- Dependencies: 187
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('region_id_seq', 21, true);


--
-- TOC entry 3210 (class 0 OID 0)
-- Dependencies: 189
-- Name: rodzaj_kuponu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rodzaj_kuponu_id_seq', 3, true);


--
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 193
-- Name: rozgrywki_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rozgrywki_id_seq', 26, true);


--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 191
-- Name: typ_zdarzenia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('typ_zdarzenia_id_seq', 77, true);


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 181
-- Name: uprawnienia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('uprawnienia_id_seq', 3, true);


--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 199
-- Name: wariant_zdarzenia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wariant_zdarzenia_id_seq', 71, true);


--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 195
-- Name: wydarzenie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wydarzenie_id_seq', 22, true);


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 197
-- Name: zdarzenie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('zdarzenie_id_seq', 46, true);


--
-- TOC entry 3024 (class 2606 OID 20348)
-- Name: adres pk_adres; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adres
    ADD CONSTRAINT pk_adres PRIMARY KEY (id);


--
-- TOC entry 3008 (class 2606 OID 20246)
-- Name: dyscyplina pk_dyscyplina; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dyscyplina
    ADD CONSTRAINT pk_dyscyplina PRIMARY KEY (id);


--
-- TOC entry 3006 (class 2606 OID 20238)
-- Name: grupa_typu pk_grupa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupa_typu
    ADD CONSTRAINT pk_grupa PRIMARY KEY (id);


--
-- TOC entry 3028 (class 2606 OID 20377)
-- Name: kupon pk_kupon; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kupon
    ADD CONSTRAINT pk_kupon PRIMARY KEY (id);


--
-- TOC entry 3030 (class 2606 OID 20398)
-- Name: kupon_szczegol pk_kupon_szcz; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kupon_szczegol
    ADD CONSTRAINT pk_kupon_szcz PRIMARY KEY (id);


--
-- TOC entry 3010 (class 2606 OID 20254)
-- Name: region pk_region; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY region
    ADD CONSTRAINT pk_region PRIMARY KEY (id);


--
-- TOC entry 3012 (class 2606 OID 20262)
-- Name: rodzaj_kuponu pk_rodzaj; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rodzaj_kuponu
    ADD CONSTRAINT pk_rodzaj PRIMARY KEY (id);


--
-- TOC entry 3016 (class 2606 OID 20283)
-- Name: rozgrywki pk_rozgrywki; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rozgrywki
    ADD CONSTRAINT pk_rozgrywki PRIMARY KEY (id);


--
-- TOC entry 3014 (class 2606 OID 20270)
-- Name: typ_zdarzenia pk_typ; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY typ_zdarzenia
    ADD CONSTRAINT pk_typ PRIMARY KEY (id);


--
-- TOC entry 3004 (class 2606 OID 20230)
-- Name: uprawnienia pk_uprawnienia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY uprawnienia
    ADD CONSTRAINT pk_uprawnienia PRIMARY KEY (id);


--
-- TOC entry 3026 (class 2606 OID 20356)
-- Name: uzytkownik pk_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY uzytkownik
    ADD CONSTRAINT pk_user PRIMARY KEY (login);


--
-- TOC entry 3022 (class 2606 OID 20335)
-- Name: wariant_zdarzenia pk_wariant; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wariant_zdarzenia
    ADD CONSTRAINT pk_wariant PRIMARY KEY (id);


--
-- TOC entry 3018 (class 2606 OID 20301)
-- Name: wydarzenie pk_wydarzenie; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wydarzenie
    ADD CONSTRAINT pk_wydarzenie PRIMARY KEY (id);


--
-- TOC entry 3020 (class 2606 OID 20314)
-- Name: zdarzenie pk_zdarzenie; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zdarzenie
    ADD CONSTRAINT pk_zdarzenie PRIMARY KEY (id);


--
-- TOC entry 3041 (class 2606 OID 20383)
-- Name: kupon kupon_rodzaj_kuponu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kupon
    ADD CONSTRAINT kupon_rodzaj_kuponu_id_fkey FOREIGN KEY (rodzaj_kuponu_id) REFERENCES rodzaj_kuponu(id);


--
-- TOC entry 3042 (class 2606 OID 20399)
-- Name: kupon_szczegol kupon_szczegol_kupon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kupon_szczegol
    ADD CONSTRAINT kupon_szczegol_kupon_id_fkey FOREIGN KEY (kupon_id) REFERENCES kupon(id);


--
-- TOC entry 3043 (class 2606 OID 20404)
-- Name: kupon_szczegol kupon_szczegol_wariant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kupon_szczegol
    ADD CONSTRAINT kupon_szczegol_wariant_id_fkey FOREIGN KEY (wariant_id) REFERENCES wariant_zdarzenia(id);


--
-- TOC entry 3040 (class 2606 OID 20378)
-- Name: kupon kupon_uzytkownik_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kupon
    ADD CONSTRAINT kupon_uzytkownik_id_fkey FOREIGN KEY (uzytkownik_id) REFERENCES uzytkownik(login);


--
-- TOC entry 3033 (class 2606 OID 20289)
-- Name: rozgrywki rozgrywki_dyscyplina_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rozgrywki
    ADD CONSTRAINT rozgrywki_dyscyplina_id_fkey FOREIGN KEY (dyscyplina_id) REFERENCES dyscyplina(id);


--
-- TOC entry 3032 (class 2606 OID 20284)
-- Name: rozgrywki rozgrywki_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rozgrywki
    ADD CONSTRAINT rozgrywki_region_id_fkey FOREIGN KEY (region_id) REFERENCES region(id);


--
-- TOC entry 3031 (class 2606 OID 20271)
-- Name: typ_zdarzenia typ_zdarzenia_grupa_typu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY typ_zdarzenia
    ADD CONSTRAINT typ_zdarzenia_grupa_typu_id_fkey FOREIGN KEY (grupa_typu_id) REFERENCES grupa_typu(id);


--
-- TOC entry 3038 (class 2606 OID 20357)
-- Name: uzytkownik uzytkownik_adres_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY uzytkownik
    ADD CONSTRAINT uzytkownik_adres_id_fkey FOREIGN KEY (adres_id) REFERENCES adres(id);


--
-- TOC entry 3039 (class 2606 OID 20362)
-- Name: uzytkownik uzytkownik_uprawnienia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY uzytkownik
    ADD CONSTRAINT uzytkownik_uprawnienia_id_fkey FOREIGN KEY (uprawnienia_id) REFERENCES uprawnienia(id);


--
-- TOC entry 3037 (class 2606 OID 20336)
-- Name: wariant_zdarzenia wariant_zdarzenia_zdarzenie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wariant_zdarzenia
    ADD CONSTRAINT wariant_zdarzenia_zdarzenie_id_fkey FOREIGN KEY (zdarzenie_id) REFERENCES zdarzenie(id);


--
-- TOC entry 3034 (class 2606 OID 20302)
-- Name: wydarzenie wydarzenie_rozgrywki_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wydarzenie
    ADD CONSTRAINT wydarzenie_rozgrywki_id_fkey FOREIGN KEY (rozgrywki_id) REFERENCES rozgrywki(id);


--
-- TOC entry 3035 (class 2606 OID 20315)
-- Name: zdarzenie zdarzenie_typ_zdarzenia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zdarzenie
    ADD CONSTRAINT zdarzenie_typ_zdarzenia_id_fkey FOREIGN KEY (typ_zdarzenia_id) REFERENCES typ_zdarzenia(id);


--
-- TOC entry 3036 (class 2606 OID 20320)
-- Name: zdarzenie zdarzenie_wydarzenie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zdarzenie
    ADD CONSTRAINT zdarzenie_wydarzenie_id_fkey FOREIGN KEY (wydarzenie_id) REFERENCES wydarzenie(id);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-09-14 20:41:13

--
-- PostgreSQL database dump complete
--

