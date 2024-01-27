-
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


ALTER TABLE public.city OWNER TO lnagler1;

--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.city_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.country OWNER TO lnagler1;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.country_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.gender OWNER TO lnagler1;

--
-- Name: gender_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.gender_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gender_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.icon OWNER TO lnagler1;

--
-- Name: icon_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.icon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.icon_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.image OWNER TO lnagler1;

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.image_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.interests OWNER TO lnagler1;

--
-- Name: interests_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.interests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.interests_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.interests_users OWNER TO lnagler1;

--
-- Name: like_user; Type: TABLE; Schema: public; Owner: lnagler1
--

CREATE TABLE public.like_user (
                                  id bigint NOT NULL,
                                  liked_user_id bigint,
                                  user_id bigint
);


ALTER TABLE public.like_user OWNER TO lnagler1;

--
-- Name: like_user_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.like_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.like_user_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.location OWNER TO lnagler1;

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.location_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.looking_for OWNER TO lnagler1;

--
-- Name: looking_for_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.looking_for_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.looking_for_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.match_user OWNER TO lnagler1;

--
-- Name: match_user_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.match_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.match_user_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.playing_with_neon OWNER TO lnagler1;

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


ALTER SEQUENCE public.playing_with_neon_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.religion OWNER TO lnagler1;

--
-- Name: religion_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.religion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.religion_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.sexuality OWNER TO lnagler1;

--
-- Name: sexuality_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.sexuality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sexuality_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.state OWNER TO lnagler1;

--
-- Name: state_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.state_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.user_account OWNER TO lnagler1;

--
-- Name: user_account_id_seq; Type: SEQUENCE; Schema: public; Owner: lnagler1
--

CREATE SEQUENCE public.user_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_account_id_seq OWNER TO lnagler1;

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


ALTER TABLE public.user_account_interests OWNER TO lnagler1;

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

COPY public.city (id, name, state_id) FROM stdin;
1	Garsten	1
2	Steyr	1
3	Wolfern	1
4	Dietach	1
5	St. Ulrich	1
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.country (id, name, iso) FROM stdin;
571	Afghanistan	AF
572	Aland Islands	AX
573	Albania	AL
574	Algeria	DZ
575	American Samoa	AS
576	Andorra	AD
577	Angola	AO
578	Anguilla	AI
579	Antarctica	AQ
580	Antigua And Barbuda	AG
581	Argentina	AR
582	Armenia	AM
583	Aruba	AW
584	Australia	AU
585	Austria	AT
586	Azerbaijan	AZ
587	Bahrain	BH
588	Bangladesh	BD
589	Barbados	BB
590	Belarus	BY
591	Belgium	BE
592	Belize	BZ
593	Benin	BJ
594	Bermuda	BM
595	Bhutan	BT
596	Bolivia	BO
597	Bonaire, Sint Eustatius and Saba	BQ
598	Bosnia and Herzegovina	BA
599	Botswana	BW
600	Bouvet Island	BV
601	Brazil	BR
602	British Indian Ocean Territory	IO
603	Brunei	BN
604	Bulgaria	BG
605	Burkina Faso	BF
606	Burundi	BI
607	Cambodia	KH
608	Cameroon	CM
609	Canada	CA
610	Cape Verde	CV
611	Cayman Islands	KY
612	Central African Republic	CF
613	Chad	TD
614	Chile	CL
615	China	CN
616	Christmas Island	CX
617	Cocos (Keeling) Islands	CC
618	Colombia	CO
619	Comoros	KM
620	Congo	CG
621	Cook Islands	CK
622	Costa Rica	CR
623	Cote DIvoire (Ivory Coast)	CI
624	Croatia	HR
625	Cuba	CU
626	Curaçao	CW
627	Cyprus	CY
628	Czech Republic	CZ
629	Democratic Republic of the Congo	CD
630	Denmark	DK
631	Djibouti	DJ
632	Dominica	DM
633	Dominican Republic	DO
    634	East Timor	TL
