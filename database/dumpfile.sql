--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)

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
-- Name: actors; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.actors (
    id uuid NOT NULL,
    mail text,
    name text,
    role text
);


ALTER TABLE public.actors OWNER TO admin;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.courses (
    id uuid NOT NULL,
    title text,
    description text,
    language text
);


ALTER TABLE public.courses OWNER TO admin;

--
-- Name: learning_resources; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.learning_resources (
    id uuid NOT NULL,
    title text,
    description text,
    language text,
    interactivity_type text,
    interactivity_level text,
    learning_resource_type text,
    semantic_density text,
    difficulty text,
    typical_learning_time text
);


ALTER TABLE public.learning_resources OWNER TO admin;

--
-- Name: module_resources; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.module_resources (
    module_id uuid,
    resource_id uuid
);


ALTER TABLE public.module_resources OWNER TO admin;

--
-- Name: modules; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.modules (
    id uuid NOT NULL,
    course_id uuid,
    parent_id uuid,
    title text,
    instructor_id uuid
);


ALTER TABLE public.modules OWNER TO admin;

--
-- Name: COLUMN modules.instructor_id; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.modules.instructor_id IS 'only set for top-level modules (parent_id == NULL)';


--
-- Name: statements; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.statements (
    id uuid NOT NULL,
    actor_id uuid,
    module_id uuid,
    verb text,
    result jsonb,
    "timestamp" timestamp with time zone
);


ALTER TABLE public.statements OWNER TO admin;

