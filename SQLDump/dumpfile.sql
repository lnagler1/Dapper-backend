--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: city; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.city (
    id bigint NOT NULL,
    name character varying(255),
    state_id bigint
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.city_id_seq OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.country (
    id bigint NOT NULL,
    name character varying(255),
    iso character varying(255)
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.country_id_seq OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- Name: gender; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.gender (
    id bigint NOT NULL,
    is_binary boolean NOT NULL,
    name character varying(255)
);


ALTER TABLE public.gender OWNER TO postgres;

--
-- Name: gender_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.gender_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gender_id_seq OWNER TO postgres;

--
-- Name: gender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.gender_id_seq OWNED BY public.gender.id;


--
-- Name: icon; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.icon (
    id bigint NOT NULL,
    path character varying(255),
    interest_id bigint
);


ALTER TABLE public.icon OWNER TO postgres;

--
-- Name: icon_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.icon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.icon_id_seq OWNER TO postgres;

--
-- Name: icon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.icon_id_seq OWNED BY public.icon.id;


--
-- Name: image; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.image (
    id bigint NOT NULL,
    path character varying(255),
    user_id bigint
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.image_id_seq OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- Name: interests; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.interests (
    id bigint NOT NULL,
    name character varying(255),
    icon_id bigint
);


ALTER TABLE public.interests OWNER TO postgres;

--
-- Name: interests_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.interests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.interests_id_seq OWNER TO postgres;

--
-- Name: interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.interests_id_seq OWNED BY public.interests.id;


--
-- Name: interests_users; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.interests_users (
    interest_id bigint NOT NULL,
    users_id bigint NOT NULL
);


ALTER TABLE public.interests_users OWNER TO postgres;

--
-- Name: like_user; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.like_user (
    id bigint NOT NULL,
    liked_user_id bigint,
    user_id bigint
);


ALTER TABLE public.like_user OWNER TO postgres;

--
-- Name: like_user_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.like_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.like_user_id_seq OWNER TO postgres;

--
-- Name: like_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.like_user_id_seq OWNED BY public.like_user.id;


--
-- Name: location; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.location (
    id bigint NOT NULL,
    city_id bigint,
    country_id bigint,
    state_id bigint
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.location_id_seq OWNER TO postgres;

--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.location_id_seq OWNED BY public.location.id;


--
-- Name: looking_for; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.looking_for (
    id bigint NOT NULL,
    description character varying(255)
);


ALTER TABLE public.looking_for OWNER TO postgres;

--
-- Name: looking_for_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.looking_for_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.looking_for_id_seq OWNER TO postgres;

--
-- Name: looking_for_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.looking_for_id_seq OWNED BY public.looking_for.id;


--
-- Name: match_user; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.match_user (
    id bigint NOT NULL,
    match_user_id bigint,
    user_id bigint
);


ALTER TABLE public.match_user OWNER TO postgres;

--
-- Name: match_user_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.match_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.match_user_id_seq OWNER TO postgres;

--
-- Name: match_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.match_user_id_seq OWNED BY public.match_user.id;


--
-- Name: playing_with_neon; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.playing_with_neon (
    id integer NOT NULL,
    name text NOT NULL,
    value real
);


ALTER TABLE public.playing_with_neon OWNER TO postgres;

--
-- Name: playing_with_neon_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.playing_with_neon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.playing_with_neon_id_seq OWNER TO postgres;

--
-- Name: playing_with_neon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.playing_with_neon_id_seq OWNED BY public.playing_with_neon.id;


--
-- Name: religion; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.religion (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.religion OWNER TO postgres;

--
-- Name: religion_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.religion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.religion_id_seq OWNER TO postgres;

--
-- Name: religion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.religion_id_seq OWNED BY public.religion.id;


--
-- Name: sexuality; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.sexuality (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.sexuality OWNER TO postgres;

--
-- Name: sexuality_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.sexuality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sexuality_id_seq OWNER TO postgres;

--
-- Name: sexuality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.sexuality_id_seq OWNED BY public.sexuality.id;


--
-- Name: state; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.state (
    id bigint NOT NULL,
    name character varying(255),
    country_id bigint
);


ALTER TABLE public.state OWNER TO postgres;

--
-- Name: state_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.state_id_seq OWNER TO postgres;

--
-- Name: state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.state_id_seq OWNED BY public.state.id;


--
-- Name: user_account; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.user_account (
    id bigint NOT NULL,
    age integer,
    bio character varying(255),
    birthday timestamp(6) without time zone,
    dap_coin integer,
    email character varying(255),
    height integer,
    instagram character varying(255),
    nickname character varying(255),
    password character varying(255),
    quote character varying(255),
    role character varying(255),
    snapchat character varying(255),
    terms boolean,
    tiktok character varying(255),
    token character varying(255),
    token_lifetime bigint,
    username character varying(255),
    gender_id bigint,
    location_id bigint,
    looking_for_id bigint,
    religion_id bigint,
    sexuality_id bigint
);


ALTER TABLE public.user_account OWNER TO postgres;

--
-- Name: user_account_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.user_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_account_id_seq OWNER TO postgres;

--
-- Name: user_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lnagler1
--

ALTER SEQUENCE public.user_account_id_seq OWNED BY public.user_account.id;


--
-- Name: user_account_interests; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.user_account_interests (
    user_id bigint NOT NULL,
    interests_id bigint NOT NULL
);


ALTER TABLE public.user_account_interests OWNER TO postgres;

--
-- Name: city id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: gender id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.gender ALTER COLUMN id SET DEFAULT nextval('public.gender_id_seq'::regclass);


--
-- Name: icon id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.icon ALTER COLUMN id SET DEFAULT nextval('public.icon_id_seq'::regclass);


--
-- Name: image id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- Name: interests id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.interests ALTER COLUMN id SET DEFAULT nextval('public.interests_id_seq'::regclass);


--
-- Name: like_user id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.like_user ALTER COLUMN id SET DEFAULT nextval('public.like_user_id_seq'::regclass);


--
-- Name: location id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.location ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);


--
-- Name: looking_for id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.looking_for ALTER COLUMN id SET DEFAULT nextval('public.looking_for_id_seq'::regclass);


--
-- Name: match_user id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.match_user ALTER COLUMN id SET DEFAULT nextval('public.match_user_id_seq'::regclass);


--
-- Name: playing_with_neon id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.playing_with_neon ALTER COLUMN id SET DEFAULT nextval('public.playing_with_neon_id_seq'::regclass);


--
-- Name: religion id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.religion ALTER COLUMN id SET DEFAULT nextval('public.religion_id_seq'::regclass);


--
-- Name: sexuality id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.sexuality ALTER COLUMN id SET DEFAULT nextval('public.sexuality_id_seq'::regclass);


--
-- Name: state id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.state ALTER COLUMN id SET DEFAULT nextval('public.state_id_seq'::regclass);


--
-- Name: user_account id; Type: DEFAULT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.user_account ALTER COLUMN id SET DEFAULT nextval('public.user_account_id_seq'::regclass);


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

INSERT INTO public.city VALUES (1, 'Garsten', 1);
INSERT INTO public.city VALUES (2, 'Steyr', 1);
INSERT INTO public.city VALUES (3, 'Wolfern', 1);
INSERT INTO public.city VALUES (4, 'Dietach', 1);
INSERT INTO public.city VALUES (5, 'St. Ulrich', 1);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

INSERT INTO public.country VALUES (571, 'Afghanistan', 'AF');
INSERT INTO public.country VALUES (572, 'Aland Islands', 'AX');
INSERT INTO public.country VALUES (573, 'Albania', 'AL');
INSERT INTO public.country VALUES (574, 'Algeria', 'DZ');
INSERT INTO public.country VALUES (575, 'American Samoa', 'AS');
INSERT INTO public.country VALUES (576, 'Andorra', 'AD');
INSERT INTO public.country VALUES (577, 'Angola', 'AO');
INSERT INTO public.country VALUES (578, 'Anguilla', 'AI');
INSERT INTO public.country VALUES (579, 'Antarctica', 'AQ');
INSERT INTO public.country VALUES (580, 'Antigua And Barbuda', 'AG');
INSERT INTO public.country VALUES (581, 'Argentina', 'AR');
INSERT INTO public.country VALUES (582, 'Armenia', 'AM');
INSERT INTO public.country VALUES (583, 'Aruba', 'AW');
INSERT INTO public.country VALUES (584, 'Australia', 'AU');
INSERT INTO public.country VALUES (585, 'Austria', 'AT');
INSERT INTO public.country VALUES (586, 'Azerbaijan', 'AZ');
INSERT INTO public.country VALUES (587, 'Bahrain', 'BH');
INSERT INTO public.country VALUES (588, 'Bangladesh', 'BD');
INSERT INTO public.country VALUES (589, 'Barbados', 'BB');
INSERT INTO public.country VALUES (590, 'Belarus', 'BY');
INSERT INTO public.country VALUES (591, 'Belgium', 'BE');
INSERT INTO public.country VALUES (592, 'Belize', 'BZ');
INSERT INTO public.country VALUES (593, 'Benin', 'BJ');
INSERT INTO public.country VALUES (594, 'Bermuda', 'BM');
INSERT INTO public.country VALUES (595, 'Bhutan', 'BT');
INSERT INTO public.country VALUES (596, 'Bolivia', 'BO');
INSERT INTO public.country VALUES (597, 'Bonaire, Sint Eustatius and Saba', 'BQ');
INSERT INTO public.country VALUES (598, 'Bosnia and Herzegovina', 'BA');
INSERT INTO public.country VALUES (599, 'Botswana', 'BW');
INSERT INTO public.country VALUES (600, 'Bouvet Island', 'BV');
INSERT INTO public.country VALUES (601, 'Brazil', 'BR');
INSERT INTO public.country VALUES (602, 'British Indian Ocean Territory', 'IO');
INSERT INTO public.country VALUES (603, 'Brunei', 'BN');
INSERT INTO public.country VALUES (604, 'Bulgaria', 'BG');
INSERT INTO public.country VALUES (605, 'Burkina Faso', 'BF');
INSERT INTO public.country VALUES (606, 'Burundi', 'BI');
INSERT INTO public.country VALUES (607, 'Cambodia', 'KH');
INSERT INTO public.country VALUES (608, 'Cameroon', 'CM');
INSERT INTO public.country VALUES (609, 'Canada', 'CA');
INSERT INTO public.country VALUES (610, 'Cape Verde', 'CV');
INSERT INTO public.country VALUES (611, 'Cayman Islands', 'KY');
INSERT INTO public.country VALUES (612, 'Central African Republic', 'CF');
INSERT INTO public.country VALUES (613, 'Chad', 'TD');
INSERT INTO public.country VALUES (614, 'Chile', 'CL');
INSERT INTO public.country VALUES (615, 'China', 'CN');
INSERT INTO public.country VALUES (616, 'Christmas Island', 'CX');
INSERT INTO public.country VALUES (617, 'Cocos (Keeling) Islands', 'CC');
INSERT INTO public.country VALUES (618, 'Colombia', 'CO');
INSERT INTO public.country VALUES (619, 'Comoros', 'KM');
INSERT INTO public.country VALUES (620, 'Congo', 'CG');
INSERT INTO public.country VALUES (621, 'Cook Islands', 'CK');
INSERT INTO public.country VALUES (622, 'Costa Rica', 'CR');
INSERT INTO public.country VALUES (623, 'Cote DIvoire (Ivory Coast)', 'CI');
INSERT INTO public.country VALUES (624, 'Croatia', 'HR');
INSERT INTO public.country VALUES (625, 'Cuba', 'CU');
INSERT INTO public.country VALUES (626, 'Curaçao', 'CW');
INSERT INTO public.country VALUES (627, 'Cyprus', 'CY');
INSERT INTO public.country VALUES (628, 'Czech Republic', 'CZ');
INSERT INTO public.country VALUES (629, 'Democratic Republic of the Congo', 'CD');
INSERT INTO public.country VALUES (630, 'Denmark', 'DK');
INSERT INTO public.country VALUES (631, 'Djibouti', 'DJ');
INSERT INTO public.country VALUES (632, 'Dominica', 'DM');
INSERT INTO public.country VALUES (633, 'Dominican Republic', 'DO');
INSERT INTO public.country VALUES (634, 'East Timor', 'TL');
INSERT INTO public.country VALUES (635, 'Ecuador', 'EC');
INSERT INTO public.country VALUES (636, 'Egypt', 'EG');
INSERT INTO public.country VALUES (637, 'El Salvador', 'SV');
INSERT INTO public.country VALUES (638, 'Equatorial Guinea', 'GQ');
INSERT INTO public.country VALUES (639, 'Eritrea', 'ER');
INSERT INTO public.country VALUES (640, 'Estonia', 'EE');
INSERT INTO public.country VALUES (641, 'Ethiopia', 'ET');
INSERT INTO public.country VALUES (642, 'Falkland Islands', 'FK');
INSERT INTO public.country VALUES (643, 'Faroe Islands', 'FO');
INSERT INTO public.country VALUES (644, 'Fiji Islands', 'FJ');
INSERT INTO public.country VALUES (645, 'Finland', 'FI');
INSERT INTO public.country VALUES (646, 'France', 'FR');
INSERT INTO public.country VALUES (647, 'French Guiana', 'GF');
INSERT INTO public.country VALUES (648, 'French Polynesia', 'PF');
INSERT INTO public.country VALUES (649, 'French Southern Territories', 'TF');
INSERT INTO public.country VALUES (650, 'Gabon', 'GA');
INSERT INTO public.country VALUES (651, 'Gambia The', 'GM');
INSERT INTO public.country VALUES (652, 'Georgia', 'GE');
INSERT INTO public.country VALUES (653, 'Germany', 'DE');
INSERT INTO public.country VALUES (654, 'Ghana', 'GH');
INSERT INTO public.country VALUES (655, 'Gibraltar', 'GI');
INSERT INTO public.country VALUES (656, 'Greece', 'GR');
INSERT INTO public.country VALUES (657, 'Greenland', 'GL');
INSERT INTO public.country VALUES (658, 'Grenada', 'GD');
INSERT INTO public.country VALUES (659, 'Guadeloupe', 'GP');
INSERT INTO public.country VALUES (660, 'Guam', 'GU');
INSERT INTO public.country VALUES (661, 'Guatemala', 'GT');
INSERT INTO public.country VALUES (662, 'Guernsey and Alderney', 'GG');
INSERT INTO public.country VALUES (663, 'Guinea', 'GN');
INSERT INTO public.country VALUES (664, 'Guinea-Bissau', 'GW');
INSERT INTO public.country VALUES (665, 'Guyana', 'GY');
INSERT INTO public.country VALUES (666, 'Haiti', 'HT');
INSERT INTO public.country VALUES (667, 'Heard Island and McDonald Islands', 'HM');
INSERT INTO public.country VALUES (668, 'Honduras', 'HN');
INSERT INTO public.country VALUES (669, 'Hong Kong S.A.R.', 'HK');
INSERT INTO public.country VALUES (670, 'Hungary', 'HU');
INSERT INTO public.country VALUES (671, 'Iceland', 'IS');
INSERT INTO public.country VALUES (672, 'India', 'IN');
INSERT INTO public.country VALUES (673, 'Indonesia', 'ID');
INSERT INTO public.country VALUES (674, 'Iran', 'IR');
INSERT INTO public.country VALUES (675, 'Iraq', 'IQ');
INSERT INTO public.country VALUES (676, 'Ireland', 'IE');
INSERT INTO public.country VALUES (677, 'Israel', 'IL');
INSERT INTO public.country VALUES (678, 'Italy', 'IT');
INSERT INTO public.country VALUES (679, 'Jamaica', 'JM');
INSERT INTO public.country VALUES (680, 'Japan', 'JP');
INSERT INTO public.country VALUES (681, 'Jersey', 'JE');
INSERT INTO public.country VALUES (682, 'Jordan', 'JO');
INSERT INTO public.country VALUES (683, 'Kazakhstan', 'KZ');
INSERT INTO public.country VALUES (684, 'Kenya', 'KE');
INSERT INTO public.country VALUES (685, 'Kiribati', 'KI');
INSERT INTO public.country VALUES (686, 'Kosovo', 'XK');
INSERT INTO public.country VALUES (687, 'Kuwait', 'KW');
INSERT INTO public.country VALUES (688, 'Kyrgyzstan', 'KG');
INSERT INTO public.country VALUES (689, 'Laos', 'LA');
INSERT INTO public.country VALUES (690, 'Latvia', 'LV');
INSERT INTO public.country VALUES (691, 'Lebanon', 'LB');
INSERT INTO public.country VALUES (692, 'Lesotho', 'LS');
INSERT INTO public.country VALUES (693, 'Liberia', 'LR');
INSERT INTO public.country VALUES (694, 'Libya', 'LY');
INSERT INTO public.country VALUES (695, 'Liechtenstein', 'LI');
INSERT INTO public.country VALUES (696, 'Lithuania', 'LT');
INSERT INTO public.country VALUES (697, 'Luxembourg', 'LU');
INSERT INTO public.country VALUES (698, 'Macau S.A.R.', 'MO');
INSERT INTO public.country VALUES (699, 'Madagascar', 'MG');
INSERT INTO public.country VALUES (700, 'Malawi', 'MW');
INSERT INTO public.country VALUES (701, 'Malaysia', 'MY');
INSERT INTO public.country VALUES (702, 'Maldives', 'MV');
INSERT INTO public.country VALUES (703, 'Mali', 'ML');
INSERT INTO public.country VALUES (704, 'Malta', 'MT');
INSERT INTO public.country VALUES (705, 'Man (Isle of)', 'IM');
INSERT INTO public.country VALUES (706, 'Marshall Islands', 'MH');
INSERT INTO public.country VALUES (707, 'Martinique', 'MQ');
INSERT INTO public.country VALUES (708, 'Mauritania', 'MR');
INSERT INTO public.country VALUES (709, 'Mauritius', 'MU');
INSERT INTO public.country VALUES (710, 'Mayotte', 'YT');
INSERT INTO public.country VALUES (711, 'Mexico', 'MX');
INSERT INTO public.country VALUES (712, 'Micronesia', 'FM');
INSERT INTO public.country VALUES (713, 'Moldova', 'MD');
INSERT INTO public.country VALUES (714, 'Monaco', 'MC');
INSERT INTO public.country VALUES (715, 'Mongolia', 'MN');
INSERT INTO public.country VALUES (716, 'Montenegro', 'ME');
INSERT INTO public.country VALUES (717, 'Montserrat', 'MS');
INSERT INTO public.country VALUES (718, 'Morocco', 'MA');
INSERT INTO public.country VALUES (719, 'Mozambique', 'MZ');
INSERT INTO public.country VALUES (720, 'Myanmar', 'MM');
INSERT INTO public.country VALUES (721, 'Namibia', 'NA');
INSERT INTO public.country VALUES (722, 'Nauru', 'NR');
INSERT INTO public.country VALUES (723, 'Nepal', 'NP');
INSERT INTO public.country VALUES (724, 'Netherlands', 'NL');
INSERT INTO public.country VALUES (725, 'New Caledonia', 'NC');
INSERT INTO public.country VALUES (726, 'New Zealand', 'NZ');
INSERT INTO public.country VALUES (727, 'Nicaragua', 'NI');
INSERT INTO public.country VALUES (728, 'Niger', 'NE');
INSERT INTO public.country VALUES (729, 'Nigeria', 'NG');
INSERT INTO public.country VALUES (730, 'Niue', 'NU');
INSERT INTO public.country VALUES (731, 'Norfolk Island', 'NF');
INSERT INTO public.country VALUES (732, 'North Korea', 'KP');
INSERT INTO public.country VALUES (733, 'North Macedonia', 'MK');
INSERT INTO public.country VALUES (734, 'Northern Mariana Islands', 'MP');
INSERT INTO public.country VALUES (735, 'Norway', 'NO');
INSERT INTO public.country VALUES (736, 'Oman', 'OM');
INSERT INTO public.country VALUES (737, 'Pakistan', 'PK');
INSERT INTO public.country VALUES (738, 'Palau', 'PW');
INSERT INTO public.country VALUES (739, 'Palestinian Territory Occupied', 'PS');
INSERT INTO public.country VALUES (740, 'Panama', 'PA');
INSERT INTO public.country VALUES (741, 'Papua new Guinea', 'PG');
INSERT INTO public.country VALUES (742, 'Paraguay', 'PY');
INSERT INTO public.country VALUES (743, 'Peru', 'PE');
INSERT INTO public.country VALUES (744, 'Philippines', 'PH');
INSERT INTO public.country VALUES (745, 'Pitcairn Island', 'PN');
INSERT INTO public.country VALUES (746, 'Poland', 'PL');
INSERT INTO public.country VALUES (747, 'Portugal', 'PT');
INSERT INTO public.country VALUES (748, 'Puerto Rico', 'PR');
INSERT INTO public.country VALUES (749, 'Qatar', 'QA');
INSERT INTO public.country VALUES (750, 'Reunion', 'RE');
INSERT INTO public.country VALUES (751, 'Romania', 'RO');
INSERT INTO public.country VALUES (752, 'Russia', 'RU');
INSERT INTO public.country VALUES (753, 'Rwanda', 'RW');
INSERT INTO public.country VALUES (754, 'Saint Helena', 'SH');
INSERT INTO public.country VALUES (755, 'Saint Kitts And Nevis', 'KN');
INSERT INTO public.country VALUES (756, 'Saint Lucia', 'LC');
INSERT INTO public.country VALUES (757, 'Saint Pierre and Miquelon', 'PM');
INSERT INTO public.country VALUES (758, 'Saint Vincent And The Grenadines', 'VC');
INSERT INTO public.country VALUES (759, 'Saint-Barthelemy', 'BL');
INSERT INTO public.country VALUES (760, 'Saint-Martin (French part)', 'MF');
INSERT INTO public.country VALUES (761, 'Samoa', 'WS');
INSERT INTO public.country VALUES (762, 'San Marino', 'SM');
INSERT INTO public.country VALUES (763, 'Sao Tome and Principe', 'ST');
INSERT INTO public.country VALUES (764, 'Saudi Arabia', 'SA');
INSERT INTO public.country VALUES (765, 'Senegal', 'SN');
INSERT INTO public.country VALUES (766, 'Serbia', 'RS');
INSERT INTO public.country VALUES (767, 'Seychelles', 'SC');
INSERT INTO public.country VALUES (768, 'Sierra Leone', 'SL');
INSERT INTO public.country VALUES (769, 'Singapore', 'SG');
INSERT INTO public.country VALUES (770, 'Sint Maarten (Dutch part)', 'SX');
INSERT INTO public.country VALUES (771, 'Slovakia', 'SK');
INSERT INTO public.country VALUES (772, 'Slovenia', 'SI');
INSERT INTO public.country VALUES (773, 'Solomon Islands', 'SB');
INSERT INTO public.country VALUES (774, 'Somalia', 'SO');
INSERT INTO public.country VALUES (775, 'South Africa', 'ZA');
INSERT INTO public.country VALUES (776, 'South Georgia', 'GS');
INSERT INTO public.country VALUES (777, 'South Korea', 'KR');
INSERT INTO public.country VALUES (778, 'South Sudan', 'SS');
INSERT INTO public.country VALUES (779, 'Spain', 'ES');
INSERT INTO public.country VALUES (780, 'Sri Lanka', 'LK');
INSERT INTO public.country VALUES (781, 'Sudan', 'SD');
INSERT INTO public.country VALUES (782, 'Suriname', 'SR');
INSERT INTO public.country VALUES (783, 'Svalbard And Jan Mayen Islands', 'SJ');
INSERT INTO public.country VALUES (784, 'Swaziland', 'SZ');
INSERT INTO public.country VALUES (785, 'Sweden', 'SE');
INSERT INTO public.country VALUES (786, 'Switzerland', 'CH');
INSERT INTO public.country VALUES (787, 'Syria', 'SY');
INSERT INTO public.country VALUES (788, 'Taiwan', 'TW');
INSERT INTO public.country VALUES (789, 'Tajikistan', 'TJ');
INSERT INTO public.country VALUES (790, 'Tanzania', 'TZ');
INSERT INTO public.country VALUES (791, 'Thailand', 'TH');
INSERT INTO public.country VALUES (792, 'The Bahamas', 'BS');
INSERT INTO public.country VALUES (793, 'Togo', 'TG');
INSERT INTO public.country VALUES (794, 'Tokelau', 'TK');
INSERT INTO public.country VALUES (795, 'Tonga', 'TO');
INSERT INTO public.country VALUES (796, 'Trinidad And Tobago', 'TT');
INSERT INTO public.country VALUES (797, 'Tunisia', 'TN');
INSERT INTO public.country VALUES (798, 'Turkey', 'TR');
INSERT INTO public.country VALUES (799, 'Turkmenistan', 'TM');
INSERT INTO public.country VALUES (800, 'Turks And Caicos Islands', 'TC');
INSERT INTO public.country VALUES (801, 'Tuvalu', 'TV');
INSERT INTO public.country VALUES (802, 'Uganda', 'UG');
INSERT INTO public.country VALUES (803, 'Ukraine', 'UA');
INSERT INTO public.country VALUES (804, 'United Arab Emirates', 'AE');
INSERT INTO public.country VALUES (805, 'United Kingdom', 'GB');
INSERT INTO public.country VALUES (806, 'United States', 'US');
INSERT INTO public.country VALUES (807, 'United States Minor Outlying Islands', 'UM');
INSERT INTO public.country VALUES (808, 'Uruguay', 'UY');
INSERT INTO public.country VALUES (809, 'Uzbekistan', 'UZ');
INSERT INTO public.country VALUES (810, 'Vanuatu', 'VU');
INSERT INTO public.country VALUES (811, 'Vatican City State (Holy See)', 'VA');
INSERT INTO public.country VALUES (812, 'Venezuela', 'VE');
INSERT INTO public.country VALUES (813, 'Vietnam', 'VN');
INSERT INTO public.country VALUES (814, 'Virgin Islands (British)', 'VG');
INSERT INTO public.country VALUES (815, 'Virgin Islands (US)', 'VI');
INSERT INTO public.country VALUES (816, 'Wallis And Futuna Islands', 'WF');
INSERT INTO public.country VALUES (817, 'Western Sahara', 'EH');
INSERT INTO public.country VALUES (818, 'Yemen', 'YE');
INSERT INTO public.country VALUES (819, 'Zambia', 'ZM');
INSERT INTO public.country VALUES (820, 'Zimbabwe', 'ZW');


--
-- Data for Name: gender; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

INSERT INTO public.gender VALUES (85, false, 'Abinary');
INSERT INTO public.gender VALUES (86, false, 'Agender');
INSERT INTO public.gender VALUES (87, false, 'Ambigender');
INSERT INTO public.gender VALUES (88, false, 'Androgyne');
INSERT INTO public.gender VALUES (89, false, 'Aporagender');
INSERT INTO public.gender VALUES (90, false, 'Autigender');
INSERT INTO public.gender VALUES (91, false, 'Bakla');
INSERT INTO public.gender VALUES (92, false, 'Bigender');
INSERT INTO public.gender VALUES (93, false, 'Binary');
INSERT INTO public.gender VALUES (94, false, 'Bissu');
INSERT INTO public.gender VALUES (95, false, 'Butch');
INSERT INTO public.gender VALUES (96, false, 'Calabai');
INSERT INTO public.gender VALUES (97, false, 'Calalai');
INSERT INTO public.gender VALUES (98, false, 'Cis');
INSERT INTO public.gender VALUES (99, false, 'Cisgender');
INSERT INTO public.gender VALUES (100, false, 'Demi-boy');
INSERT INTO public.gender VALUES (101, false, 'Demiflux');
INSERT INTO public.gender VALUES (102, false, 'Demigender');
INSERT INTO public.gender VALUES (103, false, 'Demi-girl');
INSERT INTO public.gender VALUES (104, false, 'Demi-guy');
INSERT INTO public.gender VALUES (105, false, 'Demi-man');
INSERT INTO public.gender VALUES (106, false, 'Demi-woman');
INSERT INTO public.gender VALUES (107, false, 'Dual gender');
INSERT INTO public.gender VALUES (108, false, 'Fa\afafine');
INSERT INTO public.gender VALUES (109, true, 'Female');
INSERT INTO public.gender VALUES (110, false, 'Female to male');
INSERT INTO public.gender VALUES (111, false, 'Femme');
INSERT INTO public.gender VALUES (112, false, 'FTM');
INSERT INTO public.gender VALUES (113, false, 'Gender bender');
INSERT INTO public.gender VALUES (114, false, 'Gender diverse');
INSERT INTO public.gender VALUES (115, false, 'Gender gifted');
INSERT INTO public.gender VALUES (116, false, 'Genderfae');
INSERT INTO public.gender VALUES (117, false, 'Genderfluid');
INSERT INTO public.gender VALUES (118, false, 'Genderflux');
INSERT INTO public.gender VALUES (119, false, 'Genderfuck');
INSERT INTO public.gender VALUES (120, false, 'Genderless');
INSERT INTO public.gender VALUES (121, false, 'Gender nonconforming');
INSERT INTO public.gender VALUES (122, false, 'Genderqueer');
INSERT INTO public.gender VALUES (123, false, 'Gender questioning');
INSERT INTO public.gender VALUES (124, false, 'Gender variant');
INSERT INTO public.gender VALUES (125, false, 'Graygender');
INSERT INTO public.gender VALUES (126, false, 'Hijra');
INSERT INTO public.gender VALUES (127, false, 'Intergender');
INSERT INTO public.gender VALUES (128, false, 'Intersex');
INSERT INTO public.gender VALUES (129, false, 'Kathoey');
INSERT INTO public.gender VALUES (130, false, 'Māhū');
INSERT INTO public.gender VALUES (131, true, 'Male');
INSERT INTO public.gender VALUES (132, false, 'Male to female');
INSERT INTO public.gender VALUES (133, false, 'Man');
INSERT INTO public.gender VALUES (134, false, 'Man of trans experience');
INSERT INTO public.gender VALUES (135, false, 'Maverique');
INSERT INTO public.gender VALUES (136, false, 'Meta-gender');
INSERT INTO public.gender VALUES (137, false, 'MTF');
INSERT INTO public.gender VALUES (138, false, 'Multigender');
INSERT INTO public.gender VALUES (139, false, 'Muxe');
INSERT INTO public.gender VALUES (140, false, 'Neither');
INSERT INTO public.gender VALUES (141, false, 'Neurogender');
INSERT INTO public.gender VALUES (142, false, 'Neutrois');
INSERT INTO public.gender VALUES (143, false, 'non-binary');
INSERT INTO public.gender VALUES (144, false, 'Non-binary transgender');
INSERT INTO public.gender VALUES (145, false, 'Omnigender');
INSERT INTO public.gender VALUES (146, false, 'Other');
INSERT INTO public.gender VALUES (147, false, 'Pangender');
INSERT INTO public.gender VALUES (148, false, 'Person of transgendered experience');
INSERT INTO public.gender VALUES (149, false, 'Polygender');
INSERT INTO public.gender VALUES (150, false, 'Sekhet');
INSERT INTO public.gender VALUES (151, false, 'Third gender');
INSERT INTO public.gender VALUES (152, false, 'Trans');
INSERT INTO public.gender VALUES (153, false, 'Transgender');
INSERT INTO public.gender VALUES (154, false, 'Transfeminine');
INSERT INTO public.gender VALUES (155, false, 'Transmasculine');
INSERT INTO public.gender VALUES (156, false, 'Transsexual');
INSERT INTO public.gender VALUES (157, false, 'Travesti');
INSERT INTO public.gender VALUES (158, false, 'Trigender');
INSERT INTO public.gender VALUES (159, false, 'Tumtum');
INSERT INTO public.gender VALUES (160, false, 'Two spirit');
INSERT INTO public.gender VALUES (161, false, 'Vakasalewalewa');
INSERT INTO public.gender VALUES (162, false, 'Waria');
INSERT INTO public.gender VALUES (163, false, 'Winkte');
INSERT INTO public.gender VALUES (164, false, 'Woman');
INSERT INTO public.gender VALUES (165, false, 'Woman of trans experience');
INSERT INTO public.gender VALUES (166, false, 'X-gender');
INSERT INTO public.gender VALUES (167, false, 'X-jendā');
INSERT INTO public.gender VALUES (168, false, 'Xenogender');


--
-- Data for Name: icon; Type: TABLE DATA; Schema: public; Owner: lnagler1
--



--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: lnagler1
--



--
-- Data for Name: interests; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

INSERT INTO public.interests VALUES (1, '3D printing', NULL);
INSERT INTO public.interests VALUES (2, 'Acting', NULL);
INSERT INTO public.interests VALUES (3, 'Aeromodeling', NULL);
INSERT INTO public.interests VALUES (4, 'Air sports', NULL);
INSERT INTO public.interests VALUES (5, 'Airbrushing', NULL);
INSERT INTO public.interests VALUES (6, 'Aircraft Spotting', NULL);
INSERT INTO public.interests VALUES (7, 'Airsoft', NULL);
INSERT INTO public.interests VALUES (8, 'Airsofting', NULL);
INSERT INTO public.interests VALUES (9, 'Amateur astronomy', NULL);
INSERT INTO public.interests VALUES (10, 'Amateur geology', NULL);
INSERT INTO public.interests VALUES (11, 'Amateur Radio', NULL);
INSERT INTO public.interests VALUES (12, 'American football', NULL);
INSERT INTO public.interests VALUES (13, 'Animal fancy', NULL);
INSERT INTO public.interests VALUES (14, 'Animals/pets/dogs', NULL);
INSERT INTO public.interests VALUES (15, 'Antiquing', NULL);
INSERT INTO public.interests VALUES (16, 'Antiquities', NULL);
INSERT INTO public.interests VALUES (17, 'Aqua-lung', NULL);
INSERT INTO public.interests VALUES (18, 'Aquarium (Freshwater & Saltwater)', NULL);
INSERT INTO public.interests VALUES (19, 'Archery', NULL);
INSERT INTO public.interests VALUES (20, 'Art collecting', NULL);
INSERT INTO public.interests VALUES (21, 'Arts', NULL);
INSERT INTO public.interests VALUES (22, 'Association football', NULL);
INSERT INTO public.interests VALUES (23, 'Astrology', NULL);
INSERT INTO public.interests VALUES (24, 'Astronomy', NULL);
INSERT INTO public.interests VALUES (25, 'Audiophilia', NULL);
INSERT INTO public.interests VALUES (26, 'Australian rules football', NULL);
INSERT INTO public.interests VALUES (27, 'Auto audiophilia', NULL);
INSERT INTO public.interests VALUES (28, 'Auto racing', NULL);
INSERT INTO public.interests VALUES (29, 'Backgammon', NULL);
INSERT INTO public.interests VALUES (30, 'Backpacking', NULL);
INSERT INTO public.interests VALUES (31, 'Badminton', NULL);
INSERT INTO public.interests VALUES (32, 'Base Jumping', NULL);
INSERT INTO public.interests VALUES (33, 'Baseball', NULL);
INSERT INTO public.interests VALUES (34, 'Basketball', NULL);
INSERT INTO public.interests VALUES (35, 'Baton Twirling', NULL);
INSERT INTO public.interests VALUES (36, 'Beach Volleyball', NULL);
INSERT INTO public.interests VALUES (37, 'Beach/Sun tanning', NULL);
INSERT INTO public.interests VALUES (38, 'Beachcombing', NULL);
INSERT INTO public.interests VALUES (39, 'Beadwork', NULL);
INSERT INTO public.interests VALUES (40, 'Beatboxing', NULL);
INSERT INTO public.interests VALUES (41, 'Becoming A Child Advocate', NULL);
INSERT INTO public.interests VALUES (42, 'Beekeeping', NULL);
INSERT INTO public.interests VALUES (43, 'Bell Ringing', NULL);
INSERT INTO public.interests VALUES (44, 'Belly Dancing', NULL);
INSERT INTO public.interests VALUES (45, 'Bicycle Polo', NULL);
INSERT INTO public.interests VALUES (46, 'Bicycling', NULL);
INSERT INTO public.interests VALUES (47, 'Billiards', NULL);
INSERT INTO public.interests VALUES (48, 'Bird watching', NULL);
INSERT INTO public.interests VALUES (49, 'Birding', NULL);
INSERT INTO public.interests VALUES (50, 'Birdwatching', NULL);
INSERT INTO public.interests VALUES (51, 'Blacksmithing', NULL);
INSERT INTO public.interests VALUES (52, 'Blogging', NULL);
INSERT INTO public.interests VALUES (53, 'BMX', NULL);
INSERT INTO public.interests VALUES (54, 'Board games', NULL);
INSERT INTO public.interests VALUES (55, 'Board sports', NULL);
INSERT INTO public.interests VALUES (56, 'BoardGames', NULL);
INSERT INTO public.interests VALUES (57, 'Boating', NULL);
INSERT INTO public.interests VALUES (58, 'Body Building', NULL);
INSERT INTO public.interests VALUES (59, 'Bodybuilding', NULL);
INSERT INTO public.interests VALUES (60, 'Bonsai Tree', NULL);
INSERT INTO public.interests VALUES (61, 'Book collecting', NULL);
INSERT INTO public.interests VALUES (62, 'Bookbinding', NULL);
INSERT INTO public.interests VALUES (63, 'Boomerangs', NULL);
INSERT INTO public.interests VALUES (64, 'Bowling', NULL);
INSERT INTO public.interests VALUES (65, 'Boxing', NULL);
INSERT INTO public.interests VALUES (66, 'Brazilian jiu-jitsu', NULL);
INSERT INTO public.interests VALUES (67, 'Breakdancing', NULL);
INSERT INTO public.interests VALUES (68, 'Brewing Beer', NULL);
INSERT INTO public.interests VALUES (69, 'Bridge', NULL);
INSERT INTO public.interests VALUES (70, 'Bridge Building', NULL);
INSERT INTO public.interests VALUES (71, 'Bringing Food To The Disabled', NULL);
INSERT INTO public.interests VALUES (72, 'Building A House For Habitat For Humanity', NULL);
INSERT INTO public.interests VALUES (73, 'Building Dollhouses', NULL);
INSERT INTO public.interests VALUES (74, 'Bus spotting', NULL);
INSERT INTO public.interests VALUES (75, 'Butterfly Watching', NULL);
INSERT INTO public.interests VALUES (76, 'Button Collecting', NULL);
INSERT INTO public.interests VALUES (77, 'Cake Decorating', NULL);
INSERT INTO public.interests VALUES (78, 'Calligraphy', NULL);
INSERT INTO public.interests VALUES (79, 'Camping', NULL);
INSERT INTO public.interests VALUES (80, 'Candle making', NULL);
INSERT INTO public.interests VALUES (81, 'Canoeing', NULL);
INSERT INTO public.interests VALUES (82, 'Car Racing', NULL);
INSERT INTO public.interests VALUES (83, 'Card collecting', NULL);
INSERT INTO public.interests VALUES (84, 'Cartooning', NULL);
INSERT INTO public.interests VALUES (85, 'Casino Gambling', NULL);
INSERT INTO public.interests VALUES (86, 'Cave Diving', NULL);
INSERT INTO public.interests VALUES (87, 'Ceramics', NULL);
INSERT INTO public.interests VALUES (88, 'Cheerleading', NULL);
INSERT INTO public.interests VALUES (89, 'Chess', NULL);
INSERT INTO public.interests VALUES (90, 'Church/church activities', NULL);
INSERT INTO public.interests VALUES (91, 'Cigar Smoking', NULL);
INSERT INTO public.interests VALUES (92, 'Climbing', NULL);
INSERT INTO public.interests VALUES (93, 'Cloud Watching', NULL);
INSERT INTO public.interests VALUES (94, 'Coin Collecting', NULL);
INSERT INTO public.interests VALUES (95, 'Collecting', NULL);
INSERT INTO public.interests VALUES (96, 'Collecting Antiques', NULL);
INSERT INTO public.interests VALUES (97, 'Collecting Artwork', NULL);
INSERT INTO public.interests VALUES (98, 'Collecting Hats', NULL);
INSERT INTO public.interests VALUES (99, 'Collecting Music Albums', NULL);
INSERT INTO public.interests VALUES (100, 'Collecting RPM Records', NULL);
INSERT INTO public.interests VALUES (101, 'Collecting Sports Cards (Baseball, Football, Basketball, Hoc', NULL);
INSERT INTO public.interests VALUES (102, 'Collecting Swords', NULL);
INSERT INTO public.interests VALUES (103, 'Color guard', NULL);
INSERT INTO public.interests VALUES (104, 'Coloring', NULL);
INSERT INTO public.interests VALUES (105, 'Comic book collecting', NULL);
INSERT INTO public.interests VALUES (106, 'Compose Music', NULL);
INSERT INTO public.interests VALUES (107, 'Computer activities', NULL);
INSERT INTO public.interests VALUES (108, 'Computer programming', NULL);
INSERT INTO public.interests VALUES (109, 'Conworlding', NULL);
INSERT INTO public.interests VALUES (110, 'Cooking', NULL);
INSERT INTO public.interests VALUES (111, 'Cosplay', NULL);
INSERT INTO public.interests VALUES (112, 'Cosplaying', NULL);
INSERT INTO public.interests VALUES (113, 'Couponing', NULL);
INSERT INTO public.interests VALUES (114, 'Crafts', NULL);
INSERT INTO public.interests VALUES (115, 'Crafts (unspecified)', NULL);
INSERT INTO public.interests VALUES (116, 'Creative writing', NULL);
INSERT INTO public.interests VALUES (117, 'Cricket', NULL);
INSERT INTO public.interests VALUES (118, 'Crochet', NULL);
INSERT INTO public.interests VALUES (119, 'Crocheting', NULL);
INSERT INTO public.interests VALUES (120, 'Cross-Stitch', NULL);
INSERT INTO public.interests VALUES (121, 'Crossword Puzzles', NULL);
INSERT INTO public.interests VALUES (122, 'Cryptography', NULL);
INSERT INTO public.interests VALUES (123, 'Curling', NULL);
INSERT INTO public.interests VALUES (124, 'Cycling', NULL);
INSERT INTO public.interests VALUES (125, 'Dance', NULL);
INSERT INTO public.interests VALUES (126, 'Dancing', NULL);
INSERT INTO public.interests VALUES (127, 'Darts', NULL);
INSERT INTO public.interests VALUES (128, 'Debate', NULL);
INSERT INTO public.interests VALUES (129, 'Deltiology (postcard collecting)', NULL);
INSERT INTO public.interests VALUES (130, 'Diecast Collectibles', NULL);
INSERT INTO public.interests VALUES (131, 'Digital arts', NULL);
INSERT INTO public.interests VALUES (132, 'Digital Photography', NULL);
INSERT INTO public.interests VALUES (133, 'Disc golf', NULL);
INSERT INTO public.interests VALUES (134, 'Do it yourself', NULL);
INSERT INTO public.interests VALUES (135, 'Dodgeball', NULL);
INSERT INTO public.interests VALUES (136, 'Dog sport', NULL);
INSERT INTO public.interests VALUES (137, 'Dolls', NULL);
INSERT INTO public.interests VALUES (138, 'Dominoes', NULL);
INSERT INTO public.interests VALUES (139, 'Dowsing', NULL);
INSERT INTO public.interests VALUES (140, 'Drama', NULL);
INSERT INTO public.interests VALUES (141, 'Drawing', NULL);
INSERT INTO public.interests VALUES (142, 'Driving', NULL);
INSERT INTO public.interests VALUES (143, 'Dumpster Diving', NULL);
INSERT INTO public.interests VALUES (144, 'Eating out', NULL);
INSERT INTO public.interests VALUES (145, 'Educational Courses', NULL);
INSERT INTO public.interests VALUES (146, 'Electronics', NULL);
INSERT INTO public.interests VALUES (147, 'Element collecting', NULL);
INSERT INTO public.interests VALUES (148, 'Embroidery', NULL);
INSERT INTO public.interests VALUES (149, 'Entertaining', NULL);
INSERT INTO public.interests VALUES (150, 'Equestrianism', NULL);
INSERT INTO public.interests VALUES (151, 'Exercise (aerobics, weights)', NULL);
INSERT INTO public.interests VALUES (152, 'Exhibition drill', NULL);
INSERT INTO public.interests VALUES (153, 'Falconry', NULL);
INSERT INTO public.interests VALUES (154, 'Fast cars', NULL);
INSERT INTO public.interests VALUES (155, 'Felting', NULL);
INSERT INTO public.interests VALUES (156, 'Fencing', NULL);
INSERT INTO public.interests VALUES (157, 'Field hockey', NULL);
INSERT INTO public.interests VALUES (158, 'Figure skating', NULL);
INSERT INTO public.interests VALUES (159, 'Fire Poi', NULL);
INSERT INTO public.interests VALUES (160, 'Fishing', NULL);
INSERT INTO public.interests VALUES (161, 'Fishkeeping', NULL);
INSERT INTO public.interests VALUES (162, 'Flag Football', NULL);
INSERT INTO public.interests VALUES (163, 'Floorball', NULL);
INSERT INTO public.interests VALUES (164, 'Floral Arrangements', NULL);
INSERT INTO public.interests VALUES (165, 'Flower arranging', NULL);
INSERT INTO public.interests VALUES (166, 'Flower collecting and pressing', NULL);
INSERT INTO public.interests VALUES (167, 'Fly Tying', NULL);
INSERT INTO public.interests VALUES (168, 'Flying', NULL);
INSERT INTO public.interests VALUES (169, 'Footbag', NULL);
INSERT INTO public.interests VALUES (170, 'Football', NULL);
INSERT INTO public.interests VALUES (171, 'Foraging', NULL);
INSERT INTO public.interests VALUES (172, 'Foreign language learning', NULL);
INSERT INTO public.interests VALUES (173, 'Fossil hunting', NULL);
INSERT INTO public.interests VALUES (174, 'Four Wheeling', NULL);
INSERT INTO public.interests VALUES (175, 'Freshwater Aquariums', NULL);
INSERT INTO public.interests VALUES (176, 'Frisbee Golf – Frolf', NULL);
INSERT INTO public.interests VALUES (177, 'Gambling', NULL);
INSERT INTO public.interests VALUES (178, 'Games', NULL);
INSERT INTO public.interests VALUES (179, 'Gaming (tabletop games and role-playing games)', NULL);
INSERT INTO public.interests VALUES (180, 'Garage Saleing', NULL);
INSERT INTO public.interests VALUES (181, 'Gardening', NULL);
INSERT INTO public.interests VALUES (182, 'Genealogy', NULL);
INSERT INTO public.interests VALUES (183, 'Geocaching', NULL);
INSERT INTO public.interests VALUES (184, 'Ghost hunting', NULL);
INSERT INTO public.interests VALUES (185, 'Glassblowing', NULL);
INSERT INTO public.interests VALUES (186, 'Glowsticking', NULL);
INSERT INTO public.interests VALUES (187, 'Gnoming', NULL);
INSERT INTO public.interests VALUES (188, 'Go', NULL);
INSERT INTO public.interests VALUES (189, 'Go Kart Racing', NULL);
INSERT INTO public.interests VALUES (190, 'Going to movies', NULL);
INSERT INTO public.interests VALUES (191, 'Golf', NULL);
INSERT INTO public.interests VALUES (192, 'Golfing', NULL);
INSERT INTO public.interests VALUES (193, 'Gongoozling', NULL);
INSERT INTO public.interests VALUES (194, 'Graffiti', NULL);
INSERT INTO public.interests VALUES (195, 'Grip Strength', NULL);
INSERT INTO public.interests VALUES (196, 'Guitar', NULL);
INSERT INTO public.interests VALUES (197, 'Gun Collecting', NULL);
INSERT INTO public.interests VALUES (198, 'Gunsmithing', NULL);
INSERT INTO public.interests VALUES (199, 'Gymnastics', NULL);
INSERT INTO public.interests VALUES (200, 'Gyotaku', NULL);
INSERT INTO public.interests VALUES (201, 'Handball', NULL);
INSERT INTO public.interests VALUES (202, 'Handwriting Analysis', NULL);
INSERT INTO public.interests VALUES (203, 'Hang gliding', NULL);
INSERT INTO public.interests VALUES (204, 'Herping', NULL);
INSERT INTO public.interests VALUES (205, 'Hiking', NULL);
INSERT INTO public.interests VALUES (206, 'Home Brewing', NULL);
INSERT INTO public.interests VALUES (207, 'Home Repair', NULL);
INSERT INTO public.interests VALUES (208, 'Home Theater', NULL);
INSERT INTO public.interests VALUES (209, 'Homebrewing', NULL);
INSERT INTO public.interests VALUES (210, 'Hooping', NULL);
INSERT INTO public.interests VALUES (211, 'Horse riding', NULL);
INSERT INTO public.interests VALUES (212, 'Hot air ballooning', NULL);
INSERT INTO public.interests VALUES (213, 'Hula Hooping', NULL);
INSERT INTO public.interests VALUES (214, 'Hunting', NULL);
INSERT INTO public.interests VALUES (215, 'Ice hockey', NULL);
INSERT INTO public.interests VALUES (216, 'Ice skating', NULL);
INSERT INTO public.interests VALUES (217, 'Iceskating', NULL);
INSERT INTO public.interests VALUES (218, 'Illusion', NULL);
INSERT INTO public.interests VALUES (219, 'Impersonations', NULL);
INSERT INTO public.interests VALUES (220, 'Inline skating', NULL);
INSERT INTO public.interests VALUES (221, 'Insect collecting', NULL);
INSERT INTO public.interests VALUES (222, 'Internet', NULL);
INSERT INTO public.interests VALUES (223, 'Inventing', NULL);
INSERT INTO public.interests VALUES (224, 'Jet Engines', NULL);
INSERT INTO public.interests VALUES (225, 'Jewelry Making', NULL);
INSERT INTO public.interests VALUES (226, 'Jigsaw Puzzles', NULL);
INSERT INTO public.interests VALUES (227, 'Jogging', NULL);
INSERT INTO public.interests VALUES (228, 'Judo', NULL);
INSERT INTO public.interests VALUES (229, 'Juggling', NULL);
INSERT INTO public.interests VALUES (230, 'Jukskei', NULL);
INSERT INTO public.interests VALUES (231, 'Jump Roping', NULL);
INSERT INTO public.interests VALUES (232, 'Kabaddi', NULL);
INSERT INTO public.interests VALUES (233, 'Kart racing', NULL);
INSERT INTO public.interests VALUES (234, 'Kayaking', NULL);
INSERT INTO public.interests VALUES (235, 'Keep A Journal', NULL);
INSERT INTO public.interests VALUES (236, 'Kitchen Chemistry', NULL);
INSERT INTO public.interests VALUES (237, 'Kite Boarding', NULL);
INSERT INTO public.interests VALUES (238, 'Kite flying', NULL);
INSERT INTO public.interests VALUES (239, 'Kites', NULL);
INSERT INTO public.interests VALUES (240, 'Kitesurfing', NULL);
INSERT INTO public.interests VALUES (241, 'Knapping', NULL);
INSERT INTO public.interests VALUES (242, 'Knife making', NULL);
INSERT INTO public.interests VALUES (243, 'Knife throwing', NULL);
INSERT INTO public.interests VALUES (244, 'Knitting', NULL);
INSERT INTO public.interests VALUES (245, 'Knotting', NULL);
INSERT INTO public.interests VALUES (246, 'Lacemaking', NULL);
INSERT INTO public.interests VALUES (247, 'Lacrosse', NULL);
INSERT INTO public.interests VALUES (248, 'Lapidary', NULL);
INSERT INTO public.interests VALUES (249, 'LARPing', NULL);
INSERT INTO public.interests VALUES (250, 'Laser tag', NULL);
INSERT INTO public.interests VALUES (251, 'Lasers', NULL);
INSERT INTO public.interests VALUES (252, 'Lawn Darts', NULL);
INSERT INTO public.interests VALUES (253, 'Learn to Play Poker', NULL);
INSERT INTO public.interests VALUES (254, 'Learning A Foreign Language', NULL);
INSERT INTO public.interests VALUES (255, 'Learning An Instrument', NULL);
INSERT INTO public.interests VALUES (256, 'Learning To Pilot A Plane', NULL);
INSERT INTO public.interests VALUES (257, 'Leather crafting', NULL);
INSERT INTO public.interests VALUES (258, 'Leathercrafting', NULL);
INSERT INTO public.interests VALUES (259, 'Lego building', NULL);
INSERT INTO public.interests VALUES (260, 'Legos', NULL);
INSERT INTO public.interests VALUES (261, 'Letterboxing', NULL);
INSERT INTO public.interests VALUES (262, 'Listening to music', NULL);
INSERT INTO public.interests VALUES (263, 'Locksport', NULL);
INSERT INTO public.interests VALUES (264, 'Machining', NULL);
INSERT INTO public.interests VALUES (265, 'Macramé', NULL);
INSERT INTO public.interests VALUES (266, 'Macrame', NULL);
INSERT INTO public.interests VALUES (267, 'Magic', NULL);
INSERT INTO public.interests VALUES (268, 'Mahjong', NULL);
INSERT INTO public.interests VALUES (269, 'Making Model Cars', NULL);
INSERT INTO public.interests VALUES (270, 'Marbles', NULL);
INSERT INTO public.interests VALUES (271, 'Marksmanship', NULL);
INSERT INTO public.interests VALUES (272, 'Martial arts', NULL);
INSERT INTO public.interests VALUES (273, 'Matchstick Modeling', NULL);
INSERT INTO public.interests VALUES (274, 'Meditation', NULL);
INSERT INTO public.interests VALUES (275, 'Metal detecting', NULL);
INSERT INTO public.interests VALUES (276, 'Meteorology', NULL);
INSERT INTO public.interests VALUES (277, 'Microscopy', NULL);
INSERT INTO public.interests VALUES (278, 'Mineral collecting', NULL);
INSERT INTO public.interests VALUES (279, 'Model aircraft', NULL);
INSERT INTO public.interests VALUES (280, 'Model building', NULL);
INSERT INTO public.interests VALUES (281, 'Model Railroading', NULL);
INSERT INTO public.interests VALUES (282, 'Model Rockets', NULL);
INSERT INTO public.interests VALUES (283, 'Modeling Ships', NULL);
INSERT INTO public.interests VALUES (284, 'Models', NULL);
INSERT INTO public.interests VALUES (285, 'Motor sports', NULL);
INSERT INTO public.interests VALUES (286, 'Motorcycles', NULL);
INSERT INTO public.interests VALUES (287, 'Mountain Biking', NULL);
INSERT INTO public.interests VALUES (288, 'Mountain Climbing', NULL);
INSERT INTO public.interests VALUES (289, 'Mountaineering', NULL);
INSERT INTO public.interests VALUES (290, 'Movie and movie memorabilia collecting', NULL);
INSERT INTO public.interests VALUES (291, 'Mushroom hunting/Mycology', NULL);
INSERT INTO public.interests VALUES (292, 'Musical Instruments', NULL);
INSERT INTO public.interests VALUES (293, 'Nail Art', NULL);
INSERT INTO public.interests VALUES (294, 'Needlepoint', NULL);
INSERT INTO public.interests VALUES (295, 'Netball', NULL);
INSERT INTO public.interests VALUES (296, 'Nordic skating', NULL);
INSERT INTO public.interests VALUES (297, 'Orienteering', NULL);
INSERT INTO public.interests VALUES (298, 'Origami', NULL);
INSERT INTO public.interests VALUES (299, 'Owning An Antique Car', NULL);
INSERT INTO public.interests VALUES (300, 'Paintball', NULL);
INSERT INTO public.interests VALUES (301, 'Painting', NULL);
INSERT INTO public.interests VALUES (302, 'Papermache', NULL);
INSERT INTO public.interests VALUES (303, 'Papermaking', NULL);
INSERT INTO public.interests VALUES (304, 'Parachuting', NULL);
INSERT INTO public.interests VALUES (305, 'Paragliding or Power Paragliding', NULL);
INSERT INTO public.interests VALUES (306, 'Parkour', NULL);
INSERT INTO public.interests VALUES (307, 'People Watching', NULL);
INSERT INTO public.interests VALUES (308, 'Photography', NULL);
INSERT INTO public.interests VALUES (309, 'Piano', NULL);
INSERT INTO public.interests VALUES (310, 'Pigeon racing', NULL);
INSERT INTO public.interests VALUES (311, 'Pinochle', NULL);
INSERT INTO public.interests VALUES (312, 'Pipe Smoking', NULL);
INSERT INTO public.interests VALUES (313, 'Planking', NULL);
INSERT INTO public.interests VALUES (314, 'Playing music', NULL);
INSERT INTO public.interests VALUES (315, 'Playing musical instruments', NULL);
INSERT INTO public.interests VALUES (316, 'Playing team sports', NULL);
INSERT INTO public.interests VALUES (317, 'Poker', NULL);
INSERT INTO public.interests VALUES (318, 'Pole Dancing', NULL);
INSERT INTO public.interests VALUES (319, 'Polo', NULL);
INSERT INTO public.interests VALUES (320, 'Pottery', NULL);
INSERT INTO public.interests VALUES (321, 'Powerboking', NULL);
INSERT INTO public.interests VALUES (322, 'Protesting', NULL);
INSERT INTO public.interests VALUES (323, 'Puppetry', NULL);
INSERT INTO public.interests VALUES (324, 'Puzzles', NULL);
INSERT INTO public.interests VALUES (325, 'Pyrotechnics', NULL);
INSERT INTO public.interests VALUES (326, 'Quilting', NULL);
INSERT INTO public.interests VALUES (327, 'R/C Boats', NULL);
INSERT INTO public.interests VALUES (328, 'R/C Cars', NULL);
INSERT INTO public.interests VALUES (329, 'R/C Helicopters', NULL);
INSERT INTO public.interests VALUES (330, 'R/C Planes', NULL);
INSERT INTO public.interests VALUES (331, 'Racing Pigeons', NULL);
INSERT INTO public.interests VALUES (332, 'Racquetball', NULL);
INSERT INTO public.interests VALUES (333, 'Radio-controlled car racing', NULL);
INSERT INTO public.interests VALUES (334, 'Rafting', NULL);
INSERT INTO public.interests VALUES (335, 'Railfans', NULL);
INSERT INTO public.interests VALUES (336, 'Rappelling', NULL);
INSERT INTO public.interests VALUES (337, 'Rapping', NULL);
INSERT INTO public.interests VALUES (338, 'Reading', NULL);
INSERT INTO public.interests VALUES (339, 'Reading To The Elderly', NULL);
INSERT INTO public.interests VALUES (340, 'Record collecting', NULL);
INSERT INTO public.interests VALUES (341, 'Relaxing', NULL);
INSERT INTO public.interests VALUES (342, 'Renaissance Faire', NULL);
INSERT INTO public.interests VALUES (343, 'Renting movies', NULL);
INSERT INTO public.interests VALUES (344, 'Rescuing Abused Or Abandoned Animals', NULL);
INSERT INTO public.interests VALUES (345, 'Robotics', NULL);
INSERT INTO public.interests VALUES (346, 'Rock balancing', NULL);
INSERT INTO public.interests VALUES (347, 'Rock climbing', NULL);
INSERT INTO public.interests VALUES (348, 'Rock Collecting', NULL);
INSERT INTO public.interests VALUES (349, 'Rockets', NULL);
INSERT INTO public.interests VALUES (350, 'Rocking AIDS Babies', NULL);
INSERT INTO public.interests VALUES (351, 'Roleplaying', NULL);
INSERT INTO public.interests VALUES (352, 'Roller derby', NULL);
INSERT INTO public.interests VALUES (353, 'Roller skating', NULL);
INSERT INTO public.interests VALUES (354, 'Rugby', NULL);
INSERT INTO public.interests VALUES (355, 'Rugby league football', NULL);
INSERT INTO public.interests VALUES (356, 'Running', NULL);
INSERT INTO public.interests VALUES (357, 'Sailing', NULL);
INSERT INTO public.interests VALUES (358, 'Saltwater Aquariums', NULL);
INSERT INTO public.interests VALUES (359, 'Sand art', NULL);
INSERT INTO public.interests VALUES (360, 'Sand Castles', NULL);
INSERT INTO public.interests VALUES (361, 'Scrapbooking', NULL);
INSERT INTO public.interests VALUES (362, 'Scuba diving', NULL);
INSERT INTO public.interests VALUES (363, 'Sculling or Rowing', NULL);
INSERT INTO public.interests VALUES (364, 'Sculpting', NULL);
INSERT INTO public.interests VALUES (365, 'Sea glass collecting', NULL);
INSERT INTO public.interests VALUES (366, 'Seashell collecting', NULL);
INSERT INTO public.interests VALUES (367, 'Self Defense', NULL);
INSERT INTO public.interests VALUES (368, 'Sewing', NULL);
INSERT INTO public.interests VALUES (369, 'Shark Fishing', NULL);
INSERT INTO public.interests VALUES (370, 'Shooting', NULL);
INSERT INTO public.interests VALUES (371, 'Shooting sport', NULL);
INSERT INTO public.interests VALUES (372, 'Shopping', NULL);
INSERT INTO public.interests VALUES (373, 'Shortwave listening', NULL);
INSERT INTO public.interests VALUES (374, 'Singing', NULL);
INSERT INTO public.interests VALUES (375, 'Singing In Choir', NULL);
INSERT INTO public.interests VALUES (376, 'Skateboarding', NULL);
INSERT INTO public.interests VALUES (377, 'Skeet Shooting', NULL);
INSERT INTO public.interests VALUES (378, 'Sketching', NULL);
INSERT INTO public.interests VALUES (379, 'Skiing', NULL);
INSERT INTO public.interests VALUES (380, 'Skimboarding', NULL);
INSERT INTO public.interests VALUES (381, 'Sky Diving', NULL);
INSERT INTO public.interests VALUES (382, 'Skydiving', NULL);
INSERT INTO public.interests VALUES (383, 'Slack Lining', NULL);
INSERT INTO public.interests VALUES (384, 'Slacklining', NULL);
INSERT INTO public.interests VALUES (385, 'Sleeping', NULL);
INSERT INTO public.interests VALUES (386, 'Slingshots', NULL);
INSERT INTO public.interests VALUES (387, 'Slot car racing', NULL);
INSERT INTO public.interests VALUES (388, 'Snorkeling', NULL);
INSERT INTO public.interests VALUES (389, 'Snowboarding', NULL);
INSERT INTO public.interests VALUES (390, 'Soap Making', NULL);
INSERT INTO public.interests VALUES (391, 'Soapmaking', NULL);
INSERT INTO public.interests VALUES (392, 'Soccer', NULL);
INSERT INTO public.interests VALUES (393, 'Socializing with friends/neighbors', NULL);
INSERT INTO public.interests VALUES (394, 'Speed Cubing (rubix cube)', NULL);
INSERT INTO public.interests VALUES (395, 'Speed skating', NULL);
INSERT INTO public.interests VALUES (396, 'Spelunkering', NULL);
INSERT INTO public.interests VALUES (397, 'Spending time with family/kids', NULL);
INSERT INTO public.interests VALUES (398, 'Sports', NULL);
INSERT INTO public.interests VALUES (399, 'Squash', NULL);
INSERT INTO public.interests VALUES (400, 'Stamp Collecting', NULL);
INSERT INTO public.interests VALUES (401, 'Stand-up comedy', NULL);
INSERT INTO public.interests VALUES (402, 'Stone collecting', NULL);
INSERT INTO public.interests VALUES (403, 'Stone skipping', NULL);
INSERT INTO public.interests VALUES (404, 'Storm Chasing', NULL);
INSERT INTO public.interests VALUES (405, 'Storytelling', NULL);
INSERT INTO public.interests VALUES (406, 'String Figures', NULL);
INSERT INTO public.interests VALUES (407, 'Sudoku', NULL);
INSERT INTO public.interests VALUES (408, 'Surf Fishing', NULL);
INSERT INTO public.interests VALUES (409, 'Surfing', NULL);
INSERT INTO public.interests VALUES (410, 'Survival', NULL);
INSERT INTO public.interests VALUES (411, 'Swimming', NULL);
INSERT INTO public.interests VALUES (412, 'Table football', NULL);
INSERT INTO public.interests VALUES (413, 'Table tennis', NULL);
INSERT INTO public.interests VALUES (414, 'Taekwondo', NULL);
INSERT INTO public.interests VALUES (415, 'Tai chi', NULL);
INSERT INTO public.interests VALUES (416, 'Tatting', NULL);
INSERT INTO public.interests VALUES (417, 'Taxidermy', NULL);
INSERT INTO public.interests VALUES (418, 'Tea Tasting', NULL);
INSERT INTO public.interests VALUES (419, 'Tennis', NULL);
INSERT INTO public.interests VALUES (420, 'Tesla Coils', NULL);
INSERT INTO public.interests VALUES (421, 'Tetris', NULL);
INSERT INTO public.interests VALUES (422, 'Textiles', NULL);
INSERT INTO public.interests VALUES (423, 'Texting', NULL);
INSERT INTO public.interests VALUES (424, 'Tombstone Rubbing', NULL);
INSERT INTO public.interests VALUES (425, 'Tool Collecting', NULL);
INSERT INTO public.interests VALUES (426, 'Tour skating', NULL);
INSERT INTO public.interests VALUES (427, 'Toy Collecting', NULL);
INSERT INTO public.interests VALUES (428, 'Train Collecting', NULL);
INSERT INTO public.interests VALUES (429, 'Train Spotting', NULL);
INSERT INTO public.interests VALUES (430, 'Trainspotting', NULL);
INSERT INTO public.interests VALUES (431, 'Traveling', NULL);
INSERT INTO public.interests VALUES (432, 'Treasure Hunting', NULL);
INSERT INTO public.interests VALUES (433, 'Trekkie', NULL);
INSERT INTO public.interests VALUES (434, 'Triathlon', NULL);
INSERT INTO public.interests VALUES (435, 'Tutoring Children', NULL);
INSERT INTO public.interests VALUES (436, 'TV watching', NULL);
INSERT INTO public.interests VALUES (437, 'Ultimate Frisbee', NULL);
INSERT INTO public.interests VALUES (438, 'Urban exploration', NULL);
INSERT INTO public.interests VALUES (439, 'Vehicle restoration', NULL);
INSERT INTO public.interests VALUES (440, 'Video game collecting', NULL);
INSERT INTO public.interests VALUES (441, 'Video Games', NULL);
INSERT INTO public.interests VALUES (442, 'Video gaming', NULL);
INSERT INTO public.interests VALUES (443, 'Videophilia', NULL);
INSERT INTO public.interests VALUES (444, 'Vintage cars', NULL);
INSERT INTO public.interests VALUES (445, 'Violin', NULL);
INSERT INTO public.interests VALUES (446, 'Volleyball', NULL);
INSERT INTO public.interests VALUES (447, 'Volunteer', NULL);
INSERT INTO public.interests VALUES (448, 'Walking', NULL);
INSERT INTO public.interests VALUES (449, 'Warhammer', NULL);
INSERT INTO public.interests VALUES (450, 'Watching movies', NULL);
INSERT INTO public.interests VALUES (451, 'Watching sporting events', NULL);
INSERT INTO public.interests VALUES (452, 'Water sports', NULL);
INSERT INTO public.interests VALUES (453, 'Weather Watcher', NULL);
INSERT INTO public.interests VALUES (454, 'Web surfing', NULL);
INSERT INTO public.interests VALUES (455, 'Weightlifting', NULL);
INSERT INTO public.interests VALUES (456, 'Windsurfing', NULL);
INSERT INTO public.interests VALUES (457, 'Wine Making', NULL);
INSERT INTO public.interests VALUES (458, 'Wingsuit Flying', NULL);
INSERT INTO public.interests VALUES (459, 'Wood carving', NULL);
INSERT INTO public.interests VALUES (460, 'Woodworking', NULL);
INSERT INTO public.interests VALUES (461, 'Working In A Food Pantry', NULL);
INSERT INTO public.interests VALUES (462, 'Working on cars', NULL);
INSERT INTO public.interests VALUES (463, 'World Record Breaking', NULL);
INSERT INTO public.interests VALUES (464, 'Worldbuilding', NULL);
INSERT INTO public.interests VALUES (465, 'Wrestling', NULL);
INSERT INTO public.interests VALUES (466, 'Writing', NULL);
INSERT INTO public.interests VALUES (467, 'Writing Music', NULL);
INSERT INTO public.interests VALUES (468, 'Writing Songs', NULL);
INSERT INTO public.interests VALUES (469, 'Yo-yoing', NULL);
INSERT INTO public.interests VALUES (470, 'Yoga', NULL);
INSERT INTO public.interests VALUES (471, 'YoYo', NULL);
INSERT INTO public.interests VALUES (472, 'Ziplining', NULL);
INSERT INTO public.interests VALUES (473, 'Zumba', NULL);


--
-- Data for Name: interests_users; Type: TABLE DATA; Schema: public; Owner: lnagler1
--



--
-- Data for Name: like_user; Type: TABLE DATA; Schema: public; Owner: lnagler1
--



--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: lnagler1
--



--
-- Data for Name: looking_for; Type: TABLE DATA; Schema: public; Owner: lnagler1
--



--
-- Data for Name: match_user; Type: TABLE DATA; Schema: public; Owner: lnagler1
--



--
-- Data for Name: playing_with_neon; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

INSERT INTO public.playing_with_neon VALUES (1, 'c4ca4238a0', 0.981526);
INSERT INTO public.playing_with_neon VALUES (2, 'c81e728d9d', 0.44057208);
INSERT INTO public.playing_with_neon VALUES (3, 'eccbc87e4b', 0.17446828);
INSERT INTO public.playing_with_neon VALUES (4, 'a87ff679a2', 0.9201238);
INSERT INTO public.playing_with_neon VALUES (5, 'e4da3b7fbb', 0.8729564);
INSERT INTO public.playing_with_neon VALUES (6, '1679091c5a', 0.86983514);
INSERT INTO public.playing_with_neon VALUES (7, '8f14e45fce', 0.24332741);
INSERT INTO public.playing_with_neon VALUES (8, 'c9f0f895fb', 0.42946717);
INSERT INTO public.playing_with_neon VALUES (9, '45c48cce2e', 0.7393041);
INSERT INTO public.playing_with_neon VALUES (10, 'd3d9446802', 0.16446519);


--
-- Data for Name: religion; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

INSERT INTO public.religion VALUES (1, 'Christentum');
INSERT INTO public.religion VALUES (2, 'Buddhismus');
INSERT INTO public.religion VALUES (3, 'Hinduismus');
INSERT INTO public.religion VALUES (4, 'Islam');
INSERT INTO public.religion VALUES (5, 'Judentum');


--
-- Data for Name: sexuality; Type: TABLE DATA; Schema: public; Owner: lnagler1
--



--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

INSERT INTO public.state VALUES (1, 'Upper-Austria', 585);
INSERT INTO public.state VALUES (2, 'Lower-Austria', 585);
INSERT INTO public.state VALUES (3, 'Salzburg', 585);
INSERT INTO public.state VALUES (4, 'Tyrol', 585);
INSERT INTO public.state VALUES (5, 'Vorarlberg', 585);
INSERT INTO public.state VALUES (6, 'Vienna', 585);
INSERT INTO public.state VALUES (7, 'Burgenland', 585);
INSERT INTO public.state VALUES (8, 'Kärnten', 585);


--
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

INSERT INTO public.user_account VALUES (1, 32, NULL, '1990-01-01 01:00:00', 0, 'lukasnaagler17@gmail.com', 170, NULL, 'nick123', '$2a$10$YvmJCSJY.S9/2xrz1La0S.QXGOxgyuVwznQ31PD0JTzvTq5CwAztu', NULL, 'ROLE_USER', 'snap_user', true, NULL, '$2a$10$8U1YGEyHLS8E05ujKgCpSu39B/nSNoWQCGKFib5Cyv3FnG6dXyJEy', 1706278562346, 'exampleUser', 85, NULL, NULL, NULL, NULL);


--
-- Data for Name: user_account_interests; Type: TABLE DATA; Schema: public; Owner: lnagler1
--



--
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.city_id_seq', 5, true);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.country_id_seq', 1, false);


--
-- Name: gender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.gender_id_seq', 1, false);


--
-- Name: icon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.icon_id_seq', 1, false);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.image_id_seq', 1, false);


--
-- Name: interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.interests_id_seq', 1, false);


--
-- Name: like_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.like_user_id_seq', 1, false);


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.location_id_seq', 1, false);


--
-- Name: looking_for_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.looking_for_id_seq', 1, false);


--
-- Name: match_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.match_user_id_seq', 1, false);


--
-- Name: playing_with_neon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.playing_with_neon_id_seq', 10, true);


--
-- Name: religion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.religion_id_seq', 1, false);


--
-- Name: sexuality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.sexuality_id_seq', 1, false);


--
-- Name: state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.state_id_seq', 8, true);


--
-- Name: user_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lnagler1
--

SELECT pg_catalog.setval('public.user_account_id_seq', 1, true);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: gender gender_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.gender
    ADD CONSTRAINT gender_pkey PRIMARY KEY (id);


--
-- Name: icon icon_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.icon
    ADD CONSTRAINT icon_pkey PRIMARY KEY (id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: interests interests_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_pkey PRIMARY KEY (id);


--
-- Name: like_user like_user_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.like_user
    ADD CONSTRAINT like_user_pkey PRIMARY KEY (id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: looking_for looking_for_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.looking_for
    ADD CONSTRAINT looking_for_pkey PRIMARY KEY (id);


--
-- Name: match_user match_user_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.match_user
    ADD CONSTRAINT match_user_pkey PRIMARY KEY (id);


--
-- Name: playing_with_neon playing_with_neon_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.playing_with_neon
    ADD CONSTRAINT playing_with_neon_pkey PRIMARY KEY (id);


--
-- Name: religion religion_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.religion
    ADD CONSTRAINT religion_pkey PRIMARY KEY (id);


--
-- Name: sexuality sexuality_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.sexuality
    ADD CONSTRAINT sexuality_pkey PRIMARY KEY (id);


--
-- Name: state state_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (id);


--
-- Name: interests uk_bt62c80b3xxxs4qrtpy78bdis; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.interests
    ADD CONSTRAINT uk_bt62c80b3xxxs4qrtpy78bdis UNIQUE (icon_id);


--
-- Name: icon uk_ihemeki049cmutnlfgrkbinl5; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.icon
    ADD CONSTRAINT uk_ihemeki049cmutnlfgrkbinl5 UNIQUE (interest_id);


--
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (id);


--
-- Name: interests fk39l34gofcfwiegbh42cfo21vy; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.interests
    ADD CONSTRAINT fk39l34gofcfwiegbh42cfo21vy FOREIGN KEY (icon_id) REFERENCES public.icon(id);


--
-- Name: location fk4bv34oss25wa4v0vkrdjy9kra; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT fk4bv34oss25wa4v0vkrdjy9kra FOREIGN KEY (state_id) REFERENCES public.state(id);


--
-- Name: icon fk62e9dbm2ktxj347pby5tdqa8o; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.icon
    ADD CONSTRAINT fk62e9dbm2ktxj347pby5tdqa8o FOREIGN KEY (interest_id) REFERENCES public.interests(id);


--
-- Name: interests_users fk64p3mfdkdt8vl3hinoblmywm7; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.interests_users
    ADD CONSTRAINT fk64p3mfdkdt8vl3hinoblmywm7 FOREIGN KEY (users_id) REFERENCES public.user_account(id);


--
-- Name: user_account fk66mkpc6gkk87rifrt0hkcv0hc; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT fk66mkpc6gkk87rifrt0hkcv0hc FOREIGN KEY (gender_id) REFERENCES public.gender(id);


--
-- Name: city fk6p2u50v8fg2y0js6djc6xanit; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT fk6p2u50v8fg2y0js6djc6xanit FOREIGN KEY (state_id) REFERENCES public.state(id);


--
-- Name: like_user fkbfrxy3hp9ep0grr3s3vcuicvo; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.like_user
    ADD CONSTRAINT fkbfrxy3hp9ep0grr3s3vcuicvo FOREIGN KEY (liked_user_id) REFERENCES public.user_account(id);


--
-- Name: user_account fkdhbq7nke42vx11rcx8tfedewv; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT fkdhbq7nke42vx11rcx8tfedewv FOREIGN KEY (sexuality_id) REFERENCES public.sexuality(id);


--
-- Name: state fkghic7mqjt6qb9vq7up7awu0er; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT fkghic7mqjt6qb9vq7up7awu0er FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- Name: match_user fkgpay54my3tu3sowkvb97yfy2n; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.match_user
    ADD CONSTRAINT fkgpay54my3tu3sowkvb97yfy2n FOREIGN KEY (match_user_id) REFERENCES public.user_account(id);


--
-- Name: match_user fkgwthr1dbd72n8dkb1kc1gdmkr; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.match_user
    ADD CONSTRAINT fkgwthr1dbd72n8dkb1kc1gdmkr FOREIGN KEY (user_id) REFERENCES public.user_account(id);


--
-- Name: user_account fkhwspgvb7g3rh177bwq8e63x8b; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT fkhwspgvb7g3rh177bwq8e63x8b FOREIGN KEY (looking_for_id) REFERENCES public.looking_for(id);


--
-- Name: user_account fkiwisfjj5dn9lx7y8kqi3qe4s8; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT fkiwisfjj5dn9lx7y8kqi3qe4s8 FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: user_account fkkopm6g6oyn75wkp2oeb2h4x2h; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT fkkopm6g6oyn75wkp2oeb2h4x2h FOREIGN KEY (religion_id) REFERENCES public.religion(id);


--
-- Name: like_user fkky27qkjvvtdflvrxc2rgp07sl; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.like_user
    ADD CONSTRAINT fkky27qkjvvtdflvrxc2rgp07sl FOREIGN KEY (user_id) REFERENCES public.user_account(id);


--
-- Name: location fkn5m6ve3ryy2r25qvisdrg0aos; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT fkn5m6ve3ryy2r25qvisdrg0aos FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- Name: location fkr2gdhhu8rhyrvslukhtfbg8v5; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT fkr2gdhhu8rhyrvslukhtfbg8v5 FOREIGN KEY (city_id) REFERENCES public.city(id);


--
-- Name: interests_users fkrkgqfgft5clcnfr2yf7xge5gi; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.interests_users
    ADD CONSTRAINT fkrkgqfgft5clcnfr2yf7xge5gi FOREIGN KEY (interest_id) REFERENCES public.interests(id);


--
-- Name: user_account_interests fks5gdytn81rvf054fhfv6sud9f; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.user_account_interests
    ADD CONSTRAINT fks5gdytn81rvf054fhfv6sud9f FOREIGN KEY (user_id) REFERENCES public.user_account(id);


--
-- Name: image fksxt4logod6o9cb6sls630rp48; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fksxt4logod6o9cb6sls630rp48 FOREIGN KEY (user_id) REFERENCES public.user_account(id);


--
-- Name: user_account_interests fktl603sbrm2t2qerf2kfd3qeu3; Type: FK CONSTRAINT; Schema: public; Owner: lnagler1
--

ALTER TABLE ONLY public.user_account_interests
    ADD CONSTRAINT fktl603sbrm2t2qerf2kfd3qeu3 FOREIGN KEY (interests_id) REFERENCES public.interests(id);


--
-- PostgreSQL database dump complete
--