635	Ecuador	EC
636	Egypt	EG
637	El Salvador	SV
638	Equatorial Guinea	GQ
639	Eritrea	ER
640	Estonia	EE
641	Ethiopia	ET
642	Falkland Islands	FK
643	Faroe Islands	FO
644	Fiji Islands	FJ
645	Finland	FI
646	France	FR
647	French Guiana	GF
648	French Polynesia	PF
649	French Southern Territories	TF
650	Gabon	GA
651	Gambia The	GM
652	Georgia	GE
653	Germany	DE
654	Ghana	GH
655	Gibraltar	GI
656	Greece	GR
657	Greenland	GL
658	Grenada	GD
659	Guadeloupe	GP
660	Guam	GU
661	Guatemala	GT
662	Guernsey and Alderney	GG
663	Guinea	GN
664	Guinea-Bissau	GW
665	Guyana	GY
666	Haiti	HT
667	Heard Island and McDonald Islands	HM
668	Honduras	HN
669	Hong Kong S.A.R.	HK
670	Hungary	HU
671	Iceland	IS
672	India	IN
673	Indonesia	ID
674	Iran	IR
675	Iraq	IQ
676	Ireland	IE
677	Israel	IL
678	Italy	IT
679	Jamaica	JM
680	Japan	JP
681	Jersey	JE
682	Jordan	JO
683	Kazakhstan	KZ
684	Kenya	KE
685	Kiribati	KI
686	Kosovo	XK
687	Kuwait	KW
688	Kyrgyzstan	KG
689	Laos	LA
690	Latvia	LV
691	Lebanon	LB
692	Lesotho	LS
693	Liberia	LR
694	Libya	LY
695	Liechtenstein	LI
696	Lithuania	LT
697	Luxembourg	LU
698	Macau S.A.R.	MO
699	Madagascar	MG
700	Malawi	MW
701	Malaysia	MY
702	Maldives	MV
703	Mali	ML
704	Malta	MT
705	Man (Isle of)	IM
706	Marshall Islands	MH
707	Martinique	MQ
708	Mauritania	MR
709	Mauritius	MU
710	Mayotte	YT
711	Mexico	MX
712	Micronesia	FM
713	Moldova	MD
714	Monaco	MC
715	Mongolia	MN
716	Montenegro	ME
717	Montserrat	MS
718	Morocco	MA
719	Mozambique	MZ
720	Myanmar	MM
721	Namibia	NA
722	Nauru	NR
723	Nepal	NP
724	Netherlands	NL
725	New Caledonia	NC
726	New Zealand	NZ
727	Nicaragua	NI
728	Niger	NE
729	Nigeria	NG
730	Niue	NU
731	Norfolk Island	NF
732	North Korea	KP
733	North Macedonia	MK
734	Northern Mariana Islands	MP
735	Norway	NO
736	Oman	OM
737	Pakistan	PK
738	Palau	PW
739	Palestinian Territory Occupied	PS
740	Panama	PA
741	Papua new Guinea	PG
742	Paraguay	PY
743	Peru	PE
744	Philippines	PH
745	Pitcairn Island	PN
746	Poland	PL
747	Portugal	PT
748	Puerto Rico	PR
749	Qatar	QA
750	Reunion	RE
751	Romania	RO
752	Russia	RU
753	Rwanda	RW
754	Saint Helena	SH
755	Saint Kitts And Nevis	KN
756	Saint Lucia	LC
757	Saint Pierre and Miquelon	PM
758	Saint Vincent And The Grenadines	VC
759	Saint-Barthelemy	BL
760	Saint-Martin (French part)	MF
761	Samoa	WS
762	San Marino	SM
763	Sao Tome and Principe	ST
764	Saudi Arabia	SA
765	Senegal	SN
766	Serbia	RS
767	Seychelles	SC
768	Sierra Leone	SL
769	Singapore	SG
770	Sint Maarten (Dutch part)	SX
771	Slovakia	SK
772	Slovenia	SI
773	Solomon Islands	SB
774	Somalia	SO
775	South Africa	ZA
776	South Georgia	GS
777	South Korea	KR
778	South Sudan	SS
779	Spain	ES
780	Sri Lanka	LK
781	Sudan	SD
782	Suriname	SR
783	Svalbard And Jan Mayen Islands	SJ
784	Swaziland	SZ
785	Sweden	SE
786	Switzerland	CH
787	Syria	SY
788	Taiwan	TW
789	Tajikistan	TJ
790	Tanzania	TZ
791	Thailand	TH
792	The Bahamas	BS
793	Togo	TG
794	Tokelau	TK
795	Tonga	TO
796	Trinidad And Tobago	TT
797	Tunisia	TN
798	Turkey	TR
799	Turkmenistan	TM
800	Turks And Caicos Islands	TC
801	Tuvalu	TV
802	Uganda	UG
803	Ukraine	UA
804	United Arab Emirates	AE
805	United Kingdom	GB
806	United States	US
807	United States Minor Outlying Islands	UM
808	Uruguay	UY
809	Uzbekistan	UZ
810	Vanuatu	VU
811	Vatican City State (Holy See)	VA
812	Venezuela	VE
813	Vietnam	VN
814	Virgin Islands (British)	VG
815	Virgin Islands (US)	VI
816	Wallis And Futuna Islands	WF
817	Western Sahara	EH
818	Yemen	YE
819	Zambia	ZM
820	Zimbabwe	ZW
    \.