--
-- Name: COLUMN statements.result; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.statements.result IS 'may be null, depending on verb';


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.actors (id, mail, name, role) FROM stdin;
32161eaa-e9b0-50f0-aa1c-103f269a1cf4	user_test_diminished_12w_3cc321e5@example.com	User_test_diminished_12w_3cc321e5	student
ac7e21de-93e9-5324-b04e-2bb8c74e01ad	instructor3@example.com	instructor3	instructor
b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	user_test_u_shaped_12w_88998553@example.com	User_test_u_shaped_12w_88998553	student
eafc92a4-9ff9-508b-950a-1837164b2bcd	user_test_consistent_12w_ca3f4a6c@example.com	User_test_consistent_12w_ca3f4a6c	student
81da0bfe-19c8-5bcd-82d8-bcb5673384f0	instructor2@example.com	instructor2	instructor
cb485377-c70b-528f-bc91-91f51042122f	instructor1@example.com	instructor1	instructor
d3a9d109-d5de-5372-aaa6-2b4039cedb96	user_test_inconsistent_12w_953d0d9c@example.com	User_test_inconsistent_12w_953d0d9c	student
a39e581a-a948-5af5-ad61-b2b0030fb824	user_test_consistent_8w_3dd50ba6@example.com	User_test_consistent_8w_3dd50ba6	student
9aebb656-afa1-5a07-bb63-e5a569b53ca4	user_test_diminished_8w_0134708e@example.com	User_test_diminished_8w_0134708e	student
2457fc99-9240-5207-8740-05d01be3946e	user_test_inconsistent_8w_055c5b0d@example.com	User_test_inconsistent_8w_055c5b0d	student
6c3202a9-0713-5ba8-b059-6a0a2ab64a94	user_test_u_shaped_8w_af882bcb@example.com	User_test_u_shaped_8w_af882bcb	student
1e379c7d-80fd-5fe3-a839-c46b91d223c8	user_test_diminished_4w_ccce76e0@example.com	User_test_diminished_4w_ccce76e0	student
65861570-f509-5228-a69f-731f35318a06	user_test_consistent_4w_c52bb5e8@example.com	User_test_consistent_4w_c52bb5e8	student
b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	user_test_u_shaped_4w_5d7d0855@example.com	User_test_u_shaped_4w_5d7d0855	student
e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	user_test_inconsistent_4w_bf0dd5f1@example.com	User_test_inconsistent_4w_bf0dd5f1	student
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.courses (id, title, description, language) FROM stdin;
568b0c93-9f2e-4b14-921f-9451b8219ab3	Baumchirurg/Baumchirurgin	Dieser Kurs gibt einen Überblick über die benötigten Kompetenzen und Fähigkeiten für die Berufsbezeichnung Baumchirurg/Baumchirurgin (http://data.europa.eu/esco/occupation/fa30c1cb-dbc5-409c-8124-7284592b123c)	en
\.


--
-- Data for Name: learning_resources; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.learning_resources (id, title, description, language, interactivity_type, interactivity_level, learning_resource_type, semantic_density, difficulty, typical_learning_time) FROM stdin;
72a96d1b-d1bc-5f43-a109-ba8c1dd476b4	Learning Object 11	Example: Learning Object 11	de-DE	expositive	low	narrative text	low	low	PT5M30S
a701ea3b-23df-56a6-a349-4162f070e367	Learning Object 04	Example: Learning Object 04	de-DE	expositive	low	narrative text	low	low	PT5M30S
dec7d788-ab62-55a9-80af-10c12cd4228f	Learning Object 07	Example: Learning Object 07	de-DE	expositive	low	narrative text	low	low	PT5M30S
9d83e7c0-7f12-529e-8587-84cbfe867826	Learning Object 09	Example: Learning Object 09	de-DE	expositive	low	narrative text	low	low	PT5M30S
721439fb-cd82-5b9b-90b3-c9f54daa0d23	Learning Object 06	Example: Learning Object 06	de-DE	expositive	low	narrative text	low	low	PT5M30S
b48a6928-01f2-5578-b089-f64da75d5361	Learning Object 03	Example: Learning Object 03	de-DE	expositive	low	narrative text	low	low	PT5M30S
a2779fdf-ec6f-5535-92db-c78f14e15dbc	Learning Object 10	Example: Learning Object 10	de-DE	expositive	low	narrative text	low	low	PT5M30S
217b5901-5c7a-5ffd-af0d-00b0a993380e	Learning Object 05	Example: Learning Object 05	de-DE	expositive	low	narrative text	low	low	PT5M30S
a869f521-b8ac-5561-a49c-9b7bdfac9793	Learning Object 08	Example: Learning Object 08	de-DE	expositive	low	narrative text	low	low	PT5M30S
21a9be69-1ea7-5f3a-8c0b-9f086f821be8	Learning Object 01	Example: Learning Object 01	de-DE	expositive	low	narrative text	low	low	PT5M30S
77e04731-9cea-57f1-b658-f19bcd2fd715	Learning Object 02	Example: Learning Object 02	de-DE	expositive	low	narrative text	low	low	PT5M30S
690e7da3-8773-5bde-a6cd-70ffcb58c4ee	Learning Object 15	Example: Learning Object 15	de-DE	expositive	low	narrative text	low	low	PT5M30S
d6102b11-d7a2-555b-affe-8dead6361f9f	Learning Object 14	Example: Learning Object 14	de-DE	expositive	low	narrative text	low	low	PT5M30S
531fcb6d-8894-5139-98ef-07826e3c1227	Learning Object 12	Example: Learning Object 12	de-DE	expositive	low	narrative text	low	low	PT5M30S
bc8092d0-8540-5f4a-9910-83d0354ae856	Learning Object 13	Example: Learning Object 13	de-DE	expositive	low	narrative text	low	low	PT5M30S
\.


--
-- Data for Name: module_resources; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.module_resources (module_id, resource_id) FROM stdin;
0895d383-5f59-51b2-ae8c-e0b985d81f1f	72a96d1b-d1bc-5f43-a109-ba8c1dd476b4
f8743c64-6b32-5a84-a231-88eaa828b8f3	a701ea3b-23df-56a6-a349-4162f070e367
70423966-9ebb-5262-b082-4b8925547d57	dec7d788-ab62-55a9-80af-10c12cd4228f
628435a2-1aba-5f57-8452-22f0f6fe8b5a	9d83e7c0-7f12-529e-8587-84cbfe867826
0f8226a0-d513-534c-871b-15d9f310349b	721439fb-cd82-5b9b-90b3-c9f54daa0d23
02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	21a9be69-1ea7-5f3a-8c0b-9f086f821be8
a38e6922-2eda-5548-9bc7-bd5f8e33cf73	d6102b11-d7a2-555b-affe-8dead6361f9f
d79afb6a-4da1-59a3-aca1-a837bf3e62aa	531fcb6d-8894-5139-98ef-07826e3c1227
fcc40587-6fbe-570f-8676-ba7f80daec71	b48a6928-01f2-5578-b089-f64da75d5361
6db96e1f-b595-5aec-adbb-46b408029b79	a2779fdf-ec6f-5535-92db-c78f14e15dbc
4bfce604-c23f-530e-8c8e-a24764e1667a	217b5901-5c7a-5ffd-af0d-00b0a993380e
9a044b1c-e0aa-54f5-8787-f52ec405b4d8	a869f521-b8ac-5561-a49c-9b7bdfac9793
f10c153c-968c-5979-b6cc-05736dc40095	77e04731-9cea-57f1-b658-f19bcd2fd715
dd4608c4-45ad-543d-a42c-6276790440d3	690e7da3-8773-5bde-a6cd-70ffcb58c4ee
ab3ff241-b1ca-54ed-aa92-b324f1a5155b	bc8092d0-8540-5f4a-9910-83d0354ae856
\.


--
-- Data for Name: modules; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.modules (id, course_id, parent_id, title, instructor_id) FROM stdin;
0895d383-5f59-51b2-ae8c-e0b985d81f1f	568b0c93-9f2e-4b14-921f-9451b8219ab3	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Bäume schützen	\N
f8743c64-6b32-5a84-a231-88eaa828b8f3	568b0c93-9f2e-4b14-921f-9451b8219ab3	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Bäume kappen	\N
70423966-9ebb-5262-b082-4b8925547d57	568b0c93-9f2e-4b14-921f-9451b8219ab3	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Bäume ausdünnen	\N
628435a2-1aba-5f57-8452-22f0f6fe8b5a	568b0c93-9f2e-4b14-921f-9451b8219ab3	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Baumkonservierung	\N
0f8226a0-d513-534c-871b-15d9f310349b	568b0c93-9f2e-4b14-921f-9451b8219ab3	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Beratung zu Fragen rund um Bäume	\N
02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	568b0c93-9f2e-4b14-921f-9451b8219ab3	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Krankheits- und Schädlingsbekämpfung durchführen	\N
a38e6922-2eda-5548-9bc7-bd5f8e33cf73	568b0c93-9f2e-4b14-921f-9451b8219ab3	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Grünpflanzen pflanzen	\N
d79afb6a-4da1-59a3-aca1-a837bf3e62aa	568b0c93-9f2e-4b14-921f-9451b8219ab3	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Baumkrankheiten bekämpfen	\N
fcc40587-6fbe-570f-8676-ba7f80daec71	568b0c93-9f2e-4b14-921f-9451b8219ab3	fddec982-57b8-5dd3-8122-3c2363cc0151	Auf Bäume klettern	\N
6db96e1f-b595-5aec-adbb-46b408029b79	568b0c93-9f2e-4b14-921f-9451b8219ab3	fddec982-57b8-5dd3-8122-3c2363cc0151	Gefahren im Umgang mit Bäumen mindern	\N
4bfce604-c23f-530e-8c8e-a24764e1667a	568b0c93-9f2e-4b14-921f-9451b8219ab3	fddec982-57b8-5dd3-8122-3c2363cc0151	Mit Seilausrüstung Bäume erklimmen	\N
9a044b1c-e0aa-54f5-8787-f52ec405b4d8	568b0c93-9f2e-4b14-921f-9451b8219ab3	fddec982-57b8-5dd3-8122-3c2363cc0151	Sicherheitsverfahren in großen Höhen befolgen	\N
f10c153c-968c-5979-b6cc-05736dc40095	568b0c93-9f2e-4b14-921f-9451b8219ab3	eb99265a-e3fa-5d65-a73c-8042621cf088	Kettensäge bedienen	\N
dd4608c4-45ad-543d-a42c-6276790440d3	568b0c93-9f2e-4b14-921f-9451b8219ab3	eb99265a-e3fa-5d65-a73c-8042621cf088	Forstwirtschaftliche Ausrüstung instand halten	\N
ab3ff241-b1ca-54ed-aa92-b324f1a5155b	568b0c93-9f2e-4b14-921f-9451b8219ab3	eb99265a-e3fa-5d65-a73c-8042621cf088	Bei der Baumidentifizierung assistieren	\N
fddec982-57b8-5dd3-8122-3c2363cc0151	568b0c93-9f2e-4b14-921f-9451b8219ab3	\N	Grundlagen des Kletterns	cb485377-c70b-528f-bc91-91f51042122f
eb99265a-e3fa-5d65-a73c-8042621cf088	568b0c93-9f2e-4b14-921f-9451b8219ab3	\N	Grundlagen der Instandhaltung	ac7e21de-93e9-5324-b04e-2bb8c74e01ad
d33a5ca9-9a16-57b0-92a2-51dae47aa69a	568b0c93-9f2e-4b14-921f-9451b8219ab3	\N	Grundlagen der Baumpflege	81da0bfe-19c8-5bcd-82d8-bcb5673384f0
\.


--
-- Data for Name: statements; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.statements (id, actor_id, module_id, verb, result, "timestamp") FROM stdin;
243be910-1d6e-4eab-bc56-cae54cc8dc68	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-27 13:58:20.492+00
03e08d21-f110-4e68-bb67-7b5b920a0e0e	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-27 14:01:20.488+00
b1d08c57-fb60-4fc3-9c5c-88c1d5a45b8d	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-03-27 14:02:20.492+00
fd7fe5ed-9cb6-483f-bf62-bc67d775d1f0	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-27 14:03:20.474+00
f47cbe4c-be74-4325-ab2f-3638a518a8fb	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-03-27 14:06:20.492+00
83837f0c-53e4-4730-a7a6-96ce3786b62c	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT63M"}	2025-03-27 15:01:20.492+00
c04b4898-e121-4633-8379-d330f1e8be0c	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.89}}	2025-03-27 15:02:20.492+00
e7ff81a6-e4d3-4e13-a5a9-b3ac20cfc946	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT88M"}	2025-03-27 15:31:20.474+00
cfdc12df-1bf1-438f-be73-b315a93da475	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-03-27 15:32:20.474+00
9bffc9d1-8995-4ecf-98b0-4276d59e2949	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-03-27 15:37:20.474+00
23e2efc4-5990-4602-8a73-40fc6801042e	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT143M"}	2025-03-27 16:24:20.488+00
9c30ff56-3d0d-4d47-9efa-52307bb60c64	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09}}	2025-03-27 16:25:20.488+00
cbf45eea-5c55-4c56-9a38-8df308c1aedc	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-03-27 16:30:20.488+00
a6cd0654-cbf9-4f1c-9638-e1316d531204	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-03-28 15:21:20.474+00
edafa660-b59d-42ce-89fc-9b9fe78f8782	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-28 15:26:20.474+00
82164615-e28f-45b6-9464-655083fe7670	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-28 16:27:20.492+00
c6cc0f32-b1e6-427a-9f03-c7bc702101fc	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-03-28 16:37:20.492+00
fbb191a7-c337-46f6-ad5f-0e361794dcc5	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT91M"}	2025-03-28 16:57:20.474+00
467df7a4-9b1c-4976-a64b-69be3fb0b25d	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 28, "scaled": 0.28}}	2025-03-28 16:58:20.474+00
3582fdf4-d08b-4468-9732-a1c8d4d368ff	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-03-28 16:59:20.474+00
50a25b2f-06d0-47f4-b9ac-3b0c71690ea2	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT49M"}	2025-03-28 17:16:20.492+00
9d02bcc9-7ac4-4be6-b613-5344e4899139	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.85}}	2025-03-28 17:17:20.492+00
343ae68b-4dd9-499a-9943-df96f6c64fc2	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-29 15:39:20.492+00
46a473c6-ba23-45e6-a9f7-f091e177c08b	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-03-29 15:48:20.492+00
943430ca-3ae7-41b2-bdb9-d9a17314e288	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-03-29 15:57:20.492+00
9691cdfc-ab2d-436d-8165-b9b5ccc973c2	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-03-29 16:36:20.492+00
842897ca-5104-40b9-bf20-342b8fc1ba06	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.6}}	2025-03-29 16:37:20.492+00
04954c98-8349-4b61-9b24-3d0f7f754360	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-29 16:48:20.474+00
a316383e-425c-4875-a12c-758a96745208	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-03-29 17:53:10.826+00
72895e4b-0337-4012-832a-24421243687b	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT68M"}	2025-03-29 17:56:20.474+00
5bede385-ff30-4c18-872e-7167b243f629	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-03-29 17:57:20.474+00
0111c6c4-79b5-4c37-b420-f9872c36a06f	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-29 17:58:10.826+00
2c6b5656-a7cb-471f-afdf-a7976b4d39ab	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-03-29 18:00:20.474+00
2eb7eb2b-e72f-49d4-ae1c-23a9a0870d4d	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT104M"}	2025-03-29 19:42:10.826+00
a21a07f8-64ba-4814-b7d4-e0eb41c1a0a8	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43}}	2025-03-29 19:43:10.826+00
89541200-6cef-4eaa-9d87-4d88e903aace	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-03-29 19:49:10.826+00
be30dcd4-2523-467e-931a-c4d03de232ec	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-03-30 12:49:20.474+00
218abc28-399e-4124-9ac9-64d182bbb3dc	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-30 12:52:20.474+00
77536e23-c757-4cd6-b165-0d240e5970c7	d3a9d109-d5de-5372-aaa6-2b4039cedb96	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-30 13:02:20.482+00
12bc287d-99ba-4e52-968d-440a27ec5797	d3a9d109-d5de-5372-aaa6-2b4039cedb96	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT41M"}	2025-03-30 13:43:20.482+00
1dc4dd34-00ed-4b52-a49a-9dcd6f6b49aa	d3a9d109-d5de-5372-aaa6-2b4039cedb96	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.81}}	2025-03-30 13:44:20.482+00
6a217e86-60ad-48d0-8a14-f83e5754d10b	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT80M"}	2025-03-30 14:12:20.474+00
60fb2173-dfda-43fa-9b79-0636ae8630fe	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 70, "scaled": 0.7}}	2025-03-30 14:13:20.474+00
1df94093-7993-4968-8525-025e3b969da1	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-30 16:54:20.492+00
a1b41cc8-da32-44c2-9eb6-7e5cc698b087	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-03-30 17:00:20.492+00
f7c8c2d3-0776-42ef-a8ee-803960b21c85	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT68M"}	2025-03-30 18:02:20.492+00
c470254d-e70d-4f55-a8f6-3c530a6ce235	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-03-30 18:03:20.492+00
40f607a9-092a-4a2d-863e-2168c36bb567	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-31 12:42:20.482+00
aeab78d2-947b-4d29-abe3-99ffebca0dc8	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT42M"}	2025-03-31 13:24:20.482+00
1c1fb245-e6e2-4f95-b65b-dfd3b5a9bb45	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 28, "scaled": 0.28}}	2025-03-31 13:25:20.482+00
fae4f5b0-3234-4d11-b203-ff69409b8084	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-03-31 13:27:20.482+00
20fc1cf8-1c39-41f6-95b8-f1e782cabcdc	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-03-31 14:25:12.148+00
84313c56-83a6-46c0-b2fe-17ad7f3eac51	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-31 14:28:12.148+00
303d7c74-b9f5-4088-950b-abe2b4e8e4de	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-03-31 14:50:20.474+00
f003bd1d-91b9-4ab6-929a-dc9ab4229a67	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-03-31 14:52:20.474+00
1f388bad-1205-4f6b-86d1-b68f1574ae87	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT73M"}	2025-03-31 15:41:12.148+00
0d55adac-b9c0-4e0b-b568-3164e32ac3e5	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72}}	2025-03-31 15:42:12.148+00
4e926ee6-7431-4c04-92c2-a9ae69539907	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-03-31 15:49:12.148+00
3206238e-09fb-4b2e-804c-351b612d617e	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT87M"}	2025-03-31 16:19:20.474+00
b3b5d127-8fe4-4a3c-95cc-594c70f532cc	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 91, "scaled": 0.91}}	2025-03-31 16:20:20.474+00
808893e8-d768-41b8-885c-fb4f309842a6	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-03-31 16:23:20.474+00
80651025-fbee-466d-bc29-1b44cb4a39ca	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-01 14:15:20.474+00
fa828592-8300-4938-97ca-6e3923bbc03a	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-01 14:19:20.474+00
eda4a621-45e2-4ac3-8e97-cdcf0c4fe5d0	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT71M"}	2025-04-01 15:30:20.474+00
abfd4ed8-2b4e-462d-bb72-28c8003afb88	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 5, "scaled": 0.05}}	2025-04-01 15:31:20.474+00
28a69326-1d3b-4fe0-ae77-ce0f1735e710	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.7297117912531004}}	2025-04-01 17:57:20.474+00
ca98c21e-78e3-40ac-9d00-6baec9a07cf9	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.7297117912531004}}	2025-04-01 17:58:20.474+00
789ce29c-2a89-4e96-bf28-1d6b0677065b	eafc92a4-9ff9-508b-950a-1837164b2bcd	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-04-01 17:59:20.474+00
0645445f-50f3-43b3-92a2-e4be770d7928	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-02 17:27:50.97+00
b841b2ba-1b32-40a5-9e9b-804a183788d3	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT144M"}	2025-04-02 19:51:50.97+00
26852dc2-5508-4874-93e2-38224def64f6	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 23, "scaled": 0.23}}	2025-04-02 19:52:50.97+00
000597be-feb3-4d1e-8fed-93bb86b42c40	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-02 19:56:50.97+00
58f6b0da-0fab-45e0-840e-d0a58ef2bee7	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-03 14:57:20.474+00
77b43721-19f4-4ed9-be40-4f5c6ff9995a	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-03 15:00:20.474+00
a5ae0a64-c424-4185-b9e3-e8902d480fa1	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT67M"}	2025-04-03 16:07:20.474+00
596c4aed-fe29-48df-8d94-3d0b39114421	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-04-03 16:08:20.474+00
e3e19c01-55ce-49df-808e-15c4098d0a55	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-04 14:46:41.379+00
92e1d866-acc8-4052-be16-d4b2426d53f0	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-04 14:50:41.379+00
ed0e7b98-4a7a-42d9-82d4-df411684127f	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-04 16:30:20.474+00
9768c971-f4f9-4e43-bbd6-08e0d9ed3a8b	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-04 16:33:20.474+00
d773d834-9a4e-4276-8faf-5ce9578e9a9f	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT132M"}	2025-04-04 17:02:41.379+00
f0bb0461-f168-4378-a485-90de44c8e895	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24}}	2025-04-04 17:03:41.379+00
1e507708-8557-4d37-ad94-3735d509b2e0	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-04 17:06:41.379+00
10533a84-015b-4122-bc88-947e1cb55192	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-04-04 17:37:20.474+00
b0c095fd-d796-47bb-952e-e53861e54d02	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-04-04 17:38:20.474+00
c2cc2dae-8be8-4dee-8f6c-3b0e58b0c7f1	d3a9d109-d5de-5372-aaa6-2b4039cedb96	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-05 12:12:20.482+00
9f5d1c59-bde6-4cff-afd4-23a779430727	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-05 17:41:20.474+00
6a454e71-c112-472c-b05e-0e7ba60d5e50	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT92M"}	2025-04-05 19:13:20.474+00
c9ef950e-0599-4078-ad4c-1809880b3806	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.87}}	2025-04-05 19:14:20.474+00
c987b7cb-1793-44bc-b3d1-7a9d5446e7f6	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-06 12:04:20.705+00
6d4083f6-6ca5-4043-9e76-e85724384d04	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-06 12:08:20.705+00
34a099ea-b3fd-4c57-bc01-84fbfa20b849	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT137M"}	2025-04-06 14:25:20.705+00
0be71135-d570-47b6-b68d-29b144820abc	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41}}	2025-04-06 14:26:20.705+00
fc3406bf-e6ac-4112-b3c7-e36ea438a2dc	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-06 14:32:20.705+00
0bdba017-a646-44c8-99cb-d54a3482c2f2	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-06 16:21:20.474+00
dff28b1a-bd66-4e3f-8f3f-f6eecc236e0f	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT93M"}	2025-04-06 17:54:20.474+00
b32f20d3-d98a-4adc-9718-cb02ba79ecba	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.77}}	2025-04-06 17:55:20.474+00
52905b9e-6c34-49ae-89e2-5641cb343838	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-06 17:58:20.474+00
beea426b-91e6-4952-9b25-4ce9bf6998a0	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-07 16:50:10.902+00
6d16804c-e36b-4b88-aca7-54f7505d186d	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-07 16:53:10.902+00
f5ce0bfc-3754-4ffa-9f52-cbe1a0fa1687	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-07 17:01:20.474+00
79ce968e-f860-443a-95eb-473f0a8ed4f4	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT97M"}	2025-04-07 18:30:10.902+00
8e61cc20-f2af-40b1-9b81-62dd39e9d457	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 2, "scaled": 0.02}}	2025-04-07 18:31:10.902+00
faa42980-650a-440c-849e-40f9cb6cf2f8	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT93M"}	2025-04-07 18:34:20.474+00
5fbe54f5-de1b-4361-9a28-13c454ff98d4	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-04-07 18:35:20.474+00
d6e53bf7-5610-4b7e-b4a1-3d35680045ef	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-07 18:40:10.902+00
99de3747-fd5b-4649-9e4f-bc08f4a98a8e	d3a9d109-d5de-5372-aaa6-2b4039cedb96	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-08 13:56:20.482+00
2ada80d9-9c9c-480b-98d3-022869590b6d	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-08 14:13:20.474+00
220cbe3c-8600-4eb0-8fef-4b2eff96c830	d3a9d109-d5de-5372-aaa6-2b4039cedb96	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT80M"}	2025-04-08 15:16:20.482+00
929a414f-6581-43f9-8857-b79ee379e603	d3a9d109-d5de-5372-aaa6-2b4039cedb96	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.89}}	2025-04-08 15:17:20.482+00
e83e5be9-ed6b-4f49-800c-49e5418ed013	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT73M"}	2025-04-08 15:26:20.474+00
eee818ad-842c-402d-bcfe-2faa79011b0e	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 6, "scaled": 0.06}}	2025-04-08 15:27:20.474+00
a495c59e-d78c-4a80-b44c-6d840a3ba0ae	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.8937644849208954}}	2025-04-08 18:31:20.474+00
8494f104-29fb-4881-83d8-890159fe4d0b	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.8937644849208954}}	2025-04-08 18:32:20.474+00
154f970e-83db-4ac5-8c79-06e8d2171d32	eafc92a4-9ff9-508b-950a-1837164b2bcd	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 26, "scaled": 0.26}}	2025-04-08 18:33:20.474+00
04adf9a8-63b5-482f-90c1-321c7001080a	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-09 14:47:26.053+00
402f7f8d-33e0-4167-9791-748be588a642	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-09 14:49:26.053+00
5106c9a1-48fb-4051-ae47-48fdaef5aad9	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-09 15:41:20.492+00
85968f68-9167-45d7-a504-a087684b776e	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-04-09 15:48:20.492+00
4087dfe4-c060-4d20-878f-79d178d3e365	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-09 15:57:20.492+00
902fd3f5-ed6a-44b7-a615-991df64ad96e	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT99M"}	2025-04-09 16:28:26.053+00
99cc29a6-bbb6-4b81-b951-5c23be36bdc6	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-04-09 16:29:26.053+00
b167c0dd-2bf3-40e8-b644-d6a36650232e	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-09 16:33:26.053+00
5312ef1c-9500-477b-88d6-abc38e8ac7b5	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT55M"}	2025-04-09 16:36:20.492+00
0c51efd8-cadc-4513-a66f-ec5e46af4fab	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.89}}	2025-04-09 16:37:20.492+00
6a635c51-d80b-4d8f-8deb-ac072c033389	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-10 13:55:20.474+00
c9bdd880-094a-4c51-adc5-7defcdf1282c	d3a9d109-d5de-5372-aaa6-2b4039cedb96	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-10 14:19:20.482+00
5d65cf51-dda0-4e75-afc7-87c730946d8e	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT71M"}	2025-04-10 15:06:20.474+00
895a9341-ffef-4631-a32a-4a0df0b50e52	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 2, "scaled": 0.02}}	2025-04-10 15:07:20.474+00
612b6613-9e3c-4158-88fc-2ef68201f160	d3a9d109-d5de-5372-aaa6-2b4039cedb96	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT105M"}	2025-04-10 16:04:20.482+00
7e997f7d-257f-420c-bd92-2549550c2ca1	d3a9d109-d5de-5372-aaa6-2b4039cedb96	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 70, "scaled": 0.7}}	2025-04-10 16:05:20.482+00
570bfc9d-a3d8-4c2a-bb29-b57a697255c8	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-11 12:04:09.106+00
b63e9e9c-43a7-43b0-bf51-1a338331a975	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-11 12:07:09.106+00
c90fbeb4-41e6-4f52-bdd8-d0550589a018	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT141M"}	2025-04-11 14:28:09.106+00
2a3f2834-8eb2-403d-83f2-f079a2fe41b0	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9}}	2025-04-11 14:29:09.106+00
981dbcbc-af34-49d8-b2d1-d346722fe1bd	d3a9d109-d5de-5372-aaa6-2b4039cedb96	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-11 14:35:20.482+00
0b615e3f-8e35-457b-b061-844745f3ed64	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-11 14:36:09.106+00
6687c9f3-a080-48b1-894b-d4a7c7b8facb	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-11 15:06:20.474+00
55c22cae-b6c0-41cc-9aef-a675081db45c	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-11 15:46:20.492+00
711d06c0-0829-4964-a1b4-1d388d4b7c5a	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-11 15:50:20.492+00
efcaa357-9464-483f-8d4a-1d9ad445c152	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-11 15:55:20.492+00
9abbb1cd-2d98-4398-a71d-03eb84ae5bca	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT69M"}	2025-04-11 16:15:20.474+00
590dc7f2-9eb6-4585-b6a3-9cc9bf54b23d	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-04-11 16:16:20.474+00
043b1e61-3f23-40d2-abc6-600d46380f24	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-11 16:21:20.474+00
1fbd6b5f-0f7c-4ee9-88f9-c7faaea05f0c	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT37M"}	2025-04-11 16:23:20.492+00
b6534d0b-f026-48a9-8924-d8e80629cffe	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-04-11 16:24:20.492+00
aadd1644-6abc-4beb-8a65-64e57efa5a2f	d3a9d109-d5de-5372-aaa6-2b4039cedb96	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-12 12:24:20.482+00
8373ae8a-9cf0-4019-b67c-91fb964fa9ee	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-12 12:40:20.474+00
e11ad906-e8b7-4cd4-9906-b1fc4461bb96	d3a9d109-d5de-5372-aaa6-2b4039cedb96	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT81M"}	2025-04-12 13:45:20.482+00
2a7946de-6f55-43a3-a84b-22bc51346b85	d3a9d109-d5de-5372-aaa6-2b4039cedb96	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-04-12 13:46:20.482+00
91ba76b6-7947-4f96-9885-3f6e60367c41	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT71M"}	2025-04-12 13:51:20.474+00
63c36f82-43ca-4402-932c-990538673469	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 12, "scaled": 0.12}}	2025-04-12 13:52:20.474+00
8381ce8e-2ad1-41fb-acdd-0899ab14c2ca	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-12 18:19:26.573+00
761c4c5b-57f7-4f06-984c-10ad2416af38	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-12 18:24:26.573+00
fcc51450-c6d1-4984-adf3-17c48f518f07	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-12 18:46:20.492+00
a0ea984d-b3eb-4f5b-baea-878ab9cbb920	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-04-12 18:53:20.492+00
370cf37c-a0d9-40d4-8644-9890a4475bf9	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-12 19:02:20.492+00
066119d4-09c5-475a-8e56-f97fc5727287	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT42M"}	2025-04-12 19:28:20.492+00
0cf7351d-59b4-4228-acab-b29d3d40aaa1	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-04-12 19:29:20.492+00
4b95b89c-4347-414f-a5fb-bc7bb4f65c6d	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT132M"}	2025-04-12 20:36:26.573+00
c024b407-1a4b-4f65-b528-6efc3b3311bd	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.6}}	2025-04-12 20:37:26.573+00
4a1f84a7-850c-4ddf-97cb-7a9c91c1e779	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-13 16:40:20.474+00
d5f462e3-64fd-4ce7-bdcb-e000c2348134	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT68M"}	2025-04-13 17:48:20.474+00
ac1a8dc6-a42f-4f2b-9618-117f70b12c86	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.82}}	2025-04-13 17:49:20.474+00
fb9c8361-0552-460c-9597-634482789137	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.6988345653638747}}	2025-04-13 20:14:20.474+00
a5ff7a37-f9e6-473a-bca8-90a9aa20e503	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.6988345653638747}}	2025-04-13 20:15:20.474+00
8c984125-ac35-4ff0-bf77-bd49a0250998	eafc92a4-9ff9-508b-950a-1837164b2bcd	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-04-13 20:16:20.474+00
132a241d-f4b3-4420-a827-642ad01aeb9c	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-14 11:41:02.803+00
5222a3d0-d356-4846-bcec-f37689b165ec	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-14 11:43:02.803+00
2fd9b4c7-cfbb-4ef2-9b9f-bf9607f2fe42	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT123M"}	2025-04-14 13:46:02.803+00
72a683a1-85ec-41f6-88fa-6895fda4c7f7	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24}}	2025-04-14 13:47:02.803+00
d19a727c-b0a1-4219-a7aa-36c41086fab8	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-14 13:50:02.803+00
ed86414e-ac35-445b-a91d-3ba1f8acfa87	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-15 10:00:20.474+00
8027cbf3-75db-4e40-8ea6-20bdf4bda4a6	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-15 10:04:20.474+00
d8f0615c-e13b-48fc-bbd3-a44710287b39	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT71M"}	2025-04-15 11:15:20.474+00
4e82abb5-15fb-46fc-8fbb-d6c32aabf123	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09}}	2025-04-15 11:16:20.474+00
d7d170a6-66c6-4a2a-9bb5-28be319332a2	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-15 11:21:20.474+00
873d4dcf-1060-4f81-b3ea-12b86debedf1	d3a9d109-d5de-5372-aaa6-2b4039cedb96	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-15 13:47:20.482+00
48a85aa3-512f-4d3e-b5d7-e5d92f006cf8	d3a9d109-d5de-5372-aaa6-2b4039cedb96	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT86M"}	2025-04-15 15:13:20.482+00
08ffc6b9-2d0c-4fe8-8d75-81ee1357a4c8	d3a9d109-d5de-5372-aaa6-2b4039cedb96	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 23, "scaled": 0.23}}	2025-04-15 15:14:20.482+00
3aa3d528-248f-49ad-a298-dd49683de126	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-15 16:04:14.341+00
c0b54205-ecb2-4712-8809-b5c11577d044	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-15 16:09:14.341+00
ec775159-7799-44e7-9adc-7afdc8da059f	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT129M"}	2025-04-15 18:18:14.341+00
0fb95b4d-59a3-4c09-9ac2-7be471b98b83	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.77}}	2025-04-15 18:19:14.341+00
364cece5-78b0-433f-ae42-1b5b7cc9a848	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-15 18:28:14.341+00
1495a606-bf29-4c4a-b0f8-58e53c1531cf	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-16 13:42:50.609+00
ca2840c6-4af7-454b-a0bb-ade3086ddf9f	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-16 15:53:20.474+00
3e41f48f-ca57-481d-90a7-6b39e8cbab04	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT132M"}	2025-04-16 15:54:50.609+00
1f6739b6-64a9-45f5-87e9-bf73aa159aba	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.75}}	2025-04-16 15:55:50.609+00
96552428-f4f0-4c70-ad36-628afdef09d3	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-16 15:59:50.609+00
9d4b1343-b82c-4378-b257-2cb109bd1548	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT85M"}	2025-04-16 17:18:20.474+00
d3d1e921-d394-4629-ace2-ad2d139b54bf	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 7, "scaled": 0.07}}	2025-04-16 17:19:20.474+00
b77ec7f3-d290-4797-ba1e-039e7b886986	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-17 12:39:04.396+00
0612cf4a-597f-4a40-ae0e-3c4d476f7762	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT51M"}	2025-04-17 13:30:04.396+00
dc4c1168-c1eb-44f3-80c6-0f83d4b68312	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 91, "scaled": 0.91}}	2025-04-17 13:31:04.396+00
5ab89eda-dff1-466d-8916-eea1f57c022f	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-17 13:37:04.396+00
2c87a2e1-2920-4b3f-b2e1-353918904ac6	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-17 15:35:20.474+00
86411ddb-a7ad-4fa2-a3f8-f853e7dfda22	d3a9d109-d5de-5372-aaa6-2b4039cedb96	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-17 16:17:20.482+00
9c71cd90-ee93-41fd-a257-6d3359a6e635	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-04-17 16:45:20.474+00
3edeb351-a466-4d12-b67d-a47e6e9c6eb5	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 15, "scaled": 0.15}}	2025-04-17 16:46:20.474+00
c12d9cc8-3535-45dd-a3b2-03612d570054	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-17 16:49:20.474+00
7bbdb920-b802-40a7-9e3b-30d5a6240ac8	d3a9d109-d5de-5372-aaa6-2b4039cedb96	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT85M"}	2025-04-17 17:42:20.482+00
9d1c51a5-b269-416b-839f-64e4c0d08f10	d3a9d109-d5de-5372-aaa6-2b4039cedb96	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 16, "scaled": 0.16}}	2025-04-17 17:43:20.482+00
70819290-01fe-4362-ae14-db3be2062001	d3a9d109-d5de-5372-aaa6-2b4039cedb96	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-17 17:50:20.482+00
a9e03439-d631-4373-8334-4b6ef52633b6	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-18 16:01:20.474+00
23463d95-e076-4f9d-ac6b-84e31a2899e9	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-18 16:03:20.474+00
0b6f5040-9073-4954-8e69-791f4597d3ef	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-18 17:21:11.052+00
b91fe73a-9062-4c01-8bcd-aff530c57111	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT88M"}	2025-04-18 17:31:20.474+00
476048ed-e6a8-4b03-bc98-15a5eeacde20	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-04-18 17:32:20.474+00
9e909f69-ecb8-4ba4-95bb-8d1b84cfa679	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT112M"}	2025-04-18 19:13:11.052+00
4aad0c03-b3ab-4589-a9c9-1bb12e508b2a	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 23, "scaled": 0.23}}	2025-04-18 19:14:11.052+00
2050709a-0cca-46d2-9e22-c4134d7aa6bb	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-19 14:49:20.492+00
fd22434c-3a5e-4af9-a6a2-834afb71f661	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-19 14:58:20.492+00
84d18155-29d8-4291-b645-b28aae4d336d	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-19 15:03:20.492+00
824d1c6c-5f1d-4cac-929d-fe9a9f10eea3	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-04-19 15:46:20.492+00
090d3e25-a3bc-4df4-a816-881d50fb720b	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43}}	2025-04-19 15:47:20.492+00
e06a3d56-1171-48c9-906a-af2c1b7e16a8	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-19 17:38:20.474+00
38bc8747-babb-43f2-8226-6ca249b06197	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-19 17:40:20.474+00
9ad407f6-e0bd-4ab4-ae50-623ad959d23d	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT88M"}	2025-04-19 19:08:20.474+00
2176fbf0-10f5-4e25-944a-80d00d15ca62	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.81}}	2025-04-19 19:09:20.474+00
e5973fcb-6239-4351-9daf-d8af27851310	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-20 15:58:37.441+00
5392f82a-0c9a-4618-80db-252464b8d07c	d3a9d109-d5de-5372-aaa6-2b4039cedb96	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-20 16:00:20.482+00
caf9f7c4-5f5d-4f7a-bdb5-c820b41683eb	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT103M"}	2025-04-20 17:41:37.441+00
53b44833-ddd7-4769-8a4c-1c905fb05a7a	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-04-20 17:42:37.441+00
842313a2-382b-41de-8340-91df1f4813fe	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-20 17:48:37.441+00
3e8aca1a-7f5b-4a0b-81d3-27f949754ed0	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-20 18:37:20.474+00
9cabf25f-6b72-4d39-96aa-5dd0621b3e90	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT92M"}	2025-04-20 20:09:20.474+00
3d4824c9-2367-4c52-a8c7-45f8bcbb0a73	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 91, "scaled": 0.91}}	2025-04-20 20:10:20.474+00
38702b34-fd39-4864-94e2-04a9df8806d5	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-20 20:15:20.474+00
2f7d55a0-267e-404f-9394-ec3aaac7bc3f	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.9208905726791743}}	2025-04-20 21:51:20.474+00
18bb102f-a9d5-4431-af04-6ad8a90ecce0	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.9208905726791743}}	2025-04-20 21:52:20.474+00
a62cefe1-0817-449f-9f53-1e32065ed533	eafc92a4-9ff9-508b-950a-1837164b2bcd	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 27, "scaled": 0.27}}	2025-04-20 21:53:20.474+00
c11b905e-3310-44b5-80a9-57963a6d4390	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-22 10:58:20.474+00
7c2ba8b5-3fa7-46b2-b64e-b932a0b0d0d6	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT78M"}	2025-04-22 12:16:20.474+00
acb57500-e619-422e-944d-3e79c015f97b	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39}}	2025-04-22 12:17:20.474+00
862a6785-190f-44b4-9fbb-08c977b91719	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-22 13:00:36.4+00
983a21ce-93c2-433b-9837-e42ee4c555a9	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-22 13:05:36.4+00
a91f70b7-5679-40cd-af97-7214865c2be3	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT85M"}	2025-04-22 14:30:36.4+00
d8f18458-04ec-47e2-8178-9e95b82f78b6	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 10, "scaled": 0.1}}	2025-04-22 14:31:36.4+00
36d2d0f1-7674-44d8-931b-17d5d69b28a5	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-22 15:25:20.492+00
09713bc1-34bb-4b26-9261-99272fe593da	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-22 15:33:20.492+00
447b8d26-7f3b-41b3-861d-7acc0876329b	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-22 15:36:20.492+00
78f52520-3b5c-490f-9f81-4ced353bdfa5	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT62M"}	2025-04-22 16:27:20.492+00
0059c8d7-d696-4222-afb5-1321a665cdbf	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-04-22 16:28:20.492+00
dd568add-e7fd-4271-ae9a-f00552cd78ed	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-23 13:25:20.474+00
a0853910-b439-4175-9fae-cd5c41f3c25a	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT79M"}	2025-04-23 14:44:20.474+00
07c7c4a0-a74a-4ef5-9931-3848b0c9c9b2	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-04-23 14:45:20.474+00
d311b0cf-f8dd-4315-83fa-f6b16b9d8558	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-23 15:51:10.74+00
53a9758b-92d8-472b-90b8-f7d1ba115bbb	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-23 15:56:10.74+00
be303303-b802-4c98-a653-5d0e82a14a76	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT82M"}	2025-04-23 17:18:10.74+00
21840c82-d48e-4e90-8c28-51ad42f34ea7	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.86}}	2025-04-23 17:19:10.74+00
c2acfd5d-d8fb-4096-ad9c-d8225c14d1a0	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-24 13:58:20.47+00
44729eb5-348f-4c23-9d91-d15c7e7c2094	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-24 13:58:20.491+00
cd60b542-dfe6-48bc-af4f-86a051a5623f	2457fc99-9240-5207-8740-05d01be3946e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-24 14:01:20.481+00
a359ad15-fe98-4c32-9a0e-af6bfeb78e83	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-24 14:02:20.47+00
823c336f-07e5-449e-9b3e-daad0cfaf1a8	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-24 14:03:20.486+00
6f6e5a4d-90eb-4fd5-b7cf-35869cc4b691	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-24 14:03:20.491+00
c1b58760-89be-402c-9b26-3542048d593b	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-24 14:05:20.486+00
88bee256-5a5d-4a71-a428-2bc431d2d141	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-24 14:12:20.491+00
3817c771-386f-405d-a2fc-69de59e4c2d7	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT106M"}	2025-04-24 15:44:20.491+00
9f77a6d3-ba34-4730-b625-92da010ada8b	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-04-24 15:45:20.491+00
cd8b2047-cc9f-434f-be64-dbd2901b4297	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-24 17:10:20.474+00
1e518b65-6816-4eb4-b383-9fda46507561	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-24 17:14:20.474+00
5a1ec12c-3477-4f18-942b-0491a3db4063	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT211M"}	2025-04-24 17:33:20.47+00
d657b1db-1a97-4e65-a4f3-eb1790085b91	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-04-24 17:34:20.47+00
e027642a-4931-49b2-8a50-7ce059dd2834	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-24 17:38:20.47+00
adba3a65-a370-4db0-b85f-c04f96419004	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT73M"}	2025-04-24 18:27:20.474+00
1b562992-e80e-45a3-8a2f-8d2bb6e101a5	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 91, "scaled": 0.91}}	2025-04-24 18:28:20.474+00
43e90556-9c65-4559-9ebf-d6f2580adb5b	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT307M"}	2025-04-24 19:12:20.486+00
738bae6d-1afb-41d8-8978-936b0cd1c4e5	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-04-24 19:13:20.486+00
607a27f3-9504-4d44-a22e-55de1cd4e72c	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-24 19:18:20.486+00
82fd071f-994f-4186-a907-5015f62e9b13	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-25 11:38:20.491+00
db6613f8-ad20-450e-9305-dd4162a79839	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-25 11:48:20.491+00
ade6540d-3aa1-4595-90d4-284f1f796ee2	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-25 12:05:20.474+00
d9a9ca02-402d-4fdb-8333-2e6a5ad34f8a	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT85M"}	2025-04-25 13:30:20.474+00
37f8e2c5-3687-444e-a399-8c3c9c593ecc	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.82}}	2025-04-25 13:31:20.474+00
ee58816b-1639-4ce2-88d7-1f673cc6a500	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT122M"}	2025-04-25 13:40:20.491+00
dbbd47c7-6fc0-44e4-9cdd-f8ab766716d5	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.92}}	2025-04-25 13:41:20.491+00
50a887c8-dd71-4da8-a35c-321c342cfbf3	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-25 14:34:20.47+00
2b5bf88a-a935-440e-ace8-1e0d20821d75	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT202M"}	2025-04-25 17:56:20.47+00
9b96c311-967a-49b9-862d-e27ce0cbf5a8	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-04-25 17:57:20.47+00
dc9f8221-4e2c-44ff-a802-dcccd5277a90	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-25 18:33:45.447+00
b0d29051-fdf6-40bb-9fe3-1de0d1018a3b	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-25 18:37:45.447+00
af04d3af-a5e9-41fb-b456-93c70d184cb1	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT134M"}	2025-04-25 20:51:45.447+00
26084246-52ce-4e1b-9de5-e896d5af2f29	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 7, "scaled": 0.07}}	2025-04-25 20:52:45.447+00
0450978c-99f7-4cef-872f-14701e3d1243	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-25 20:56:45.447+00
2014ae81-8432-4d2b-90b2-80fed749591f	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-26 13:18:20.492+00
4e842f8b-5d23-4339-a99f-c41dad29c287	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-04-26 13:21:20.492+00
daa9b23e-a689-451e-93cc-f11a8b714907	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-26 13:27:20.492+00
76d4c4f5-2988-4adc-8ee0-0841802c8be0	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-26 14:30:10.738+00
80c25c3a-cb4b-4ca1-be80-e3bd854a7742	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT75M"}	2025-04-26 14:33:20.492+00
f7b18fe5-18e4-41af-9400-5cb715141fa2	32161eaa-e9b0-50f0-aa1c-103f269a1cf4	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-04-26 14:34:20.492+00
58828900-5bb7-4e22-ae3d-9af3e55d9d96	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-26 14:35:10.738+00
d0978e55-a83c-4afe-a40a-7b828d34bec4	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-26 15:19:20.491+00
c82dafb8-875c-45f8-85bf-71a6d0307cf4	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-26 15:22:20.491+00
cb4856b9-693f-4824-95ad-690c9cab951c	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT95M"}	2025-04-26 16:54:20.491+00
88b637c8-0a44-4ef0-b295-a0dc80bcfa39	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.99}}	2025-04-26 16:55:20.491+00
415691b2-dd19-4494-aaec-9c612620d0be	2457fc99-9240-5207-8740-05d01be3946e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-26 16:57:20.481+00
96a9ae46-ccf8-4aa1-b428-6576d6ef1e40	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-26 18:15:20.474+00
c7f3995b-07ec-4cb9-bae6-753b3e7eaa2c	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-26 18:18:20.474+00
ecdc65da-0435-4214-86d9-5516ddc6572e	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT227M"}	2025-04-26 18:22:10.738+00
6da58cca-cf3f-4f78-9259-b05fac133678	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 21, "scaled": 0.21}}	2025-04-26 18:23:10.738+00
bd1a5b91-5076-4602-a4a6-cd529e58ef8c	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT81M"}	2025-04-26 19:39:20.474+00
1fc1f5f0-ca6a-40b2-bf67-32e74a9a85de	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.82}}	2025-04-26 19:40:20.474+00
2d40e0d0-a856-45cb-95b5-97ad344a24a3	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-27 11:20:20.482+00
50a2b0d8-487d-4841-a672-969dc9cfa51f	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT87M"}	2025-04-27 12:47:20.482+00
ad3e761d-5e52-4409-a5e0-cb30ae561beb	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-04-27 12:48:20.482+00
801d19a0-b086-43fb-947a-4408d8a62498	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-27 14:19:32.257+00
1a9fc8e6-fa63-4f3a-860a-23003660ceed	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-27 14:24:32.257+00
e05cb1c8-b495-4a8d-906c-aa3c9fbe6366	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-27 14:45:55.482+00
e8be0ddb-c09c-4b80-b68c-b6ae310f9e59	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT55M"}	2025-04-27 15:40:55.482+00
3441d6aa-08fd-49a4-9c8c-e0d17f6caedc	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9}}	2025-04-27 15:41:55.482+00
e3191bbd-a0e2-41fb-a749-613339e4d586	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-27 15:48:55.482+00
d31f99be-d658-4456-b84d-780ff21a2354	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-27 17:23:20.474+00
6f6c97ba-7fc3-4ba2-afd8-f479096fea69	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-27 17:26:20.474+00
fe66f381-86ec-4260-b06a-208c7de98908	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT83M"}	2025-04-27 18:49:20.474+00
e392384d-405a-438e-98ab-f1c58f080282	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 12, "scaled": 0.12}}	2025-04-27 18:50:20.474+00
afde948d-63fd-405a-8bd7-f9d30e175186	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT319M"}	2025-04-27 19:43:32.257+00
46f0aa27-a94f-4417-a7ec-1d10474fe5a8	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 12, "scaled": 0.12}}	2025-04-27 19:44:32.257+00
e2dd9c36-179a-4b50-bc2d-52dcc9cc78b4	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-27 19:48:32.257+00
3dc581c8-a496-4fee-acac-7dbde6ade212	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-27 20:29:20.47+00
269267a1-fd51-4562-a0c0-85a51e4ff02d	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-27 20:32:20.47+00
02326fc6-8797-4c1d-b39e-6602e91602d4	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.86115561142676}}	2025-04-27 22:36:20.474+00
d8b7d683-ae9d-44e9-a90e-607679008957	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.86115561142676}}	2025-04-27 22:37:20.474+00
f328548c-bf38-4a89-b4a5-aa9e944a4ec7	eafc92a4-9ff9-508b-950a-1837164b2bcd	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-04-27 22:38:20.474+00
862c488b-2f4b-4d7c-af55-759291cbc744	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT195M"}	2025-04-27 23:47:20.47+00
0fa92a78-f4d7-4cff-b329-cfc936fc43b7	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-04-27 23:48:20.47+00
4c2f6011-bb5d-4728-94b5-9d3b555b875d	9aebb656-afa1-5a07-bb63-e5a569b53ca4	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-29 14:28:20.491+00
0f81181a-cd77-43f4-b3e9-b5ebe986ba0a	9aebb656-afa1-5a07-bb63-e5a569b53ca4	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-29 14:35:20.491+00
20320345-1104-49d1-88e6-da0b0811d753	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-29 15:20:11.951+00
de4b6b60-a9a3-4c59-b63f-606d4a096793	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-29 15:25:11.951+00
ebe1f3a7-680c-410e-b63e-6710939c8012	2457fc99-9240-5207-8740-05d01be3946e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-29 15:30:20.481+00
c5ebbb98-3bd0-40c7-96dd-24364a8f1363	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-29 15:56:20.474+00
47e7162b-13ac-4935-b337-bc25ebede280	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-29 15:59:20.474+00
d9cd6b82-3fde-47ef-b0dc-ea1669d58e4a	9aebb656-afa1-5a07-bb63-e5a569b53ca4	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT105M"}	2025-04-29 16:13:20.491+00
9a784c59-ca1a-4d67-9983-a4c48d838430	9aebb656-afa1-5a07-bb63-e5a569b53ca4	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 98, "scaled": 0.98}}	2025-04-29 16:14:20.491+00
31a0a5dd-ebbb-4336-a1f7-173d81658786	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT74M"}	2025-04-29 17:13:20.474+00
ac8eb7e9-6b80-4887-8efc-7299e4c48f98	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.85}}	2025-04-29 17:14:20.474+00
931bd6e8-1726-440c-961a-fcc69f92bfea	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-29 18:44:20.47+00
1c75ab79-6345-4dd1-a1c8-ea2831b48fc5	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT244M"}	2025-04-29 19:29:11.951+00
fc730dc4-3678-4399-9a9c-b7f3dba23510	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 83, "scaled": 0.83}}	2025-04-29 19:30:11.951+00
6f6a6367-1d87-45f0-96e1-d990b627a242	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-29 19:32:11.951+00
3ef33116-5093-4d42-a562-cb271fcbbe0e	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT214M"}	2025-04-29 22:18:20.47+00
6c33fb88-97aa-4d3c-90e8-a7b66ccfd1ca	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09}}	2025-04-29 22:19:20.47+00
46331e13-61d4-49a1-82d9-a9554efe4324	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-30 10:33:20.474+00
45ca0f75-9967-4cb1-aee4-b27e3bc40013	d3a9d109-d5de-5372-aaa6-2b4039cedb96	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-30 11:08:20.482+00
8f681fe1-d84d-42e3-a8c3-4817fd5babcd	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT67M"}	2025-04-30 11:40:20.474+00
d66f5e58-3526-4bcc-b7c6-277d632a6ef8	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.99}}	2025-04-30 11:41:20.474+00
713a0df0-2c57-41a5-b2e6-2cff4bf6120e	d3a9d109-d5de-5372-aaa6-2b4039cedb96	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT91M"}	2025-04-30 12:39:20.482+00
8d3b70c3-2016-4de7-874f-155e923d3c50	d3a9d109-d5de-5372-aaa6-2b4039cedb96	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-04-30 12:40:20.482+00
253fe09d-c613-4bff-83e1-d830e79043a5	d3a9d109-d5de-5372-aaa6-2b4039cedb96	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-30 12:49:20.482+00
619bf36e-bb37-4967-952d-63f1b36a49d6	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-30 13:13:20.491+00
57672a30-3317-445a-8946-a9c5c76afd9c	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-30 13:17:20.491+00
d18e448e-aff5-4b12-9553-5bb252fccb89	2457fc99-9240-5207-8740-05d01be3946e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-30 15:10:20.481+00
6e7fe675-ca02-40aa-8ac7-7298a021ea1d	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT226M"}	2025-04-30 16:59:20.491+00
53b3f992-163e-43ea-be7d-7d3467d1ac30	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-04-30 17:00:20.491+00
2b5a274b-402a-480f-9600-a4a7c77512b6	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-01 13:27:25.899+00
a3740c02-b659-402e-9f08-e9e951b36274	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT19M"}	2025-05-01 13:46:25.899+00
e5c88e05-77f9-4415-87c9-b1d811ee86e9	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39}}	2025-05-01 13:47:25.899+00
16fc33c6-1114-4cb8-8144-1e468b2a86ce	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-01 14:46:20.47+00
ad153efb-7b01-41a9-8717-a9a0bef32cbe	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-01 15:03:15.43+00
9942135b-9738-4fab-be23-9a264bf9afa8	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-01 15:05:15.43+00
adfa2682-f9aa-4bb2-bfad-ac9cd88fb516	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-01 16:59:20.474+00
d2606cf1-8248-4f7a-a73f-df6a07d1720e	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-01 17:03:20.474+00
56076488-05ed-4e52-89ce-ec42098936a9	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT139M"}	2025-05-01 17:24:15.43+00
13936bd0-9feb-442f-8746-b8feec199124	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56}}	2025-05-01 17:25:15.43+00
9a4d24d3-b11e-4013-85be-dcecf6c7af12	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT168M"}	2025-05-01 17:34:20.47+00
4544b358-2de1-468c-a5b1-bbf4f6c7e732	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 27, "scaled": 0.27}}	2025-05-01 17:35:20.47+00
d18eca43-f449-443b-802b-44467aee80a8	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT81M"}	2025-05-01 18:24:20.474+00
4fbc1dd9-b0b7-42b9-9e2d-f190e4e928c5	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9}}	2025-05-01 18:25:20.474+00
bf29db06-17d8-4b53-83e7-3ac38da4680d	2457fc99-9240-5207-8740-05d01be3946e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-01 20:28:20.481+00
0cd8df72-4302-4f57-b39d-c758aa3ab44d	2457fc99-9240-5207-8740-05d01be3946e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT105M"}	2025-05-01 22:13:20.481+00
9e850053-45db-470f-82fb-50832777826a	2457fc99-9240-5207-8740-05d01be3946e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-05-01 22:14:20.481+00
686f456b-d61e-48b6-865e-997ba4485f6e	2457fc99-9240-5207-8740-05d01be3946e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-01 22:16:20.481+00
6a71fc8d-001e-4e98-ac39-d7968865f177	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-02 11:46:20.474+00
dac4ab80-20b9-40ea-91a8-4058812099ed	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT82M"}	2025-05-02 13:08:20.474+00
57333ddc-0361-4921-93a6-bf6a7c3fa658	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 16, "scaled": 0.16}}	2025-05-02 13:09:20.474+00
6aa766a9-b748-41ee-8889-7b9992c51fc1	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-05-02 13:13:20.474+00
406f7eda-b1a3-4777-8f67-bf5a88315643	9aebb656-afa1-5a07-bb63-e5a569b53ca4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-02 14:08:20.491+00
2b739550-213d-41be-9921-0720f9f4857d	9aebb656-afa1-5a07-bb63-e5a569b53ca4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-02 14:13:20.491+00
d0620d2a-34c1-4cb8-97c1-1c49db2c0817	9aebb656-afa1-5a07-bb63-e5a569b53ca4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-02 14:21:20.491+00
57aec44b-5d59-4df8-b1aa-a3761f473b01	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.5979120634905235}}	2025-05-02 16:41:20.474+00
a8519c75-1110-4c7a-9cb9-6014103f44b7	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.5979120634905235}}	2025-05-02 16:42:20.474+00
3e663d5d-7648-47a8-a31a-773e1a47c855	eafc92a4-9ff9-508b-950a-1837164b2bcd	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 8, "scaled": 0.08}}	2025-05-02 16:43:20.474+00
ffd885c1-e5dc-47ef-9002-a70f2c4fbc53	2457fc99-9240-5207-8740-05d01be3946e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-02 17:17:20.481+00
f1a96afc-499c-4972-8ae1-00cbc9154460	9aebb656-afa1-5a07-bb63-e5a569b53ca4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT200M"}	2025-05-02 17:28:20.491+00
5465b72b-5f18-4822-a693-ce668700fc86	9aebb656-afa1-5a07-bb63-e5a569b53ca4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-05-02 17:29:20.491+00
8b5bc767-d445-47ed-8fb0-c737590eb9cf	2457fc99-9240-5207-8740-05d01be3946e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT58M"}	2025-05-02 18:15:20.481+00
b2723eaf-23e7-4ef9-9ce7-dd857ce65210	2457fc99-9240-5207-8740-05d01be3946e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24}}	2025-05-02 18:16:20.481+00
dd43a539-f4d8-4142-99e1-e0280be618f5	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-03 14:40:54.559+00
213d6b49-335f-4e27-a122-6015fbb5d31a	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-03 15:13:27.283+00
c29d5bfd-2360-42af-b8a1-05bf22926e89	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-03 15:17:27.283+00
da1b2392-3e9d-4af8-af0e-4ce35aa59929	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-05-03 15:37:54.559+00
504cb26a-82a7-47ca-9962-4008a82e5fd7	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-05-03 15:38:54.559+00
0a181c18-da8e-47fd-9a82-c58c628c9715	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-03 15:41:54.559+00
838619d7-518e-4b61-ae70-89ab6ee4b2d4	9aebb656-afa1-5a07-bb63-e5a569b53ca4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-03 16:22:20.491+00
ef3f720c-ecf8-4a6f-a66f-67bbb9b9a082	9aebb656-afa1-5a07-bb63-e5a569b53ca4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-05-03 16:28:20.491+00
5d9f562e-f2b9-4cf8-be40-1382a56c3973	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-03 16:32:20.482+00
82ec37fd-068a-44cd-b0b8-a8d8fa42683a	9aebb656-afa1-5a07-bb63-e5a569b53ca4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-03 16:35:20.491+00
eb1e02da-6d72-421d-a0d3-ee452e98de94	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-03 17:33:20.47+00
d3e5f7eb-1456-4672-9819-531af3cb5c6f	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT66M"}	2025-05-03 17:38:20.482+00
bdc2f9c9-de48-45a4-b79b-ecd84655eaa4	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-05-03 17:39:20.482+00
a2a9e122-4eaa-458b-95f2-565dbefe894a	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-03 17:43:20.482+00
7451825d-6848-40cb-8894-35117e6ac52f	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT181M"}	2025-05-03 18:18:27.283+00
3bd2b154-b77e-44de-aa88-247ff6d046f6	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 10, "scaled": 0.1}}	2025-05-03 18:19:27.283+00
cb2ecb25-e9c2-45c6-80ff-90583ccd420f	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-03 18:24:27.283+00
ea7d531c-6d1b-4a22-a3d5-f47464479721	9aebb656-afa1-5a07-bb63-e5a569b53ca4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT214M"}	2025-05-03 19:56:20.491+00
dad218d1-d457-494c-87e8-92ec6d9ba2db	9aebb656-afa1-5a07-bb63-e5a569b53ca4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 26, "scaled": 0.26}}	2025-05-03 19:57:20.491+00
a919299a-1527-446a-9b92-9e4f448f79cb	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT210M"}	2025-05-03 21:03:20.47+00
ca86e7d4-4814-4c6a-ab70-632bd70f60d2	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.99}}	2025-05-03 21:04:20.47+00
a462cb78-6c9d-4a3b-9b15-8b99bcea73ed	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43513328207357077}}	2025-05-04 00:35:20.47+00
423ad651-c849-4a7a-840a-4f09a37f3336	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43513328207357077}}	2025-05-04 00:36:20.47+00
4c6aa9ff-9d2c-48b9-90ae-3880e17d8675	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 8, "scaled": 0.08}}	2025-05-04 00:37:20.47+00
06ff8505-4be1-449b-a009-d814b66efd8c	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-04 13:10:20.482+00
bc97947c-68bb-450e-b912-f27cc16b8c71	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-04 14:18:20.491+00
6490c26f-50d7-46be-b39a-92b395dd53b9	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-05-04 14:25:20.491+00
e046be69-f222-4dc2-8c09-3002b0ce41bf	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-04 14:28:20.491+00
9030900d-0c95-487b-bf6d-125832b0bb04	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-05-04 14:38:20.491+00
e5a94029-f6c8-4a3c-9925-befbacbdf300	2457fc99-9240-5207-8740-05d01be3946e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-04 14:49:20.481+00
5acfa00b-a779-47bb-b648-a64453ef0ebd	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT115M"}	2025-05-04 15:05:20.482+00
730f8d1d-c003-4c28-9228-7f9d28cb628b	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.84}}	2025-05-04 15:06:20.482+00
59a8a7cf-b447-4f85-9718-d06efec0efcf	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-04 15:11:20.482+00
c0ade074-a90b-4204-8aa1-398bdcd9c680	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT97M"}	2025-05-04 15:55:20.491+00
efee293b-e189-40e0-a974-949d4e837969	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": -6, "scaled": -0.061777481058610195}}	2025-05-04 15:55:20.491+00
d0b7158d-23f3-4402-8e25-386aab6e2663	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-05-04 15:56:20.491+00
98a2548a-c87f-465c-8bad-c5294c347735	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": -6, "scaled": -0.061777481058610195}}	2025-05-04 15:56:20.491+00
69711b50-8441-4a4d-a5c1-891893caca3c	9aebb656-afa1-5a07-bb63-e5a569b53ca4	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 2, "scaled": 0.02}}	2025-05-04 15:57:20.491+00
356b3446-d026-40d6-942e-160c1d94a1d1	2457fc99-9240-5207-8740-05d01be3946e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT116M"}	2025-05-04 16:45:20.481+00
13de7932-5c42-4cd8-8b89-2dd943a20ec1	2457fc99-9240-5207-8740-05d01be3946e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 83, "scaled": 0.83}}	2025-05-04 16:46:20.481+00
a178a54a-24a4-4c8f-bcb0-055be1fce341	2457fc99-9240-5207-8740-05d01be3946e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-04 16:54:20.481+00
7862310e-15de-4c04-8dab-e1c7e1ad2aa4	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-04 17:55:20.474+00
f6428630-6456-4524-a97e-f9595f5905ce	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-04 17:58:20.474+00
642b75ce-56b6-409e-9282-76047bee927b	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT78M"}	2025-05-04 19:16:20.474+00
318637e2-b2d4-4225-bfca-a07a3bf0767d	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-05-04 19:17:20.474+00
16b6a568-4215-4b4d-84d8-6c4f340ae852	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-05 12:20:33.406+00
e531d6ed-5d6a-4ed0-af87-2d680e7a064b	9aebb656-afa1-5a07-bb63-e5a569b53ca4	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-05 14:33:20.491+00
5b429877-b321-44a9-a6e5-3f13b13d510e	9aebb656-afa1-5a07-bb63-e5a569b53ca4	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-05 14:41:20.491+00
f81fce9c-3856-4170-b3f5-6579d5e4c6fe	9aebb656-afa1-5a07-bb63-e5a569b53ca4	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-05 14:48:20.491+00
d037ad26-eb98-40c8-b38f-092a9551eb37	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-05 15:56:20.47+00
76ec0e78-6726-4dd0-aa52-b85e7d929e7e	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-05 15:59:20.47+00
2ad096d0-f277-4e4f-ad38-7d5677b323fa	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-05 16:11:06.078+00
5a118aa2-763e-41db-869d-b17ba1ef2cfa	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-05 16:36:20.474+00
8a60cd47-fe1b-4edb-a8be-6db52ac77324	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-05 16:38:20.474+00
15f17b9e-1b20-4eac-a5de-4e9ef92bbdd7	9aebb656-afa1-5a07-bb63-e5a569b53ca4	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT138M"}	2025-05-05 16:51:20.491+00
55ba8249-7d93-407e-933e-2ce72c4cdcdf	9aebb656-afa1-5a07-bb63-e5a569b53ca4	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-05-05 16:52:20.491+00
8a15131b-766d-400c-abb0-b02dcc13264b	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT80M"}	2025-05-05 17:58:20.474+00
a8805d7b-a2b7-447a-86c7-861a970a2bf8	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 8, "scaled": 0.08}}	2025-05-05 17:59:20.474+00
bf9b5890-da8d-4503-b37c-7203b22fc79c	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT189M"}	2025-05-05 19:08:20.47+00
f9dc2159-70cb-4941-8cae-021de0d6e448	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.77}}	2025-05-05 19:09:20.47+00
ec4038f5-e13d-40bd-bdc3-7ab55322ba0b	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-05 19:10:20.47+00
467b7ad8-cc48-4ae0-9ff3-a30bf3a0d875	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT244M"}	2025-05-05 20:15:06.078+00
26d1dd0f-f21c-4198-828f-528412615270	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 28, "scaled": 0.28}}	2025-05-05 20:16:06.078+00
2b38b62b-1d59-4ab6-90a5-c9cfd0886aa7	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-05 20:18:06.078+00
b636e414-ced5-433b-b38b-c70d03a2044d	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41350165691413293}}	2025-05-05 20:21:20.47+00
ccea53a6-bbf1-4872-8e8d-2f44ef610ed5	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41350165691413293}}	2025-05-05 20:22:20.47+00
5d844bd5-d694-4751-b985-fe2de7687f52	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-05-05 20:23:20.47+00
896111f4-1923-42eb-b2b8-8a74097011b4	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-06 11:39:20.491+00
492a52f1-7262-487b-8d0a-f3dc70616fb8	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-05-06 11:49:20.491+00
870d46ca-ac5c-447e-bc6f-61262cfe766d	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-06 11:57:20.491+00
77fb4b5a-cf8d-475f-a469-8af166972cd4	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-06 13:12:20.47+00
a7965d9e-8da0-4423-b9b0-8e6b0be6b2df	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-06 13:16:20.47+00
8d057aa3-b6c3-4c72-b5c8-5b6847d6ff11	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-06 14:00:20.474+00
79998288-b13d-45dc-bb00-8025ea401824	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT146M"}	2025-05-06 14:05:20.491+00
7a6b4b78-e2ff-4d14-94b4-8124485a58be	9aebb656-afa1-5a07-bb63-e5a569b53ca4	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 10, "scaled": 0.1}}	2025-05-06 14:06:20.491+00
8cc541a6-f5ed-4029-9b22-702edccb55bf	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT66M"}	2025-05-06 15:06:20.474+00
f162b1a9-32b4-4cd4-90d6-463bf617216a	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.2}}	2025-05-06 15:07:20.474+00
90818d2d-9015-4ec4-8aab-6cfcb72e0e4c	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-06 15:25:20.481+00
fdd79b6d-12bf-49b3-a3b5-9ad892586c04	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT62M"}	2025-05-06 16:27:20.481+00
b50c15c4-8781-416a-947f-fa0bb6ec02be	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.99}}	2025-05-06 16:28:20.481+00
0756b1ce-bc33-4928-a8ec-49c1fb17d800	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT199M"}	2025-05-06 16:35:20.47+00
564e4b31-0eee-4f02-a2ec-fd6b4343117b	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.52}}	2025-05-06 16:36:20.47+00
2b1b1d5d-65de-4453-9388-5fc9ef949064	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39760652068751784}}	2025-05-06 20:25:20.47+00
a037e3b0-bfe2-4024-b8b9-98974983ba5f	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39760652068751784}}	2025-05-06 20:26:20.47+00
bcae87d6-48d5-4668-bc29-bcde65541c72	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.81}}	2025-05-06 20:27:20.47+00
6ebb6e96-457e-4487-9ebe-a5eef17414b8	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-07 16:07:49.71+00
9849622e-a4c4-45d6-8c30-46ba76a62e14	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-07 16:10:49.71+00
3237a2a6-0eac-4586-ab1a-aad7db36acbe	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-07 16:12:20.474+00
a5288cd2-7c76-40ae-a90c-f066d853e91b	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT77M"}	2025-05-07 17:29:20.474+00
48aed9fb-63e2-430c-aade-a370d41d26b4	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-18 16:33:20.481+00
aa8914e3-7b5f-41d0-aff9-6a543e82d694	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43}}	2025-05-07 17:30:20.474+00
25c8fa3e-6c56-4426-b407-d5de6b80f3b2	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-07 17:32:20.474+00
96680341-424e-4dec-b909-311031c2e52c	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-07 17:37:20.47+00
38b31e46-5aae-4b65-a59b-f83fd01010d0	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT167M"}	2025-05-07 20:24:20.47+00
3cba8e97-8c07-4ccd-9dc1-25eb23d38e07	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-05-07 20:25:20.47+00
ec39fce7-0988-4ae2-9d4e-3f70b0b413ef	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT264M"}	2025-05-07 20:34:49.71+00
c1118620-a2c5-440d-95f2-4845f4650978	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-05-07 20:35:49.71+00
e9deb6c9-89b5-4669-8e53-3407478393c1	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-07 20:39:49.71+00
b360fa6b-6da2-425a-94c1-70911d5cc6ed	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39236223215126825}}	2025-05-07 23:42:20.47+00
bc8ab48f-df4d-4d9d-8f75-96e442a741af	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39236223215126825}}	2025-05-07 23:43:20.47+00
37745621-02cc-44dc-8ad6-108d9b059961	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-05-07 23:44:20.47+00
360a1ae1-0678-4326-8875-0f953ddea63b	d3a9d109-d5de-5372-aaa6-2b4039cedb96	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-08 11:50:20.482+00
59104900-e3f9-4fec-9be5-3d8698c6a65c	d3a9d109-d5de-5372-aaa6-2b4039cedb96	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-05-08 13:00:20.482+00
b40269b5-f9ab-4ecf-b2ca-14bcc07849c9	d3a9d109-d5de-5372-aaa6-2b4039cedb96	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-05-08 13:01:20.482+00
42d1704a-6af9-4cf4-87e5-93ce1c26e002	2457fc99-9240-5207-8740-05d01be3946e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-08 15:33:20.481+00
51999b77-9de5-466b-9c1f-08e50f6710bf	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-08 18:38:20.474+00
5c3d487b-7c20-4d8c-9965-076a672ad467	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT83M"}	2025-05-08 20:01:20.474+00
662a59f7-8205-4ea8-878d-91280a2b8393	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-05-08 20:02:20.474+00
cfc4def2-9b57-40eb-ab2c-c415a8a1ab60	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.576468576528981}}	2025-05-08 23:52:20.474+00
76844670-b466-4472-80d8-ee88262a9a43	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.576468576528981}}	2025-05-08 23:53:20.474+00
ec0d6972-a5f6-4321-b34f-a584b8022934	eafc92a4-9ff9-508b-950a-1837164b2bcd	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-05-08 23:54:20.474+00
81d26f98-2a47-4309-b580-62957d0cc4e4	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-09 11:25:35.701+00
08dad9c0-3119-4d68-83cb-62e12c79171e	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-09 11:29:35.701+00
852e50f5-bb30-42e0-8e14-1765de3a0293	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT22M"}	2025-05-09 11:51:35.701+00
210dcb71-66ca-4978-99b1-04b4af771117	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 27, "scaled": 0.27}}	2025-05-09 11:52:35.701+00
ef62d16a-cbd8-491e-9491-693cd700a96d	2457fc99-9240-5207-8740-05d01be3946e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-09 16:21:20.481+00
029f8ed4-2d27-4d2a-aaba-b9d62c675378	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-09 17:06:13.829+00
628a042a-77f2-479a-9041-e8f9713d31be	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-09 17:11:13.829+00
9d64610e-4cff-4eef-a0c5-67783070ae48	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-09 18:25:20.47+00
3edd4216-0864-419d-94fb-c4be155391e1	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT211M"}	2025-05-09 20:42:13.829+00
6fddd2e1-30e6-4da1-941c-b83e88e9a8c3	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 12, "scaled": 0.12}}	2025-05-09 20:43:13.829+00
b141f61f-ed5a-490e-b2ee-783e42f28af8	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-09 20:52:13.829+00
58d9c2f8-2c0f-4790-81d9-14b6e4bb6507	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT198M"}	2025-05-09 21:43:20.47+00
90034cff-1160-4b98-a054-8439e73a9134	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.29}}	2025-05-09 21:44:20.47+00
89344624-90bc-4def-9031-4acd2ecb00e3	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.5298087287119986}}	2025-05-09 23:01:20.47+00
a73f42e3-185b-408b-a78f-37be740b65a0	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.5298087287119986}}	2025-05-09 23:02:20.47+00
ced889fc-40c8-4278-983c-59dfcce69e8d	a39e581a-a948-5af5-ad61-b2b0030fb824	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 23, "scaled": 0.23}}	2025-05-09 23:03:20.47+00
724aa913-9633-447c-ba80-74efa351473b	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-10 11:42:20.474+00
deff8e1c-fad3-4a53-884b-7a7e8e590bb3	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-10 12:16:20.482+00
fbbcef0c-5dd2-4683-97dc-be225b1b9cda	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT72M"}	2025-05-10 12:54:20.474+00
ac772e4f-40a9-4a2c-9cc6-12ff1f4f3300	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 6, "scaled": 0.06}}	2025-05-10 12:55:20.474+00
171c485f-770e-4a9a-9691-49eb99931ba8	2457fc99-9240-5207-8740-05d01be3946e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-10 17:40:20.481+00
b4504631-e6f5-4d61-9f15-8ec9f9865e2f	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-11 11:09:08.431+00
505677b6-7ff4-4479-8ff2-3cf62d84f09e	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-11 11:14:08.431+00
7fabbfbc-0744-4f21-81f1-2608587dcee9	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT29M"}	2025-05-11 11:43:08.431+00
7f515d48-83ef-4265-892b-5606593e9acf	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT215M"}	2025-05-14 20:24:20.47+00
a3de0d57-b778-4231-bf17-e4abf41af837	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-05-11 11:44:08.431+00
c3d5de8d-325e-45f3-8fbf-883770a20a84	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-11 16:07:25.908+00
6bf1da32-96ca-4274-9d2f-92152273fcc7	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-11 16:10:25.908+00
639a0a0d-5eff-49e4-8df9-aff6eb9f274c	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-11 18:53:20.474+00
d7805621-d702-4743-af7e-a3825ba06a01	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-11 18:56:20.474+00
86dc3770-4faa-44e2-a637-afe9576293d4	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT68M"}	2025-05-11 20:04:20.474+00
ed235725-1ada-4847-b15c-5aec421301ce	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.29}}	2025-05-11 20:05:20.474+00
32209448-0d95-4d76-8c98-55ca2d83ea9d	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-05-11 20:09:20.474+00
6ad7a95c-e2a3-4647-a6af-60f6965d6584	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT253M"}	2025-05-11 20:23:25.908+00
186fbac0-c402-4143-9863-4e2e2c8b6eda	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 7, "scaled": 0.07}}	2025-05-11 20:24:25.908+00
31f6970b-6432-49ef-b96b-757b654ee4a0	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-11 20:28:25.908+00
ea1fc434-c94e-4a06-81c2-877c1b11923d	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-12 11:45:20.482+00
d1413972-6188-4cbb-82f7-1fbeb6bd9535	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT112M"}	2025-05-12 13:37:20.482+00
ef481381-86e7-47a1-810f-86e685c7a1d0	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-05-12 13:38:20.482+00
c69a233b-afd4-46ca-9c33-a60ff36b1586	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-12 13:42:20.482+00
faa4756a-4f0f-4200-a122-dedc2b636613	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-12 17:08:20.481+00
8a461ce5-8425-4223-8c19-fdf175ade571	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-12 17:26:20.47+00
f4d5b2ca-45e2-4dac-8da9-2c473390d2e0	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-12 18:30:20.474+00
59ace5f0-cde4-443d-ac58-ec345b4f053a	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT98M"}	2025-05-12 18:46:20.481+00
421120b0-7c49-41d9-9735-61e6910d23f5	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 18, "scaled": 0.18}}	2025-05-12 18:47:20.481+00
a76c8e2e-50c6-4793-aebc-cc2bfe6ad55e	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-12 18:54:20.481+00
6e8852ba-1e3a-435b-98c2-3073fd5c1367	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT66M"}	2025-05-12 19:36:20.474+00
67754a88-7d2f-4dea-811b-7a3ef64c31d6	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-05-12 19:37:20.474+00
120361c1-3476-4313-898b-98678e1921cf	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT198M"}	2025-05-12 20:44:20.47+00
d2425ddd-4505-4300-ae50-721e70a7e3e7	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-05-12 20:45:20.47+00
c0aa35df-4818-46da-a177-592d4600696e	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-13 11:46:37.756+00
7d03c77f-9692-41d6-ac06-cc29c7daf6d3	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-13 13:56:20.47+00
83ddbe9e-a279-4791-ab8d-4a243e92c4a1	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-13 16:05:20.481+00
f2a7bd7b-74fd-40e3-b329-4124aa027999	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-13 16:53:56.151+00
f5736b93-7fcc-433d-82df-1a1a60f9224d	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT50M"}	2025-05-13 16:55:20.481+00
99bb2e53-1ab1-4b11-8ae6-0346dfa4580a	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-05-13 16:56:20.481+00
05814af6-588b-4f18-9f42-d4f1c17554e1	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-13 16:58:56.151+00
3c53075a-8e36-4cd8-b8b1-770ff12c8bf5	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT211M"}	2025-05-13 17:27:20.47+00
50eb609f-3539-4383-8667-577b5b99345b	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-05-13 17:28:20.47+00
63fa68fe-1e9d-463c-9f61-49e3f2f7819e	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-13 17:30:20.47+00
ae273d95-7334-49f1-b356-9642dffed80b	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-13 18:24:20.474+00
7acbe2bd-b83b-439f-9e34-fa4085215ea3	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT66M"}	2025-05-13 19:30:20.474+00
1c23f6b2-674d-4b19-91be-361442389e38	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 70, "scaled": 0.7}}	2025-05-13 19:31:20.474+00
2a0dd979-257a-4975-b17e-fd2d888a5341	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT336M"}	2025-05-13 22:34:56.151+00
cf102138-77c2-45e0-b5e3-479f8e2ae983	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.88}}	2025-05-13 22:35:56.151+00
06a645c1-fcbc-4800-93f7-3e0a62b7c3bf	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-13 22:44:56.151+00
1b041f00-738f-4607-8ae5-b63399c6e570	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-14 14:10:20.474+00
f5c5ccf5-3c2e-48be-9141-b93a102f3a6e	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT62M"}	2025-05-14 15:12:20.474+00
56f456de-dfc8-4884-b0c8-ce7859fce3de	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 3, "scaled": 0.03}}	2025-05-14 15:13:20.474+00
d50cd2fe-b43f-40af-9b6d-dc07bed18137	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-14 16:49:20.47+00
cb6a738e-6cd9-4277-a242-06c4112309f9	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-14 17:33:12.313+00
bb98ef4d-9322-4143-96db-69e8f1aa830a	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT38M"}	2025-05-14 18:11:12.313+00
1d14afb6-7760-4e91-8082-5126e0499147	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24}}	2025-05-14 18:12:12.313+00
5edfea15-6518-4a3c-a27f-f0703cdc1e8f	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-14 18:20:12.313+00
b4ff4b74-2378-407c-a861-5cb3da89e014	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-05-14 20:25:20.47+00
8345b86b-668a-4d0c-b36b-94734fa0e5b0	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-15 13:45:20.474+00
71fb1d22-5cfd-43c4-9e06-f04000e4929e	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-15 13:49:20.474+00
1ec137d8-18ab-40b0-ad76-53bf02779ad8	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-15 14:11:42.52+00
5cd021e5-ff34-466b-9845-69bbd0359f2f	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT91M"}	2025-05-15 15:20:20.474+00
34bfa3e9-851f-4d6c-bfb4-7ed3e96a4211	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-05-15 15:21:20.474+00
aa84c3ad-6a0c-4983-8637-ef09a2c8fa7e	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT118M"}	2025-05-15 16:09:42.52+00
88bac2e0-680f-4cdf-8cd5-4125d3f6e499	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 23, "scaled": 0.23}}	2025-05-15 16:10:42.52+00
e15b3bd3-b0fe-417c-a47c-f342a48ef6aa	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-15 16:13:42.52+00
f2e827f2-d2c2-4ae0-a3d4-4ce11c61dcd6	d3a9d109-d5de-5372-aaa6-2b4039cedb96	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-15 16:18:20.482+00
41db3fab-1e84-4459-943b-86c84f1160d3	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-15 16:24:42.52+00
98258476-6c17-4b0f-961a-bcc3de7b93ff	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-15 16:25:42.52+00
f71bdbe1-eecf-436a-babe-451c98bbcadf	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-05-15 16:26:42.52+00
1b9a9a54-c424-4b23-88de-c40da9eb6625	2457fc99-9240-5207-8740-05d01be3946e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-15 16:30:20.481+00
28d32186-7b4a-4bcc-b333-1fe1e23cf539	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-15 16:33:42.52+00
68647df8-926e-490a-8c18-dfdea5d2e1eb	d3a9d109-d5de-5372-aaa6-2b4039cedb96	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT101M"}	2025-05-15 17:59:20.482+00
94d92021-f6bc-459f-b200-0e15473b3dc1	d3a9d109-d5de-5372-aaa6-2b4039cedb96	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-05-15 18:00:20.482+00
6f9c1ddb-6496-4799-9372-d31222b84921	d3a9d109-d5de-5372-aaa6-2b4039cedb96	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-15 18:02:20.482+00
a268982a-54e8-49b0-96cf-bf2fba3a63a8	2457fc99-9240-5207-8740-05d01be3946e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT102M"}	2025-05-15 18:12:20.481+00
cd00ceab-384f-43bc-83b8-b3ec5be74e80	2457fc99-9240-5207-8740-05d01be3946e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-05-15 18:13:20.481+00
a7706534-f057-47cd-b944-3f0ad867a7d1	2457fc99-9240-5207-8740-05d01be3946e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-15 18:20:20.481+00
67a2d3a7-814d-4d55-8313-4cf604cc6f77	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.6138210825753116}}	2025-05-15 18:35:20.474+00
cc651b27-23c2-4f1b-be70-dd96f6fc0f96	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.6138210825753116}}	2025-05-15 18:36:20.474+00
97e15507-1e42-4118-8c81-3a0b6c2c7e0f	eafc92a4-9ff9-508b-950a-1837164b2bcd	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 8, "scaled": 0.08}}	2025-05-15 18:37:20.474+00
15ee19bd-96d9-4695-bf21-e94021bd7067	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-16 11:34:53.924+00
7547d110-14df-4fca-a76d-5f3450d4ba2b	d3a9d109-d5de-5372-aaa6-2b4039cedb96	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-16 13:11:20.482+00
a9cf12d1-aca3-4265-adc6-c284610470de	d3a9d109-d5de-5372-aaa6-2b4039cedb96	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT89M"}	2025-05-16 14:40:20.482+00
8429d788-e7be-4963-8ca7-13ce18433459	d3a9d109-d5de-5372-aaa6-2b4039cedb96	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.77}}	2025-05-16 14:41:20.482+00
0c65242b-b39b-4203-9ebd-74e9fc9b1367	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-16 18:40:20.47+00
0b8a1e92-6363-48f3-8196-dacb33d482c5	2457fc99-9240-5207-8740-05d01be3946e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-16 20:43:20.481+00
02e321cb-e5da-4252-a302-695f0e721254	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT197M"}	2025-05-16 21:57:20.47+00
00c90b67-2a48-4e6c-8816-81e7a1a0f103	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-16 21:58:20.47+00
c3fc9a77-a749-43d7-95fe-97a8d720311d	2457fc99-9240-5207-8740-05d01be3946e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT114M"}	2025-05-16 22:37:20.481+00
87b9bbca-3e61-43ed-b6ba-5e484729a233	2457fc99-9240-5207-8740-05d01be3946e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.29}}	2025-05-16 22:38:20.481+00
74853b98-b0b8-46da-b871-7b01867b864f	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-17 12:06:20.474+00
4316b3f9-5957-45e7-9981-fa5dda108644	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-05-17 13:16:20.474+00
f91e804c-4578-4962-ae5f-57c82ce253ac	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-05-17 13:17:20.474+00
ab64313a-cfe1-4ff2-9a08-16201bdbc87f	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-17 16:04:29.777+00
08d1ac41-5e8b-4e9c-af71-f62dd95d204b	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-17 16:09:29.777+00
c1844268-101e-495a-87c9-e27ec0a5dca1	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT145M"}	2025-05-17 18:34:29.777+00
bae12a06-6d1f-497b-97c1-108ecfd99513	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-05-17 18:35:29.777+00
829f8634-dafa-4f2d-97d0-a659fdedfd58	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-17 18:40:29.777+00
6af5dba7-2459-4afe-acff-0d8dcde2e6eb	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-18 13:08:20.482+00
c232590b-946e-4df4-b488-80d0367d3000	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT71M"}	2025-05-18 14:19:20.482+00
29f26976-9626-4b10-a8bb-b63cabb041cf	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.85}}	2025-05-18 14:20:20.482+00
5fb97c38-d7c6-45d7-8c3a-777712c7e5d7	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-18 14:27:20.482+00
c232d64d-ad35-4bdd-9904-0c07d194da74	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-18 18:18:41.163+00
df179794-70d7-4e2a-a41c-c815e61464e2	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT107M"}	2025-05-18 18:20:20.481+00
15913299-622b-4615-a9c0-700b2ef36da8	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.2}}	2025-05-18 18:21:20.481+00
4aac29f7-7580-459b-81ff-5c57e14f4020	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT19M"}	2025-05-18 18:37:41.163+00
23ba05e6-382b-40cd-bd15-7d2b3d8d3f17	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-05-18 18:38:41.163+00
e0655a3c-f18c-485e-b4ea-cb1e72cfb496	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-18 18:44:41.163+00
882714c7-46de-4bfb-b7b2-5e32009e5a09	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-18 18:57:20.474+00
7c10f3c3-4220-4b9a-8590-aaef6818db26	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT66M"}	2025-05-18 20:03:20.474+00
5fcd07fd-2dcc-4836-b5be-74614ee28be0	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.82}}	2025-05-18 20:04:20.474+00
cecae0c1-2023-4be2-b00a-8029e76d6e4d	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-18 20:32:20.47+00
37549210-722e-41c2-9882-22883cd69b90	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-18 20:35:20.47+00
2b25d825-c447-4751-b44e-8f9033566487	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT154M"}	2025-05-18 23:09:20.47+00
fe7c79d8-7123-457b-9e0b-27e4b40469e7	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 12, "scaled": 0.12}}	2025-05-18 23:10:20.47+00
0e7aad9d-9bfe-44f1-b960-60d7270b23eb	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-18 23:13:20.47+00
bb692ea3-3d98-40df-9f59-92a74898fa70	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.4842610267085525}}	2025-05-19 01:28:20.47+00
14b519f0-cfc6-4f0f-9d90-61bba52c1534	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.4842610267085525}}	2025-05-19 01:29:20.47+00
857b4771-3b6d-4ad6-a7b5-5cdb474cecea	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-05-19 01:30:20.47+00
ff3fcda3-fa6e-42ed-870e-f4ff4cd2b57b	d3a9d109-d5de-5372-aaa6-2b4039cedb96	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-19 13:00:20.482+00
707f3e84-4ccc-46be-b610-52c4c45ef981	d3a9d109-d5de-5372-aaa6-2b4039cedb96	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT59M"}	2025-05-19 13:59:20.482+00
1710ed03-491a-4425-8e7c-7456e20b5b77	d3a9d109-d5de-5372-aaa6-2b4039cedb96	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 2, "scaled": 0.02}}	2025-05-19 14:00:20.482+00
4e379032-cf5e-4877-9519-1e9901717677	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-19 14:35:43.437+00
f5451657-9673-454d-96fe-3441a955344e	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-19 14:38:43.437+00
f74b66a7-830e-4633-a74d-cdc5acf08c47	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT116M"}	2025-05-19 16:34:43.437+00
ef385c39-90f5-4702-bda4-07a662f263a7	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09}}	2025-05-19 16:35:43.437+00
bda5ff9b-d01d-4a08-8d88-ffd8c90f62be	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-19 16:37:43.437+00
32ff29dc-2b59-4939-b9b3-19fcacf3220f	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-19 16:49:20.474+00
f0391375-19fb-4a79-87d7-77b7312ab7fe	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-19 16:52:20.474+00
2c3528ae-1ecf-4c3b-aa95-285e658cc71c	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-05-19 18:02:20.474+00
76b8f522-1ddf-4619-b3dc-635b03100305	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.88}}	2025-05-19 18:03:20.474+00
07724c0c-206d-40a4-9311-41439badfa50	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-20 11:11:48.136+00
3ee03b07-ef1b-4dae-929e-bb08dd195945	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT45M"}	2025-05-20 11:56:48.136+00
52461005-8fd8-48ad-88a1-5ff4135a55e7	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.32}}	2025-05-20 11:57:48.136+00
5e1efc2c-d2c2-4c83-89d1-b5e742696f9e	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-20 13:11:20.474+00
20a22789-4b50-4642-860d-a450337bd2c8	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-20 13:14:20.474+00
22c60f4a-bff1-4b5b-bdf2-fcf70b86452a	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT62M"}	2025-05-20 14:16:20.474+00
92842c7d-a535-4276-8407-8ae7ab30ce4a	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-05-20 14:17:20.474+00
91900e5e-42f7-49b7-8c6f-e3206749859d	2457fc99-9240-5207-8740-05d01be3946e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-20 16:16:20.481+00
1f3aa29f-cde2-4903-8538-cfb366452153	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-20 17:42:20.47+00
f1f51d3a-e75b-41ce-b1cb-e87ceb17cb03	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-20 17:47:20.47+00
e809a9bc-5ddb-4194-a528-97e54ec4e187	2457fc99-9240-5207-8740-05d01be3946e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT124M"}	2025-05-20 18:20:20.481+00
fa0da127-4888-4817-b741-8fb9c24539c0	2457fc99-9240-5207-8740-05d01be3946e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-05-20 18:21:20.481+00
6ee309fd-83c8-4ed4-8681-23f9dd7e9e3a	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT212M"}	2025-05-20 21:19:20.47+00
f071c552-4b23-4967-a1d7-889440f4f90b	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-05-20 21:20:20.47+00
2b17e10f-b3ed-4eb9-a6f8-d563f5776dc1	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.3940420350357227}}	2025-05-21 01:13:20.47+00
8e282afb-5432-4baf-9a1e-5dbb91bb9752	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.3940420350357227}}	2025-05-21 01:14:20.47+00
7b4ea6e4-538d-4544-a9b5-5ad75d85cb32	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 93, "scaled": 0.93}}	2025-05-21 01:15:20.47+00
b1f29597-2cfa-4aed-baa8-95a1e60ad275	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-21 13:35:20.474+00
5da781ce-1df0-4378-873d-a4bf1820f38b	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-21 13:37:20.474+00
a04e3f34-61ea-401c-b2ff-342aa238a74d	d3a9d109-d5de-5372-aaa6-2b4039cedb96	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-21 14:03:20.482+00
8b1fea33-a304-4996-83cc-48b5353c21b0	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT72M"}	2025-05-21 14:49:20.474+00
69f47b76-bbb4-432b-a33b-fed6316dcbc8	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-05-21 14:50:20.474+00
ac52aab8-b028-44d1-a7f1-891dd0be77ef	d3a9d109-d5de-5372-aaa6-2b4039cedb96	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT89M"}	2025-05-21 15:32:20.482+00
250e3af1-1fb9-4ac7-9ad5-7039d4e58f72	d3a9d109-d5de-5372-aaa6-2b4039cedb96	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-05-21 15:33:20.482+00
966aa3be-76a5-4424-87e5-12a2573bee3c	d3a9d109-d5de-5372-aaa6-2b4039cedb96	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-21 15:41:20.482+00
cae737fb-cce6-403b-a840-7d796b931510	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-21 16:25:24.946+00
93fe614f-5466-4213-9ae5-ca0960164289	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-21 16:30:24.946+00
15ce3d9b-ce5b-40ed-a058-de100e713555	2457fc99-9240-5207-8740-05d01be3946e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-21 16:46:20.481+00
01e144de-4347-4280-9913-2f81a45b6d32	2457fc99-9240-5207-8740-05d01be3946e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT92M"}	2025-05-21 18:18:20.481+00
38f6e652-a364-492f-b645-ec8886afe5a4	2457fc99-9240-5207-8740-05d01be3946e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.2}}	2025-05-21 18:19:20.481+00
113b294b-7b80-41cb-a1c7-ead3f522ef42	2457fc99-9240-5207-8740-05d01be3946e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-21 18:27:20.481+00
b84af257-8d22-4fbf-ad0f-3493baee8b10	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT170M"}	2025-05-21 19:20:24.946+00
1a80a046-5147-4847-b2af-dd4c3f14b6c8	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 27, "scaled": 0.27}}	2025-05-21 19:21:24.946+00
5d7fe9d8-21a2-4952-9cde-76ebac7e8ded	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-21 19:25:24.946+00
a139b15b-37d9-4c20-a33b-13da7d957fac	1e379c7d-80fd-5fe3-a839-c46b91d223c8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-22 13:58:20.491+00
78f607c6-f0a9-4cb5-b301-f6f1d7d0e4ce	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-22 14:00:20.467+00
23a60407-c774-4695-81ba-af5fe963bede	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-22 14:04:20.483+00
7bbe0461-2143-43ba-a2f8-12591559299e	1e379c7d-80fd-5fe3-a839-c46b91d223c8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-22 14:07:20.491+00
47bd823e-7322-4ad3-b72e-7ce0f01c1cbd	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-22 14:08:20.483+00
382e6ad2-b43f-4fff-900d-9ef5c50c3e22	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT39M"}	2025-05-22 14:39:20.467+00
987b6148-909a-4e19-984c-3f0d0404085c	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-05-22 14:40:20.467+00
ed3eefe5-97a0-4931-bac0-855d96f173bf	1e379c7d-80fd-5fe3-a839-c46b91d223c8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT45M"}	2025-05-22 14:43:20.491+00
a489fc7a-9397-470f-b065-c02537879269	1e379c7d-80fd-5fe3-a839-c46b91d223c8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-05-22 14:44:20.491+00
6b8456eb-b25b-48a7-a962-bae276d0e9f7	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT77M"}	2025-05-22 15:25:20.483+00
6500c0ea-57df-42b8-9e33-d5bfff1c116e	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-05-22 15:26:20.483+00
72bcf692-c83e-4f83-94b4-8277fde1a52b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-22 15:34:20.483+00
f65f6e81-a205-4efb-85fa-62c48594a081	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-22 18:01:20.474+00
0a8cd475-95a6-47cc-a922-8e5123c2e92d	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT93M"}	2025-05-22 19:34:20.474+00
6e53ec1d-2fb1-4391-8623-fe0d470cea33	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 12, "scaled": 0.12}}	2025-05-22 19:35:20.474+00
0ddae096-2641-45ff-a7e3-05a69c3e20bc	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-22 19:38:20.474+00
a9586d12-dc9f-4e60-9077-ff0b98987a32	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.5823383925283999}}	2025-05-22 23:35:20.474+00
82d89bad-b2d0-4180-81af-ad6df3f5b983	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.5823383925283999}}	2025-05-22 23:36:20.474+00
69091cda-f9ff-42c4-8749-cc8090b122a8	eafc92a4-9ff9-508b-950a-1837164b2bcd	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42}}	2025-05-22 23:37:20.474+00
3d537a7c-e2c7-42c6-b30c-ed6c7be204cc	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-23 12:39:20.477+00
67898f1a-0469-4e44-af2a-9809e3f980cc	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT81M"}	2025-05-23 14:00:20.477+00
dedcb39c-e641-4330-9da3-b2e3ee14107f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.69}}	2025-05-23 14:01:20.477+00
537efe35-5fd1-464d-bfba-d145ff37ae72	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-23 15:26:34.742+00
2ec0c2f2-68cc-4fb4-80d6-c45228bf70ec	d3a9d109-d5de-5372-aaa6-2b4039cedb96	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-23 15:35:20.482+00
25d23c34-6b31-431b-b62e-ba1642f2613f	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-23 15:59:20.47+00
55fc0025-c1f2-4a2d-8666-35d13f3fe748	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-23 16:14:04.692+00
8da642a4-b900-425b-baa6-68c642733495	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-23 16:17:04.692+00
a78c6a7b-edaa-4577-a344-0148b547d3a9	2457fc99-9240-5207-8740-05d01be3946e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-23 16:33:20.481+00
ea1d9f7d-49ac-4ddc-9c00-7183f45322c2	1e379c7d-80fd-5fe3-a839-c46b91d223c8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-23 16:56:20.491+00
5b29d2fa-35bd-4807-932f-bc1dfdd6080b	1e379c7d-80fd-5fe3-a839-c46b91d223c8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-23 17:06:20.491+00
4d64c1c6-daf5-4d79-8829-174e6ba9be14	1e379c7d-80fd-5fe3-a839-c46b91d223c8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-23 17:14:20.491+00
af02469b-34f8-4f0b-a4fe-cd2cddfc7acd	d3a9d109-d5de-5372-aaa6-2b4039cedb96	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT101M"}	2025-05-23 17:16:20.482+00
2a3ecae2-4b1c-485f-a170-4270ad5a32bb	d3a9d109-d5de-5372-aaa6-2b4039cedb96	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-05-23 17:17:20.482+00
2393fb72-c9a7-4c6d-82e4-1409dda7b34e	d3a9d109-d5de-5372-aaa6-2b4039cedb96	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-23 17:23:20.482+00
a73703ba-6b66-4405-860f-bfe652072096	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT129M"}	2025-05-23 17:35:34.742+00
2d604320-d7f3-4516-8f2c-f0b6fbd9d995	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 83, "scaled": 0.83}}	2025-05-23 17:36:34.742+00
33c91953-a0ae-452f-9a6b-106ee5b314ea	1e379c7d-80fd-5fe3-a839-c46b91d223c8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT41M"}	2025-05-23 17:37:20.491+00
189f345d-2de1-49f0-9c2d-d1a84c0327c4	1e379c7d-80fd-5fe3-a839-c46b91d223c8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-05-23 17:38:20.491+00
de9dfaf0-ce51-492d-8f18-c22cfc5b5494	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-23 17:42:34.742+00
eb168499-dd5c-434b-8f98-dd1c230fe2ae	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT103M"}	2025-05-23 18:00:04.692+00
0d690962-90ef-4af4-9451-954a167f576b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.88}}	2025-05-23 18:01:04.692+00
9fc5db65-d06d-45fd-a68c-70e2a86a7e3f	2457fc99-9240-5207-8740-05d01be3946e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT89M"}	2025-05-23 18:02:20.481+00
6a5dad7c-8220-4ee7-8a84-134d0991895b	2457fc99-9240-5207-8740-05d01be3946e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-05-23 18:03:20.481+00
4bf511f3-bd1c-46b2-a988-fc34ce55b28b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-23 18:04:04.692+00
a4366a25-446a-4e1e-bb5c-9540afbd0f9b	2457fc99-9240-5207-8740-05d01be3946e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-23 18:07:20.481+00
72c45168-c2b2-4491-9b1c-797aa7c51dfb	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-23 18:09:20.467+00
43f8f8d7-ad9a-4b96-b3d7-c93525bbc195	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-23 18:13:20.467+00
612803e0-c8d1-4352-aecb-9988db36b04f	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT35M"}	2025-05-23 18:48:20.467+00
2883c122-2183-4102-a57a-d14f015b7aa3	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-05-23 18:49:20.467+00
9dfec2de-bec3-41a8-bc10-07652c28c8b9	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT209M"}	2025-05-23 19:28:20.47+00
07ed86fe-6159-4003-97d3-5408d9081dae	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.2}}	2025-05-23 19:29:20.47+00
a590feaa-8907-4cd5-b181-7e18274401c8	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-23 19:30:20.47+00
da9c3190-4405-4d9e-9fbd-6c4b8224c4c5	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5616209063728423}}	2025-05-23 21:11:20.47+00
462d2175-4644-4cc4-9fd9-1406297f0581	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5616209063728423}}	2025-05-23 21:12:20.47+00
bc23a612-ad14-4201-965a-b14b594ff7f2	a39e581a-a948-5af5-ad61-b2b0030fb824	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 73, "scaled": 0.73}}	2025-05-23 21:13:20.47+00
3601a588-d8c6-488f-add6-c25ade517273	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-24 11:53:20.474+00
25de51e6-e150-4e06-b371-553cb31e5e84	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT91M"}	2025-05-24 13:24:20.474+00
038c3c0f-1b47-45f5-8072-6a79d4864785	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 12, "scaled": 0.12}}	2025-05-24 13:25:20.474+00
ab7a9012-1dee-4fa5-8fe1-02b169bb5010	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-24 13:29:20.474+00
26d3d8b6-40c6-4ada-ada6-1236f3050ca1	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-24 16:47:20.477+00
fafdef9a-8084-439e-84f9-5ba5b4abbe20	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-24 16:52:20.467+00
9ff9fc13-289f-4c42-b572-af4fe23cd2e8	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-24 17:27:12.41+00
941b7949-63c6-4f9c-9b8c-db4902e2f92a	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT37M"}	2025-05-24 17:29:20.467+00
43bcf360-3d50-49b4-847b-702ed2c03ce9	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 3, "scaled": 0.03}}	2025-05-24 17:30:20.467+00
bda2c487-85c8-45dd-84e4-c7431de9c6d0	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-05-24 17:35:20.467+00
f8badbb2-6396-4edc-8ff8-4d29538a3bd6	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT69M"}	2025-05-24 17:56:20.477+00
59a0e219-6755-4c59-b2bb-0b12557a9d5e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 2, "scaled": 0.02}}	2025-05-24 17:57:20.477+00
d30b2b07-df98-4a59-bf7d-d2a76e28a2f7	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-24 17:59:20.481+00
caeda8fc-1969-4837-b394-2ea6b770592c	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-24 18:04:20.477+00
93ebb220-1d72-4029-ad06-40656fc877e0	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-05-24 18:14:12.41+00
ca344498-558b-4015-9291-f4fe27e4e751	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 4, "scaled": 0.04}}	2025-05-24 18:15:12.41+00
cda785e6-3cf7-4f19-81d2-23516d43fcd1	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-25 11:41:38.896+00
3050b1b5-3994-4b34-9f8d-c22de642918a	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-25 11:43:38.896+00
78ba0d8b-992e-4dbc-90b4-9c372358ce79	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-25 12:30:20.477+00
c54f4010-b33a-43b0-94bd-c2d5e422717a	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT60M"}	2025-05-25 12:43:38.896+00
7280f2a0-fee2-4f13-a0b2-4a68a4fa1717	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-05-25 12:44:38.896+00
62479f7a-1f3d-4431-86f5-088b21645d52	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT53M"}	2025-05-25 13:23:20.477+00
000cd645-68ec-4211-8523-488746689285	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-05-25 13:24:20.477+00
edd8e537-8139-4404-ba28-5aee94b28393	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-25 13:27:20.477+00
d27beb34-b542-44ef-b0b1-b0987682f87a	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-25 13:34:20.474+00
4bd2e4f9-5c4b-4a5c-98bc-8cf80b82b784	d3a9d109-d5de-5372-aaa6-2b4039cedb96	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-25 13:50:20.482+00
9dea384d-327a-4574-b764-9296b92aa1e8	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT80M"}	2025-05-25 14:54:20.474+00
03cd023a-cd6d-4f44-ab66-7fd4a0cb6759	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 7, "scaled": 0.07}}	2025-05-25 14:55:20.474+00
17f5b6ff-eca6-4348-b3f7-45cfa211667e	d3a9d109-d5de-5372-aaa6-2b4039cedb96	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT103M"}	2025-05-25 15:33:20.482+00
dacc46cc-bc71-414f-92af-0890b589e3f0	d3a9d109-d5de-5372-aaa6-2b4039cedb96	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.88}}	2025-05-25 15:34:20.482+00
bfb11fff-0ce6-4779-912b-abd79b16e343	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-25 15:37:20.481+00
5ff7a434-36ee-487c-98f4-20e985cb8024	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-25 16:30:20.467+00
7059d1d1-9923-41cb-8951-1e8ad69cbe2e	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-25 16:32:20.467+00
b0e599ce-b91f-43e9-b2cb-571acc0468e5	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT35M"}	2025-05-25 17:07:20.467+00
ad0e2062-2bfd-4d3a-ac8e-a103f28b7be3	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-05-25 17:08:20.467+00
c6bf3634-e4a4-4c81-828f-c2a1e20c420d	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT133M"}	2025-05-25 17:50:20.481+00
2e5e9445-4229-47bc-9f68-86db7abefa44	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 4, "scaled": 0.04}}	2025-05-25 17:51:20.481+00
b65e0c32-24d3-421b-b806-454e42c96247	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-25 17:55:20.481+00
7ab00d16-a565-4b07-aa0a-25c469322a8d	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.875549880363466}}	2025-05-25 19:16:20.467+00
aeed87c2-a2ce-485a-a213-50337ae3398c	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.875549880363466}}	2025-05-25 19:17:20.467+00
28645ce7-1b58-4a68-a302-e70647e7dbcf	65861570-f509-5228-a69f-731f35318a06	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-05-25 19:18:20.467+00
cfb1216f-c7a2-4bc4-b569-1011d3533b8d	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-26 12:14:20.477+00
0a1bcb8d-9d21-430b-9a46-c0c04f77d179	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT113M"}	2025-05-26 14:07:20.477+00
8a2c408b-ba78-45c6-b2e0-0a368cafe261	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 95, "scaled": 0.95}}	2025-05-26 14:08:20.477+00
4754908a-11b8-46a9-a3a1-e4c568ff17e8	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-26 14:13:20.474+00
80bcbb07-dd1d-47bc-a0a4-b959e037d777	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-26 14:15:20.474+00
5505a2d4-3fd6-458e-b113-f537c4c1f3a1	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-26 14:26:26.969+00
e543eed6-0bf2-4e31-9a8b-3c6eda9b619d	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-26 14:30:26.969+00
5f5e5ce0-8848-4bc3-abc4-22844a8e18d8	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT82M"}	2025-05-26 15:37:20.474+00
f0da8460-aaea-4611-bec5-039ef3a12ce5	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.86}}	2025-05-26 15:38:20.474+00
b9216fa7-21e2-4c97-945f-b0f8eeb86c98	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-26 15:40:20.47+00
03ffeaeb-37d3-4d9e-8a4b-8e3dc3e10f67	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT108M"}	2025-05-26 16:18:26.969+00
a5d67d68-78a3-4681-a479-5ee941f2f119	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-05-26 16:19:26.969+00
bb9c7cbc-e9b3-400d-b0e4-c2841f7347e5	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-26 16:23:26.969+00
dfa3d039-5f99-49e8-b39c-44dd8ebaf17a	1e379c7d-80fd-5fe3-a839-c46b91d223c8	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-26 17:26:20.491+00
da723e22-232d-4173-8c13-781b15066f31	1e379c7d-80fd-5fe3-a839-c46b91d223c8	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-26 17:33:20.491+00
8b0f8ea7-e6da-47fb-ab34-ce11419da657	1e379c7d-80fd-5fe3-a839-c46b91d223c8	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT20M"}	2025-05-26 17:46:20.491+00
e9ce4cf1-a27c-4e53-b7b8-ff5b54e4ec54	1e379c7d-80fd-5fe3-a839-c46b91d223c8	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 21, "scaled": 0.21}}	2025-05-26 17:47:20.491+00
83ea5d0e-c8f7-4248-9e4c-b56f1760dcf3	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT169M"}	2025-05-26 18:29:20.47+00
6a45b01f-8374-4943-b69a-6f6f870d0959	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 4, "scaled": 0.04}}	2025-05-26 18:30:20.47+00
6e1a7e4f-6583-470c-be4d-6707fdb8bad0	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.4499229349725645}}	2025-05-26 18:41:20.474+00
a3dee006-cf79-45c5-8bf0-cf981f3ece31	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.4499229349725645}}	2025-05-26 18:42:20.474+00
fdccc465-3307-4256-bd0a-b454c5ec5407	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 7, "scaled": 0.07}}	2025-05-26 18:43:20.474+00
4213d1fb-f929-42c8-8baa-e0d6b31341a0	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-27 10:28:09.423+00
899a3ac6-4f2e-49f0-81b2-effe6b04fa1b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT61M"}	2025-05-27 11:29:09.423+00
d64fe703-493c-4e41-af36-f8719120b6c3	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-05-27 11:30:09.423+00
6e63400b-ead0-43ee-907d-71c5f7baaf24	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-27 11:34:09.423+00
e678eb8c-85b1-4b50-94fa-eef97c3bb80b	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-27 14:15:20.467+00
b4898140-4c4c-48fb-bf58-9f5d54fed562	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-27 14:23:44.281+00
370e1384-fe0a-40ad-b959-1daec641a3a3	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-27 14:25:44.281+00
8585ab04-c3ad-42e2-a9f3-0868c5fbbdd5	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT33M"}	2025-05-27 14:48:20.467+00
21585265-2a39-49f9-9cea-1b9d812f30aa	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72}}	2025-05-27 14:49:20.467+00
9f5a0b9c-030d-4fa6-9dfe-e41e20c5f738	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT96M"}	2025-05-27 16:01:44.281+00
f627c2c9-4d13-4a9b-b766-70555ef85a60	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-05-27 16:02:44.281+00
8b7b0f53-0cbe-456d-9f86-abe7916a4c62	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-27 16:07:44.281+00
7d73fef8-ec40-4f4f-9193-20bbaaa626aa	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-27 16:30:20.47+00
1311b0d6-59f7-47fa-94ab-3fcb61e0a302	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-27 16:32:20.47+00
6e89c2b5-0963-42af-96c3-79db93c4b1e9	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-27 17:29:20.474+00
e0f67b69-1bb9-418e-88da-3d2c792089a9	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT88M"}	2025-05-27 18:57:20.474+00
da1918cd-92a6-45c0-8805-41fe110f9315	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-05-27 18:58:20.474+00
fae7a281-6748-4122-afea-364320e53b93	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT150M"}	2025-05-27 19:02:20.47+00
0227cdf9-fdf0-4e6d-b939-fad151e7e1c9	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-05-27 19:03:20.47+00
d4bbc85c-4796-429b-80af-d36ec60e2245	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.6513180220677142}}	2025-05-27 20:37:20.474+00
eae31c43-f5f2-4148-9baa-90f6baf42218	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.6513180220677142}}	2025-05-27 20:38:20.474+00
794c2c8a-afc6-4a97-815b-bad8ca7d90a8	eafc92a4-9ff9-508b-950a-1837164b2bcd	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-05-27 20:39:20.474+00
95e252af-5687-4777-91dc-e999aa51beac	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-28 12:16:06.722+00
869d0982-159d-4ac9-97ea-63239760be15	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-28 12:18:06.722+00
2079e5c3-403b-4093-9dd8-c306357c7f9e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-28 12:53:20.477+00
396ac24b-6030-49a4-808b-e1b3fd85446f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT45M"}	2025-05-28 13:38:20.477+00
2e0dd8d0-5041-40c2-aba7-e45b1fae6eb2	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 96, "scaled": 0.96}}	2025-05-28 13:39:20.477+00
bdf9c9e9-8219-492e-873f-d30f0d07aec3	d3a9d109-d5de-5372-aaa6-2b4039cedb96	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-28 14:04:20.482+00
6142334d-86a7-4f2a-b460-05fbae7ca474	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT153M"}	2025-05-28 14:51:06.722+00
48f0ac4b-c017-4029-b5e7-3c79fcf5b693	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-05-28 14:52:06.722+00
48e1ad1c-dd70-4022-a587-dbebe70cc2a7	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-28 14:55:06.722+00
8b3eb8e6-4006-40f2-9393-3df8c97bf517	d3a9d109-d5de-5372-aaa6-2b4039cedb96	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT75M"}	2025-05-28 15:19:20.482+00
163505c9-fd80-4bc6-a33f-418ba9c1e004	d3a9d109-d5de-5372-aaa6-2b4039cedb96	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41}}	2025-05-28 15:20:20.482+00
5e9ff777-41ab-439a-ad3d-68f4a06d103e	d3a9d109-d5de-5372-aaa6-2b4039cedb96	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-28 15:22:20.482+00
47343ac4-8cf9-452c-ad6e-c8f6804f0fc8	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-28 16:50:20.467+00
12e2a7ba-deb5-4bc3-8590-77a78cfe0929	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-28 16:52:20.467+00
5314b7b5-3609-4df0-89e2-22ba827195c6	1e379c7d-80fd-5fe3-a839-c46b91d223c8	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-28 17:33:20.491+00
2059e1f2-0e33-4e92-b473-488c1959cb9c	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT44M"}	2025-05-28 17:36:20.467+00
54f76a87-10a2-4ce2-9107-ffc6ee890d17	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-05-28 17:37:20.467+00
b8b061d8-f48c-4cab-972c-8266ce583b5b	1e379c7d-80fd-5fe3-a839-c46b91d223c8	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-28 17:43:20.491+00
c3cf41e4-5d4e-44ff-8224-0e906a20e084	1e379c7d-80fd-5fe3-a839-c46b91d223c8	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-28 17:51:20.491+00
78b5d437-6d03-4bcf-b275-6319900ba1e5	1e379c7d-80fd-5fe3-a839-c46b91d223c8	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT36M"}	2025-05-28 18:09:20.491+00
aefd77c8-e2ea-41e6-ac84-144620cd77a2	1e379c7d-80fd-5fe3-a839-c46b91d223c8	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 17, "scaled": 0.17}}	2025-05-28 18:10:20.491+00
3b0df01a-0ec0-4ac5-8c63-caf1116ca17b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-29 09:25:59.593+00
431e7ad4-69a5-498c-b88f-a0928204d605	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-29 09:29:59.593+00
62521e13-adc3-443b-abba-afaa22eb63b3	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-29 10:12:20.474+00
46b5469b-293c-4962-ba75-149ffa80a8fc	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT51M"}	2025-05-29 10:20:59.593+00
22c2b983-34f3-4624-83ad-fbce7526f89f	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-05-29 10:21:59.593+00
ca78cf1a-3262-41de-9eda-f36d6ffa9a2c	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-29 10:30:59.593+00
fb062f90-adf4-477c-a6a9-e581d92a3bd5	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT75M"}	2025-05-29 11:27:20.474+00
65128dba-7e10-4090-b317-a90458499ab8	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 26, "scaled": 0.26}}	2025-05-29 11:28:20.474+00
447665c1-707a-4e31-a2fc-8f568e1fb524	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-29 11:29:20.474+00
4bcd5b6d-c0eb-42a3-9f8a-4b81ba1f7a65	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-29 11:37:20.477+00
6435a8f1-024c-4e78-a8ca-194d624ade48	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-29 15:44:20.47+00
e6b584cb-1ebc-421b-9fe0-42b4a589d666	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-29 16:48:54.426+00
ad2c2a68-c8ee-4591-a1c6-fd41c9453fd7	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-29 16:50:54.426+00
114d0752-0d19-44b4-9bb7-58199e72d133	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-29 17:15:20.467+00
1e6bcd29-8eb2-4136-b38f-98ac6e163096	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-29 17:20:20.467+00
888b61d5-ff99-4ebb-a2f8-f236dd824f8d	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-29 17:28:20.481+00
ca5a4ce8-55a7-4ba4-a29e-280b11862405	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT49M"}	2025-05-29 18:09:20.467+00
512b3d08-9028-4aa1-9cf9-460ffd8ec7dd	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 5, "scaled": 0.05}}	2025-05-29 18:10:20.467+00
26a69a44-daa6-4d92-8976-cf14791f6624	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.2964131712287903}}	2025-05-29 18:22:20.481+00
0ae81ab0-e725-4226-b8e2-4dcf7981e74c	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.2964131712287903}}	2025-05-29 18:23:20.481+00
1112b30f-7a53-4574-bab7-9013368ce58a	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 95, "scaled": 0.95}}	2025-05-29 18:24:20.481+00
cbc4791e-ae66-486b-af02-ee3e294f3beb	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT97M"}	2025-05-29 18:27:54.426+00
4209ba80-c48f-4964-95cc-97554983a37a	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24}}	2025-05-29 18:28:54.426+00
20dec7d8-63ab-48ab-910c-536683334cbe	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-29 18:32:54.426+00
d38becbe-991c-4840-9bfd-b88a137875e2	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT171M"}	2025-05-29 18:35:20.47+00
92747d6e-7382-4927-b966-24dad9a8796a	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72}}	2025-05-29 18:36:20.47+00
40bbfdfe-2fe4-4c3f-93a0-2e41d5fc6382	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-30 12:14:20.474+00
b5e739ef-4cac-402e-9dd1-6923cbbf3dce	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT87M"}	2025-05-30 13:41:20.474+00
d8dbe693-b0b2-4a5f-b0d5-06493de7e3eb	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 8, "scaled": 0.08}}	2025-05-30 13:42:20.474+00
20f6bba2-8a29-4f7d-ae76-9d034df11f70	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-30 14:10:04.299+00
e9b56a0b-1cb0-4a3b-b33b-f74a45fb6a6d	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-30 14:12:04.299+00
eb89759a-d02c-4adc-b14c-ffc7bee0fc12	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-30 15:41:20.477+00
7af8643a-2976-4dcc-96b7-4e5ee783089d	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT91M"}	2025-05-30 15:43:04.299+00
7f5532e8-c499-4e85-825b-9f4a136888fd	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-05-30 15:44:04.299+00
9d87337c-1384-4ef9-8602-6f19fcd508aa	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-30 15:45:20.467+00
73e50a3c-d804-4e84-82b1-bea3867c51bd	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-30 15:47:04.299+00
37b9e023-95a1-4001-aec9-5452affda1f9	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT48M"}	2025-05-30 16:33:20.467+00
168c40c4-85be-4ed2-8acf-d69d277dd5e2	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.29}}	2025-05-30 16:34:20.467+00
429e34c0-a31b-4511-b2c7-af36dd31e5b3	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-30 18:29:25.152+00
56c12b58-08c4-4f85-90cc-0d6003d29c67	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-30 18:32:25.152+00
f4a7a8bf-05e2-4500-84c6-a52c8ef46a88	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT100M"}	2025-05-30 20:12:25.152+00
63cd2b43-7fb3-4884-a314-b1326cc66e31	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-05-30 20:13:25.152+00
cea869a8-3f0f-479d-a078-2bcd9182c043	2457fc99-9240-5207-8740-05d01be3946e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-30 20:21:20.481+00
340acbd9-379a-4b57-ac3b-eb7c1ce25554	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-30 20:21:25.152+00
6a13feaf-ace4-42b3-a9ec-1d2e12dccda4	2457fc99-9240-5207-8740-05d01be3946e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT101M"}	2025-05-30 22:02:20.481+00
23d1967b-2186-4918-8201-6c666e3c1b0c	2457fc99-9240-5207-8740-05d01be3946e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43}}	2025-05-30 22:03:20.481+00
0bbbec59-bef1-4558-896c-3c2b39f00950	2457fc99-9240-5207-8740-05d01be3946e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-30 22:12:20.481+00
24b1c087-a522-4449-ab0b-1117498188fb	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-31 12:01:27.576+00
4b6fc777-a2bc-43a4-a2ef-39af068595d9	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-31 12:03:27.576+00
90d512ca-5a91-4025-9030-d41ecaa9c6f6	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-31 14:05:20.47+00
e874d019-1c74-4cb5-9c61-f5e18bbd334d	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-31 14:08:20.467+00
e2bcf196-cd37-455e-8e17-ec023cd481ee	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-31 14:11:20.467+00
afd0aa6b-78c2-49cd-adf6-e8ce77eeb810	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT153M"}	2025-05-31 14:36:27.576+00
c162836e-74fd-4301-96e5-d3729dda5bf1	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.88}}	2025-05-31 14:37:27.576+00
9e75d823-67fd-4148-b6f2-e95f75f00197	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-31 14:43:27.576+00
f2e990e6-7740-4149-9c1a-59ec6055d1df	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT42M"}	2025-05-31 14:53:20.467+00
4be62744-6e1d-4bbe-9c67-d5bd02d2f401	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-05-31 14:54:20.467+00
a0b12af5-3b50-49a9-b87c-5037b5c54fb9	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-31 14:57:20.467+00
162bc1c7-cff4-443c-ac92-b7a05517e098	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-31 15:28:20.474+00
9640c601-431e-4512-8ed1-e7afe3e74cf9	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-31 15:30:20.474+00
fefaf9e1-00c0-423d-ab8e-18c1bde042da	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-31 16:21:20.477+00
9066dde3-f934-4fd5-a538-64ab5e01c5e8	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT87M"}	2025-05-31 16:57:20.474+00
b279a0ff-eaf8-4ab3-87f9-6ae386cddde8	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-06 14:20:20.467+00
dcad16f2-6e2b-4075-923a-657ebdb7131a	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-05-31 16:58:20.474+00
43e5b67e-274c-45d4-8d9d-dd9e9fd8da39	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-31 17:02:20.474+00
b8660469-2b1c-4b0b-8c03-54a6c3dd6325	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT192M"}	2025-05-31 17:17:20.47+00
d0d3a767-9447-48ab-ba6e-106f1da3d36a	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-05-31 17:18:20.47+00
4df187e5-a1ca-4618-80ca-736e111fae3e	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.8447688222109642}}	2025-05-31 17:37:20.467+00
cdda836b-b811-4839-bd9b-8388f4cf00c8	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.8447688222109642}}	2025-05-31 17:38:20.467+00
8c8fa00d-410f-4c02-8d50-790d401c7ae2	65861570-f509-5228-a69f-731f35318a06	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.89}}	2025-05-31 17:39:20.467+00
d5239335-f60c-4ce5-93ac-4ffb4c7f581d	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT103M"}	2025-05-31 18:04:20.477+00
055d4611-b835-4e42-b582-b3b264a8a959	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56}}	2025-05-31 18:05:20.477+00
5404aac7-87b6-4c08-8949-923876ad1fa5	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-31 18:13:20.477+00
28f78b25-3d62-4edf-b5a9-e3476b1f6587	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-31 20:33:20.481+00
a0d83731-4743-41e6-8776-623c44f6fbf6	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.6602733470532824}}	2025-05-31 21:12:20.47+00
4315c153-4888-479c-bc80-64d72674dabe	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.6602733470532824}}	2025-05-31 21:13:20.47+00
3f36d274-c95d-4a74-be2d-4728a83e3869	a39e581a-a948-5af5-ad61-b2b0030fb824	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 19, "scaled": 0.19}}	2025-05-31 21:14:20.47+00
2d3210f2-8c25-41f9-84b3-e1806cb7b8da	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT54M"}	2025-05-31 21:27:20.481+00
5ebf3f2b-e3bc-46d6-b7f7-d05dd17dbfe4	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 12, "scaled": 0.12}}	2025-05-31 21:28:20.481+00
f9d29d3e-0d77-4493-b378-1bb240eb13dc	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-01 12:23:52.252+00
a17ff3c7-c7ba-4125-94d6-1de870d1f93a	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-01 12:28:52.252+00
aa3b8303-8e1f-4098-aa86-a72f595d10fb	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-01 13:08:09.445+00
a0dbb66a-cd0f-4026-9b46-74732b8426d3	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-01 13:10:09.445+00
9a6f1f6b-cc44-401f-b6d6-aec1718f5444	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT99M"}	2025-06-01 14:07:52.252+00
20c78909-c0df-4d91-af38-1b0e2b0986a2	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-06-01 14:08:52.252+00
eed66199-84f3-432e-a027-ab7e7cf332d4	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-01 14:14:52.252+00
cf9ffe1a-59f9-4603-9c88-9a3135f23fc0	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-01 14:17:20.477+00
ace9b394-823e-4156-9159-d57a746e53c9	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT80M"}	2025-06-01 14:30:09.445+00
54a65ad5-c571-471f-8490-a0a2e44de495	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.51}}	2025-06-01 14:31:09.445+00
a220b40d-4193-4c68-a21e-d6dee6b95239	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-01 14:35:09.445+00
f31f6d72-b70e-4a87-9630-6f9b8a98e6b2	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT79M"}	2025-06-01 15:36:20.477+00
0de817c8-6ab7-4906-89c2-e47ab4a94f29	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.29}}	2025-06-01 15:37:20.477+00
346a214b-db59-4d34-bf2b-935697d0bbd7	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-01 15:56:33.64+00
7a88e025-bddc-4466-b8c7-111602aa8360	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-01 17:59:20.474+00
49df9b2a-ce46-46ef-a584-48f336427a44	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-01 18:04:20.474+00
1a0c7ab3-7d47-465d-a765-e1223d537903	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT136M"}	2025-06-01 18:12:33.64+00
dd1ff4df-015b-4674-8ec3-bc3e3b567913	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 94, "scaled": 0.94}}	2025-06-01 18:13:33.64+00
a9cc1f19-1aa3-476e-ac0e-d9c42879e467	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT93M"}	2025-06-01 19:37:20.474+00
02b6c362-5aad-4940-955d-5b1a8fc42383	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 3, "scaled": 0.03}}	2025-06-01 19:38:20.474+00
b0c561f1-9fbf-45f9-9bd4-c9d81fc48d73	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 98, "scaled": 0.9857623172598837}}	2025-06-01 23:35:20.474+00
891becec-78b1-45a3-8cad-b3851b1b7ac4	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 98, "scaled": 0.9857623172598837}}	2025-06-01 23:36:20.474+00
4f409202-5a08-4b47-94fd-3f62bbd6aa1f	eafc92a4-9ff9-508b-950a-1837164b2bcd	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-06-01 23:37:20.474+00
9468cfda-cffb-4b77-8cf7-9fa46e309230	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-02 11:05:20.477+00
01a01efe-38e9-4664-9f6d-aff54e2d18fb	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT75M"}	2025-06-02 12:20:20.477+00
75d45f3b-625a-4618-895b-3494941082c1	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-06-02 12:21:20.477+00
5a6d3294-9536-4aea-8efe-9dbf234593bd	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-02 12:26:20.477+00
bcc91a28-b55e-4443-b380-097db1931dac	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-02 14:47:20.467+00
edbdb0c7-b930-42bb-847b-398d93d3d1d5	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT41M"}	2025-06-02 15:28:20.467+00
49b289af-1536-41fc-8ff3-848837674729	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.51}}	2025-06-02 15:29:20.467+00
6f7b49d3-4d5e-4603-90a0-b0eec90c6def	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-02 19:06:07.406+00
b4d3a13a-94ac-478e-b89a-154da1aec512	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-02 19:09:07.406+00
8364d222-aab2-4562-bda3-e7c410bb26a0	2457fc99-9240-5207-8740-05d01be3946e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-02 19:24:20.481+00
71823896-e9e0-47a6-b169-ba35f8965c31	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT55M"}	2025-06-02 20:04:07.406+00
1cb01479-5597-4db2-8c51-c0721ed42027	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-06-02 20:05:07.406+00
7b04fc37-7e98-470a-81b6-f916e4317d5e	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-02 20:14:07.406+00
84edff13-1e7b-4fea-a322-fa859be4c345	2457fc99-9240-5207-8740-05d01be3946e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT100M"}	2025-06-02 21:04:20.481+00
eded173e-f97d-446b-8efe-fbe27e1f2232	2457fc99-9240-5207-8740-05d01be3946e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-06-02 21:05:20.481+00
23c2b0ff-7f08-4043-87e8-f4a2c5d0ba14	2457fc99-9240-5207-8740-05d01be3946e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-02 21:12:20.481+00
e9fdb9d0-a525-4f28-9b6c-bf53ad762a35	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-03 11:08:20.477+00
130796f2-0e30-438e-9556-5e48e8c0acc5	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT99M"}	2025-06-03 12:47:20.477+00
62eeaa4a-dcf7-4fc4-a2d2-35d0f3afcd68	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.32}}	2025-06-03 12:48:20.477+00
6e7567e7-e7a2-4ab8-b4e4-befbfaf8755b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-03 12:50:20.477+00
67271551-4eed-4fba-9f6e-3fb10696cf18	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-03 14:04:20.467+00
6a263f06-6940-4225-895a-0a642fa890e1	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-03 14:07:20.467+00
ceaae568-85c0-403c-b604-9938c479a492	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT40M"}	2025-06-03 14:47:20.467+00
cccad852-53d1-48b7-926c-587e84e8d074	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-06-03 14:48:20.467+00
898c0f67-af8f-42af-aa4b-0cba2843c22b	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-03 14:52:07.18+00
5a9d0d2e-e813-47b7-9c99-289bf26ffb33	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-03 14:52:20.467+00
6e44479c-462f-4e27-837a-11fec79fe5ac	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-03 14:56:07.18+00
bfa24949-e5d1-44e6-8435-c42f37352f65	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-03 15:09:20.474+00
cef12ba8-2073-473b-8523-d57a53d15874	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-03 15:12:20.474+00
f7e64bb6-4feb-4e5a-a1ad-19d108369bb5	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT73M"}	2025-06-03 16:25:20.474+00
a868a32a-3802-478b-9520-59572568728b	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39}}	2025-06-03 16:26:20.474+00
f48215d5-8c88-4207-9653-f2bb7d9c9c0e	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT103M"}	2025-06-03 16:39:07.18+00
78950ada-4d1e-475e-8f8a-60bde76f8ec2	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-06-03 16:40:07.18+00
b930bb78-caaa-469a-976c-97362c93f22c	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-03 16:44:07.18+00
6e181ab3-acbb-422b-94ae-37ece5464064	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-03 17:00:07.18+00
cc761014-079e-41e8-a776-fde6f732d632	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-03 17:01:07.18+00
7623f0de-430f-45a1-b269-7add5cb4323d	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 91, "scaled": 0.91}}	2025-06-03 17:02:07.18+00
02674374-db24-4521-9d74-4e21be05fff6	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-06-03 17:03:07.18+00
d3396cdd-e03e-4777-9df6-c4001e84372b	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-03 19:08:20.481+00
ca5d1877-3647-48f0-adc4-0b3092d2ae4c	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-04 09:39:23.691+00
4aaf6558-3952-447b-9276-8be6e901298e	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-04 09:42:23.691+00
e28ef3c8-a725-4ae3-8d1f-3fb2dc9ff744	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT104M"}	2025-06-04 11:26:23.691+00
d7f0479a-9cf1-44ee-bb1c-1b9d5586ab7b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 19, "scaled": 0.19}}	2025-06-04 11:27:23.691+00
11d1f87d-5497-4a6f-8a3e-f96856c90a95	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-04 11:32:23.691+00
4a87c792-d067-479f-9d78-e1e549c504f3	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-04 12:14:27.795+00
006f1e8b-051f-4a8b-a261-1470cd73234a	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-04 12:16:27.795+00
d622f648-0189-4492-abb8-3b3e4341b015	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-04 13:36:20.474+00
1719cbec-2833-4b3a-9e45-5d52031ebb23	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-04 13:38:20.474+00
d13ede74-f3ee-44ce-b1dd-d00e72165938	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-04 14:16:20.477+00
0f88ad0a-3e45-48fc-9b7c-520b06372e14	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT150M"}	2025-06-04 14:46:27.795+00
e1ea0e7b-6fc4-41fb-9e44-9cd31e3f7174	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 2, "scaled": 0.02}}	2025-06-04 14:47:27.795+00
92a4e9d0-ef9c-4e15-a6c7-98b65afed02b	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-04 14:54:27.795+00
fa7e3ec0-e716-4ed0-b4e4-2004c3f5cd9a	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT86M"}	2025-06-04 15:04:20.474+00
120c8e79-c3a9-4891-a1af-69229b91eab4	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 2, "scaled": 0.02}}	2025-06-04 15:05:20.474+00
0aca2eb4-3e44-4122-8a96-c7f2f7d02ac8	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-06-04 15:20:20.477+00
f454465e-85d9-48a7-9ba5-0935e7df4e15	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 16, "scaled": 0.16}}	2025-06-04 15:21:20.477+00
a487992a-c8f6-44f6-9aa9-ff434e8a9f08	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-04 15:25:20.477+00
0efd191f-8eb8-4aee-a1aa-6ae44608d7e9	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-04 15:51:27.795+00
ce5ac97e-f880-4294-a028-25dc178409ca	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-04 15:52:27.795+00
ec7045a3-35a7-4c64-8091-6c7164a37ed7	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.82}}	2025-06-04 15:53:27.795+00
f673ddee-a893-4fe6-acab-fdc90fc4c6d3	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-04 15:58:27.795+00
a107ff1c-14a4-4c23-9892-17d0a79c5530	1e379c7d-80fd-5fe3-a839-c46b91d223c8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-04 16:59:20.491+00
4acebe9c-b2da-48cc-b12d-7b6415e6090f	1e379c7d-80fd-5fe3-a839-c46b91d223c8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-04 17:04:20.491+00
7fecea3c-c44f-4d7a-95d0-13602fd16e50	1e379c7d-80fd-5fe3-a839-c46b91d223c8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-04 17:07:20.491+00
ca518870-6f5a-4e68-9e2c-9c1c77a60126	1e379c7d-80fd-5fe3-a839-c46b91d223c8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT22M"}	2025-06-04 17:21:20.491+00
b2818523-72ba-4b75-904f-04617bc01f20	1e379c7d-80fd-5fe3-a839-c46b91d223c8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9}}	2025-06-04 17:22:20.491+00
efd79282-be9c-481a-ae9f-3e6fd7d51636	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-04 17:54:20.467+00
04e99934-0c53-4b94-83e8-325dc0f45f50	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT43M"}	2025-06-04 18:37:20.467+00
7090ea1c-d839-45d8-ab67-3733b23c7a2b	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.88}}	2025-06-04 18:38:20.467+00
10b1b39f-3c32-4af8-bc8e-5fe02061cbd8	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-06-04 18:40:20.467+00
2c7fbcdc-1819-4360-8c29-f322509855af	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-04 20:09:20.47+00
9aead042-49fe-4262-9488-319c3a2476ed	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT210M"}	2025-06-04 23:39:20.47+00
abb2391e-191d-4aba-91dc-a5fe61c1ee7d	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.85}}	2025-06-04 23:40:20.47+00
3bab2c64-e8dc-4c36-9ff8-9ca02124e11f	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-05 11:39:32.374+00
2c3d6a60-9185-4d55-8da7-011050b1c8ea	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-05 12:29:20.474+00
04ab6949-7544-4f82-afa8-cb572d227d51	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-05 12:51:20.477+00
6000ad3f-4f77-4fc0-9ecf-6feaf62f2a76	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT74M"}	2025-06-05 12:53:32.374+00
fb959383-70e1-436a-aa68-fa4f2973cd31	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.75}}	2025-06-05 12:54:32.374+00
ce0db029-a9fd-4d1e-8c67-75a2c06f9fbd	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-05 13:17:20.482+00
68d70250-0265-4520-bf56-be553f1fb706	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-05 13:21:55.899+00
b51a56d0-dfc5-45e6-8e54-bef8c6400a32	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-05 13:24:55.899+00
4d801c80-a5a4-48c7-b1c0-54ae5bcf6d72	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT82M"}	2025-06-05 13:51:20.474+00
39f6d356-4b4a-4f02-8ec0-487f3c585c3b	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 70, "scaled": 0.7}}	2025-06-05 13:52:20.474+00
a157b2c0-5d49-40de-860b-de70dc0d9459	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT79M"}	2025-06-05 14:10:20.477+00
2fb44b68-65f8-4b09-94cc-fe11d84d7c1b	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT53M"}	2025-06-05 14:10:20.482+00
ef6ce98b-9eaf-4d23-af87-decc1e4777ae	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 6, "scaled": 0.06}}	2025-06-05 14:11:20.477+00
c464992d-6761-45ee-9da7-4d5676f69c79	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 97, "scaled": 0.97}}	2025-06-05 14:11:20.482+00
7f08b29a-886e-40cc-bd0a-02fcc2f5414d	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-05 14:14:20.482+00
38a879e1-afcb-40f6-9c87-6dc70ccd67d2	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-05 14:15:20.477+00
096705b4-bed2-4952-967b-075bebb914e9	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT83M"}	2025-06-05 14:47:55.899+00
0ecd9f0f-d16f-44c0-b2eb-97a8950841b9	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 95, "scaled": 0.95}}	2025-06-05 14:48:55.899+00
a0c7360f-b072-44fb-8138-de6f3cbbd327	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-05 14:53:55.899+00
e9a77167-5d1d-40ed-bfe4-4e8fc8238e73	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-05 16:52:20.467+00
37970498-8d3e-4ab8-baa7-40dc049c8e9b	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-05 16:57:20.467+00
917fdc8c-59b1-42e6-adf9-c483d05bf54c	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT39M"}	2025-06-05 17:36:20.467+00
3419ecb6-b570-4fdd-9a0d-ea71da6efcc2	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-06-05 17:37:20.467+00
57579946-43b0-4d05-9260-b338a4c13a46	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41443003680974205}}	2025-06-05 18:40:20.467+00
60f2ffef-e7ae-47c8-93d5-7d0470ced810	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41443003680974205}}	2025-06-05 18:41:20.467+00
b4cb0c42-1578-45cd-b126-7559b15061b3	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 7, "scaled": 0.07}}	2025-06-05 18:42:20.467+00
b4292949-099c-4d37-b469-0a2a07a2c384	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-06 12:50:20.477+00
e30c8b84-25c6-406f-9501-67e0ca1cc8c5	2457fc99-9240-5207-8740-05d01be3946e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-06 14:08:20.481+00
eb3aee4b-089d-4fde-bdf2-f3ae25dab45e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT94M"}	2025-06-06 14:24:20.477+00
c1c2da97-cc00-4e59-8656-3b02ec2c388f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.2}}	2025-06-06 14:25:20.477+00
6013dd5b-3c0e-4811-b438-9d6dbe3c8d4d	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-06 14:32:20.477+00
1ac89ca6-1982-4c63-a1f3-855092be164f	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-06 14:39:20.47+00
ba8e1772-6440-46d6-b920-3ba05aee59a6	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT40M"}	2025-06-06 15:00:20.467+00
0e6e4849-6445-4044-ad48-ee4d3f456541	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 11, "scaled": 0.11}}	2025-06-06 15:01:20.467+00
6c91d59f-7430-49ad-bcb4-19716c829ad9	2457fc99-9240-5207-8740-05d01be3946e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT134M"}	2025-06-06 16:22:20.481+00
fa51bf94-f00e-40ac-ac8d-a61bcd38da6c	2457fc99-9240-5207-8740-05d01be3946e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 7, "scaled": 0.07}}	2025-06-06 16:23:20.481+00
051b8ce9-b391-4915-9a14-52f619b3b64c	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-06 16:38:20.474+00
3415e0bd-5574-402a-8f4c-b5261bb299df	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-06 17:02:03.532+00
a214097c-c646-48a1-8afc-03006605bbba	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-06 17:06:03.532+00
cf8c60b7-8fb1-44b7-8313-350bcd4817a3	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-06 17:15:31.718+00
6247e5ac-6daa-43f1-9f1d-3f287a676838	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-06 17:17:31.718+00
35d60a44-5ee7-4591-88c5-d1375b63a2cd	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT161M"}	2025-06-06 17:20:20.47+00
62a26581-170d-4acc-ba8c-0a218b4bc7ab	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 73, "scaled": 0.73}}	2025-06-06 17:21:20.47+00
6c46adb3-8629-4345-a33b-d33bd31f70b4	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT62M"}	2025-06-06 17:40:20.474+00
7827630e-7cc0-4002-85de-30eeab9b072a	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 15, "scaled": 0.15}}	2025-06-06 17:41:20.474+00
78dfe80c-bd4c-4ca4-81f1-5fc87fe0d930	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.5406551071359034}}	2025-06-06 17:58:20.467+00
fd2ac3b5-5b16-4e32-9974-a512e4966d77	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.5406551071359034}}	2025-06-06 17:59:20.467+00
43353e34-c3bd-499e-8415-bdc355ad1223	65861570-f509-5228-a69f-731f35318a06	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-06-06 18:00:20.467+00
a1c9ea07-a0e2-462a-a6c8-e178472bc03d	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT63M"}	2025-06-06 18:20:31.718+00
b91dce93-7b8d-4260-acfa-09a6b13e5205	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT75M"}	2025-06-06 18:21:03.532+00
36d7bb61-b3ef-4774-b706-8340695150cb	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 12, "scaled": 0.12}}	2025-06-06 18:21:31.718+00
1713420e-81b9-4218-bda0-55e3e36daa0a	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-06-06 18:22:03.532+00
d0845b6d-5aba-4a7f-a466-17ee412cbc9e	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-06 18:26:31.718+00
73d0e464-cb1c-489a-ae18-631f258ad011	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-06 18:30:03.532+00
630c75db-5f4e-48ba-9056-832450324890	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.8151274289206498}}	2025-06-06 19:13:31.718+00
460879b3-4b6b-408a-a85a-1831349b4b58	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.8151274289206498}}	2025-06-06 19:14:31.718+00
65fa5e7a-7466-4b36-a769-10212c2f08db	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-06-06 19:15:31.718+00
8d3b306d-cfc0-4d68-bbe0-76a54bd0f90b	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-06 19:20:31.718+00
fa1815fa-00c3-495a-af7a-685a867cfed9	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.9275287526823575}}	2025-06-06 19:50:20.474+00
52963954-8f95-4518-99f9-d54d8cdc412f	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.9275287526823575}}	2025-06-06 19:51:20.474+00
8932a992-4656-4529-b87a-fdd53bcbfc40	eafc92a4-9ff9-508b-950a-1837164b2bcd	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.38}}	2025-06-06 19:52:20.474+00
e3ef7ac9-5fd0-418d-8ed2-680c1b08e1f5	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-07 13:11:20.477+00
b013d658-c2c3-42a2-8e99-2a2ae6e65450	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT55M"}	2025-06-07 14:06:20.477+00
fc51a1c0-ee8f-4826-b822-d68b40f956e3	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-06-07 14:07:20.477+00
276271c8-eea4-47ec-9f3c-6dfe814d1631	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-07 14:13:20.477+00
44add1f2-4ae5-470d-9741-d1c0bea637cd	1e379c7d-80fd-5fe3-a839-c46b91d223c8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-07 14:28:20.491+00
aab9c0b5-c780-48b1-911d-d8f556af3eae	1e379c7d-80fd-5fe3-a839-c46b91d223c8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-07 14:34:20.491+00
8af6516c-b11e-4ada-a92e-7aa7f4d81d4f	1e379c7d-80fd-5fe3-a839-c46b91d223c8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-07 14:41:20.491+00
c02fc070-a43f-4d48-85ef-ab06432debd9	1e379c7d-80fd-5fe3-a839-c46b91d223c8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT19M"}	2025-06-07 14:47:20.491+00
ff98b7fb-3be1-49e7-a085-65a3cfc7f201	1e379c7d-80fd-5fe3-a839-c46b91d223c8	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 27, "scaled": 0.27}}	2025-06-07 14:48:20.491+00
35908f6e-c321-44f7-a214-58d1f210f29c	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-07 15:44:20.47+00
d2c3e9e8-0330-4a51-b596-eccb3b9703cc	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-07 15:46:20.47+00
c09b541f-10ba-4f30-9f04-26937824c034	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT207M"}	2025-06-07 19:13:20.47+00
6daeb8ac-b78b-4872-8a25-6acb281c333d	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-06-07 19:14:20.47+00
9537db34-aa3b-49f6-a418-90fc8e758926	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-07 19:19:20.47+00
84d6a674-acb4-48c4-b346-88d5ed6df64d	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-08 11:33:23.536+00
275e07ff-8b26-4217-8ebc-7aeca6516df6	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-08 12:54:20.477+00
23d15c4a-43c4-4af3-be6d-4008ac2e0618	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT105M"}	2025-06-08 13:18:23.536+00
8725ede7-3f93-49be-b4ce-8cee0b89c8c3	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.81}}	2025-06-08 13:19:23.536+00
fbd64909-442a-4490-afb1-cdc0c552a8ec	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-08 13:28:23.536+00
67d5384b-0d0c-4e7f-a76c-f9dbe5a8f511	d3a9d109-d5de-5372-aaa6-2b4039cedb96	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-08 13:54:20.482+00
e88f48cd-5766-4980-b9b4-c57a1f97794e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT69M"}	2025-06-08 14:03:20.477+00
705b8f18-de8e-4d09-83f6-499809bcb8ec	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-06-08 14:04:20.477+00
2fb85ede-aa82-418d-be84-78068680ae49	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-06-08 14:11:20.477+00
52e9a4f6-ad41-419e-bb76-298ad293cf6e	d3a9d109-d5de-5372-aaa6-2b4039cedb96	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT51M"}	2025-06-08 14:45:20.482+00
0b5ee9cc-d391-44ab-8923-06220bdee1f6	d3a9d109-d5de-5372-aaa6-2b4039cedb96	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.89}}	2025-06-08 14:46:20.482+00
455b9f0a-2498-4afa-a402-9b7af43b429d	d3a9d109-d5de-5372-aaa6-2b4039cedb96	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-08 14:49:20.482+00
dcec05a7-f448-444f-9502-8f4ec776b160	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-08 15:31:16.757+00
312ec0c0-57cc-416b-9e54-8c8a51307600	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-08 15:36:16.757+00
ab3a32e3-7032-4b25-b227-34ea2ee54405	eafc92a4-9ff9-508b-950a-1837164b2bcd	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-08 16:11:20.474+00
385d5017-e503-44a8-9c33-b9a750064443	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-08 16:14:20.467+00
0dc0f728-5429-4621-beeb-2369eefba460	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-08 16:16:20.467+00
e4f0d632-54bd-4599-af14-730684f92eff	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT40M"}	2025-06-08 16:56:20.467+00
cdd1683e-02b1-4bd4-b6e8-975d66d98960	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-06-08 16:57:20.467+00
f27dbf95-1313-4255-9bd9-fd712482c1b9	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT111M"}	2025-06-08 17:27:16.757+00
9080a06f-11b1-45dd-a2ec-fb4d2d9a51eb	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 14, "scaled": 0.14}}	2025-06-08 17:28:16.757+00
388d5352-df74-4848-bfa0-5f24d8907319	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-08 17:33:16.757+00
754ee943-5a3c-4c0c-b58d-f3cdb8a3c169	eafc92a4-9ff9-508b-950a-1837164b2bcd	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT89M"}	2025-06-08 17:40:20.474+00
ab78c5c9-0ffb-425f-a3a2-bf20aa8ddcb9	eafc92a4-9ff9-508b-950a-1837164b2bcd	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 3, "scaled": 0.03}}	2025-06-08 17:41:20.474+00
fbf78edc-45c7-4ed1-aa0b-1d092c2b44f3	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-08 18:05:16.757+00
771dacb6-ad47-4cbf-b5bc-2badcfc6c93c	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-08 18:06:16.757+00
ee5838f9-c8a7-4853-a09e-605447d9629d	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.85}}	2025-06-08 18:07:16.757+00
a1aaf2c1-d3a6-4c6f-a520-6bd551ea38f2	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-08 18:08:16.757+00
99f1fbc2-0270-4fda-a377-944fcde2dd38	2457fc99-9240-5207-8740-05d01be3946e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-08 18:50:20.481+00
592d4746-01c9-4fc2-afbe-00560028786c	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-08 20:40:20.47+00
ed0b02c7-643e-4e12-86a9-086564f6a227	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT158M"}	2025-06-08 23:18:20.47+00
82ebf7b0-d858-4675-a66a-0221d24826e2	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 21, "scaled": 0.21}}	2025-06-08 23:19:20.47+00
e85682e9-99bc-4dcb-87ec-fa966c60c405	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-09 16:50:13.683+00
cebdfb24-7b96-4641-927e-251ab2d6a4e5	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-09 16:54:13.683+00
21ea06f1-d469-4f7b-929e-dbbd9e5b654a	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-09 16:54:20.467+00
26f70d28-afb3-4653-b617-e3e269089f39	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-09 16:58:20.467+00
79c12f51-33eb-4293-b4f1-10df8a014560	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT43M"}	2025-06-09 17:41:20.467+00
dfb6e8d1-a47a-4aa0-82df-81f29a7cdc3e	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 13, "scaled": 0.13}}	2025-06-09 17:42:20.467+00
8f3d06d8-a42c-4016-867c-79896ef9e232	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT59M"}	2025-06-09 17:53:13.683+00
e56859d2-fe74-4dfd-a872-9afbb216399d	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-09 17:53:20.481+00
a6efaa24-41c4-4a2b-8e7d-533d9a6a1555	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-06-09 17:54:13.683+00
26a82d5d-099b-42b2-8272-aedccf1d183e	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-09 18:03:13.683+00
ed1f9227-9bd9-441c-8296-c14170af4dce	eafc92a4-9ff9-508b-950a-1837164b2bcd	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-09 18:30:20.474+00
96b932f7-db4f-44c8-af54-59f7c8768e55	eafc92a4-9ff9-508b-950a-1837164b2bcd	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT79M"}	2025-06-09 19:49:20.474+00
015f8a67-b471-4691-8056-067d61559dbc	eafc92a4-9ff9-508b-950a-1837164b2bcd	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-06-09 19:50:20.474+00
f51f57bf-79a6-4459-b107-006dbb241793	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT118M"}	2025-06-09 19:51:20.481+00
92178650-cc29-4118-bfe3-9519f8db7449	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-06-09 19:52:20.481+00
5a5d4c2c-6d7c-4c49-abce-372b483a24f8	eafc92a4-9ff9-508b-950a-1837164b2bcd	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-09 19:55:20.474+00
51afc03b-3686-4bbf-8b70-51039790a3b2	eafc92a4-9ff9-508b-950a-1837164b2bcd	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-10 11:16:20.474+00
77ac44ee-94bc-45b0-8613-5d80952c72e7	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-10 11:28:20.477+00
c6748e51-2715-4211-bf7c-be0b7510658b	d3a9d109-d5de-5372-aaa6-2b4039cedb96	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-10 12:17:20.482+00
2788289f-6272-4b76-bedc-0c40a9b89a49	eafc92a4-9ff9-508b-950a-1837164b2bcd	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT84M"}	2025-06-10 12:40:20.474+00
70a3d5ed-f9d4-43f6-8b48-2143a690fd78	eafc92a4-9ff9-508b-950a-1837164b2bcd	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39}}	2025-06-10 12:41:20.474+00
970ce8c9-777b-4698-bbb9-2865613d8ffd	d3a9d109-d5de-5372-aaa6-2b4039cedb96	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT110M"}	2025-06-10 14:07:20.482+00
0f1cdca0-6ead-42c2-aace-1ff56224f391	d3a9d109-d5de-5372-aaa6-2b4039cedb96	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-06-10 14:08:20.482+00
eeecd75d-8c91-452e-a7fa-fae80c6da679	eafc92a4-9ff9-508b-950a-1837164b2bcd	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5052343169835484}}	2025-06-10 16:08:20.474+00
915c4b12-5e31-489e-a248-4c8e25060077	eafc92a4-9ff9-508b-950a-1837164b2bcd	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5052343169835484}}	2025-06-10 16:09:20.474+00
ceb1d5b1-7296-4f34-b4e9-47468c3384f8	eafc92a4-9ff9-508b-950a-1837164b2bcd	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.86}}	2025-06-10 16:10:20.474+00
5dfb8448-b021-4278-ad2b-2d783a97246c	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-10 16:53:43.474+00
7acb1c41-6377-45b4-a725-60ed8f3ea840	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-10 16:55:43.474+00
d99f41c7-4f2d-4092-b5e8-b6671b9b4d2f	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-10 18:33:20.467+00
fd2abae0-d51c-467a-8ed1-34e6520eb97b	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-10 18:35:20.467+00
f98ad972-ca68-4c93-9f21-55a5eb4f6b02	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT34M"}	2025-06-10 19:09:20.467+00
7c736c34-0a64-4063-ba14-207a34f88fcb	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.85}}	2025-06-10 19:10:20.467+00
79f017d4-a823-41a5-82c9-0bc55e48d168	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-10 19:27:20.47+00
509f6f98-1d27-4481-baa6-77222df9b5d9	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT161M"}	2025-06-10 19:36:43.474+00
85fd862f-b4ac-4927-b8f7-be3682d56112	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 26, "scaled": 0.26}}	2025-06-10 19:37:43.474+00
d08c5fe7-63c2-429d-988b-922519419685	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-10 19:43:43.474+00
c9edd378-4a75-4a41-afae-9c389b73e79c	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT183M"}	2025-06-10 22:30:20.47+00
51e5d23c-fcf5-4383-8b5f-8e6688033535	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.92}}	2025-06-10 22:31:20.47+00
87d9c24a-c924-4458-bc8d-5c81b77dbd4a	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-11 11:00:20.477+00
007173b6-f01d-4fc0-974e-1bdb53349c93	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT74M"}	2025-06-11 12:14:20.477+00
5f9e1454-e387-47f5-8975-8767c35af0b8	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 21, "scaled": 0.21}}	2025-06-11 12:15:20.477+00
256de148-a05b-4d56-a9ef-31efd5fe2f2f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.7767214128347122}}	2025-06-11 12:58:20.477+00
1a87ea96-515d-4dc6-9409-d69da99b378c	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.7767214128347122}}	2025-06-11 12:59:20.477+00
0a5ec9fc-8d23-4e87-8955-ea85e1b904a7	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 21, "scaled": 0.21}}	2025-06-11 13:00:20.477+00
4cee576c-010d-45c0-ab0e-6db47058396d	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-11 15:02:18.668+00
2a259725-04a2-4925-81be-24c39cc75594	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-11 15:41:20.481+00
e2600321-e3ef-4dbf-9768-aacb83c5f030	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-11 15:52:41.195+00
781636d1-b3b4-4d22-83c3-223819916595	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-11 15:57:41.195+00
50657dba-fad7-4733-b42c-2349bd350158	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT81M"}	2025-06-11 16:23:18.668+00
50958df6-de82-4ccb-bbf3-7766d50da3f5	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-06-11 16:24:18.668+00
e0307bd8-49b2-47e4-8f32-4e7ebaf112a4	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-11 17:28:20.47+00
b801ce6d-4fe4-4496-a827-1b021ea2b2c1	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT97M"}	2025-06-11 17:34:41.195+00
32486dc8-3a0e-4648-b7e4-c5bae6fa0e1c	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-06-11 17:35:41.195+00
a4ae8963-0c9c-40ca-93c9-9869294ec1ee	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-11 17:43:41.195+00
4d2d680c-fdf4-40d4-9099-fb1b265a7cdb	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-11 18:06:41.195+00
38e35d0c-6bc6-4f49-a6eb-bb1dbee5b550	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-11 18:07:41.195+00
bbd3c2f9-84bf-4dc1-9024-81b53a7b69db	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-06-11 18:08:41.195+00
2ed11383-0cce-4ed1-bca3-47d8ef4e7c0b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-11 18:11:41.195+00
d5aee77e-0352-471b-a8af-00593b379264	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-11 18:41:20.467+00
944028a1-e897-4057-b5a9-5b6ab1f50af5	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-11 18:43:20.467+00
80db7a6e-081c-471e-883e-533319ed0202	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT49M"}	2025-06-11 19:32:20.467+00
f5a3b610-66ad-4916-ae4f-ca167d1254ac	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-06-11 19:33:20.467+00
022d62fd-0d29-4b66-afc6-e2221ea1ae83	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT183M"}	2025-06-11 20:31:20.47+00
3a0dc8d1-384c-49c0-a374-8f7f3e90bdbb	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41}}	2025-06-11 20:32:20.47+00
fa78a831-0dfc-43de-a417-5281d67fcb65	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.6406309903388158}}	2025-06-11 22:05:20.47+00
e399aee2-2cbb-473b-9bb4-91192a2bd141	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.6406309903388158}}	2025-06-11 22:06:20.47+00
0042d844-8add-4056-8de8-bfe6b459193d	a39e581a-a948-5af5-ad61-b2b0030fb824	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 19, "scaled": 0.19}}	2025-06-11 22:07:20.47+00
b92487f8-5f39-436d-b822-564e634de9ba	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.6593578718930085}}	2025-06-11 22:14:20.467+00
2237bc78-ad19-4e3b-8ad4-4bbe55953f56	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.6593578718930085}}	2025-06-11 22:15:20.467+00
58182402-ddcc-4803-abe1-1eeea9f5c732	65861570-f509-5228-a69f-731f35318a06	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 83, "scaled": 0.83}}	2025-06-11 22:16:20.467+00
72a4cea4-2909-46f7-97aa-070a27f22c0b	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-12 14:13:49.307+00
1849e27c-0a53-49dc-bb91-cfba1868a5aa	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-12 14:17:49.307+00
8a601325-d088-469b-aed2-1e523a5ba4e7	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-12 15:26:20.474+00
21b30dd0-5112-43ac-906f-74fa8958c3b1	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-06-12 16:30:20.474+00
8dbfb125-b3f4-4415-be5f-b03d695e9b2b	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 95, "scaled": 0.95}}	2025-06-12 16:31:20.474+00
c3810484-7245-4080-85ce-f9d70cebb50a	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT151M"}	2025-06-12 16:48:49.307+00
d9fe04c4-3a8e-4a8b-9a1e-cd2af3de0d19	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-06-12 16:49:49.307+00
8c6fc904-68a8-4192-a0a8-e47436915d55	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-12 16:50:20.477+00
2d018b49-c1d1-4451-ad36-011fa315bd0a	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-12 16:54:49.307+00
805bd32b-cee1-4c0b-a3e0-3ed3f815c56b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-06-12 17:54:20.477+00
ef6596b9-4081-429d-9a1e-6ebea46c7c8f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9}}	2025-06-12 17:55:20.477+00
52b90c6b-c584-4f75-890b-cb8434ee2cec	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-12 18:01:20.477+00
32f43b7d-e8b4-4449-a377-8045d06744c4	d3a9d109-d5de-5372-aaa6-2b4039cedb96	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-13 12:06:20.482+00
33f62856-f6a7-4576-b19a-9c2a8aa2d72b	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-13 14:21:20.474+00
10b73cd1-76e4-4830-93a6-1eb9e12c01eb	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT83M"}	2025-06-13 15:44:20.474+00
7673784f-20ee-47f1-a84b-464054779222	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 1, "scaled": 0.01}}	2025-06-13 15:45:20.474+00
9274eb13-9945-426a-ab0d-4789856ae288	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-13 15:47:20.467+00
31b3bb04-a7ee-4f67-bf6a-93dba351f578	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT41M"}	2025-06-13 16:28:20.467+00
5a6050b5-7bf0-4330-bf96-7a1764f1d77f	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.85}}	2025-06-13 16:29:20.467+00
23bb6b47-dbed-453a-aaf3-7a34cbc931fc	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-13 16:30:38.768+00
c118790a-ae65-495c-9ccd-68d0b82e3e40	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-13 16:32:38.768+00
0accfaa5-7d63-4462-9175-6a0c06f7e9a9	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-13 17:51:20.477+00
56215778-2c0c-409d-8f66-fb3ee7773bb5	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-13 18:01:20.47+00
c14ef73e-0815-427c-a91b-f4adb57c68ad	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT102M"}	2025-06-13 18:14:38.768+00
f398879e-4b8d-463b-978c-e2e02394a618	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 14, "scaled": 0.14}}	2025-06-13 18:15:38.768+00
a423c2cf-3029-4171-b485-97f8cc319a75	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-13 18:24:38.768+00
ce944d15-0ebe-4674-ac5a-cc4277338aa9	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT43M"}	2025-06-13 18:34:20.477+00
be305474-5876-4c68-adaf-7b425fbf395c	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-06-13 18:35:20.477+00
603c25a4-3551-495b-b592-8cff6a087cdc	2457fc99-9240-5207-8740-05d01be3946e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-13 19:57:20.481+00
235ff2ea-198f-48b1-936f-6b088822a471	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT161M"}	2025-06-13 20:42:20.47+00
bf5647b0-4e72-4b53-bc12-1706bb26161f	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-06-13 20:43:20.47+00
d76ba113-889e-4436-ba54-01ab9eee64ea	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-14 11:44:20.477+00
ac7a40e7-ed30-4460-a601-cb81fd328940	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-06-14 12:41:20.477+00
5b4b7e75-5ee6-46b4-823d-8cedc3fb5743	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 17, "scaled": 0.17}}	2025-06-14 12:42:20.477+00
2f177f5a-2d67-42a1-8d1d-7712c346f0cd	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-14 15:23:50.532+00
bdeeb92f-9a58-491b-956d-ab73ab004444	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-14 15:27:50.532+00
96c7c1f4-0e8f-466f-bae8-a2fb9301f679	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-14 17:31:20.467+00
96b424ec-9d52-45eb-83a9-4c38ea4da86e	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-14 17:34:20.467+00
4a442345-2cd6-4d86-a93b-c69f3316ae70	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-14 17:47:20.474+00
ff5894b4-9ddb-4bf7-91e4-f7e2298f019c	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-14 17:50:20.474+00
d764c55c-3008-4992-bd16-d005a46dd458	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT166M"}	2025-06-14 18:13:50.532+00
baa1ea03-c815-41b6-be33-61e21251a22c	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.74}}	2025-06-14 18:14:50.532+00
16daaedc-1542-47a1-acaf-a80ba9073ed3	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT43M"}	2025-06-14 18:17:20.467+00
334a571c-76c3-46a2-9473-1e6df163eac9	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-14 18:17:50.532+00
5bd05226-f368-4e21-a959-35c89dc1a619	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-06-14 18:18:20.467+00
c49a18fa-65e1-401b-b6fc-f979679f6813	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT68M"}	2025-06-14 18:58:20.474+00
894d1223-d3ba-4dea-9eb5-36fca0e1ea0d	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 28, "scaled": 0.28}}	2025-06-14 18:59:20.474+00
03a58671-def6-4257-aa95-87d2e4f0eb18	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-14 19:03:20.474+00
fd1d4382-8b3b-4b22-b1c9-77227d2baf0a	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-15 12:55:47.166+00
3f8d8ac8-38ba-437a-8591-d9211749bec7	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-15 13:00:47.166+00
d8127f1f-0fcc-437a-8a1f-6a85ef24a35e	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-15 13:51:20.47+00
b2e54037-d26c-4c5c-879e-46dc3b85f64a	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-15 13:53:20.47+00
1b926872-0662-4506-9858-233b18c65bf9	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-06-15 14:04:47.166+00
71d18846-49e9-4cc5-ba4d-1cc90c22099f	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-06-15 14:05:47.166+00
8e08d704-da57-42dd-ba40-a501d445b4c3	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-15 14:10:20.474+00
18b0dc0f-9f5b-4530-bad7-fb210f1ef207	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-15 14:11:47.166+00
1747aab1-dd3d-45ff-a186-6f993136f2fb	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-15 15:31:20.884+00
5f00217d-02f8-45ba-9ea6-b7e9f4d3113b	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT86M"}	2025-06-15 15:36:20.474+00
852d92a1-18b2-4f14-ae52-73c6a4d06e2f	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 27, "scaled": 0.27}}	2025-06-15 15:37:20.474+00
120add49-75f4-42e9-9bf5-01841e4c1a2d	2457fc99-9240-5207-8740-05d01be3946e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-15 16:04:20.481+00
24b20ff1-0b14-4264-a244-d02d35a1ef87	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT184M"}	2025-06-15 16:57:20.47+00
440304c8-f1ed-41eb-880c-46d7768a3b38	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.75}}	2025-06-15 16:58:20.47+00
750d09af-988d-4705-b648-ac6c3db1a2cf	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-15 17:55:20.467+00
9a921c23-995b-41e5-ab79-67b8fc51a889	2457fc99-9240-5207-8740-05d01be3946e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT121M"}	2025-06-15 18:05:20.481+00
a2ad355f-fc67-4883-8122-e83c304edc76	2457fc99-9240-5207-8740-05d01be3946e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-06-15 18:06:20.481+00
0fd71f8d-164e-47e8-907a-6d4f7f86ad58	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT39M"}	2025-06-15 18:34:20.467+00
2b1e8920-2118-4d2b-8bda-dceae52c74d3	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56}}	2025-06-15 18:35:20.467+00
2fdc651c-ecab-4e4e-a4c7-78aa2dab4d7b	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-15 18:38:20.467+00
7eb68349-1370-48d5-89e9-1f127b4e9a4b	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-16 12:22:39.414+00
8edb6e29-f3a2-4ad4-8d86-a1b3d8524281	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-16 12:27:39.414+00
477d4e0d-7572-4164-97ec-80e95a44a12f	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT92M"}	2025-06-16 13:59:39.414+00
c2d721ee-0fde-4275-bd37-faebfd78a172	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-06-16 14:00:39.414+00
505d9378-a99a-49a8-8f89-2840e5f9da03	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-16 14:01:20.477+00
6b5c2611-d641-4406-9c6c-ac952c89db66	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-16 14:04:39.414+00
4f42b8ea-a91b-4ae4-a9de-955da2248642	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-16 14:51:39.414+00
d2eb1853-bb46-408c-83eb-0c51847decfb	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-16 14:52:39.414+00
d6e8cf2b-1745-44c0-9884-daecf08eb9b7	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-06-16 14:53:39.414+00
053b7276-97d0-4d71-a625-5b93375e7c84	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-16 15:01:39.414+00
772c7a79-5ba1-4120-9fd5-a3b4f4307f40	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT62M"}	2025-06-16 15:03:20.477+00
5b35f88b-311f-4479-a189-157a834ea944	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.82}}	2025-06-16 15:04:20.477+00
08ad2003-fed6-443a-94c9-1613997fbcd3	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-16 15:12:20.477+00
f58fb123-6fb0-47f3-b581-12c0fb7c483e	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-16 16:26:20.467+00
f73c117c-d2d3-4420-8a8a-f87b6d2e71f1	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT42M"}	2025-06-16 17:08:20.467+00
4dc03a53-503e-4c61-a722-ed74629567e6	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-06-16 17:09:20.467+00
0e47dc10-2e48-410d-a1eb-e5063a701529	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-16 17:10:20.467+00
186ffad0-0d92-4039-b6ec-bf4c6fe15016	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-16 18:30:20.474+00
b0ae5f94-b12a-4dbd-b2d2-f4f0b1d7ffad	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-06-16 19:34:20.474+00
e1d76f8c-3f9e-488d-8e82-76bfc7a51930	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-06-16 19:35:20.474+00
6a9a973b-5332-4969-926f-a64e0aba6253	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.5887801473867491}}	2025-06-16 22:24:20.474+00
31d8a894-bb65-4825-9469-ef26ee9beb88	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.5887801473867491}}	2025-06-16 22:25:20.474+00
5d7b78b9-38c5-4184-bcfd-68445abe67f8	eafc92a4-9ff9-508b-950a-1837164b2bcd	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-06-16 22:26:20.474+00
cb82a10b-56ef-4fd2-9775-aa0d1fe798cc	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-17 11:13:00.79+00
7321f08c-537f-4489-b612-f71c92067653	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-17 11:18:00.79+00
298c66f7-b7b7-42c2-ba7b-b082ab95e00a	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT62M"}	2025-06-17 12:20:00.79+00
59d5d3e7-d803-4558-934e-5b55cd2f0f88	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.75}}	2025-06-17 12:21:00.79+00
aec2accb-e315-42a4-bcc9-69229e92e2cb	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-17 13:14:20.47+00
b2a438f7-424a-4e0c-8a07-a3415fd1a67f	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-17 13:18:20.47+00
17efdf74-8c7e-4352-8451-fe3be6af2af5	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-17 14:52:38.548+00
0c3cbaea-61c4-4815-99b5-bdec4a1c3a60	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-17 14:56:38.548+00
56f5df5b-e3f8-49af-95d2-6e6d642691c0	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-17 15:15:20.481+00
1452580b-f4d7-4ce0-b849-bafd1d2e40c1	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-17 15:57:20.477+00
f6d9c5dc-ded4-4ff7-803b-d5e5b666a928	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT51M"}	2025-06-17 16:06:20.481+00
cf7cb8c8-adca-49bd-9e51-e3332e3c9a51	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.92}}	2025-06-17 16:07:20.481+00
b647fd1f-3e44-46da-b009-ef016cbfab69	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-17 16:12:20.481+00
6496a63b-02d9-4670-b002-f665eb6b39de	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT77M"}	2025-06-17 16:13:38.548+00
0083b563-4cf3-4776-8170-dec2e6899f78	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 1, "scaled": 0.01}}	2025-06-17 16:14:38.548+00
72d18f47-3309-4bd2-91d5-4b4b2cec5ce0	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT180M"}	2025-06-17 16:18:20.47+00
644e2150-9bb8-47ca-9ccc-ddc0475c98a4	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-06-17 16:19:20.47+00
7f92f4ca-c1ce-4231-895c-7597d9469d5a	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-17 16:23:38.548+00
6993c67b-d4e8-43a9-89fa-9c0c1d24897f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT39M"}	2025-06-17 16:36:20.477+00
9ff9f01b-cfb7-434d-827c-bf632c0f87ed	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.81}}	2025-06-17 16:37:20.477+00
2284d72a-2481-4921-b7c0-def499543932	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-17 16:46:20.477+00
977b352f-1648-4672-89e3-c58fa04493d5	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-17 17:20:38.548+00
6068b2c4-5eef-4028-b0f8-9104c7bea31f	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-17 17:21:38.548+00
9b4fe24a-ac4f-428c-87c5-4ca78bcac9ef	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 13, "scaled": 0.13}}	2025-06-17 17:22:38.548+00
365b4b6f-f296-4ed9-beef-a2fe971ade54	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-06-17 17:23:38.548+00
a924ea75-ba47-4f00-b4a7-7ee206eb3cdc	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-17 18:08:20.467+00
1880d586-ac6d-42d3-80e6-9d67b108202c	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-17 18:11:20.467+00
b5bf347a-b5a9-4edf-8c7d-1c4fce053249	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT46M"}	2025-06-17 18:57:20.467+00
f9ea0eb5-5dd0-4903-b6d6-0d875e881328	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-06-17 18:58:20.467+00
3ad09059-a3ee-485f-a0de-62945504ba10	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.5475324068513332}}	2025-06-17 21:03:20.467+00
76f292a7-f691-45e0-924b-e6bc706a4ebb	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.5475324068513332}}	2025-06-17 21:04:20.467+00
6319bdd4-61ef-411a-a3ae-2a15d5ad0f64	65861570-f509-5228-a69f-731f35318a06	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-06-17 21:05:20.467+00
19e5163a-e09f-4938-859f-a6878fd58ddc	d3a9d109-d5de-5372-aaa6-2b4039cedb96	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-18 13:03:20.482+00
fcabe67c-0e47-40d0-a201-1ba7afa37596	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-18 13:31:20.474+00
0e0a877d-c912-4e9d-86b4-7e528a33e341	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-18 13:54:35.327+00
94be82e3-f77f-44c9-a07d-6b107db5230e	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-18 13:56:35.327+00
235fedcc-a5a2-4dc2-b25e-ba0ef9e02a6d	d3a9d109-d5de-5372-aaa6-2b4039cedb96	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT56M"}	2025-06-18 13:59:20.482+00
b9708ff5-ae16-43c5-a2cc-31f5e650ccbb	d3a9d109-d5de-5372-aaa6-2b4039cedb96	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-06-18 14:00:20.482+00
7c509688-3eda-4909-b8c0-83c24c5e469e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-18 14:04:20.477+00
c887dcd5-d92a-472d-82e0-b15157f456d7	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT72M"}	2025-06-18 14:43:20.474+00
24314fbf-3c54-4f62-be49-079acb7a8ee8	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-06-18 14:44:20.474+00
5cd07946-f9ca-4784-a92c-79bc086e1c3b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT74M"}	2025-06-18 15:18:20.477+00
b4f20656-59aa-4b9d-8ada-d114d36eb1a8	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 6, "scaled": 0.06}}	2025-06-18 15:19:20.477+00
c8bd2b81-8ce8-4afc-bee7-62d703cbce07	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT105M"}	2025-06-18 15:41:35.327+00
b6dfe528-8031-4299-9b10-a4e4a57ea854	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-06-18 15:42:35.327+00
9c12f48c-b364-4401-b828-14511c037fdc	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-19 11:56:30.127+00
780b8127-4f03-4dc3-8778-f3860f99b1a0	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-19 12:01:30.127+00
5c3fb45e-3511-4f85-9a90-5cd9a1f49ee9	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-19 14:13:20.477+00
4a7eb9f1-9642-416e-b8d5-d806b2f99e7f	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT164M"}	2025-06-19 14:45:30.127+00
245d7044-6de5-4adc-8e43-7e9e7ab802a3	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 27, "scaled": 0.27}}	2025-06-19 14:46:30.127+00
387f2c0f-cfcd-4127-ada0-afcb160c19a4	2457fc99-9240-5207-8740-05d01be3946e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-19 14:49:20.481+00
a41e8485-c825-42ca-a3b4-5cf28ac539dd	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-19 14:54:30.127+00
e9f0013a-35fb-4ed2-81e8-8b4288fc6f8b	2457fc99-9240-5207-8740-05d01be3946e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-06-19 15:46:20.481+00
89ef28dc-4f66-4d3b-b029-d940de0589e0	2457fc99-9240-5207-8740-05d01be3946e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 83, "scaled": 0.83}}	2025-06-19 15:47:20.481+00
3484b7f2-d8c5-468a-a0c4-8fa91e62837b	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-19 15:49:20.474+00
46a4e5f1-3177-4a81-9a33-3457c9a7984d	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT72M"}	2025-06-19 17:01:20.474+00
4b5bb4f1-8f46-4eb7-8118-3fda2d9ec348	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-06-19 17:02:20.474+00
b7421b7f-3248-4486-a5f3-ea71f6789425	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-19 18:26:20.467+00
a22fdd2c-9735-4444-94c4-8c2d8715239f	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-19 18:26:20.47+00
42d5ae20-13c6-4e32-bb37-5a457845a4cf	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-19 18:28:20.467+00
078aac10-074e-4b8a-bd68-869d9f8f5625	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT35M"}	2025-06-19 19:03:20.467+00
1d37893c-13e9-4cdf-94a0-350fb95fad9c	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 1, "scaled": 0.01}}	2025-06-19 19:04:20.467+00
028f2cd5-f703-40e7-9da6-3ef0cba56944	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-19 19:06:20.467+00
8cfded0e-0a99-4bcd-87e0-b471f80f15f1	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-19 19:15:28.762+00
9129e6da-40d7-430d-89e2-2ab14409e1e4	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-19 19:20:28.762+00
7b48ab75-20a7-4968-a09b-0db5177f2a9b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT94M"}	2025-06-19 20:54:28.762+00
cea0d7f8-f347-4889-b1fb-c3a09e860a8a	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 4, "scaled": 0.04}}	2025-06-19 20:55:28.762+00
3d82350d-784c-4db5-a85a-f7772b54bf68	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-19 20:59:28.762+00
36c1979b-7e88-40a8-8480-f962341b030d	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT201M"}	2025-06-19 21:47:20.47+00
3fad3824-9ff2-4fae-95af-dbe759dc5540	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 93, "scaled": 0.93}}	2025-06-19 21:48:20.47+00
bacff1e5-3ce6-45e1-98dd-0c6d15268df5	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.7199940744020139}}	2025-06-19 23:07:20.47+00
a4e8b7ae-1c77-4159-aaf2-51706f80c301	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.7199940744020139}}	2025-06-19 23:08:20.47+00
34525647-578f-4035-82d7-a5495f3d5fca	a39e581a-a948-5af5-ad61-b2b0030fb824	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 15, "scaled": 0.15}}	2025-06-19 23:09:20.47+00
0dbc3d27-b2c0-4335-8f8a-cbd9fdad7c2c	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-20 12:14:13.917+00
8440427e-6c7e-459c-8b6d-6ddcd13bc03d	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-20 12:19:13.917+00
ff114dee-17a4-41b6-834c-0208afdbeab0	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-20 13:04:20.477+00
4d75eddc-5216-464f-b7ab-4bb57811026f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT58M"}	2025-06-20 14:02:20.477+00
341714a0-355c-4e61-8fec-c8e0f3adfba4	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42}}	2025-06-20 14:03:20.477+00
d8312abf-dd68-4d62-820f-1f973c8d8ffb	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-20 14:21:20.467+00
cbed1bc9-d40d-4238-bacd-4d09a9f1b62c	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-20 14:24:20.467+00
f19b849b-31f8-4aae-8d82-45addffc0369	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT137M"}	2025-06-20 14:36:13.917+00
45c8dc53-d0c9-42c6-9b31-7f740fc15b32	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-06-20 14:37:13.917+00
e636e8cc-dff8-4907-aa80-f516d2986b82	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-20 14:41:13.917+00
3f3a56bc-8ee8-4a83-b1c9-f1a1886049fe	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT36M"}	2025-06-20 15:00:20.467+00
4a1a0aa7-a444-4da1-9399-6475ccbda091	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 16, "scaled": 0.16}}	2025-06-20 15:01:20.467+00
e18591b1-57b5-4472-8525-216cacf0d728	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-20 15:13:20.474+00
aa55510b-ed06-4613-8606-87439f007d26	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-20 15:17:20.474+00
ec838b74-e68f-4636-96d2-583f8b2810b1	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT93M"}	2025-06-20 16:50:20.474+00
1e262787-a56c-4227-b1b7-c1b8a5ee5034	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-06-20 16:51:20.474+00
46399977-1aa2-4fb0-9b70-eaa42904638e	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-06-20 16:52:20.474+00
6f4c8560-7bc6-4450-be11-6db419203176	2457fc99-9240-5207-8740-05d01be3946e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-20 19:31:20.481+00
53e6b2c3-e5b8-4431-a3ed-2906fa5f4738	2457fc99-9240-5207-8740-05d01be3946e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT122M"}	2025-06-20 21:33:20.481+00
56424ae2-3823-4754-aa15-82c6da2a719b	2457fc99-9240-5207-8740-05d01be3946e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.29}}	2025-06-20 21:34:20.481+00
abb351a3-0601-439e-b48f-1ae3784245a5	2457fc99-9240-5207-8740-05d01be3946e	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-20 21:41:20.481+00
a3e92c35-7b1a-47a8-863c-3a690a29d741	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-21 10:07:20.474+00
3765ea20-dd51-41f6-9d12-2503082008ad	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-21 10:10:20.474+00
ff8c7222-25c3-4f43-8ffb-cfec834d214d	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT78M"}	2025-06-21 11:28:20.474+00
f2cad170-5a75-4409-92bf-e42797ef9a6d	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-06-21 11:29:20.474+00
7c79c622-f247-4fe8-8647-28912e515cf9	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-21 11:34:20.474+00
ff548de1-956b-48f8-a279-c9a504fef509	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-21 13:10:20.477+00
8cc34e11-92db-43b5-81a7-45c39318af5d	d3a9d109-d5de-5372-aaa6-2b4039cedb96	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-21 13:39:20.482+00
a192b948-1ffc-4350-81b3-0b017ff07498	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-21 13:45:05.426+00
54276237-9257-4621-9829-ea8a8917c17b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT86M"}	2025-06-21 14:36:20.477+00
55c704ae-45a1-48dc-b466-7185b0523dc7	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 28, "scaled": 0.28}}	2025-06-21 14:37:20.477+00
ad39b012-5185-4ae0-ae0a-8913f2722a4c	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-21 14:39:20.477+00
32fce3a0-d1c7-4a68-86c7-5d9c2318dcdf	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-21 14:47:26.513+00
650901b9-33b6-4546-96bb-73be11133d7a	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-21 14:51:26.513+00
90a233d4-0bcc-474c-9968-d4f063617234	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.8487334200512213}}	2025-06-21 15:00:20.474+00
9d335f92-23d4-4aab-8f41-c9b9c531fdbf	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.8487334200512213}}	2025-06-21 15:01:20.474+00
b1826039-7230-4262-b8d6-b358b9db481b	eafc92a4-9ff9-508b-950a-1837164b2bcd	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 10, "scaled": 0.1}}	2025-06-21 15:02:20.474+00
511ab3e7-3085-4aaa-ac52-9dc9031d7c1b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT86M"}	2025-06-21 15:11:05.426+00
0806df38-04e8-4514-935b-7aeb18b440b7	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-06-21 15:12:05.426+00
44177ce9-d2c0-4e69-9b54-4142b87a7a09	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-21 15:19:05.426+00
7a485184-7182-491f-b392-d703aa57132a	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT148M"}	2025-06-21 17:19:26.513+00
a5ba6504-bdd2-408d-8733-46a015284c0e	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-06-21 17:20:26.513+00
bf510d6d-2e5c-4451-875a-4311c7c3f092	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-21 17:28:26.513+00
ed5bf717-6f88-4e33-914e-c57b2039f15a	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-21 19:19:20.481+00
63a72e83-ef57-4c51-a633-8e82007a5951	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-21 19:49:20.467+00
d0c08f14-bfeb-4d2a-ab1e-8e0a32826898	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-21 19:52:20.467+00
0b83f6ed-812e-4332-8438-ddf7fc28560a	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT49M"}	2025-06-21 20:41:20.467+00
9924a7f5-bdfb-42a5-b496-d1afdabb0c79	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-06-21 20:42:20.467+00
39208e86-a8d3-46b1-8411-d2fb4dbf1989	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-06-21 20:43:20.467+00
c1d38902-abfc-4f13-8885-11c2000031ba	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT111M"}	2025-06-21 21:10:20.481+00
0de4a43b-63e5-45b0-a42e-bd9838ef632b	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-06-21 21:11:20.481+00
bb3df99b-9538-4acb-96cf-74e6357046e6	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-22 15:32:20.467+00
716185fa-4f15-48f7-8451-dd11c244b0eb	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-22 15:34:20.467+00
9b1d5057-3f1d-4de1-b721-c4c02351fb6b	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT37M"}	2025-06-22 16:11:20.467+00
b0cdb11b-8cb6-4d20-877e-b676962c921e	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-06-22 16:12:20.467+00
45ce5425-101c-4138-8c31-326e4543daae	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-22 16:16:20.477+00
34333b87-79e7-4a3f-9d44-803cdb98f846	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-22 16:17:20.467+00
f0e11d14-f3cc-4a8b-898d-6e0945ae287b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-06-22 17:03:20.477+00
586dd2cf-14d1-4ff4-884c-287872f5cae9	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 5, "scaled": 0.05}}	2025-06-22 17:04:20.477+00
556e9933-b800-46bd-9bca-d23b40cb3566	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.5372821172785289}}	2025-06-22 17:51:20.467+00
bb9aecb7-cbd3-4c49-a72f-b0998805d5ac	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.5372821172785289}}	2025-06-22 17:52:20.467+00
8b1494f4-3309-46b7-9519-f15165a65ac5	65861570-f509-5228-a69f-731f35318a06	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-06-22 17:53:20.467+00
32dacaaa-aab9-4df5-8418-7a9e4a1c03aa	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-22 18:10:20.47+00
b7470818-1955-4551-80fe-af99899e5411	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-22 18:14:20.47+00
079b1b07-5427-4256-8865-497cebb68766	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-22 20:57:20.481+00
4872223a-4dfb-4230-8385-bd158f4804d0	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT190M"}	2025-06-22 21:24:20.47+00
4f6ed067-ce39-47db-8dd9-fa0abd76eb01	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-06-22 21:25:20.47+00
13466be4-f8b1-471f-ae1a-9622214f4e91	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-22 21:29:20.47+00
73bbbc61-ecca-4ab6-9a05-8d35bf71d425	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT103M"}	2025-06-22 22:40:20.481+00
46dd1bcb-412e-4cc1-a3c4-b1231e0a7bfe	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.57}}	2025-06-22 22:41:20.481+00
f9d8912a-fe03-42cd-9da3-27a031264445	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4099887927033909}}	2025-06-22 23:38:20.481+00
1ffe124d-b37a-4e99-bc86-4bc685b9a358	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4099887927033909}}	2025-06-22 23:39:20.481+00
33b99c07-9e0e-464c-9d7c-c5c89ac9f3bd	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-06-22 23:40:20.481+00
3b57c7f4-508d-4c65-93e2-421a8d5fd2c3	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-06-22 23:43:20.481+00
d2f0daba-0566-417e-8506-62146ab3179b	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-23 15:38:35.454+00
492ad26c-0d6c-46af-ab22-2c95e4103955	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-23 15:42:35.454+00
744d368d-35bc-45b1-83e1-f7b72ef51036	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-23 17:43:20.47+00
4c20c046-7965-4a33-98da-40faa82fe58c	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-23 17:44:20.477+00
b09a00e2-0c28-49d4-9185-d56de374c81e	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT158M"}	2025-06-23 18:20:35.454+00
96479837-1d9b-4a04-b5ee-fe8361bbd3fc	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09}}	2025-06-23 18:21:35.454+00
5e645fff-a4f3-4afd-9e00-9a3a53b9bdc4	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-23 18:28:35.454+00
aa54449d-6b30-4e88-ab20-946d71cb1de2	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT87M"}	2025-06-23 19:11:20.477+00
d4646d88-9469-49b1-b8e9-22ffa71d51c3	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09}}	2025-06-23 19:12:20.477+00
7b0f84e8-0af0-4880-b904-c1d5e00c914a	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-23 19:21:33.879+00
e0192e15-3f52-42d6-a024-1352c842346f	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT25M"}	2025-06-23 19:46:33.879+00
eb844aa5-e63e-4413-8a21-52290b18efe2	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.81}}	2025-06-23 19:47:33.879+00
67a7d755-788b-46fa-bd05-6e564fbefbf5	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.6645160430357593}}	2025-06-23 20:04:20.477+00
0dcf5978-3b5b-4112-bf89-8871913b8849	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.6645160430357593}}	2025-06-23 20:05:20.477+00
3d167985-090c-4b85-bc32-c1b37d04be7d	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 19, "scaled": 0.19}}	2025-06-23 20:06:20.477+00
90983dff-1812-49c2-8971-ceeff7419efe	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT187M"}	2025-06-23 20:50:20.47+00
df3149b2-d149-416e-9def-abcfe242cac5	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-06-23 20:51:20.47+00
f97692ea-ce83-411e-9872-5d659ce4ed7f	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-23 20:54:20.47+00
1cd0a48a-1bcf-40a1-b024-76c2082bcedb	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-24 14:40:28.402+00
cbea263c-06ac-4730-a31e-18f3db9aeeb7	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-24 14:44:28.402+00
b0f353ef-2bfa-457a-8dd0-c6bc91b2635c	d3a9d109-d5de-5372-aaa6-2b4039cedb96	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-24 15:14:20.482+00
4b99f90c-cfd7-4193-b73e-db55bca5b9b1	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-24 15:57:20.477+00
2c0244fc-0216-4628-ad78-6b047a19e340	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-24 16:19:20.481+00
d0446c2b-f3ef-4ed9-b856-26d0081b0d2a	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-24 17:00:20.467+00
e4796777-f5c2-41cc-873f-8bbb7db2480b	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-24 17:04:20.467+00
73d9636b-9236-433f-9a08-60d23bd5dd66	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT75M"}	2025-06-24 17:34:20.481+00
6be569e8-9056-43e8-ac50-870da37f0622	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-06-24 17:35:20.481+00
7276705d-5707-44d2-aa61-25b4e5be3e1b	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT39M"}	2025-06-24 17:43:20.467+00
9b974567-35c1-4e5e-b2e0-9256e40e643e	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-24 17:43:20.481+00
e72b26e1-9b3d-4a0a-8c81-0d8e2c3a9949	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 28, "scaled": 0.28}}	2025-06-24 17:44:20.467+00
e98f93e2-d1ae-41c6-9e5b-0c4b95de8396	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-24 18:41:20.47+00
c9c796d3-2f5a-4472-a5ff-9ab072679349	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT312M"}	2025-06-24 19:56:28.402+00
3a1d9ac5-91e5-4d16-9e08-396d7ecbb684	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-06-24 19:57:28.402+00
c376ed33-751c-4b5c-9a37-26869fb19425	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-24 20:01:28.402+00
df1229a4-9c6f-4f15-b6c7-45c31729b67d	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT203M"}	2025-06-24 22:04:20.47+00
ba90c509-3606-4070-9eb9-0ce0ded7fb06	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.84}}	2025-06-24 22:05:20.47+00
39d7d379-792a-41be-9076-361f46d7ab6a	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-24 22:09:20.47+00
11c3b9e5-fe1b-4a2c-9036-c2f94c65b3f0	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-25 13:56:19.661+00
43e94900-cc5c-4d64-9eca-e03d3f4a245e	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-25 13:58:19.661+00
5b3efd13-3cf9-464f-b18d-4769a2f8f4ef	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-25 15:50:20.467+00
1bec208d-5e35-435e-8e48-2171118c6e5d	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT40M"}	2025-06-25 16:30:20.467+00
3e9441a0-e2e1-427f-8ffd-f735f15b6dee	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-06-25 16:31:20.467+00
85bd1593-7d5b-4e29-ba95-545831f2ef3a	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-06-25 16:32:20.467+00
8c7b0777-acf7-49a8-8b5e-66db504f2edd	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT155M"}	2025-06-25 16:33:19.661+00
b0401243-8b52-4284-b0bb-7d6aa7812fa8	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 94, "scaled": 0.94}}	2025-06-25 16:34:19.661+00
beb782b5-8958-4fe3-a3bd-4e94375997e3	b8993c35-161c-5593-9c2a-8c6b7b4c8e5e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-25 16:41:19.661+00
3d0cb076-f1b1-483a-9fd7-c87b23afd9b9	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-25 18:11:33.441+00
d73cd557-48bc-4051-8a81-4b343c0f1cb3	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-25 18:13:33.441+00
956ef979-e856-44d9-868c-37547fab2756	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT41M"}	2025-06-25 18:54:33.441+00
8ade02c5-799c-4de9-8d6d-1e427090c268	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.69}}	2025-06-25 18:55:33.441+00
fca6b7d8-923c-4624-8d93-b23a32d4bc9e	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-25 19:03:33.441+00
67bb376a-5a39-4b07-b269-75c0ccb9ddbc	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-26 13:08:20.47+00
de498349-8f93-4b05-b6e3-5f7d98d9f864	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-26 14:30:20.477+00
1a5bd7eb-78a8-4f49-8cb7-248f0e5aaa89	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-26 14:39:20.467+00
99375e89-0f5b-4922-86a3-23b6bd6c99cf	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-26 14:43:20.467+00
38388815-6961-4e48-9413-c5504e5d3f6b	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT33M"}	2025-06-26 15:16:20.467+00
499eedcd-a24b-4077-a4b5-b497f7410052	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 10, "scaled": 0.1}}	2025-06-26 15:17:20.467+00
31cc6526-7005-4a94-aaeb-feab090eaf7c	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT49M"}	2025-06-26 15:19:20.477+00
0d91d467-7c73-44a1-aa10-33a74256aca0	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-06-26 15:20:20.477+00
1395bd29-d45f-4eea-bb50-ab27b808b643	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-26 15:23:20.481+00
f2380f11-b445-4fb5-a099-60dc88cadc6a	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-26 15:24:20.477+00
cf7fed88-595a-4247-9e95-290c4613d17e	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-26 15:26:38.039+00
b5112b24-5ace-47df-9200-a1b072eb76c4	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-26 15:29:38.039+00
ee987222-d8c2-4a73-b20d-c4cd2de7ec6d	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT159M"}	2025-06-26 15:47:20.47+00
67d272a7-4da8-4728-92dd-dae0916f9c60	1e379c7d-80fd-5fe3-a839-c46b91d223c8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-26 15:47:20.491+00
8647f2c6-d5d9-4dcd-9300-9a05bda0e6cb	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-06-26 15:48:20.47+00
b27de37d-c81b-44a8-9f1e-e940681b5abf	1e379c7d-80fd-5fe3-a839-c46b91d223c8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-26 15:51:20.491+00
66f22ef2-4abd-44dd-ba11-f61e74b046e7	1e379c7d-80fd-5fe3-a839-c46b91d223c8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-26 15:56:20.491+00
c09df0e1-d944-49a2-aa05-a51ec1a4a316	1e379c7d-80fd-5fe3-a839-c46b91d223c8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT52M"}	2025-06-26 16:39:20.491+00
8b586d89-8c73-4be0-b583-9a02cb25f6ea	1e379c7d-80fd-5fe3-a839-c46b91d223c8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-06-26 16:40:20.491+00
a36d9186-cd27-4f7f-a7d7-5d86ec2b8acc	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT400M"}	2025-06-26 22:09:38.039+00
1cb12a04-6e35-4e85-afca-de6047a1b878	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 95, "scaled": 0.95}}	2025-06-26 22:10:38.039+00
d5bcc9f1-e44a-4740-83a5-4ba153ac28c4	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-26 22:13:38.039+00
bd32aee8-0af4-461d-ae34-cc9f9aaa660c	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-27 17:21:20.477+00
2abf43d2-b00e-4b7f-b833-9a2225bc500e	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-27 17:23:20.467+00
d6837863-eb66-4e10-836a-0e9c60fd6219	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT45M"}	2025-06-27 18:08:20.467+00
74e80eae-068e-456a-bdd6-ebeb3593905e	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-06-27 18:09:20.467+00
4af9d2d8-e4d3-4aec-bf59-e30ae41f1793	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT88M"}	2025-06-27 18:49:20.477+00
9e68ef72-3514-4f88-b35b-e1787a988c3b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-06-27 18:50:20.477+00
e9a4cbdc-4eea-485e-81ad-cb311ca3be52	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-27 18:56:20.477+00
5cd377b6-1a8c-4b87-bf17-59363ee4a277	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-30 14:17:20.477+00
6a225eee-4b50-4279-bd05-7e2e4bac3da1	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 91, "scaled": 0.910697403597865}}	2025-06-27 19:51:20.477+00
a7316cb2-61dd-4948-bec7-c24d5e1e2b0e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 91, "scaled": 0.910697403597865}}	2025-06-27 19:52:20.477+00
8e19dfa4-8260-4546-ac71-106bbf3c8e67	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-06-27 19:53:20.477+00
1fb50499-44bf-4347-8a0a-95e4336d4972	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-27 19:54:20.477+00
52fae2cf-050c-4519-a0e5-30cca55558a8	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-27 20:15:20.47+00
a3a6a8f4-862b-4feb-9cc2-99bb2e617ee8	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-27 20:19:20.47+00
935b3dac-8214-48c8-a334-ce35f66e4c53	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.433375716580158}}	2025-06-27 21:55:20.467+00
d96d9fe9-91e5-4b7a-a9b4-dff37cc43966	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.433375716580158}}	2025-06-27 21:56:20.467+00
5ca2c144-97ba-4dc3-ac4d-b63dcb7ce160	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-06-27 21:57:20.467+00
1aaef0ce-612b-4f96-aa21-46f907bedba7	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT184M"}	2025-06-27 23:23:20.47+00
4fa638c0-79b8-46af-8ce3-e0cfa0087985	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.81}}	2025-06-27 23:24:20.47+00
4abcab20-e724-4af3-81db-b21cc5ae266e	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-27 23:26:20.47+00
7cf95e14-5d40-449f-9cd1-515e89cd1aea	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-28 12:52:20.477+00
5bcbfcdc-3356-472b-8deb-ff01b336ad4b	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-28 13:17:20.47+00
95fe5ad7-e4e3-4a48-89d1-91f9db474872	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-28 13:22:20.47+00
5e6d3724-47f1-45cd-9ae4-be01bbe64661	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT73M"}	2025-06-28 14:05:20.477+00
d2a2b4ce-4e35-42c4-af17-0a6f20a6f3b5	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9}}	2025-06-28 14:06:20.477+00
798f9f21-ae1c-4f67-97a4-2b9e8881f5bd	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-28 14:12:20.477+00
8b174f43-1ffd-42a9-b0ef-6445ae2d1015	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-28 14:18:20.467+00
263af057-1136-431e-8672-191a6488f61e	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-28 14:22:20.467+00
79f92ece-c38c-4ce0-88b5-7962a7a02468	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-28 14:35:17.711+00
07e34318-aa4a-435d-8479-6999d5f0c501	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-28 14:39:17.711+00
c32a898b-0503-4448-b714-0048ee0e1dee	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT37M"}	2025-06-28 14:59:20.467+00
b0cfa429-e8fe-415f-861d-e6792098c085	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-06-28 15:00:20.467+00
003001e6-bbe8-4f7c-bfde-a0575ed7569e	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-28 15:03:20.467+00
b402cc10-fd34-4d80-a5c0-5653216e0c72	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-28 15:39:20.481+00
674ac7fc-b976-46f6-a768-bee06427185f	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT191M"}	2025-06-28 16:33:20.47+00
f3aca71c-14de-43e2-b41e-c3340db5502e	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-06-28 16:34:20.47+00
b33b39d3-acc0-4e43-af13-4aaffcdfcb9e	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-06-28 16:36:20.481+00
28f0f7aa-c392-4dfc-87f9-a151ba54f4c8	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 15, "scaled": 0.15}}	2025-06-28 16:37:20.481+00
cb9d5cf1-9a01-481c-9cf1-03a018ffae66	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-28 16:44:20.481+00
e80d8f9a-fba3-4698-95db-e5d858d08496	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.5516569915660616}}	2025-06-28 17:47:20.467+00
bc351982-aff4-42ec-b81a-12142e54477b	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.5516569915660616}}	2025-06-28 17:48:20.467+00
ac209cd4-657d-44b4-bbec-379068017066	65861570-f509-5228-a69f-731f35318a06	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-06-28 17:49:20.467+00
ba30f84c-5036-4dcf-8942-6da2f1ed953e	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.648097825718386}}	2025-06-28 18:14:20.47+00
f1f7c400-b267-4e14-b573-b793368909fa	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.648097825718386}}	2025-06-28 18:15:20.47+00
5e2b7b6e-db18-47b5-98c7-18adf34d9608	a39e581a-a948-5af5-ad61-b2b0030fb824	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-06-28 18:16:20.47+00
786f4623-4a5c-451f-9705-d7a57bc3d007	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT234M"}	2025-06-28 18:33:17.711+00
6cc9767e-39e9-49cf-8558-ab6d94eabbba	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-06-28 18:34:17.711+00
847ab50c-0ff1-4e2e-a5b8-07610de59331	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-28 18:37:17.711+00
db535770-6974-41cb-8279-aaba16e95e02	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-29 16:39:20.477+00
b2ec4639-b92e-437b-a808-addf27c23788	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT73M"}	2025-06-29 17:52:20.477+00
26500554-bdf2-4e98-9a75-12676988671b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 93, "scaled": 0.93}}	2025-06-29 17:53:20.477+00
59ebaa26-6cab-4bf4-b4c2-49fcf068000b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-30 09:20:25.326+00
fe5322be-f969-46f1-abc4-1cc4783ea9f2	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-30 14:47:58.317+00
6a5597d7-380d-4095-a3c1-684cd04c61fa	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-30 14:52:58.317+00
f62be97b-087e-4bbd-b4cb-d744ede6bb6f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT100M"}	2025-06-30 15:57:20.477+00
82cdb025-9a06-4293-ac46-18f4e2d6fb9b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 93, "scaled": 0.93}}	2025-06-30 15:58:20.477+00
76bd8055-d61c-4122-bf51-baee10065ea2	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-30 16:06:20.477+00
906ba6a8-18ef-426b-aea0-b149628eac95	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-30 16:39:20.481+00
8747f3ca-72bd-4bbc-88a8-ae2885ef6768	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT105M"}	2025-06-30 18:24:20.481+00
74407b04-9552-420f-8062-58785da6bafe	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-06-30 18:25:20.481+00
22167a9d-0be3-43fb-8f7d-5153b5268cf3	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-30 19:46:20.467+00
ca1c2c28-1a6b-4a91-88e0-3c653210627c	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-30 19:51:20.467+00
cc28db04-9ec1-4524-8fcb-fc50a18c8995	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT337M"}	2025-06-30 20:29:58.317+00
47ec2670-8bee-4eda-8e34-618a574203a3	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-06-30 20:30:58.317+00
c046d461-b745-441f-b3f9-ac342e91b14b	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT43M"}	2025-06-30 20:34:20.467+00
006f57bb-3ec8-475d-9580-888ca4770366	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-06-30 20:35:20.467+00
914b351c-4609-4845-91dd-e2d146d844df	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-30 20:38:58.317+00
64f8707e-b876-496b-965a-2028e2a745d1	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-01 12:52:20.477+00
0efb5608-e4fc-4d9a-873f-edcb20b26571	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT79M"}	2025-07-01 14:11:20.477+00
506941b5-6674-4359-9f70-6c933145a529	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 96, "scaled": 0.96}}	2025-07-01 14:12:20.477+00
4bbec521-c6ec-4ccb-8107-e0fd9f556958	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-01 14:21:20.477+00
270fe773-ef6f-4028-9666-085851376623	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46363539914856716}}	2025-07-01 15:01:20.477+00
c5b04220-1652-4e8a-bb10-6091ec4cecae	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46363539914856716}}	2025-07-01 15:02:20.477+00
9055d36d-31f9-4930-b72f-70d764008b17	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72}}	2025-07-01 15:03:20.477+00
818efd53-a91b-4fab-8f4c-cfc6399e518e	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-01 18:03:20.467+00
93f7d6ec-ea35-44eb-8ec0-cbb541eb5e1a	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT43M"}	2025-07-01 18:46:20.467+00
bd077aee-bad1-4d5e-a1ab-a59b8853f7e2	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 21, "scaled": 0.21}}	2025-07-01 18:47:20.467+00
9c4ff93c-008a-40d1-9d6f-636459a8b1d1	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-01 19:18:20.47+00
3d48e7d2-d973-4fa9-9416-9d5e23fccd11	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT201M"}	2025-07-01 22:39:20.47+00
c2ce4130-fa3e-471e-9ac1-ebd830a6d0e2	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 98, "scaled": 0.98}}	2025-07-01 22:40:20.47+00
6a077585-3352-4d38-b143-8b363c35a59b	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-01 22:45:20.47+00
a1ff09fb-a5d3-4ee7-8c21-7a11ec57fcc8	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-02 13:36:20.477+00
25549121-b73a-4179-91df-4c4db7c19928	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT85M"}	2025-07-02 15:01:20.477+00
24fc7cda-b837-4b8b-a3d8-12ab2e0fc15e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.84}}	2025-07-02 15:02:20.477+00
31c35fcf-8b3a-490f-b64d-bd27e756a9ed	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-02 15:06:20.477+00
ab4190af-0918-4015-9333-8ba36bb7d737	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-02 15:57:03.926+00
fae5b891-0ae0-4928-a463-62a24b918afb	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-02 15:59:03.926+00
bc9bc823-86dc-4d60-a464-327d593de76d	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-02 18:29:20.467+00
ac461495-7e1b-46a1-af67-81acb96bb4d2	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT38M"}	2025-07-02 19:07:20.467+00
51007b12-586b-4f84-bada-bf2aa74ac7da	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-07-02 19:08:20.467+00
6692dedd-8ec1-4aaa-a4d9-33bdf6fd6165	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-02 19:26:35.341+00
cafe2d8b-5dbf-4f99-9e42-cf136089c038	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT26M"}	2025-07-02 19:52:35.341+00
2d0a1b29-a8ca-4765-bdab-b81775c7be98	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72}}	2025-07-02 19:53:35.341+00
2874c71a-782e-4885-a531-31a3788025a1	2457fc99-9240-5207-8740-05d01be3946e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-02 19:54:20.481+00
d6794f03-3a7b-44ca-85a7-77b343fffa3e	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-02 19:58:35.341+00
9965eec5-f8c0-48ad-9ab6-bb841a9f2210	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT267M"}	2025-07-02 20:26:03.926+00
633112ac-fd9d-418a-9a38-52c392c1aa4f	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-07-02 20:27:03.926+00
73cf54d0-9cca-41a0-9759-fc684139d2b6	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-02 20:34:03.926+00
a3bb0128-4983-4ac1-a627-1ce1d3ebf4cc	2457fc99-9240-5207-8740-05d01be3946e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT73M"}	2025-07-02 21:07:20.481+00
76bbd7e6-e3c2-4881-b7d0-6370c5796c96	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT157M"}	2025-07-06 17:43:20.47+00
b2a862f8-4d41-437d-862d-a190e732a3b7	2457fc99-9240-5207-8740-05d01be3946e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-07-02 21:08:20.481+00
7037517a-9725-40bd-b355-726d823be8c3	2457fc99-9240-5207-8740-05d01be3946e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-02 21:13:20.481+00
00192282-87ce-41ec-b042-0129c8e58e9c	2457fc99-9240-5207-8740-05d01be3946e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-02 21:22:20.481+00
c07d2ca8-3614-4c4b-a09a-56edf6702c58	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-03 15:19:20.467+00
1c28b503-5da7-4502-9bea-f9b967bdd400	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT41M"}	2025-07-03 16:00:20.467+00
660725bb-ec85-49bc-b692-5c967bd203e6	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.38}}	2025-07-03 16:01:20.467+00
ca1102ef-9e4f-465a-9645-b432a8665508	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-03 19:11:20.481+00
17edd9f4-fabe-42a2-a552-ef26836d9228	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-03 19:23:20.47+00
ae9214dd-eca6-40b8-a3ab-c97b90595346	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-03 19:28:20.47+00
a702f15d-31d1-43de-ab2d-48bf661ec656	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.5205062906068396}}	2025-07-03 20:03:20.481+00
c390ec24-5dd4-49c0-8f9b-bcb6e3d2350e	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.5205062906068396}}	2025-07-03 20:04:20.481+00
614f8227-0467-44a2-90c0-9e7795ae8771	2457fc99-9240-5207-8740-05d01be3946e	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42}}	2025-07-03 20:05:20.481+00
00db3e3e-ac48-40e4-ac40-b0971bf18fd6	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT190M"}	2025-07-03 22:38:20.47+00
98dda0f8-8862-49fe-810b-381c29c63197	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-07-03 22:39:20.47+00
0b132b1d-d19c-47e8-85d2-d67182e058c5	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-04 12:49:20.477+00
96009ab8-eeff-4356-b52e-1a82eafcc1ea	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT45M"}	2025-07-04 13:34:20.477+00
c32648e6-6d54-4f00-920a-3d1b4f543e07	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-07-04 13:35:20.477+00
d4bd1cb4-a127-4ff1-990d-2110c55a78b0	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-04 14:03:12.942+00
80fad55a-97e9-4e19-aa7c-0527c9a062ae	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-04 14:06:12.942+00
a6f70158-2b78-4695-b84c-a8eadc5f875e	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-04 16:23:20.467+00
8df1b6ff-2f2a-429d-880a-300fc0d75c39	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-04 16:27:20.467+00
f7d3d1e9-a8da-49cd-9034-349015c20a99	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-07-04 17:14:20.467+00
737b0096-50d2-4487-85fb-fbd07b17a47f	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43}}	2025-07-04 17:15:20.467+00
5cdb6563-00d5-4727-9cfc-bf517b42381f	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT222M"}	2025-07-04 17:48:12.942+00
87fe5d11-cbfe-4bf8-91a8-9b76f680141c	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-07-04 17:49:12.942+00
8b3ca44a-169c-4842-98c8-e2e9701e928a	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-04 17:58:12.942+00
9aa2b2bb-6edf-4946-83bd-3287c69e0464	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.7979782250012428}}	2025-07-04 20:06:20.467+00
f8fd8491-e90f-4a98-950e-7a7894ac25b6	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.7979782250012428}}	2025-07-04 20:07:20.467+00
ad138741-20b8-4b20-9d43-f4850d98f779	65861570-f509-5228-a69f-731f35318a06	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 12, "scaled": 0.12}}	2025-07-04 20:08:20.467+00
2c540cbb-74ee-4655-94af-d72fdbed20fe	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-05 10:53:02.328+00
c07947cf-e6f9-42ac-9ed7-2e590801b6f8	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-05 18:38:20.47+00
aed2df22-020d-41cb-9ade-cabd0f76468b	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.4830340904895347}}	2025-07-05 19:07:20.481+00
e803c7de-dfa0-499e-9213-c19a02cf06a4	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.4830340904895347}}	2025-07-05 19:08:20.481+00
de00e444-9975-4752-be3a-dd0196543fdc	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.77}}	2025-07-05 19:09:20.481+00
244d9596-a9a7-4de7-83f0-4ba055396f6b	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-05 19:11:20.481+00
c91a1c59-b99c-47ce-94e7-246f15898061	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT211M"}	2025-07-05 22:09:20.47+00
92f38161-4e37-41ef-9ea0-6e138ae3709b	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 15, "scaled": 0.15}}	2025-07-05 22:10:20.47+00
23e5ad30-c8e2-4483-af70-8cbed55cfe96	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-06 12:27:20.477+00
f0cfa995-b0b5-44d5-9bce-48e9de78c4bc	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT51M"}	2025-07-06 13:18:20.477+00
58180577-7b43-491b-8cdb-f5f128b2817a	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41}}	2025-07-06 13:19:20.477+00
c288e1be-6e38-48c6-a665-525cbd08d62c	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-06 13:28:20.477+00
2c30c560-4ee8-423e-a99f-9c3df5d972dc	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-06 15:06:20.47+00
97fa791f-ed9d-4279-8e5e-5ed787e85b6d	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-06 15:56:07.293+00
c127609e-36db-4d82-b437-03857fe649a4	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-06 15:58:07.293+00
e2a52177-9d03-416d-a771-8b361987bd07	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-06 17:35:20.467+00
10204842-63f7-47f7-b081-dc5b62428ba6	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-06 17:39:20.467+00
1fb64694-61b6-4abd-ae61-545ba30e142f	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-07-06 17:44:20.47+00
27231fc6-bfcb-441f-9aac-5b22e16d9080	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT44M"}	2025-07-06 18:23:20.467+00
95ff6066-24df-4e30-9f27-6cf66c8c1ce8	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 3, "scaled": 0.03}}	2025-07-06 18:24:20.467+00
403cfd0b-81b0-4924-bf1e-091d06819475	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT206M"}	2025-07-06 19:24:07.293+00
3620f6c2-5689-474f-86be-205435780fd7	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.89}}	2025-07-06 19:25:07.293+00
d20d2171-c853-4828-9d62-59b9f0f43f74	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-06 19:34:07.293+00
08571e47-093f-40b0-9f47-7cfa7912a767	2457fc99-9240-5207-8740-05d01be3946e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-06 20:16:20.481+00
b5e44949-7d8e-4064-86a6-ce881550dee4	2457fc99-9240-5207-8740-05d01be3946e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT74M"}	2025-07-06 21:30:20.481+00
3a52d89d-8c51-4233-9e2e-dc482368d8a6	2457fc99-9240-5207-8740-05d01be3946e	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.99}}	2025-07-06 21:31:20.481+00
1fe415ae-b140-4ea8-9f27-87f7430dc083	2457fc99-9240-5207-8740-05d01be3946e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-07 15:11:20.481+00
861455fe-7554-4e0b-a6ba-54e8e3e405d9	2457fc99-9240-5207-8740-05d01be3946e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT61M"}	2025-07-07 16:12:20.481+00
8f142e05-eb62-49cd-b636-dcf3dd51276a	2457fc99-9240-5207-8740-05d01be3946e	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-07-07 16:13:20.481+00
e94f2723-2fe1-425d-ada8-94ed4003719e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-07 16:48:20.477+00
5fdfc6c3-4e35-4603-bf9d-c411b6aba0ec	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT51M"}	2025-07-07 17:39:20.477+00
932621c7-86a3-432c-b78d-012f3a404576	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.87}}	2025-07-07 17:40:20.477+00
b9787245-db67-458c-9437-592ab339ed1d	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.481668382981019}}	2025-07-07 18:15:20.477+00
2a15cd52-9ed9-4225-8717-d6db1b41862f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.481668382981019}}	2025-07-07 18:16:20.477+00
778e7eb3-912b-4cde-b32a-63286e5e4cd9	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 96, "scaled": 0.96}}	2025-07-07 18:17:20.477+00
3407c284-894f-42d4-8929-8bccdc8966da	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-07-07 18:20:20.477+00
ab19ff42-8b96-4154-a8fb-d3228001e54d	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-07 18:28:20.467+00
ec1faf21-8597-4443-8207-404d37f1b651	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-07-07 19:15:20.467+00
2708acd3-4fc3-453f-9837-d25d9923696c	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.32}}	2025-07-07 19:16:20.467+00
3c06a4d8-a877-4845-86b4-57f004b4abf4	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-07-07 19:18:20.467+00
c1461ff8-84f2-43aa-8b3b-42f9a898a442	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-08 13:35:20.47+00
162e6fb9-95d3-48da-a929-8ebed16df025	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-08 13:36:20.477+00
2cc0aa6e-8361-4cee-ae7b-d5a71298c954	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT69M"}	2025-07-08 14:45:20.477+00
f8c8d958-3b70-428a-b023-ebc175b85c95	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-07-08 14:46:20.477+00
2e021d94-1c57-4e79-bfb8-749ef9bc7c93	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 97, "scaled": 0.9777446050044722}}	2025-07-08 15:18:20.477+00
3482ef17-d09e-4b18-85f8-d5cb92a45601	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 97, "scaled": 0.9777446050044722}}	2025-07-08 15:19:20.477+00
e5ae6126-ec09-4a74-af74-58315ad29952	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56}}	2025-07-08 15:20:20.477+00
291de8b4-b2bd-405c-88ac-82787e42830e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-08 15:22:20.477+00
94ea8bec-d8ea-4ca8-ad5c-16ec82265f55	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-08 15:46:06.21+00
7b60689a-3e1a-4e46-8f94-c2da24d274fa	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-08 15:50:06.21+00
6518b593-f04f-43de-bc26-11a29ef706e3	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-08 16:01:20.467+00
8cb8e204-9f49-43f0-92b1-eb35e2757fdb	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT159M"}	2025-07-08 16:14:20.47+00
2eabb5d6-915f-4724-868b-87a683e0abd6	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 17, "scaled": 0.17}}	2025-07-08 16:15:20.47+00
b256293b-17f2-44d0-90ff-ab77cd807b34	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-07-08 16:19:20.47+00
2e0758ef-3c0d-48e9-8a69-529c9fa15dc0	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT50M"}	2025-07-08 16:51:20.467+00
73611a85-9761-4a53-97f3-97e3f3f1af60	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 4, "scaled": 0.04}}	2025-07-08 16:52:20.467+00
78ebc455-0349-4355-9970-260546054d8e	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-08 16:57:20.467+00
92718ce5-69d3-4378-bfcd-f3aafe084823	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 73, "scaled": 0.7373041129230626}}	2025-07-08 17:59:20.47+00
46d2c8c3-634b-4a8a-9380-ba23cec0f3c9	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 73, "scaled": 0.7373041129230626}}	2025-07-08 18:00:20.47+00
88d629b3-723b-470a-9ff8-097596ef923a	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT46M"}	2025-07-14 18:49:20.467+00
85e76253-9830-4176-aec6-235ba9511402	a39e581a-a948-5af5-ad61-b2b0030fb824	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 23, "scaled": 0.23}}	2025-07-08 18:01:20.47+00
589324ef-038c-4bbe-9aa2-b615d567f816	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT288M"}	2025-07-08 20:38:06.21+00
d28ee24e-f707-4193-a82c-a1af4531e7f1	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.57}}	2025-07-08 20:39:06.21+00
4f9de61e-bad9-4422-8a3e-9f39c74b0135	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-08 20:43:06.21+00
6d4634ee-83d5-4451-b9f5-21080c5d6e34	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-09 12:33:33.951+00
416c9e01-cc28-4f14-9157-03c775da9c35	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-09 12:36:33.951+00
9e2ec7b9-0a65-4d38-bf72-91cbac848ec5	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT14M"}	2025-07-09 12:50:33.951+00
fc3a7bf4-91ab-4f72-ab50-59b3027b814f	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-07-09 12:51:33.951+00
e592adf6-543e-4bab-973f-13b8ca9bf8bf	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49856280595349844}}	2025-07-09 13:44:33.951+00
a86ebe9a-ce2f-47b9-a32a-67d02c55de79	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49856280595349844}}	2025-07-09 13:45:33.951+00
7c589ec6-e810-4679-85ec-640ccdc81e75	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-07-09 13:46:33.951+00
7bb8380a-9342-42d0-bdb5-f107747411b3	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-09 15:48:20.467+00
48b4ae14-f482-414e-bae6-5ae93041dbf2	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-09 16:15:20.477+00
5de34b3e-a6cc-45d1-b549-5ed7acac4433	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT37M"}	2025-07-09 16:25:20.467+00
7ace3aca-2278-4e64-88a2-e8c4a3826e75	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72}}	2025-07-09 16:26:20.467+00
c7cef560-9bed-4b31-b2f7-3c42dca1b3ed	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-07-09 16:30:20.467+00
b7f463e4-afe2-4675-885b-94f824718e07	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-09 16:42:20.481+00
6f7a6bda-63c2-4205-bde3-edd4439e1125	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT76M"}	2025-07-09 17:58:20.481+00
9a9ef130-bd6d-47f3-a7eb-d6fa47b05bd6	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.86}}	2025-07-09 17:59:20.481+00
919b0d17-00a0-4c48-a9a4-3404db56da47	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.7462171391564942}}	2025-07-09 18:30:20.467+00
7708afa0-af12-4049-b386-756012eef065	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.7462171391564942}}	2025-07-09 18:31:20.467+00
f732b7b2-215c-4394-bf3e-2bbe9325349b	65861570-f509-5228-a69f-731f35318a06	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 93, "scaled": 0.93}}	2025-07-09 18:32:20.467+00
a3adb894-2b43-448e-a544-50fc9c74a295	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.3577596891557392}}	2025-07-09 18:36:20.481+00
b366c2ab-ab45-49df-b819-c0742c67a4fc	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.3577596891557392}}	2025-07-09 18:37:20.481+00
c39eb18c-0d1c-4d5c-a376-0582a0478ca1	2457fc99-9240-5207-8740-05d01be3946e	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-07-09 18:38:20.481+00
c8265da3-4215-4ae5-85d0-25ddafc4dd02	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-10 12:23:20.477+00
eeadda9b-4b26-436f-86d8-50c658c8dc7e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT41M"}	2025-07-10 13:04:20.477+00
0ac2f57b-a913-4d18-9d00-5196898c55af	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 97, "scaled": 0.97}}	2025-07-10 13:05:20.477+00
162d166b-33fa-47d5-bf0e-97655ecb1d40	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-10 15:09:14.313+00
73f7ee28-8857-45b2-a649-58fe60a8fa09	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-10 15:12:14.313+00
ed47ef7e-8bb6-4e10-8587-4d44c30d4e03	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT386M"}	2025-07-10 21:38:14.313+00
f6d12a44-b78b-492e-80f5-7f1713ee42d1	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.6}}	2025-07-10 21:39:14.313+00
5289b8ba-27e9-4926-b7e7-8646f45f49f4	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-10 21:45:14.313+00
ff81d4ef-b333-41b5-b5d8-ec4ee889fbae	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-11 11:21:20.477+00
cc9cacc2-1b7e-46dd-86f0-401336d61fdf	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT38M"}	2025-07-11 11:59:20.477+00
3f552328-3bb7-45e4-920e-a6aba86dcf73	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-07-11 12:00:20.477+00
789de97d-0171-479d-a39d-bf10ff6178eb	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-11 12:08:20.477+00
7a1b15d9-a08b-41d4-964c-70897216c23a	2457fc99-9240-5207-8740-05d01be3946e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-11 14:38:20.481+00
aeb34cb2-2def-4435-a737-e556d79c3ee9	2457fc99-9240-5207-8740-05d01be3946e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-07-11 15:25:20.481+00
11cedbe4-d72d-4e19-ba71-a4093eb2c5fb	2457fc99-9240-5207-8740-05d01be3946e	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 15, "scaled": 0.15}}	2025-07-11 15:26:20.481+00
142743f0-3ea6-47b1-901e-98c41ae78d63	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-11 17:40:20.467+00
3ecaeec7-f7e4-41c5-986a-162d9b204976	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-11 17:44:20.467+00
4dacb23b-8468-458f-8000-6fb69374b70d	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-07-11 18:31:20.467+00
edfbee04-07b1-4d95-a1e8-dddd7d0a88b1	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-07-11 18:32:20.467+00
51e8abba-3ecf-4dea-b1b3-37df44e4b707	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-20 11:16:20.477+00
073e6e3e-4771-43a0-8ea6-f6d283d27436	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-11 18:35:20.467+00
820181ab-0a11-4a16-b8de-f9d18cf2fd8e	a39e581a-a948-5af5-ad61-b2b0030fb824	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-11 19:09:20.47+00
eb55bf62-f24d-4711-9e25-3ee341df954a	a39e581a-a948-5af5-ad61-b2b0030fb824	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT152M"}	2025-07-11 21:41:20.47+00
1718e617-365b-42c2-9a04-8cac267ed8e1	a39e581a-a948-5af5-ad61-b2b0030fb824	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-07-11 21:42:20.47+00
385019f6-b81a-4ed2-80fb-6b5ac231dc4f	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-12 14:16:24.001+00
2ffe0f5b-5794-46f9-8e57-831e31f2d2fb	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-12 14:20:24.001+00
02d9de75-3951-4b4c-86ab-01c70f041682	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-12 14:51:20.477+00
5080c3eb-9165-43ca-8570-fd2dd7e31506	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT38M"}	2025-07-12 15:29:20.477+00
31515358-68bc-4057-a161-951548e40e42	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-07-12 15:30:20.477+00
84d7cbad-f743-4c3b-9bf2-af31de48c778	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-12 16:38:20.467+00
d18873d0-5dfa-4cf4-aa00-6481a427f7de	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT49M"}	2025-07-12 17:27:20.467+00
44cedcd9-16a7-4e54-bd41-99f584ccc2a6	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-07-12 17:28:20.467+00
1139af76-72e1-478f-bbb8-372595685591	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT252M"}	2025-07-12 18:32:24.001+00
a343f939-d4b0-4580-b16c-ac0ac8d9b846	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39}}	2025-07-12 18:33:24.001+00
98f0f2ad-ebee-4274-978c-fa4be14062fd	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-12 18:37:24.001+00
4bf2c14c-a275-4c94-9ee8-db429e1ac524	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-12 19:40:20.481+00
ca843a4e-48e5-41b5-848c-3a4d013bfb0d	a39e581a-a948-5af5-ad61-b2b0030fb824	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-12 20:21:20.47+00
7c94a7c8-d5f3-4bdb-9b78-65a8c54e9d82	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT66M"}	2025-07-12 20:46:20.481+00
bdb469e8-c570-47fb-a49d-b3dcdff6cd5a	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-07-12 20:47:20.481+00
dee001c2-19f4-4ceb-9f7d-1792cca03daa	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.6593590476728468}}	2025-07-12 21:12:20.481+00
9a1a78db-431c-439d-8ed8-1e7baee0d8e0	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.6593590476728468}}	2025-07-12 21:13:20.481+00
3c6e2812-7ad0-4a17-8ad7-60d9127d086e	2457fc99-9240-5207-8740-05d01be3946e	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.77}}	2025-07-12 21:14:20.481+00
63de75ed-bdf3-4877-8662-5778081bc3c1	a39e581a-a948-5af5-ad61-b2b0030fb824	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT146M"}	2025-07-12 22:47:20.47+00
ded77031-fef5-47cf-9517-3d0a30bd1163	a39e581a-a948-5af5-ad61-b2b0030fb824	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.81}}	2025-07-12 22:48:20.47+00
965cc281-e7e2-4dec-86cd-49e16b710cb3	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-13 12:02:20.477+00
f8e2c5e7-dd33-4566-9010-7d21e5064c85	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT44M"}	2025-07-13 12:46:20.477+00
c1204521-9afe-4fac-bb4b-d3019d6ec4e8	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.82}}	2025-07-13 12:47:20.477+00
c2f37b51-059c-48a6-9223-32191129f8f1	a39e581a-a948-5af5-ad61-b2b0030fb824	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-13 16:26:20.47+00
d5bbc583-5c9a-4310-83ba-67262e22b029	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-13 17:51:28.173+00
5a0117b0-36da-498c-b90c-0e9451bc9626	a39e581a-a948-5af5-ad61-b2b0030fb824	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT160M"}	2025-07-13 19:06:20.47+00
110a0e0c-59e5-40b1-9285-173957470451	a39e581a-a948-5af5-ad61-b2b0030fb824	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-07-13 19:07:20.47+00
f50972af-ff12-42ef-bf45-27034736f066	a39e581a-a948-5af5-ad61-b2b0030fb824	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-13 19:08:20.47+00
7f3c44b1-85f3-435b-abd7-7e15e3cf2e11	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-13 19:11:20.467+00
de7ffcb1-92dc-4d10-98b7-9b7939f77bb7	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-13 19:15:20.467+00
90e55ace-2908-4418-89f8-5312bcbed2a9	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT46M"}	2025-07-13 20:01:20.467+00
20acaeaa-efd2-4465-bed1-5b4ab4e77358	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.69}}	2025-07-13 20:02:20.467+00
4fa29c40-2123-4d2d-a998-b77c8026d710	a39e581a-a948-5af5-ad61-b2b0030fb824	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.6281420568210144}}	2025-07-13 22:06:20.47+00
cae34359-9bbf-4e9b-b3c6-9ea42125c6a7	a39e581a-a948-5af5-ad61-b2b0030fb824	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.6281420568210144}}	2025-07-13 22:07:20.47+00
6d87b348-63eb-4b06-8185-253fb251055a	a39e581a-a948-5af5-ad61-b2b0030fb824	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-07-13 22:08:20.47+00
62247fa0-bc8d-4050-84ce-91f34e1bbf42	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-14 15:45:21.464+00
9fbe05f3-900f-4a0c-9090-342d2c5e6826	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-14 15:50:21.464+00
100ff93d-36b6-4b01-bdcf-dffbca1ed25d	2457fc99-9240-5207-8740-05d01be3946e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-14 16:43:20.481+00
c4ab3b22-b9c9-4877-9620-76af0560b5cd	2457fc99-9240-5207-8740-05d01be3946e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT69M"}	2025-07-14 17:52:20.481+00
4897eac6-06e4-41da-a00c-4e0afef44bb7	2457fc99-9240-5207-8740-05d01be3946e	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-07-14 17:53:20.481+00
b4089419-5a4e-46a3-a846-3b3953fd30f5	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-14 17:59:20.467+00
724da36f-024f-4221-9c36-59b65b71bcbe	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-14 18:03:20.467+00
6d011c8d-9041-42c0-85d5-16f5108cab98	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09}}	2025-07-14 18:50:20.467+00
c4ebf89d-0796-42b5-b781-4840d326f4e1	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT362M"}	2025-07-14 21:52:21.464+00
9b3c8193-3bd9-4b59-a4a2-886d60d5c7d1	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 93, "scaled": 0.93}}	2025-07-14 21:53:21.464+00
35b94a7e-8d6d-4aea-936f-8e2c3d59bde6	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-14 22:02:21.464+00
bb79465c-4371-4a10-8854-6c316ec61310	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-15 14:37:20.467+00
a262f2a3-98c0-4bc3-986b-9e39a0170c85	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-15 14:47:20.477+00
f801017e-1e15-4774-a2ad-98cf1c6bc414	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-15 15:06:20.47+00
b9a6a004-4c39-48a4-9727-464222fcdec3	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT41M"}	2025-07-15 15:18:20.467+00
2933c13b-294e-40fb-98d2-249e1c0eea71	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.51}}	2025-07-15 15:19:20.467+00
158e320f-c9db-42ce-ba23-57562b632c5a	2457fc99-9240-5207-8740-05d01be3946e	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-15 15:26:20.481+00
fb2b153a-86da-4e82-9c2b-891cf75bfb48	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT58M"}	2025-07-15 15:45:20.477+00
183fd59e-a292-4a8d-8e54-d39e5a6daaec	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09}}	2025-07-15 15:46:20.477+00
da4fc2f1-e290-470c-9aa9-296f2eb4abed	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-15 15:52:20.477+00
90247d83-65bd-4ada-8c00-47a06f9838a2	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.6701556310421004}}	2025-07-15 16:23:20.477+00
71b88605-26db-45de-8fe6-8a78b42ec474	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.6701556310421004}}	2025-07-15 16:24:20.477+00
eac0be1a-1645-4d71-a4af-b352f88d3244	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-07-15 16:25:20.477+00
d8e0dc37-1899-4919-bf71-054b0218cd02	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT154M"}	2025-07-15 17:40:20.47+00
d33699e9-08e6-4f0a-9c12-1301c79b524a	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-07-15 17:41:20.47+00
e5dfe933-ce40-4e83-badf-34b4574282e2	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.7184904029543668}}	2025-07-15 17:52:20.467+00
12a1a737-1440-48c0-80ae-b6d77e18c781	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.7184904029543668}}	2025-07-15 17:53:20.467+00
2125fa9b-69a9-4899-92f7-62780025dd68	65861570-f509-5228-a69f-731f35318a06	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 5, "scaled": 0.05}}	2025-07-15 17:54:20.467+00
6142b65e-4d20-45ae-938f-ff105771b516	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-16 09:32:22.077+00
f9584904-a156-47ff-b96b-1691db570d5b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT39M"}	2025-07-16 10:11:22.077+00
22a11056-20f1-4b55-bbb0-a4e4ce9d7cae	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.99}}	2025-07-16 10:12:22.077+00
ffb71cc3-71ff-432c-9969-29ed688e832c	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-16 10:14:22.077+00
18739be8-a68a-4095-984c-064b3ee885ac	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-16 11:07:20.477+00
91ec0c2e-8784-4f79-8174-6dff7c4c62f9	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT73M"}	2025-07-16 12:20:20.477+00
fd2d5877-c7aa-4ac9-8e6d-d3ce57dac269	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 3, "scaled": 0.03}}	2025-07-16 12:21:20.477+00
f1075b2b-9343-4a11-92ec-f4536a7f664d	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-16 14:57:55.73+00
a75c966f-540b-4d5a-be2c-259f56af43c0	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-16 15:01:55.73+00
23bdd499-4444-47ec-a911-b2f74e8cde98	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT233M"}	2025-07-16 18:54:55.73+00
6853b8f5-6081-46e2-954a-d1265aefc05c	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 10, "scaled": 0.1}}	2025-07-16 18:55:55.73+00
470c635a-b5aa-4ee7-8cb1-20e8690fb7a0	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-16 19:01:55.73+00
0f31647a-b9dd-4991-8978-030f0dc91f7f	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-17 14:30:33.163+00
f93e3e75-7ea1-4c6b-bc98-3910e75f4c05	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-17 14:34:33.163+00
69eb13ee-9c2f-4dbc-97a3-31c33666bd5b	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-17 15:55:20.467+00
c703dbb1-c326-487e-bb87-81653be5361c	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-17 16:14:20.47+00
79bd0fe9-99c7-4919-93a9-7c1f7ca2fb23	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT38M"}	2025-07-17 16:33:20.467+00
d7b7f6a3-832f-407d-b210-22403bf4e2ec	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-07-17 16:34:20.467+00
17611937-575a-4b0d-bcbe-37e2b8f16e7f	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT214M"}	2025-07-17 19:48:20.47+00
3edce14b-79dd-4da9-aa00-071e18e87eff	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-07-17 19:49:20.47+00
7615a547-1877-4622-8625-c0b8a5890533	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-17 19:58:20.481+00
941af71b-bb68-4ca3-a2b3-e6266d30331f	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT393M"}	2025-07-17 21:07:33.163+00
868d0069-9235-4888-a770-6646f6643e0d	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-07-17 21:08:33.163+00
f68691f0-bfe3-4476-b6b7-b9fd2afd8f56	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-17 21:13:33.163+00
0f0d0ae0-65a3-4ad3-9456-f8f02a6c7f26	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT107M"}	2025-07-17 21:45:20.481+00
96565010-8aef-46e7-94e5-c9618b81b9db	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42}}	2025-07-17 21:46:20.481+00
dfddc01a-28a8-4694-8413-ce7b956b49b1	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-17 21:52:20.481+00
be57ee33-74e1-4b58-aee0-658f47db1289	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-17 22:07:33.163+00
874c0354-5784-4fa0-ae2d-74ed2506b111	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-17 22:08:33.163+00
307b886d-279d-4d6b-a181-56f15e980bfd	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-07-17 22:09:33.163+00
2d63daf0-bacb-40fb-a96a-212f95622e9a	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-17 22:10:33.163+00
214e56c0-480d-4bff-9101-c7b216a814fb	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-18 13:19:20.47+00
091874ab-fea4-44f6-8742-b5f8095cc295	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-18 15:06:20.477+00
85476515-8d8f-4cfa-b2f3-14df658b9054	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-18 16:18:20.467+00
04c6e79b-fd87-43c8-b54c-9eda06e885a0	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT180M"}	2025-07-18 16:19:20.47+00
eb54e2ad-c063-4e6b-93c7-1eaa823bf1bc	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 2, "scaled": 0.02}}	2025-07-18 16:20:20.47+00
2b9df7a2-4bd6-4e2a-ab47-257f3248047a	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-18 16:23:20.467+00
1a6b8f24-d1f1-424f-846d-58ec2a95bd30	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT50M"}	2025-07-18 17:13:20.467+00
69b10e19-dce3-4260-93c2-184072afaa04	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-07-18 17:14:20.467+00
aae0ba4d-5a14-4661-affa-e372294ea144	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-19 14:32:20.477+00
6d1e6033-0d9e-417e-aac4-2a561c4d8e87	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-19 15:45:44.403+00
87678159-fbe6-45d2-bb3f-47dbb0f719b6	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-19 15:48:44.403+00
da82e387-60ea-4a40-ba8c-659b918201a7	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT94M"}	2025-07-19 16:06:20.477+00
2fed39a8-4391-403c-b973-2e533f61ea60	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-07-19 16:07:20.477+00
0940794a-6bfd-4c8d-948e-9858a01e091d	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-19 18:06:20.481+00
d02aec5e-9fbb-4790-a01b-52d68fbda336	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-19 19:10:20.467+00
89ce5e02-25ee-48fe-871d-aa3af18c5a2b	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT78M"}	2025-07-19 19:24:20.481+00
7f0d0dfc-6855-4351-8a6f-4483105de680	2457fc99-9240-5207-8740-05d01be3946e	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 91, "scaled": 0.91}}	2025-07-19 19:25:20.481+00
4d41552e-da13-4685-abc6-6f6bba995f44	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT39M"}	2025-07-19 19:49:20.467+00
ba47f4ac-b734-497b-bbf0-37610dbe7773	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 27, "scaled": 0.27}}	2025-07-19 19:50:20.467+00
ff43334a-681f-447b-8294-485d26de971d	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-07-19 19:51:20.467+00
5e52c29f-4d88-4f00-a3b7-8878cb7b3f40	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-19 20:03:20.47+00
418e20db-813d-4a83-9594-5b7ba729d9e2	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-19 20:06:20.47+00
51c4175e-9346-4e69-a0a3-087c62bb75bd	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT310M"}	2025-07-19 20:58:44.403+00
a610fab9-c42b-48fd-ae1d-a4feb65cfcea	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-07-19 20:59:44.403+00
d232f73a-2d39-4eba-b645-7e3af5212e8a	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-19 21:05:44.403+00
6cd68d01-b5b9-4dfc-8756-d64bc8599a73	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-19 21:50:44.403+00
19fc2eff-4f92-4902-b12b-846b7d072c7e	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-19 21:51:44.403+00
8fd45e34-2f3b-4d54-8fb7-1118a6070ac5	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-07-19 21:52:44.403+00
63df80ef-6f7b-4834-b7fd-7c29e24b0277	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-07-19 21:59:44.403+00
04cdc419-e740-4371-b434-da10fc89d03e	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT150M"}	2025-07-19 22:36:20.47+00
53599fe1-393d-40d1-9ec8-8005a029962a	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-07-19 22:37:20.47+00
77029728-dad9-4e60-96c9-ab4314e09be6	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5684744277758669}}	2025-07-19 23:38:20.467+00
3ba50e32-f580-406c-96cd-0c9be1d4f089	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5684744277758669}}	2025-07-19 23:39:20.467+00
64ebadaf-b651-469a-b6c5-126810cdef1b	65861570-f509-5228-a69f-731f35318a06	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 5, "scaled": 0.05}}	2025-07-19 23:40:20.467+00
db36e636-f77f-4dbd-8cdc-3c7de62d6c6a	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.5513923365146336}}	2025-07-19 23:47:20.47+00
dd7a5e11-9294-4a4e-9c8d-2738e0e96ebc	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.5513923365146336}}	2025-07-19 23:48:20.47+00
d008d133-e6a3-407b-9c39-dca2c89d0ac9	a39e581a-a948-5af5-ad61-b2b0030fb824	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 13, "scaled": 0.13}}	2025-07-19 23:49:20.47+00
8f803d6d-1b19-4ca5-882f-d31958284475	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT56M"}	2025-07-20 12:12:20.477+00
a87e2625-23b5-47b3-8e56-c64420f37ae2	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.99}}	2025-07-20 12:13:20.477+00
deba66f5-1a25-488f-850c-c553153440ac	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-20 12:22:20.477+00
a5833bff-9925-48ed-8cf4-2212f380a603	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-20 19:43:34.393+00
8c976d44-38ce-4e10-ae42-0f0dd6a47e73	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT20M"}	2025-07-20 20:03:34.393+00
545e3664-c897-4e84-97b6-50e6ffdaca33	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 17, "scaled": 0.17}}	2025-07-20 20:04:34.393+00
8e1403aa-1f81-4008-806b-601636435519	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-21 16:35:20.477+00
d324ffc8-0fa6-44e4-b151-e3369b1f079f	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-21 16:41:48.644+00
a5a56527-1beb-4562-b4f9-ad06909175d5	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-21 16:43:48.644+00
ae7d274a-4c8d-467f-95f1-1f4023a2f61a	2457fc99-9240-5207-8740-05d01be3946e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-21 19:37:20.481+00
4afb780e-7682-4613-a8a9-38006608c8c5	2457fc99-9240-5207-8740-05d01be3946e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT76M"}	2025-07-21 20:53:20.481+00
ac41dcae-bdf8-4672-a1e8-7c23f55ce84b	2457fc99-9240-5207-8740-05d01be3946e	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 6, "scaled": 0.06}}	2025-07-21 20:54:20.481+00
edd22916-3213-4bb4-819d-79bcfa5280e8	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT335M"}	2025-07-21 22:18:48.644+00
30cbcbe8-4522-4dd6-8428-3b415dc558ed	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72}}	2025-07-21 22:19:48.644+00
137cad63-1068-4e5b-aeb3-75ecfe981999	6c3202a9-0713-5ba8-b059-6a0a2ab64a94	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-21 22:28:48.644+00
627245ad-af19-498f-931e-199993dda284	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-22 10:07:19.778+00
e6a66f19-b2bd-4d4b-9f0d-c1dfb4becde0	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-22 10:10:19.778+00
a080ddd1-2fe8-4248-be5d-3ea7ea6cadfa	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT111M"}	2025-07-22 12:01:19.778+00
a4754a63-c208-42a7-b15d-30873de49af6	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-07-22 12:02:19.778+00
2dbe26a1-2fe9-4c1a-b52b-82b68d3314c5	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-22 12:08:19.778+00
27d38919-e9a8-4ef2-a327-4bcf10e09dd9	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-22 16:03:20.47+00
6fb7ffe2-2455-48d0-ae7d-2e55ec3e71f3	2457fc99-9240-5207-8740-05d01be3946e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-22 18:40:20.481+00
4a86fb05-ee55-49e4-9bf9-fd3786c3ec33	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT179M"}	2025-07-22 19:02:20.47+00
e5ede858-eb2f-47ab-a3d4-b197cda90708	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-07-22 19:03:20.47+00
d434f921-16d0-4e55-b962-5990f132b11d	2457fc99-9240-5207-8740-05d01be3946e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT104M"}	2025-07-22 20:24:20.481+00
922b8ada-25e5-4b3a-83cf-6bbb6fa5eaa5	2457fc99-9240-5207-8740-05d01be3946e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-07-22 20:25:20.481+00
0b22d3ce-82fc-4256-9aad-f91c88e66673	2457fc99-9240-5207-8740-05d01be3946e	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-22 20:33:20.481+00
d943b51a-d4ab-421c-bd6b-c45b4b61b12c	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-23 15:43:37.902+00
359442ac-56c4-41d2-aa0a-987a6d5b9e22	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-23 15:47:37.902+00
eb74a300-0d6b-4565-aba7-07412a204d2d	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-23 16:40:20.477+00
5c164356-38eb-4e39-a26c-74eb5711d94b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT42M"}	2025-07-23 17:22:20.477+00
81ee4bf3-2942-465d-b347-ba740996fb04	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.87}}	2025-07-23 17:23:20.477+00
4920b710-5534-49e2-9eae-e237f0bfc949	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT107M"}	2025-07-23 17:34:37.902+00
6a3879b7-ec39-475c-97db-17328c9ad607	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 98, "scaled": 0.98}}	2025-07-23 17:35:37.902+00
872cf027-cae3-443a-8599-d233a3475108	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-23 17:37:37.902+00
e832c296-eb2e-4263-97a8-83aada6451bf	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.8505846219139763}}	2025-07-23 18:00:20.477+00
d71d6bac-d11d-43d2-8e85-11d17da95cc8	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.8505846219139763}}	2025-07-23 18:01:20.477+00
c38b5d58-cbef-419d-81af-253c84e0eb97	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09}}	2025-07-23 18:02:20.477+00
12849992-31dd-4db7-84d5-4a1d86daf324	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-23 18:11:37.902+00
42c2d24d-5373-448c-9f4e-42bc7a32cc76	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-23 18:12:37.902+00
f4b78524-d116-4b2d-8e03-103cd486690b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.2}}	2025-07-23 18:13:37.902+00
73af12b7-1ecb-417a-ad75-143e366b2222	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-23 18:20:37.902+00
16ec7554-d116-434c-b5be-18f6c63662cf	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-24 14:54:20.467+00
c6073db6-a552-43d7-ac1d-613ea83833df	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT38M"}	2025-07-24 15:32:20.467+00
74df93fb-3312-4d3e-b002-6295997b7aee	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-07-24 15:33:20.467+00
f5c051ec-3b96-4dbc-81b8-8c9b06ab6708	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-24 15:37:20.467+00
1a37cee1-b894-4913-9a07-1adb6413256d	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-24 17:31:20.477+00
658142ec-6450-4113-afbf-7e4ac8b1ca58	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT97M"}	2025-07-24 19:08:20.477+00
fe093d75-8424-4432-8e7e-3f0345d21d46	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-24 19:09:20.477+00
1c5659d5-024d-4715-be0e-94714c7a942b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.8109513208660071}}	2025-07-24 20:07:20.477+00
125d1a65-425d-45ae-99c9-4f0ae728428f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.8109513208660071}}	2025-07-24 20:08:20.477+00
16fa8462-926f-4408-9c4e-8391acf88a12	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-07-24 20:09:20.477+00
1ce60de0-0de1-46fb-af7c-1d8d57f243f4	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-24 20:30:20.47+00
15d6c46d-9c62-4a78-94fe-9c2706f8d90a	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT198M"}	2025-07-24 23:48:20.47+00
5d2042e5-edbb-47b0-a5ba-881ae68ff8a1	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24}}	2025-07-24 23:49:20.47+00
00f9d34a-a65e-4778-82d8-750e9fdfd28a	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-24 23:50:20.47+00
f3a52c4e-926c-411a-8203-ce811d488c7e	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-25 09:29:48.381+00
628eace7-a738-4483-be9f-fe6d46f08ffe	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-25 09:31:48.381+00
65720e3e-103d-4d0e-b4d7-eb569e037be5	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT65M"}	2025-07-25 10:36:48.381+00
73c0984e-87a8-4443-8b08-a26b66d1274b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-07-25 10:37:48.381+00
a309f786-9068-4e92-9199-34ee508049de	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-25 10:45:48.381+00
a67a47ed-eb60-45c0-a6d2-57d33422611f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-25 12:12:20.477+00
b08f5803-2e64-45b3-8e3d-f25b85af6374	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-25 14:00:20.467+00
d6ad1035-2002-4dd2-a589-0959328ebf73	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-25 14:04:20.467+00
2ad14d9a-1541-4bd3-b1e7-e246cd36618c	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT48M"}	2025-07-25 14:52:20.467+00
9ca40053-d8a9-477b-af32-9ffc2cc99f9d	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.99}}	2025-07-25 14:53:20.467+00
dfc39697-f912-415c-88cc-e5a3d16b32be	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-26 12:06:24.556+00
83126786-3ebb-4b03-8cf0-45cf272e5ad9	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-26 12:10:24.556+00
7faa56f8-eddc-4c6b-abdb-8ea7a574f7d8	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-26 12:40:20.477+00
267d0fb8-c2f1-4861-93e5-8019ded602bc	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT68M"}	2025-07-26 13:48:20.477+00
392457de-3ab8-499f-a9c5-4d52f5ab67f5	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-07-26 13:49:20.477+00
b083a0b6-6415-481b-95e7-51bfbd106c36	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-26 13:51:20.477+00
765a9e15-ae4e-4e5d-a872-061c50d248f5	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT122M"}	2025-07-26 14:12:24.556+00
adcca27d-af1f-41d0-8ef7-6f7ba5bd2645	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9}}	2025-07-26 14:13:24.556+00
d57b12d2-e6d3-4e98-87e9-255a7ebc1566	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-26 14:21:24.556+00
a27ba204-92a8-4547-aec4-11364be801c3	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-26 14:46:24.556+00
7a90451a-3486-45e3-be55-583a22706393	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-26 14:47:24.556+00
ef1fb670-9b4f-4f37-af7c-15ab9e7340d2	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-26 14:48:20.477+00
65eea434-e6ec-4c33-a02c-e10be6c1cc7b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 7, "scaled": 0.07}}	2025-07-26 14:48:24.556+00
e2b8c3f6-0b4d-4824-9750-2c1db6633aa9	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-26 14:49:20.477+00
77eb6bb1-bdec-481f-8eaa-b31c9aead7c0	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.74}}	2025-07-26 14:50:20.477+00
d8fb300a-9f69-4e1a-80dd-0e52f0b19aa8	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-07-26 14:50:24.556+00
de6f3271-e6a3-4f2b-8e01-d113f9c4ce2d	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-26 18:35:20.47+00
866fb65f-b909-4603-82b1-ef140604a7e5	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-26 18:57:20.467+00
b03562ba-3c82-4d87-b3ff-f08c7168d71f	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT38M"}	2025-07-26 19:35:20.467+00
05e4216f-7056-4a4a-a5a7-1714d62223b8	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-07-26 19:36:20.467+00
387c6bdb-ed4a-45b8-9266-5b6cc23e8c99	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT193M"}	2025-07-26 21:48:20.47+00
73e57438-7df4-4792-a238-540c95dd74e5	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-07-26 21:49:20.47+00
e8351ba5-c887-4a4c-a5d4-36f39464bb83	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-27 14:25:20.467+00
492f46ac-3e64-4b0c-9c6e-bdb63c27dee9	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-27 14:28:20.467+00
1c43c580-92b5-430c-a464-fe741cc9dba9	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT50M"}	2025-07-27 15:18:20.467+00
8655ff4c-8cb6-422e-b4d9-69a28f19bb0d	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 17, "scaled": 0.17}}	2025-07-27 15:19:20.467+00
f75e9301-0871-4a2c-a2de-9c2051b98250	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-27 15:23:20.467+00
480c4025-60aa-4956-bc67-44eabfc700e2	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-27 17:36:20.477+00
9190891d-156c-4236-87b5-646c123cbe7e	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.7404700251904324}}	2025-07-27 18:38:20.467+00
22fbe93e-ab90-4f68-a7f4-02432daa4212	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.7404700251904324}}	2025-07-27 18:39:20.467+00
db36dff6-067d-41e7-a3d6-8b9f625b53c4	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT63M"}	2025-07-27 18:39:20.477+00
d673c921-e60a-4077-9b4d-d8ca56682707	65861570-f509-5228-a69f-731f35318a06	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39}}	2025-07-27 18:40:20.467+00
0d9fbcc7-38bd-44d0-82ab-3a8683e8f1d8	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 14, "scaled": 0.14}}	2025-07-27 18:40:20.477+00
2387f60d-a5c3-41e4-bea4-a51c7165f597	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-27 19:09:20.477+00
9736b528-5f81-408f-8a61-297a87f20dd5	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-27 19:10:20.477+00
1b56145e-f240-4137-89a3-d69886fdd0a1	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-07-27 19:11:20.477+00
caa8c814-2e25-4244-bdd4-1f2ce039c42f	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-27 19:18:20.47+00
7e80f8c1-7a4a-4856-9768-a5ab851cdabb	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-27 19:22:20.47+00
5ab16f1d-d87d-4de7-ae6a-b16fd9852602	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT181M"}	2025-07-27 22:23:20.47+00
62d8380e-921e-40b1-ade4-41b0ffe3a21d	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.81}}	2025-07-27 22:24:20.47+00
1f008a75-961b-48e3-adab-0245c4d60b93	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.7154771872476504}}	2025-07-28 01:02:20.47+00
709d3d4e-0577-41b7-af42-a57b2b23fa2c	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.7154771872476504}}	2025-07-28 01:03:20.47+00
913def0e-5b29-472a-ae4b-f6e73a30da54	a39e581a-a948-5af5-ad61-b2b0030fb824	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-07-28 01:04:20.47+00
1a1d6dca-de59-4ec7-9cbd-9f17a1c10a01	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-28 12:32:02.831+00
390b70bf-191f-460d-b627-b3564e4fc3b0	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-28 12:37:02.831+00
84376182-a019-4e4d-ad02-99a66098077a	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT118M"}	2025-07-28 14:35:02.831+00
f8546a51-83b3-4497-8991-0c54a2beddd6	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-07-28 14:36:02.831+00
d4515723-51b3-4cff-aeb4-0ae8be239745	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-28 14:40:02.831+00
ed0ddb46-6408-442d-b179-38eb0e3fa86c	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-28 15:17:20.477+00
dd7f31ac-890f-49af-bdff-611cd760db59	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-28 15:20:02.831+00
5fd178ac-60a3-428f-95be-946e2ae52fad	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-28 15:21:02.831+00
092d3e8f-1ac3-4220-b1e0-fb5725204399	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.74}}	2025-07-28 15:22:02.831+00
1c2b179a-91bd-45f8-93cc-ba911b628333	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-28 15:24:02.831+00
7b4b18b9-ae2f-45ed-9ef0-41687d5edb64	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-29 15:12:20.477+00
e7639cd5-3f03-4349-964d-e567f8bff195	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-30 12:50:20.477+00
e3f7dffc-1e97-4fbc-93e0-f1afe0f03e15	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT88M"}	2025-07-30 14:18:20.477+00
8ecd5dfc-b44e-47f6-a94b-e62f1847620e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.74}}	2025-07-30 14:19:20.477+00
79bf8bd2-0a61-4e4d-8c3d-b86d12e70845	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-30 14:23:20.477+00
4c9132ce-f6e7-4742-9bfe-604491744644	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-30 18:59:56.951+00
01992333-1592-4b03-bd4a-0ed289ae92d0	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-30 19:04:56.951+00
a29c2ca7-d4de-4d05-9fe3-14e84a19184e	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-30 20:15:20.47+00
cd2307c3-39f1-4ffb-b59e-5d29ca07fc11	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT74M"}	2025-07-30 20:18:56.951+00
2f8d9a1d-850d-445d-8183-9dff2dd13874	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-07-30 20:19:56.951+00
2c6a73a5-4608-494b-a90b-97470f88f470	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-30 20:26:56.951+00
5fd81475-ea58-4258-8842-9d936761fb82	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT170M"}	2025-07-30 23:05:20.47+00
2ad7e310-c85e-4240-a51d-0c2fb2f69c21	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 98, "scaled": 0.98}}	2025-07-30 23:06:20.47+00
e13de3df-e07b-4549-92f4-6df048e2b7e6	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-31 13:24:20.47+00
ba29d2d1-e849-4039-8ebc-01cb4887144a	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-31 13:29:20.47+00
b1307601-7ffb-4792-a187-8996178ccc5c	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT181M"}	2025-07-31 16:30:20.47+00
e6c3e4b1-a0c6-4c6a-a524-3c91c57f9dba	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09}}	2025-07-31 16:31:20.47+00
d5d1602a-fe71-4b4b-8a85-7d209bfe9035	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-01 11:25:14.907+00
6092821c-9c43-4ff0-ade2-5f0c6620b9fb	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-01 11:29:14.907+00
cc164c23-cf75-4645-be0c-bd099137f245	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT132M"}	2025-08-01 13:41:14.907+00
08477692-5742-424b-a8d5-ddb858cd8ade	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09}}	2025-08-01 13:42:14.907+00
a43cb402-5334-409a-a2ae-ba36ad676a58	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-01 13:51:14.907+00
fcd8f641-ba51-4277-990e-91c9a4a4c57b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-01 14:20:20.477+00
3c951ea9-b6d0-4bee-ad01-2fe7d17d478e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT79M"}	2025-08-01 15:39:20.477+00
6d5da3d1-a50a-40e1-8407-5c338ff826ac	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.92}}	2025-08-01 15:40:20.477+00
a0b08cd7-4fab-4bc3-a41c-e3a1bfae4443	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-01 15:48:20.477+00
8094bdf3-94aa-4b69-8f90-5f95946da0a2	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-01 17:21:20.47+00
b7c44d7f-b43f-440b-8a55-b94b18293c46	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-01 17:23:20.47+00
5e2be097-94ce-45d0-982b-6f14d4c725ac	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT205M"}	2025-08-01 20:48:20.47+00
bc739bb8-c0f3-4c05-a6a5-faa17047b479	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-08-01 20:49:20.47+00
1f27e346-d29e-4fe8-9cb1-554e193dffcb	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-02 17:28:08.371+00
88289db5-a0f6-4b21-8cf0-a8757ea1015f	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-02 17:32:08.371+00
3955185e-8112-4735-bb5c-2fc1c66aae91	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT138M"}	2025-08-02 19:50:08.371+00
f104c4d5-ed7f-4b5f-9acb-fce4b5114965	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 94, "scaled": 0.94}}	2025-08-02 19:51:08.371+00
c29b435d-a316-4a44-8c28-3de58e939a77	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-02 19:58:08.371+00
fca60733-1c70-4e2c-99e9-70fd50d5a5e4	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-03 14:37:20.477+00
a0943288-627e-440e-8f42-1f33a09e2e1f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT65M"}	2025-08-03 15:42:20.477+00
e5cdb793-037d-46ae-af53-d9e9aeeb5eaa	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-08-03 15:43:20.477+00
d9d163b8-727a-489d-bea2-22b906a4e6e2	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-03 20:06:20.47+00
cba86e59-aed0-4610-9928-0b4bbb40b0c4	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT154M"}	2025-08-03 22:40:20.47+00
70a8277e-004e-4209-a71c-d2f9726a3136	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 26, "scaled": 0.26}}	2025-08-03 22:41:20.47+00
8b814b69-aa8d-4520-b16c-224bcb611440	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-04 17:10:20.477+00
df7b17d6-ff36-4bb3-bc69-b58b1c3f7204	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT90M"}	2025-08-04 18:40:20.477+00
b3cb8d8b-dbe9-414c-af19-f455e2301ddd	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-08-04 18:41:20.477+00
5e338e05-7d40-4558-ad84-8f1b2b83b2ae	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-04 18:43:20.477+00
684b55fb-ce8e-4fe8-88d7-58756745185f	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-04 19:53:05.182+00
73d55e82-0df7-459b-bf8c-e01e96aa5c22	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-04 19:56:05.182+00
7e939522-c72b-4bd1-89ff-e845644260ab	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT84M"}	2025-08-04 21:20:05.182+00
3c6c98ec-9b09-4f80-b9dd-b8c60e284c2a	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 7, "scaled": 0.07}}	2025-08-04 21:21:05.182+00
4963aabb-458e-4f0b-97b7-c4383595f866	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-04 21:26:05.182+00
13c1fcca-2d2f-4e31-a084-3c6bdecf9b6e	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-04 22:18:05.182+00
035ffabb-1338-486e-9b4b-868f52236975	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-04 22:19:05.182+00
0a87fd6b-ff22-49a9-a37e-362bd443e7fe	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.75}}	2025-08-04 22:20:05.182+00
7efdbf57-dc8c-4b10-acc7-405dac7f31e2	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-08-04 22:27:05.182+00
551591a7-b341-4d46-a896-eef81cb46589	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-05 14:10:20.477+00
0ec4ef79-47db-4c84-8705-db6764a0d80d	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT77M"}	2025-08-05 15:27:20.477+00
3262fafc-682d-428a-971f-d4553745e872	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.99}}	2025-08-05 15:28:20.477+00
e205e299-fe09-44c9-b83a-b2341703f233	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.6094553573141734}}	2025-08-05 16:04:20.477+00
6cd70293-b6a0-466d-bf8c-46d273d73a58	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.6094553573141734}}	2025-08-05 16:05:20.477+00
d0167e31-a0e8-4497-9cc6-127578d4b873	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.87}}	2025-08-05 16:06:20.477+00
e9d3b19d-4cb2-4a98-acfd-fe07fb3c747e	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-05 16:21:20.47+00
4f4d3739-76db-487c-b007-a53760a4d16a	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-05 16:24:20.47+00
9ba1f0df-5304-4dc7-8258-3e17630e38d4	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT208M"}	2025-08-05 19:52:20.47+00
c399f654-6854-4a1d-b339-2a103513f6b0	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 8, "scaled": 0.08}}	2025-08-05 19:53:20.47+00
e69ddac5-d9ae-4d95-8cea-3361fb8b557f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-06 14:35:20.477+00
787c2bf3-69ea-4394-aca5-7ed12cd80b30	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-06 15:08:20.47+00
cf25b949-9bf3-4386-91c5-6a9dff3d466e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT87M"}	2025-08-06 16:02:20.477+00
8d726a9f-15ff-4b09-a9bc-4062b702da2f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.82}}	2025-08-06 16:03:20.477+00
41e2a893-23a4-4ab1-8143-fdf6a3a53341	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-06 16:56:20.477+00
04f549db-6865-49fb-9539-d13c60fc6fca	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-06 16:57:20.477+00
0689a80c-b65d-47b1-a5a9-b2686aab69c7	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 10, "scaled": 0.1}}	2025-08-06 16:58:20.477+00
e775bfde-fffb-4aeb-9f2c-943850f69448	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-06 18:01:35.633+00
7a731561-3b81-4230-ab60-850ce4c29ec2	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-06 18:03:35.633+00
ce4adda2-9e8b-4d5d-bb7d-98d33c6ab304	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT183M"}	2025-08-06 18:11:20.47+00
f050931e-3ebc-43ed-9f15-fc48eada84c8	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-08-06 18:12:20.47+00
6bb1ac5d-a499-42cd-8911-19b6daa8df99	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-08-06 18:17:20.47+00
8f37560d-3762-477e-a51b-e0fe89b27272	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.5245540190200868}}	2025-08-06 19:38:20.47+00
6a2bf01d-6c39-4d25-b781-e8480285fee8	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.5245540190200868}}	2025-08-06 19:39:20.47+00
0be9357f-c255-4cdc-9664-cdaa2c6c1e7b	a39e581a-a948-5af5-ad61-b2b0030fb824	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-08-06 19:40:20.47+00
61612c66-2d9c-45c0-b85d-c501b5207e30	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT118M"}	2025-08-06 20:01:35.633+00
23e5a5c8-c5ef-4533-8485-95ff1941dc4b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-08-06 20:02:35.633+00
a3484cbd-8634-490e-b6fd-f91be2e78d6c	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-06 20:11:35.633+00
215a251c-e252-4fae-9766-d3fcdd68a8eb	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-07 15:47:20.477+00
f962a162-ec61-4dbf-b223-94bd1dd1265b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT38M"}	2025-08-07 16:25:20.477+00
47a8c0f0-1754-49fd-ad4f-5db59ae5b4ea	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-08-07 16:26:20.477+00
103600ed-daec-49de-9eed-5a77233ccb82	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-07 16:30:20.477+00
3a5b48eb-68a4-4b69-ae33-955d975f0c2e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-07 16:59:20.477+00
0e32a26e-588b-4e08-8cb6-b7b9bb231146	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-07 17:00:20.477+00
94b1909b-e94c-48ce-ba5b-0c3ba39112f5	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 6, "scaled": 0.06}}	2025-08-07 17:01:20.477+00
0c66a14b-c1db-44ae-99f1-8daca002104b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-08 17:42:20.477+00
b4f7d8ce-f1cd-42af-91b4-c7c45f1d6522	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-08 18:51:19.786+00
0a60e100-b582-4cf2-91b1-736b1967b0b6	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-08 18:55:19.786+00
41f2e0d1-ba81-4a63-9701-db589017124e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT114M"}	2025-08-08 19:36:20.477+00
ee686373-de77-4d3c-b41c-7ce42d4dfc4d	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 6, "scaled": 0.06}}	2025-08-08 19:37:20.477+00
554ae86c-79f3-4ee8-a37c-34760df2751e	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT110M"}	2025-08-08 20:45:19.786+00
701989b9-9144-445e-9070-f03216b045ea	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-08-08 20:46:19.786+00
b2c3751a-bdbf-4b54-98d4-0b03e08944ff	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-08 20:51:19.786+00
a035b11b-1c5c-463d-bf86-6ff6e4da208f	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-08 20:58:20.47+00
ca60880d-c615-4b11-8ec6-83537589c9ac	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-08 21:09:19.786+00
0feb679e-5893-4c66-a837-48f3d0d905da	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-08 21:10:19.786+00
01b43150-00ee-4d8d-b650-9168d18bbd06	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-08-08 21:11:19.786+00
285c6df1-7661-4447-976b-dc6fde59ded6	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-08-08 21:13:19.786+00
a6fe4d87-0222-4ca1-baef-a21c01d84b91	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT175M"}	2025-08-08 23:53:20.47+00
f327399c-d10a-4b53-ab84-d53f533121a5	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-08-08 23:54:20.47+00
c2520bc7-9f8f-4cf7-b57d-e81e8cc37fbd	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-08-08 23:58:20.47+00
1fd36073-86e0-411b-897e-d2dce9ae9025	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-10 12:19:20.931+00
e81f2878-f1db-4670-98cb-100e25df224b	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-10 12:23:20.931+00
9d43c6c7-45f9-40a2-955d-e2040252ab65	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT101M"}	2025-08-10 14:04:20.931+00
ac25e681-c762-4e40-b580-08ebe85e956f	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-20 13:26:01.468+00
0e378188-6eb3-4648-96dc-dd0898c4006d	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 1, "scaled": 0.01}}	2025-08-10 14:05:20.931+00
22ed0305-7e01-4ad2-99ed-ea578120a10a	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-10 14:09:20.931+00
87b9b932-1c6f-46fa-9646-42e6d0527560	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-10 14:37:20.931+00
d032bf9d-af0b-4ca0-b156-263ee6dcf368	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-10 14:38:20.931+00
cccaed48-c819-4fcb-a203-c9642f7772aa	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.74}}	2025-08-10 14:39:20.931+00
e756818b-3a27-487e-b2a2-857240e0f406	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-08-10 14:42:20.931+00
6169ecbf-5965-4330-823f-9c5cbfb96393	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-10 15:50:20.477+00
1f7d0401-fb66-49a9-8254-11d8cfe5a07c	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT92M"}	2025-08-10 17:22:20.477+00
79507be0-4631-42a8-ac89-c6091225395e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.87}}	2025-08-10 17:23:20.477+00
cd2872fe-c0e5-41cd-b224-49ad0356245a	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-10 17:26:20.477+00
d0408444-8a70-4526-a437-3a55a9e86153	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-10 20:24:20.47+00
d5837321-629d-4f05-a3a1-885cb3d41263	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT182M"}	2025-08-10 23:26:20.47+00
f47dd758-8893-4d94-a31c-10759f60f6b1	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-08-10 23:27:20.47+00
dbf1e555-1331-4462-9e36-936b42145bc6	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-11 11:37:20.477+00
4e677a2d-7d2b-48e2-b3ee-98b134a9a844	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-11 17:21:03.337+00
f84835b1-0d44-4d56-803a-b4906f4bca78	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-11 17:23:03.337+00
c9db012e-ea16-4e5b-a295-57c00e21c9b4	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT120M"}	2025-08-11 19:23:03.337+00
36fbdb8b-05c3-43ce-9929-375e1d548d42	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-08-11 19:24:03.337+00
7bf4ab48-91ee-486c-b184-32338e527db4	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-11 19:28:03.337+00
df4ba3d8-b867-4281-b663-dfe1f3432b9d	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-12 13:31:20.477+00
ecafe4bb-3149-4dcc-92d3-386e8a6b7b34	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT98M"}	2025-08-12 15:09:20.477+00
d5baffad-ef51-4259-8c40-c0e8f2f6be99	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-08-12 15:10:20.477+00
a9289666-97a1-4c3c-bfa5-c15c80420c46	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-12 16:31:20.47+00
752cedf5-4048-45ba-bdeb-cd017bdba971	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-12 16:35:20.47+00
6bd82f59-cbae-428c-ac3f-0d0437cc72ae	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT149M"}	2025-08-12 19:04:20.47+00
a425f9f1-a25b-4c29-8435-a94bcde0b252	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-08-12 19:05:20.47+00
9cce1fa2-f3b5-4dd7-916f-c6d8f034edc0	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-13 13:39:20.477+00
793deabb-33f9-4ce0-95f9-41ee4e3773f0	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-13 13:40:33.957+00
dfb31717-16a6-42fb-8967-afc8c9c3e619	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-13 13:44:33.957+00
f9575076-ace0-4035-be19-71d03023a53b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT69M"}	2025-08-13 14:48:20.477+00
997b876f-b227-4077-9453-0bdd5484a0ea	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-08-13 14:49:20.477+00
4c30c3bb-0956-445d-a72c-1be2a49ef746	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-13 15:36:20.477+00
181d33b4-b88d-4569-a35f-a4cb77d70625	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-13 15:37:20.477+00
c82d67f5-0c91-41ef-a3f7-f9631ec3d077	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.82}}	2025-08-13 15:38:20.477+00
c952d6d5-d1c9-475c-a35c-a56b22912917	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT119M"}	2025-08-13 15:43:33.957+00
5eff8ab0-ade2-4e03-89de-ce432eb610fc	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-08-13 15:44:33.957+00
de3ff373-dd06-4e6f-8b57-958fe3cb5ae6	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-13 15:52:33.957+00
2da4b99c-6f9a-45ab-8455-779f854b663f	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-13 20:45:20.47+00
19864a71-4470-44d1-a586-f3f86b6b9809	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-13 20:48:20.47+00
a0f77704-6c1b-40ea-9d76-42bcbfae3b81	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT168M"}	2025-08-13 23:36:20.47+00
ec4bd7c1-1b97-4899-860b-fc310cdc51fa	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-13 23:37:20.47+00
33be8722-3aad-4c07-9ca9-5290d1e2ce57	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-14 12:08:41.191+00
4826bce6-49fc-42a6-8f32-a7fea1c57650	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-14 12:12:41.191+00
a3c993ed-34b9-40f1-9cb7-12b0da1aa3a5	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT49M"}	2025-08-14 13:01:41.191+00
2c454fc4-0ec9-4e47-ad9b-bb146cca1cc9	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-08-14 13:02:41.191+00
a65fe812-9f0c-4a16-a843-361eb3d9f958	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-14 13:08:41.191+00
4ebec516-07c3-4685-8a78-a4ee9541917a	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-14 13:48:41.191+00
67d61bec-86cd-4aff-b961-95342d1caee7	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-14 13:49:41.191+00
38d23c38-9a8e-4c91-9bae-041a24008a93	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-08-14 13:50:41.191+00
b5e9f8ed-6365-4ef6-b774-2e4f18adf18c	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-08-14 13:54:41.191+00
60c0c78f-e3f6-48c3-8104-bbfc50d68df0	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-14 14:41:20.477+00
877d2214-6f50-4a1e-8f39-99ce54fbe3ad	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT39M"}	2025-08-14 15:20:20.477+00
912bf42f-3604-4c12-924c-2fac295561de	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-08-14 15:21:20.477+00
7a36974a-1974-4dd5-97f9-182ed93ff985	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-15 17:30:20.47+00
db6c33f3-50ed-4cc8-92f5-67e20b08fb8a	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-15 17:38:20.477+00
abb8b047-5fc2-4170-83d8-15a06f0663b6	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT114M"}	2025-08-15 19:32:20.477+00
862da6c8-c5ce-43bd-bda8-5d4738e42a43	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-08-15 19:33:20.477+00
370fe732-d02f-4e6e-a906-6fada716b8ba	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT175M"}	2025-08-15 20:25:20.47+00
449357e7-3636-49d9-be72-fcab8d0ed0fa	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 10, "scaled": 0.1}}	2025-08-15 20:26:20.47+00
92a80ad4-676e-4894-ad9d-430348e8c511	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-16 13:06:34.379+00
c13a8766-172d-4534-9606-72e093dc2663	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-16 13:11:34.379+00
e63f343b-656f-46b5-afd5-1e059057aac8	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-16 14:03:20.477+00
eb5fcd20-3b77-4255-8c2e-8ccaee4a5540	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT121M"}	2025-08-16 15:12:34.379+00
bb0b058b-6fac-41b4-aae1-cc1ea203dbab	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 9, "scaled": 0.09}}	2025-08-16 15:13:34.379+00
cb3ed250-06b9-44d6-9f74-05d01fa7beed	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT75M"}	2025-08-16 15:18:20.477+00
8c72178e-642a-4554-bf7f-87c84385e795	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-08-16 15:19:20.477+00
63669e9e-c891-4e2b-950f-c578af7e7e1f	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-16 15:20:34.379+00
79cad9c1-d19e-462a-929e-e1d9fa5aa07f	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-16 15:26:20.477+00
65342dae-ddf3-42dc-b8d8-5ecd1076a489	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.656109897223753}}	2025-08-16 16:03:20.477+00
167418ca-4371-4c6a-b524-bc2a48c6235a	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.656109897223753}}	2025-08-16 16:04:20.477+00
0ec4b6fc-455b-46bd-b2c9-6af8e8fca495	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 28, "scaled": 0.28}}	2025-08-16 16:05:20.477+00
e7b2a33a-4f2a-4e2a-ad4a-dcbeab38fb22	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-08-16 16:07:20.477+00
a8e90755-68d8-4bfb-93c8-12ca3bf6f66b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-17 16:49:20.477+00
7827b4b5-da87-44c2-a70f-2eca60ffdf21	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT90M"}	2025-08-17 18:19:20.477+00
1dbaec87-5b2a-4003-8292-10761b79e772	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43}}	2025-08-17 18:20:20.477+00
31f8b792-a63b-4b23-adba-83d4717f6c1c	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-17 18:22:20.477+00
b587e1d8-51ba-42c3-8f1e-5432b6cca20e	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.7846237019554927}}	2025-08-17 19:03:20.477+00
5c3a404d-9cf3-4d96-ba57-f62c8e43035b	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.7846237019554927}}	2025-08-17 19:04:20.477+00
30537dbc-961d-4b62-9ee9-44903db68e34	e92e5dec-aac8-5dea-a5d8-37e0cc2b1383	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 17, "scaled": 0.17}}	2025-08-17 19:05:20.477+00
691378b8-10d0-4044-8565-4d36c287f707	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-17 19:52:20.47+00
c4e2c405-04a4-49a4-8fbb-894703662810	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT186M"}	2025-08-17 22:58:20.47+00
cde33063-74b9-4089-b258-2e0a20715828	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.88}}	2025-08-17 22:59:20.47+00
10148148-1ffb-44a0-8e81-63730f0eed30	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.7721613598035224}}	2025-08-18 00:15:20.47+00
3d4be4e9-8469-4c80-aca5-80d53af65cf1	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.7721613598035224}}	2025-08-18 00:16:20.47+00
7ac25995-2802-40b3-b637-1d1345a87376	a39e581a-a948-5af5-ad61-b2b0030fb824	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-08-18 00:17:20.47+00
2f84f120-a87a-41ed-b556-4ad6051349ce	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-18 19:23:07.603+00
cfe01c40-02ac-4bcb-9340-6462f880c589	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-18 19:27:07.603+00
e1d803b6-28ad-4253-988f-9f092208c273	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT61M"}	2025-08-18 20:28:07.603+00
f2ea502a-4824-4707-820f-d3638f3ed6eb	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 97, "scaled": 0.97}}	2025-08-18 20:29:07.603+00
883176be-a755-405a-98a0-269029cb6ef4	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-18 20:31:07.603+00
b4c86b55-462a-4ecb-a479-18e85e5bdd0e	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-20 13:23:01.468+00
f7aa0abf-635c-45c4-9eda-4122d77d580f	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT136M"}	2025-08-20 15:42:01.468+00
8366df20-d53d-478c-bfa6-da78f02e1f05	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-08-20 15:43:01.468+00
488e6383-95e6-4ff4-8aba-361a5fcf491d	b5edd43e-e1c5-5e9f-a0ee-1f7f34acbf91	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-20 15:52:01.468+00
f046f34e-d67d-4e1a-8f04-fb6f9c647447	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-21 15:44:20.47+00
df5b1647-f8e7-449a-a19e-232395209781	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-21 15:46:20.47+00
d39f4c1d-e7a0-492a-ab1a-6654cf254f0e	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT174M"}	2025-08-21 18:40:20.47+00
2adac2a5-078e-480a-89f4-7b12aa41fab1	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 7, "scaled": 0.07}}	2025-08-21 18:41:20.47+00
ed92532e-dd5d-444a-b8f2-0b166688d39c	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-08-21 18:44:20.47+00
2fff979d-28b0-4037-8583-af1187f6b910	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-23 15:00:20.47+00
2113e87a-c473-4b78-b591-2c003bffe0c5	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT174M"}	2025-08-23 17:54:20.47+00
b8d5bd6a-f28b-4128-a6e4-e154befe0a2b	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 96, "scaled": 0.96}}	2025-08-23 17:55:20.47+00
8ca5fa54-63a9-4651-bd11-1a94c3c12889	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-08-23 18:00:20.47+00
2b552bf2-ffb3-4da2-8828-ddb33ab5e946	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-24 15:07:20.47+00
a8bd675f-4974-4822-b08f-e1f3157d05d0	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT188M"}	2025-08-24 18:15:20.47+00
107e95ab-bedf-479c-88dc-c70055cfcd30	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-08-24 18:16:20.47+00
fad745b0-c21f-4830-a10c-1075ef6a41d8	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-25 20:59:20.47+00
0da785fd-387f-45a7-bbae-d0c3e420ef05	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT157M"}	2025-08-25 23:36:20.47+00
0131541a-745d-438f-96bf-09873087a708	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 97, "scaled": 0.97}}	2025-08-25 23:37:20.47+00
b1791040-e017-4d03-a5cd-8f29a3fb4590	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-08-25 23:38:20.47+00
7a55870a-f773-4ea0-bcbd-795536c057a3	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-26 13:28:20.47+00
ee66aa07-4265-47b5-b8cd-03effd749460	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT145M"}	2025-08-26 15:53:20.47+00
d80dd161-4146-4abe-90c0-12723399a330	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 93, "scaled": 0.93}}	2025-08-26 15:54:20.47+00
b555df46-08f0-4b71-b614-a8626b758f48	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-08-26 15:59:20.47+00
64f86dcb-3f79-435d-8c2f-f156ce04e753	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.442260288264782}}	2025-08-26 17:07:20.47+00
eb1e44c5-0076-4357-a01e-14338763e7af	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.442260288264782}}	2025-08-26 17:08:20.47+00
621eeba5-3b65-4d71-9852-dc8977588269	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-08-26 17:09:20.47+00
740d5ead-56a3-4255-9e13-1b2e70e5c30f	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-28 18:12:20.47+00
c9637c23-03c1-476e-8573-2639d6db16a2	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-28 18:14:20.47+00
d647d5ef-abaf-4847-947f-faa7010dc947	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT195M"}	2025-08-28 21:29:20.47+00
917dfbc5-2d3e-4945-9bb4-ee44cca2ee10	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.88}}	2025-08-28 21:30:20.47+00
e85178f7-0d9a-4fe3-b7b6-a4c455567f08	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.380174814624796}}	2025-08-29 01:21:20.47+00
cf5903ed-1083-4f2c-a862-9c65383c3ae0	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.380174814624796}}	2025-08-29 01:22:20.47+00
f92e0408-ae76-43a2-b57e-6d4518b4e0f0	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 16, "scaled": 0.16}}	2025-08-29 01:23:20.47+00
f837ae2c-d0a7-4fed-82a5-38d6eadc2f98	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-30 18:03:20.47+00
d01f8856-57f0-43b1-9fc5-95a9b565f7de	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-30 18:07:20.47+00
bb44ff3a-a40a-42ad-b092-9882eeb5778c	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT191M"}	2025-08-30 21:18:20.47+00
044997c3-175e-4ab5-832b-add5a6517061	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.52}}	2025-08-30 21:19:20.47+00
dc4877ee-fea2-431f-88df-2cecfa676bf6	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.4339419946281236}}	2025-08-30 23:56:20.47+00
9eaddfb8-12c9-458d-b6de-10afc9e5a3b5	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.4339419946281236}}	2025-08-30 23:57:20.47+00
e19e4d46-c530-49a9-bc9a-d33bc37a3b8d	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 1, "scaled": 0.01}}	2025-08-30 23:58:20.47+00
1a17fc76-5bd7-4bad-b9d6-64ddf8ec5040	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-31 16:47:20.47+00
3f4f6cba-e019-4a51-8ca6-29a237c7db2a	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT199M"}	2025-08-31 20:06:20.47+00
d442f086-363d-4c1c-95b4-89f92c8c7515	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-08-31 20:07:20.47+00
80107d6a-5773-4dbd-b6e1-a8d6ff1b526e	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-08-31 20:10:20.47+00
1d4ebf5d-9a28-48e4-863f-4079b34a4a8b	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4001128984108691}}	2025-08-31 23:22:20.47+00
202a35b0-f9d2-4015-aa03-77ac7033506a	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4001128984108691}}	2025-08-31 23:23:20.47+00
6fc1eb5d-3be7-41eb-81ff-59981faf8438	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-08-31 23:24:20.47+00
44409604-1aa6-4f04-87d3-3fc430a2c1e8	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-01 20:45:20.47+00
dd14211b-eeb4-4ae1-950d-7fd9d6ac4a3d	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT156M"}	2025-09-01 23:21:20.47+00
0ac3e13e-7818-4f63-ae68-15430b966d20	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 95, "scaled": 0.95}}	2025-09-01 23:22:20.47+00
def08787-0c13-491d-93b6-0dee1d3a4a49	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.4330522408619469}}	2025-09-02 01:57:20.47+00
e8755d66-0d37-4d4d-a383-85f2950ffb8b	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.4330522408619469}}	2025-09-02 01:58:20.47+00
bc0dc2ba-c45a-40db-b1e1-774e501b079a	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.88}}	2025-09-02 01:59:20.47+00
ada0c91e-e8c3-4e99-afa3-7264e84d618e	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-09-03 20:12:20.47+00
f0ec8e5a-173b-4b99-a857-f01feee10ee7	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-03 20:15:20.47+00
2eb5bba9-93a9-4f7d-8128-c398036fb4ad	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT191M"}	2025-09-03 23:26:20.47+00
7ee8f01a-515b-4a49-81c9-d9a2b7aa9db5	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 18, "scaled": 0.18}}	2025-09-03 23:27:20.47+00
4b0a0063-944c-44e7-97bb-81ec404343a0	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37035426100368213}}	2025-09-04 02:22:20.47+00
ef4e147e-d4e3-49fc-b072-4c3c938d6113	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37035426100368213}}	2025-09-04 02:23:20.47+00
5102f1ae-2ff3-44d5-b12e-1b9984c54436	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-09-04 02:24:20.47+00
a893b011-0630-4680-b682-31fceb3aedbc	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-09-06 16:01:20.47+00
e5e48954-d3fa-42ac-b3f5-668356ce7ba9	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-09-06 16:02:20.47+00
7b761bd9-fb8a-4526-96a5-a3454a047e32	a39e581a-a948-5af5-ad61-b2b0030fb824	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 1, "scaled": 0.01}}	2025-09-06 16:03:20.47+00
\.