--
-- Data for Name: gender; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.gender (id, is_binary, name) FROM stdin;
85	f	Abinary
86	f	Agender
87	f	Ambigender
88	f	Androgyne
89	f	Aporagender
90	f	Autigender
91	f	Bakla
92	f	Bigender
93	f	Binary
94	f	Bissu
95	f	Butch
96	f	Calabai
97	f	Calalai
98	f	Cis
99	f	Cisgender
100	f	Demi-boy
101	f	Demiflux
102	f	Demigender
103	f	Demi-girl
104	f	Demi-guy
105	f	Demi-man
106	f	Demi-woman
107	f	Dual gender
108	f	Fa\\afafine
109	t	Female
110	f	Female to male
111	f	Femme
112	f	FTM
113	f	Gender bender
114	f	Gender diverse
115	f	Gender gifted
116	f	Genderfae
117	f	Genderfluid
118	f	Genderflux
119	f	Genderfuck
120	f	Genderless
121	f	Gender nonconforming
122	f	Genderqueer
123	f	Gender questioning
124	f	Gender variant
125	f	Graygender
126	f	Hijra
127	f	Intergender
128	f	Intersex
129	f	Kathoey
130	f	Māhū
131	t	Male
132	f	Male to female
133	f	Man
134	f	Man of trans experience
135	f	Maverique
136	f	Meta-gender
137	f	MTF
138	f	Multigender
139	f	Muxe
140	f	Neither
141	f	Neurogender
142	f	Neutrois
143	f	non-binary
144	f	Non-binary transgender
145	f	Omnigender
146	f	Other
147	f	Pangender
148	f	Person of transgendered experience
149	f	Polygender
150	f	Sekhet
151	f	Third gender
152	f	Trans
153	f	Transgender
154	f	Transfeminine
155	f	Transmasculine
156	f	Transsexual
157	f	Travesti
158	f	Trigender
159	f	Tumtum
160	f	Two spirit
161	f	Vakasalewalewa
162	f	Waria
163	f	Winkte
164	f	Woman
165	f	Woman of trans experience
166	f	X-gender
167	f	X-jendā
168	f	Xenogender
\.


--
-- Data for Name: icon; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.icon (id, path, interest_id) FROM stdin;
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.image (id, path, user_id) FROM stdin;
\.