--
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: learning_resources learning_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.learning_resources
    ADD CONSTRAINT learning_resources_pkey PRIMARY KEY (id);


--
-- Name: modules modules_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);


--
-- Name: statements statements_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.statements
    ADD CONSTRAINT statements_pkey PRIMARY KEY (id);


--
-- Name: module_resources module_resources_module_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.module_resources
    ADD CONSTRAINT module_resources_module_id_fkey FOREIGN KEY (module_id) REFERENCES public.modules(id);


--
-- Name: module_resources module_resources_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.module_resources
    ADD CONSTRAINT module_resources_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES public.learning_resources(id);


--
-- Name: modules modules_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: modules modules_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.actors(id);


--
-- Name: statements statements_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.statements
    ADD CONSTRAINT statements_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actors(id);


--
-- Name: statements statements_module_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.statements
    ADD CONSTRAINT statements_module_id_fkey FOREIGN KEY (module_id) REFERENCES public.modules(id);


--
-- Name: TABLE actors; Type: ACL; Schema: public; Owner: admin
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.actors TO api_user;


--
-- Name: TABLE courses; Type: ACL; Schema: public; Owner: admin
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.courses TO api_user;


--
-- Name: TABLE learning_resources; Type: ACL; Schema: public; Owner: admin
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.learning_resources TO api_user;


--
-- Name: TABLE module_resources; Type: ACL; Schema: public; Owner: admin
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.module_resources TO api_user;


--
-- Name: TABLE modules; Type: ACL; Schema: public; Owner: admin
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.modules TO api_user;


--
-- Name: TABLE statements; Type: ACL; Schema: public; Owner: admin
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.statements TO api_user;


--
-- PostgreSQL database dump complete
--