--
-- Data for Name: interests; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.interests (id, name, icon_id) FROM stdin;
1	3D printing	\N
2	Acting	\N
3	Aeromodeling	\N
4	Air sports	\N
5	Airbrushing	\N
6	Aircraft Spotting	\N
7	Airsoft	\N
8	Airsofting	\N
9	Amateur astronomy	\N
10	Amateur geology	\N
11	Amateur Radio	\N
12	American football	\N
13	Animal fancy	\N
14	Animals/pets/dogs	\N
15	Antiquing	\N
16	Antiquities	\N
17	Aqua-lung	\N
18	Aquarium (Freshwater & Saltwater)	\N
19	Archery	\N
20	Art collecting	\N
21	Arts	\N
22	Association football	\N
23	Astrology	\N
24	Astronomy	\N
25	Audiophilia	\N
26	Australian rules football	\N
27	Auto audiophilia	\N
28	Auto racing	\N
29	Backgammon	\N
30	Backpacking	\N
31	Badminton	\N
32	Base Jumping	\N
33	Baseball	\N
34	Basketball	\N
35	Baton Twirling	\N
36	Beach Volleyball	\N
37	Beach/Sun tanning	\N
38	Beachcombing	\N
39	Beadwork	\N
40	Beatboxing	\N
41	Becoming A Child Advocate	\N
42	Beekeeping	\N
43	Bell Ringing	\N
44	Belly Dancing	\N
45	Bicycle Polo	\N
46	Bicycling	\N
47	Billiards	\N
48	Bird watching	\N
49	Birding	\N
50	Birdwatching	\N
51	Blacksmithing	\N
52	Blogging	\N
53	BMX	\N
54	Board games	\N
55	Board sports	\N
56	BoardGames	\N
57	Boating	\N
58	Body Building	\N
59	Bodybuilding	\N
60	Bonsai Tree	\N
61	Book collecting	\N
62	Bookbinding	\N
63	Boomerangs	\N
64	Bowling	\N
65	Boxing	\N
66	Brazilian jiu-jitsu	\N
67	Breakdancing	\N
68	Brewing Beer	\N
69	Bridge	\N
70	Bridge Building	\N
71	Bringing Food To The Disabled	\N
72	Building A House For Habitat For Humanity	\N
73	Building Dollhouses	\N
74	Bus spotting	\N
75	Butterfly Watching	\N
76	Button Collecting	\N
77	Cake Decorating	\N
78	Calligraphy	\N
79	Camping	\N
80	Candle making	\N
81	Canoeing	\N
82	Car Racing	\N
83	Card collecting	\N
84	Cartooning	\N
85	Casino Gambling	\N
86	Cave Diving	\N
87	Ceramics	\N
88	Cheerleading	\N
89	Chess	\N
90	Church/church activities	\N
91	Cigar Smoking	\N
92	Climbing	\N
93	Cloud Watching	\N
94	Coin Collecting	\N
95	Collecting	\N
96	Collecting Antiques	\N
97	Collecting Artwork	\N
98	Collecting Hats	\N
99	Collecting Music Albums	\N
100	Collecting RPM Records	\N
101	Collecting Sports Cards (Baseball, Football, Basketball, Hoc	\N
102	Collecting Swords	\N
103	Color guard	\N
104	Coloring	\N
105	Comic book collecting	\N
106	Compose Music	\N
107	Computer activities	\N
108	Computer programming	\N
109	Conworlding	\N
110	Cooking	\N
111	Cosplay	\N
112	Cosplaying	\N
113	Couponing	\N
114	Crafts	\N
115	Crafts (unspecified)	\N
116	Creative writing	\N
117	Cricket	\N
118	Crochet	\N
119	Crocheting	\N
120	Cross-Stitch	\N
121	Crossword Puzzles	\N
122	Cryptography	\N
123	Curling	\N
124	Cycling	\N
125	Dance	\N
126	Dancing	\N
127	Darts	\N
128	Debate	\N
129	Deltiology (postcard collecting)	\N
130	Diecast Collectibles	\N
131	Digital arts	\N
132	Digital Photography	\N
133	Disc golf	\N
134	Do it yourself	\N
135	Dodgeball	\N
136	Dog sport	\N
137	Dolls	\N
138	Dominoes	\N
139	Dowsing	\N
140	Drama	\N
141	Drawing	\N
142	Driving	\N
143	Dumpster Diving	\N
144	Eating out	\N
145	Educational Courses	\N
146	Electronics	\N
147	Element collecting	\N
148	Embroidery	\N
149	Entertaining	\N
150	Equestrianism	\N
151	Exercise (aerobics, weights)	\N
152	Exhibition drill	\N
153	Falconry	\N
154	Fast cars	\N
155	Felting	\N
156	Fencing	\N
157	Field hockey	\N
158	Figure skating	\N
159	Fire Poi	\N
160	Fishing	\N
161	Fishkeeping	\N
162	Flag Football	\N
163	Floorball	\N
164	Floral Arrangements	\N
165	Flower arranging	\N
166	Flower collecting and pressing	\N
167	Fly Tying	\N
168	Flying	\N
169	Footbag	\N
170	Football	\N
171	Foraging	\N
172	Foreign language learning	\N
173	Fossil hunting	\N
174	Four Wheeling	\N
175	Freshwater Aquariums	\N
176	Frisbee Golf – Frolf	\N
177	Gambling	\N
178	Games	\N
179	Gaming (tabletop games and role-playing games)	\N
180	Garage Saleing	\N
181	Gardening	\N
182	Genealogy	\N
183	Geocaching	\N
184	Ghost hunting	\N
185	Glassblowing	\N
186	Glowsticking	\N
187	Gnoming	\N
188	Go	\N
189	Go Kart Racing	\N
190	Going to movies	\N
191	Golf	\N
192	Golfing	\N
193	Gongoozling	\N
194	Graffiti	\N
195	Grip Strength	\N
196	Guitar	\N
197	Gun Collecting	\N
198	Gunsmithing	\N
199	Gymnastics	\N
200	Gyotaku	\N
201	Handball	\N
202	Handwriting Analysis	\N
203	Hang gliding	\N
204	Herping	\N
205	Hiking	\N
206	Home Brewing	\N
207	Home Repair	\N
208	Home Theater	\N
209	Homebrewing	\N
210	Hooping	\N
211	Horse riding	\N
212	Hot air ballooning	\N
213	Hula Hooping	\N
214	Hunting	\N
215	Ice hockey	\N
216	Ice skating	\N
217	Iceskating	\N
218	Illusion	\N
219	Impersonations	\N
220	Inline skating	\N
221	Insect collecting	\N
222	Internet	\N
223	Inventing	\N
224	Jet Engines	\N
225	Jewelry Making	\N
226	Jigsaw Puzzles	\N
227	Jogging	\N
228	Judo	\N
229	Juggling	\N
230	Jukskei	\N
231	Jump Roping	\N
232	Kabaddi	\N
233	Kart racing	\N
234	Kayaking	\N
235	Keep A Journal	\N
236	Kitchen Chemistry	\N
237	Kite Boarding	\N
238	Kite flying	\N
239	Kites	\N
240	Kitesurfing	\N
241	Knapping	\N
242	Knife making	\N
243	Knife throwing	\N
244	Knitting	\N
245	Knotting	\N
246	Lacemaking	\N
247	Lacrosse	\N
248	Lapidary	\N
249	LARPing	\N
250	Laser tag	\N
251	Lasers	\N
252	Lawn Darts	\N
253	Learn to Play Poker	\N
254	Learning A Foreign Language	\N
255	Learning An Instrument	\N
256	Learning To Pilot A Plane	\N
257	Leather crafting	\N
258	Leathercrafting	\N
259	Lego building	\N
260	Legos	\N
261	Letterboxing	\N
262	Listening to music	\N
263	Locksport	\N
264	Machining	\N
265	Macramé	\N
266	Macrame	\N
267	Magic	\N
268	Mahjong	\N
269	Making Model Cars	\N
270	Marbles	\N
271	Marksmanship	\N
272	Martial arts	\N
273	Matchstick Modeling	\N
274	Meditation	\N
275	Metal detecting	\N
276	Meteorology	\N
277	Microscopy	\N
278	Mineral collecting	\N
279	Model aircraft	\N
280	Model building	\N
281	Model Railroading	\N
282	Model Rockets	\N
283	Modeling Ships	\N
284	Models	\N
285	Motor sports	\N
286	Motorcycles	\N
287	Mountain Biking	\N
288	Mountain Climbing	\N
289	Mountaineering	\N
290	Movie and movie memorabilia collecting	\N
291	Mushroom hunting/Mycology	\N
292	Musical Instruments	\N
293	Nail Art	\N
294	Needlepoint	\N
295	Netball	\N
296	Nordic skating	\N
297	Orienteering	\N
298	Origami	\N
299	Owning An Antique Car	\N
300	Paintball	\N
301	Painting	\N
302	Papermache	\N
303	Papermaking	\N
304	Parachuting	\N
305	Paragliding or Power Paragliding	\N
306	Parkour	\N
307	People Watching	\N
308	Photography	\N
309	Piano	\N
310	Pigeon racing	\N
311	Pinochle	\N
312	Pipe Smoking	\N
313	Planking	\N
314	Playing music	\N
315	Playing musical instruments	\N
316	Playing team sports	\N
317	Poker	\N
318	Pole Dancing	\N
319	Polo	\N
320	Pottery	\N
321	Powerboking	\N
322	Protesting	\N
323	Puppetry	\N
324	Puzzles	\N
325	Pyrotechnics	\N
326	Quilting	\N
327	R/C Boats	\N
328	R/C Cars	\N
329	R/C Helicopters	\N
330	R/C Planes	\N
331	Racing Pigeons	\N
332	Racquetball	\N
333	Radio-controlled car racing	\N
334	Rafting	\N
335	Railfans	\N
336	Rappelling	\N
337	Rapping	\N
338	Reading	\N
339	Reading To The Elderly	\N
340	Record collecting	\N
341	Relaxing	\N
342	Renaissance Faire	\N
343	Renting movies	\N
344	Rescuing Abused Or Abandoned Animals	\N
345	Robotics	\N
346	Rock balancing	\N
347	Rock climbing	\N
348	Rock Collecting	\N
349	Rockets	\N
350	Rocking AIDS Babies	\N
351	Roleplaying	\N
352	Roller derby	\N
353	Roller skating	\N
354	Rugby	\N
355	Rugby league football	\N
356	Running	\N
357	Sailing	\N
358	Saltwater Aquariums	\N
359	Sand art	\N
360	Sand Castles	\N
361	Scrapbooking	\N
362	Scuba diving	\N
363	Sculling or Rowing	\N
364	Sculpting	\N
365	Sea glass collecting	\N
366	Seashell collecting	\N
367	Self Defense	\N
368	Sewing	\N
369	Shark Fishing	\N
370	Shooting	\N
371	Shooting sport	\N
372	Shopping	\N
373	Shortwave listening	\N
374	Singing	\N
375	Singing In Choir	\N
376	Skateboarding	\N
377	Skeet Shooting	\N
378	Sketching	\N
379	Skiing	\N
380	Skimboarding	\N
381	Sky Diving	\N
382	Skydiving	\N
383	Slack Lining	\N
384	Slacklining	\N
385	Sleeping	\N
386	Slingshots	\N
387	Slot car racing	\N
388	Snorkeling	\N
389	Snowboarding	\N
390	Soap Making	\N
391	Soapmaking	\N
392	Soccer	\N
393	Socializing with friends/neighbors	\N
394	Speed Cubing (rubix cube)	\N
395	Speed skating	\N
396	Spelunkering	\N
397	Spending time with family/kids	\N
398	Sports	\N
399	Squash	\N
400	Stamp Collecting	\N
401	Stand-up comedy	\N
402	Stone collecting	\N
403	Stone skipping	\N
404	Storm Chasing	\N
405	Storytelling	\N
406	String Figures	\N
407	Sudoku	\N
408	Surf Fishing	\N
409	Surfing	\N
410	Survival	\N
411	Swimming	\N
412	Table football	\N
413	Table tennis	\N
414	Taekwondo	\N
415	Tai chi	\N
416	Tatting	\N
417	Taxidermy	\N
418	Tea Tasting	\N
419	Tennis	\N
420	Tesla Coils	\N
421	Tetris	\N
422	Textiles	\N
423	Texting	\N
424	Tombstone Rubbing	\N
425	Tool Collecting	\N
426	Tour skating	\N
427	Toy Collecting	\N
428	Train Collecting	\N
429	Train Spotting	\N
430	Trainspotting	\N
431	Traveling	\N
432	Treasure Hunting	\N
433	Trekkie	\N
434	Triathlon	\N
435	Tutoring Children	\N
436	TV watching	\N
437	Ultimate Frisbee	\N
438	Urban exploration	\N
439	Vehicle restoration	\N
440	Video game collecting	\N
441	Video Games	\N
442	Video gaming	\N
443	Videophilia	\N
444	Vintage cars	\N
445	Violin	\N
446	Volleyball	\N
447	Volunteer	\N
448	Walking	\N
449	Warhammer	\N
450	Watching movies	\N
451	Watching sporting events	\N
452	Water sports	\N
453	Weather Watcher	\N
454	Web surfing	\N
455	Weightlifting	\N
456	Windsurfing	\N
457	Wine Making	\N
458	Wingsuit Flying	\N
459	Wood carving	\N
460	Woodworking	\N
461	Working In A Food Pantry	\N
462	Working on cars	\N
463	World Record Breaking	\N
464	Worldbuilding	\N
465	Wrestling	\N
466	Writing	\N
467	Writing Music	\N
468	Writing Songs	\N
469	Yo-yoing	\N
470	Yoga	\N
471	YoYo	\N
472	Ziplining	\N
473	Zumba	\N
\.


--
-- Data for Name: interests_users; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.interests_users (interest_id, users_id) FROM stdin;
\.


--
-- Data for Name: like_user; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.like_user (id, liked_user_id, user_id) FROM stdin;
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.location (id, city_id, country_id, state_id) FROM stdin;
\.


--
-- Data for Name: looking_for; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.looking_for (id, description) FROM stdin;
1	Friends
2	Casual
3	Commited Relationship
4	Friends with benefits
5	Texting Buddy
6	Call Budy
7	Streaks
8	Open
9	New People
\.


--
-- Data for Name: match_user; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.match_user (id, match_user_id, user_id) FROM stdin;
\.


--
-- Data for Name: playing_with_neon; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.playing_with_neon (id, name, value) FROM stdin;
1	c4ca4238a0	0.981526
2	c81e728d9d	0.44057208
3	eccbc87e4b	0.17446828
4	a87ff679a2	0.9201238
5	e4da3b7fbb	0.8729564
6	1679091c5a	0.86983514
7	8f14e45fce	0.24332741
8	c9f0f895fb	0.42946717
9	45c48cce2e	0.7393041
10	d3d9446802	0.16446519
\.


--
-- Data for Name: religion; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.religion (id, name) FROM stdin;
1	Christentum
2	Buddhismus
3	Hinduismus
4	Islam
5	Judentum
\.


--
-- Data for Name: sexuality; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.sexuality (id, name) FROM stdin;
1	Abrosexual
2	Androgynosexual
3	Androsexual
4	Aromantic
5	Asexual
6	Biromantic
7	Bisexuality
8	Ceterosexual
9	Demisexual
10	Demiromantic
11	Finsexual
12	Gay
13	Gynosexual
14	Grey-Romantic
15	Heterosexual
16	Homosexuality
17	Heteroromantic
18	Homoromantic
19	Lesbian
20	Omnisexual
21	Pansexuality
22	Panromantic
23	Pomosexuality
24	Polysexual
25	Queer
26	Questioning
27	Straight
28	Skoliosexual
29	Sapiosexual
\.


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.state (id, name, country_id) FROM stdin;
1	Upper-Austria	585
2	Lower-Austria	585
3	Salzburg	585
4	Tyrol	585
5	Vorarlberg	585
6	Vienna	585
7	Burgenland	585
8	Kärnten	585
\.


--
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.user_account (id, age, bio, birthday, dap_coin, email, height, instagram, nickname, password, quote, role, snapchat, terms, tiktok, token, token_lifetime, username, gender_id, location_id, looking_for_id, religion_id, sexuality_id) FROM stdin;
1	32	\N	1990-01-01 01:00:00	0	lukasnaagler17@gmail.com	170	\N	nick123	$2a$10$YvmJCSJY.S9/2xrz1La0S.QXGOxgyuVwznQ31PD0JTzvTq5CwAztu	\N	ROLE_USER	snap_user	t	\N	$2a$10$8U1YGEyHLS8E05ujKgCpSu39B/nSNoWQCGKFib5Cyv3FnG6dXyJEy	1706278562346	exampleUser	85	\N	\N	\N	\N
\.


--
-- Data for Name: user_account_interests; Type: TABLE DATA; Schema: public; Owner: lnagler1
--

COPY public.user_account_interests (user_id, interests_id) FROM stdin;
\.


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
