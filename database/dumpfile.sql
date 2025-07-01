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
834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	user_test_inconsistent_12w_3c1724bd@example.com	User_test_inconsistent_12w_3c1724bd	student
cb485377-c70b-528f-bc91-91f51042122f	instructor1@example.com	instructor1	instructor
c0df20ab-c597-5adc-b23f-cebbe4d9a051	user_test_diminished_12w_d3db6cf8@example.com	User_test_diminished_12w_d3db6cf8	student
5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	user_test_u_shaped_12w_d35b55be@example.com	User_test_u_shaped_12w_d35b55be	student
ac7e21de-93e9-5324-b04e-2bb8c74e01ad	instructor3@example.com	instructor3	instructor
81da0bfe-19c8-5bcd-82d8-bcb5673384f0	instructor2@example.com	instructor2	instructor
dc22db1c-f777-5c82-8588-8dae349e49f8	user_test_consistent_12w_52554e6d@example.com	User_test_consistent_12w_52554e6d	student
a203229e-5fe7-5b14-a2da-9200a6214e7d	user_test_inconsistent_8w_072c4da8@example.com	User_test_inconsistent_8w_072c4da8	student
1a9c0bad-5fba-539b-bfdc-52239934b7b4	user_test_diminished_8w_35a69058@example.com	User_test_diminished_8w_35a69058	student
9631246f-5b7d-5b58-b9cb-cf589dcb81f2	user_test_u_shaped_8w_fabde55e@example.com	User_test_u_shaped_8w_fabde55e	student
544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	user_test_consistent_8w_2b6eb521@example.com	User_test_consistent_8w_2b6eb521	student
f8478e87-8fee-5ef3-95b1-41c971c4abab	user_test_inconsistent_4w_9e7b2bbf@example.com	User_test_inconsistent_4w_9e7b2bbf	student
0eb7d400-30ef-5ea7-a5de-f3a196fa569d	user_test_diminished_4w_64e387af@example.com	User_test_diminished_4w_64e387af	student
6001cdaa-df41-550b-adf6-6641e99307e2	user_test_u_shaped_4w_ab5298ca@example.com	User_test_u_shaped_4w_ab5298ca	student
92bf70e3-1598-5b49-9db4-d4b7dcff8d55	user_test_consistent_4w_f8825185@example.com	User_test_consistent_4w_f8825185	student
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.courses (id, title, description, language) FROM stdin;
179c8402-d46f-48fd-87f3-e463d76fbd1c	Baumchirurg/Baumchirurgin	Dieser Kurs gibt einen Überblick über die benötigten Kompetenzen und Fähigkeiten für die Berufsbezeichnung Baumchirurg/Baumchirurgin (http://data.europa.eu/esco/occupation/fa30c1cb-dbc5-409c-8124-7284592b123c)	en
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
0895d383-5f59-51b2-ae8c-e0b985d81f1f	179c8402-d46f-48fd-87f3-e463d76fbd1c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Bäume schützen	\N
f8743c64-6b32-5a84-a231-88eaa828b8f3	179c8402-d46f-48fd-87f3-e463d76fbd1c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Bäume kappen	\N
70423966-9ebb-5262-b082-4b8925547d57	179c8402-d46f-48fd-87f3-e463d76fbd1c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Bäume ausdünnen	\N
628435a2-1aba-5f57-8452-22f0f6fe8b5a	179c8402-d46f-48fd-87f3-e463d76fbd1c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Baumkonservierung	\N
0f8226a0-d513-534c-871b-15d9f310349b	179c8402-d46f-48fd-87f3-e463d76fbd1c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Beratung zu Fragen rund um Bäume	\N
02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	179c8402-d46f-48fd-87f3-e463d76fbd1c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Krankheits- und Schädlingsbekämpfung durchführen	\N
a38e6922-2eda-5548-9bc7-bd5f8e33cf73	179c8402-d46f-48fd-87f3-e463d76fbd1c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Grünpflanzen pflanzen	\N
d79afb6a-4da1-59a3-aca1-a837bf3e62aa	179c8402-d46f-48fd-87f3-e463d76fbd1c	d33a5ca9-9a16-57b0-92a2-51dae47aa69a	Baumkrankheiten bekämpfen	\N
fcc40587-6fbe-570f-8676-ba7f80daec71	179c8402-d46f-48fd-87f3-e463d76fbd1c	fddec982-57b8-5dd3-8122-3c2363cc0151	Auf Bäume klettern	\N
6db96e1f-b595-5aec-adbb-46b408029b79	179c8402-d46f-48fd-87f3-e463d76fbd1c	fddec982-57b8-5dd3-8122-3c2363cc0151	Gefahren im Umgang mit Bäumen mindern	\N
4bfce604-c23f-530e-8c8e-a24764e1667a	179c8402-d46f-48fd-87f3-e463d76fbd1c	fddec982-57b8-5dd3-8122-3c2363cc0151	Mit Seilausrüstung Bäume erklimmen	\N
9a044b1c-e0aa-54f5-8787-f52ec405b4d8	179c8402-d46f-48fd-87f3-e463d76fbd1c	fddec982-57b8-5dd3-8122-3c2363cc0151	Sicherheitsverfahren in großen Höhen befolgen	\N
f10c153c-968c-5979-b6cc-05736dc40095	179c8402-d46f-48fd-87f3-e463d76fbd1c	eb99265a-e3fa-5d65-a73c-8042621cf088	Kettensäge bedienen	\N
dd4608c4-45ad-543d-a42c-6276790440d3	179c8402-d46f-48fd-87f3-e463d76fbd1c	eb99265a-e3fa-5d65-a73c-8042621cf088	Forstwirtschaftliche Ausrüstung instand halten	\N
ab3ff241-b1ca-54ed-aa92-b324f1a5155b	179c8402-d46f-48fd-87f3-e463d76fbd1c	eb99265a-e3fa-5d65-a73c-8042621cf088	Bei der Baumidentifizierung assistieren	\N
eb99265a-e3fa-5d65-a73c-8042621cf088	179c8402-d46f-48fd-87f3-e463d76fbd1c	\N	Grundlagen der Instandhaltung	ac7e21de-93e9-5324-b04e-2bb8c74e01ad
fddec982-57b8-5dd3-8122-3c2363cc0151	179c8402-d46f-48fd-87f3-e463d76fbd1c	\N	Grundlagen des Kletterns	cb485377-c70b-528f-bc91-91f51042122f
d33a5ca9-9a16-57b0-92a2-51dae47aa69a	179c8402-d46f-48fd-87f3-e463d76fbd1c	\N	Grundlagen der Baumpflege	81da0bfe-19c8-5bcd-82d8-bcb5673384f0
\.


--
-- Data for Name: statements; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.statements (id, actor_id, module_id, verb, result, "timestamp") FROM stdin;
93fb02ed-0da3-4dc4-8237-7985676b9a75	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-08 11:51:22.78+00
3741ab7a-a9f8-46b8-b871-04a00ac24b53	c0df20ab-c597-5adc-b23f-cebbe4d9a051	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-08 11:51:22.789+00
b5c49476-1402-4264-b4eb-3b5d8c5145cb	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-08 11:53:22.785+00
1cbc02c7-a69e-4b22-95f0-f1eb9efd9fa0	c0df20ab-c597-5adc-b23f-cebbe4d9a051	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT103M"}	2025-04-08 13:34:22.789+00
14a3a08b-719b-4171-a272-772938a604d0	c0df20ab-c597-5adc-b23f-cebbe4d9a051	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-04-08 13:35:22.789+00
29a3bb76-f05c-469e-ab4f-9cb8ac48f176	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT124M"}	2025-04-08 13:55:22.78+00
efedfccd-44a5-4292-9edc-6d43d01cbdb6	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.75}}	2025-04-08 13:56:22.78+00
eb9f17e4-d864-4dc0-b46a-65d437115e2b	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT127M"}	2025-04-08 14:00:22.785+00
d7f38c96-503f-4fef-a2c2-c7ee1f82f08d	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-04-08 14:01:22.785+00
b17209a4-22e1-45bc-a6f6-d0c210b4c46a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-09 13:21:24.601+00
b87a861b-4569-4174-be4b-edaaf473f143	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-09 13:26:24.601+00
c41d88ff-62cc-4740-b9ec-e89274c4e94a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT160M"}	2025-04-09 16:06:24.601+00
3ea87baf-7b47-4bdf-9a86-148add5b81c9	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.69}}	2025-04-09 16:07:24.601+00
4d3c70f6-fefa-4809-b170-20a8d761121a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-09 16:14:24.601+00
070e03db-74ba-4401-9030-317ccb584e92	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-10 15:56:22.78+00
d9b9bfaa-9479-499c-83ce-f5851188d138	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT140M"}	2025-04-10 18:16:22.78+00
0c031c59-2e0d-4457-94fd-e680abbc7bc7	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 70, "scaled": 0.7}}	2025-04-10 18:17:22.78+00
5872db6f-b6fd-4020-a824-147f71aa89f3	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-10 18:22:22.78+00
ca7a6c38-138d-40fd-8b83-b23f41a41147	c0df20ab-c597-5adc-b23f-cebbe4d9a051	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-11 12:18:22.789+00
90bfa9be-74f4-439b-b1e8-1fcb4991b027	c0df20ab-c597-5adc-b23f-cebbe4d9a051	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-11 12:24:22.789+00
b0241434-5e05-4e35-be01-db3fdf30c0fa	c0df20ab-c597-5adc-b23f-cebbe4d9a051	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-11 12:31:22.789+00
9681bd78-2674-46ee-bd6a-68ad9e2d8b76	c0df20ab-c597-5adc-b23f-cebbe4d9a051	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT142M"}	2025-04-11 14:40:22.789+00
5b8fc6f0-95c0-46ec-83b7-f9283ac90db3	c0df20ab-c597-5adc-b23f-cebbe4d9a051	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72}}	2025-04-11 14:41:22.789+00
5a64f550-b9a0-4eb5-a16e-fbbc62b2fd98	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-11 16:42:49.533+00
48ccbdf5-c434-4c3f-8406-12eafa1ce383	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-11 16:45:49.533+00
8f192204-0037-4973-8602-18130d3435c5	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-11 18:04:22.771+00
03c447ad-ebfc-4240-bb29-112f0def1e01	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-11 18:07:22.771+00
02df1eab-1992-480f-8ed7-8d4d4d531882	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT137M"}	2025-04-11 20:24:22.771+00
c6fdeecb-98f1-4a9e-85e2-d488ce6a46dc	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-04-11 20:25:22.771+00
cd8475cb-2573-42a8-87cd-f45835996766	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-04-11 20:30:22.771+00
436bd280-66b0-4865-aabf-6add32397b3e	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT245M"}	2025-04-11 20:50:49.533+00
d7f07b24-50eb-45bd-af72-1b3bebaf4212	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.32}}	2025-04-11 20:51:49.533+00
2864ca55-a7ec-41e5-b0e7-390e03147e8a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-11 20:57:49.533+00
a3b530e2-a07f-4b99-8bde-2c66ed99d902	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-12 12:33:22.771+00
6630b21d-e219-4f3a-8c57-786862abb3ec	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT124M"}	2025-04-12 14:37:22.771+00
5385c0d5-d535-4346-a66f-5576425afd59	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 26, "scaled": 0.26}}	2025-04-12 14:38:22.771+00
e16d60a8-a9c4-4c23-bbad-180660664c30	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-04-12 14:42:22.771+00
c5026a94-c3c2-46cf-865a-f8cd4bde258b	c0df20ab-c597-5adc-b23f-cebbe4d9a051	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-12 14:48:22.789+00
155f1a5d-2b86-4aa2-8241-ea837e778781	c0df20ab-c597-5adc-b23f-cebbe4d9a051	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-12 14:52:22.789+00
92cec993-9c02-4af2-a5ec-a0f6b3def27c	c0df20ab-c597-5adc-b23f-cebbe4d9a051	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-12 15:02:22.789+00
a1dc5a67-f10a-4732-abcc-4733f6156edf	c0df20ab-c597-5adc-b23f-cebbe4d9a051	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT126M"}	2025-04-12 16:54:22.789+00
b38e36cd-4a33-4982-ac65-4c38459b12a2	c0df20ab-c597-5adc-b23f-cebbe4d9a051	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39}}	2025-04-12 16:55:22.789+00
61e92dad-5bcd-40b5-a61b-9ca743742d6a	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-13 12:50:22.771+00
4466acaa-2020-4b20-8711-8ff45dc19e84	c0df20ab-c597-5adc-b23f-cebbe4d9a051	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-13 14:01:22.789+00
c85684dd-5484-41fd-a7d4-0472e42c2f54	c0df20ab-c597-5adc-b23f-cebbe4d9a051	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT78M"}	2025-04-13 15:19:22.789+00
2df0a5fb-08b9-436e-be87-dafaa7b03e0c	c0df20ab-c597-5adc-b23f-cebbe4d9a051	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 26, "scaled": 0.26}}	2025-04-13 15:20:22.789+00
870661b0-5b35-4d85-af06-e653ce0cf4d9	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT152M"}	2025-04-13 15:22:22.771+00
3c39d065-31c6-4e54-b9b9-4c4c6eeca148	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-04-13 15:23:22.771+00
f1b87276-5685-443d-ac1f-560dbfca98cb	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-13 15:56:18.436+00
5a05ef3c-f1cc-4101-bf20-9db3950ad2b6	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-13 16:00:18.436+00
74c1b940-c7c7-46ac-8ac9-bb2d49e8c770	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT236M"}	2025-04-13 19:56:18.436+00
a8a777d2-ead6-469e-9dda-5076af24196c	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-04-13 19:57:18.436+00
8410eba5-436a-4e7f-8bcf-66562c842954	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-13 20:03:18.436+00
24049e60-9e67-4eb3-9627-4c3adea870e0	c0df20ab-c597-5adc-b23f-cebbe4d9a051	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-14 13:18:22.789+00
2e1eb5cf-6b12-4890-93e6-5e4bec1a9c68	c0df20ab-c597-5adc-b23f-cebbe4d9a051	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-04-14 13:21:22.789+00
5f6481f3-7c65-4cd2-970b-29a2fa884a10	c0df20ab-c597-5adc-b23f-cebbe4d9a051	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT105M"}	2025-04-14 15:03:22.789+00
bce8b6d2-55ac-4044-92f6-d778f5d3195b	c0df20ab-c597-5adc-b23f-cebbe4d9a051	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56}}	2025-04-14 15:04:22.789+00
d13a30b8-6c43-406c-9ef1-21b4b7854cfe	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-14 19:03:22.771+00
f176b98b-0fd7-4769-949e-ce898ea8adfe	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT129M"}	2025-04-14 21:12:22.771+00
b2cd62d3-5db3-4071-aa5a-29403cc45c24	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-04-14 21:13:22.771+00
6c32147c-531e-4b07-b7d2-480d5b942279	c0df20ab-c597-5adc-b23f-cebbe4d9a051	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-15 12:15:22.789+00
86b4cdef-743d-4a14-843a-50f4e24452d3	c0df20ab-c597-5adc-b23f-cebbe4d9a051	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-15 12:19:22.789+00
9e69370a-16da-46c2-a275-13d52286f344	c0df20ab-c597-5adc-b23f-cebbe4d9a051	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-15 12:29:22.789+00
f33c266a-2ef1-4c3b-bd56-6f415787508c	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-15 14:03:22.771+00
096ae15a-4c46-41c3-8554-9cba67b0f808	c0df20ab-c597-5adc-b23f-cebbe4d9a051	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT129M"}	2025-04-15 14:24:22.789+00
837e63ea-f098-4ed2-9ae4-3229b3038b66	c0df20ab-c597-5adc-b23f-cebbe4d9a051	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56}}	2025-04-15 14:25:22.789+00
8cddcd8a-5e44-4ae0-b7e9-922e26a520b0	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-15 15:47:22.78+00
23bb12a1-7d02-449e-b11c-1d7d6e7ec643	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-15 15:52:09.331+00
948aae79-30e7-47cf-a533-1df15d69d1fd	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-15 15:56:09.331+00
1441bc97-c492-4456-bcca-aed8732afa94	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT133M"}	2025-04-15 16:16:22.771+00
8f8d3e5d-9ef0-4cd7-8428-d8f6dba3d20f	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 70, "scaled": 0.7}}	2025-04-15 16:17:22.771+00
02d187cf-04e2-4bee-8236-a9650e9c2afe	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-04-15 16:19:22.771+00
7352ef62-9748-4eae-8c33-903b34fa1709	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.8172140076626757}}	2025-04-15 19:21:22.771+00
41241e6d-fa5b-41f3-8175-9486a66651c3	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.8172140076626757}}	2025-04-15 19:22:22.771+00
31ad5260-810b-4f7c-8dea-37067897b8c1	dc22db1c-f777-5c82-8588-8dae349e49f8	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-04-15 19:23:22.771+00
96d27408-8828-4dca-a3a1-8f1d6f288383	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT219M"}	2025-04-15 19:35:09.331+00
5e38b584-44f6-4377-bbd6-ce3f423b3665	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-04-15 19:36:09.331+00
4e5f4c9d-e4dc-47d0-b65c-453f2ad25127	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT250M"}	2025-04-15 19:57:22.78+00
a8d98868-7468-4057-bf19-6e026c14b332	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-04-15 19:58:22.78+00
a42553ef-4451-46bb-99c1-ef57ab3e2457	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-17 15:22:22.78+00
63429c88-2402-4af4-b3de-c8f276b1933b	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-17 15:24:08.051+00
337151f4-ec79-4e38-b2a2-6e776bd71543	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-17 17:15:22.771+00
24ca8df9-ed5e-4653-a322-5271236176ff	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-17 17:19:22.771+00
28f039f7-0fda-4232-aa28-17f44e46dd9e	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT164M"}	2025-04-17 18:06:22.78+00
b6593f49-f42d-4147-9a88-6452e0ddf91e	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-04-17 18:07:22.78+00
6671e268-ca15-4b9c-a0c9-7a912063367d	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-17 18:10:22.78+00
14575a8b-6914-4ce6-97c0-b78603e16be7	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT277M"}	2025-04-17 20:01:08.051+00
522c58bd-a016-4467-b234-dded2012e715	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.38}}	2025-04-17 20:02:08.051+00
57e35ff5-ce03-47df-b2b3-48e1bdbb1bf4	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-17 20:08:08.051+00
b970db91-45f2-483c-b6fe-399209148bce	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT175M"}	2025-04-17 20:14:22.771+00
a021b168-d36e-45fb-8382-98c209474d5b	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-04-17 20:15:22.771+00
546afe10-1eb1-42f4-8ed0-9ab253fc7cb4	c0df20ab-c597-5adc-b23f-cebbe4d9a051	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-18 14:39:22.789+00
f8126a84-342c-403b-a8df-204b92d49db8	c0df20ab-c597-5adc-b23f-cebbe4d9a051	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-04-18 14:48:22.789+00
3586cb08-5a32-449a-929b-a58650ff6fc0	c0df20ab-c597-5adc-b23f-cebbe4d9a051	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-18 14:57:22.789+00
13a811b6-db05-4fa2-b63a-dba97251f1e0	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-18 15:16:22.771+00
f38ee431-afca-4a25-99cf-cfbf34953645	c0df20ab-c597-5adc-b23f-cebbe4d9a051	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT83M"}	2025-04-18 16:02:22.789+00
f915c438-deae-44f2-9228-cb8918ac38cd	c0df20ab-c597-5adc-b23f-cebbe4d9a051	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-04-18 16:03:22.789+00
de044c8e-5f4d-4e45-8e7c-2fc4f788d84f	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT125M"}	2025-04-18 17:21:22.771+00
748efb3e-d7cb-4ff9-8775-a41c09254980	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-04-18 17:22:22.771+00
86431205-65ca-4e25-ac11-0734a8da5153	c0df20ab-c597-5adc-b23f-cebbe4d9a051	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-19 14:03:22.789+00
65cc2513-d78a-4ded-9be4-344de316ec59	c0df20ab-c597-5adc-b23f-cebbe4d9a051	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-19 14:07:22.789+00
67e36415-fe0a-4591-a409-e0a6f38b408c	c0df20ab-c597-5adc-b23f-cebbe4d9a051	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-19 14:10:22.789+00
f5f0c32b-31c1-4ad0-821d-6771e251fc88	c0df20ab-c597-5adc-b23f-cebbe4d9a051	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT91M"}	2025-04-19 15:34:22.789+00
47cea784-5e4d-4a19-b2b1-74e22ea39137	c0df20ab-c597-5adc-b23f-cebbe4d9a051	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-04-19 15:35:22.789+00
1d5eae31-75c4-484c-a5d7-d8be42f41d49	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-19 16:02:22.771+00
994c940f-6569-4a91-9dd5-84ab986feec2	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-19 18:14:08.626+00
de6c67f3-1e29-401f-b1a0-b7f59a48b45a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-19 18:17:08.626+00
635a8f84-3c42-4977-953d-ef2ff4d33dfe	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT173M"}	2025-04-19 18:55:22.771+00
b2305146-4b53-4889-a188-78b1b251b55f	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-04-19 18:56:22.771+00
cd45f153-351a-4532-acdf-1ad405a9459c	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT194M"}	2025-04-19 21:31:08.626+00
70e60f77-408f-40e3-8f1a-38bde951212c	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42}}	2025-04-19 21:32:08.626+00
a9733804-a8bb-4777-b605-7afde67fb21b	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-19 21:39:08.626+00
b32aa302-54a4-49e0-bc5c-7c4e6ccb7925	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-20 14:20:22.78+00
242ce205-01c5-47e4-bb6c-9e42b538160a	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT145M"}	2025-04-20 16:45:22.78+00
abcb61c2-1f3c-455e-91aa-1ac0173787f4	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-04-20 16:46:22.78+00
de7407e2-0a79-43c5-b42f-fc7fca8bcba9	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-20 16:53:22.78+00
ba6cf889-5c7d-4925-a65a-28e910113b1b	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-20 17:46:22.771+00
b03d60bc-df48-4b8b-ae1a-78c6046f07be	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-20 17:49:22.771+00
43d362c4-0379-43c8-bb6e-b2d6c62b437b	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT148M"}	2025-04-20 20:17:22.771+00
907ff80a-b2be-42d0-b203-d6e2f87c8093	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-04-20 20:18:22.771+00
6a76c23a-8c57-4b8e-950c-ddfa3b200e22	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-21 13:53:22.771+00
3aa7a765-27dd-4e7e-bfed-0918a8ebdd19	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-21 15:56:24.161+00
a8285015-507b-468f-a51c-c53e77234da8	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-21 16:01:24.161+00
e8a1a740-4b12-49d8-b1ba-cd85070dadc0	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT158M"}	2025-04-21 16:31:22.771+00
0a9dbae8-cad9-4df6-bee0-027c3649e188	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-04-21 16:32:22.771+00
fa4db5fa-6584-4965-b7c6-28fda67df16e	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-04-21 16:33:22.771+00
ee302108-d8dc-4222-be0d-7c12debcb808	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT127M"}	2025-04-21 18:08:24.161+00
4908e718-ddcf-4365-b0ae-35ac2f18feec	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-04-21 18:09:24.161+00
6d255c16-83c1-4a6e-b3d1-e736e36fa2bf	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-21 18:12:24.161+00
81505572-4a67-490e-8c84-eb6ff63e8363	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-22 10:52:59.35+00
3ebf5c01-98ad-4468-aa16-54514fa74997	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-22 10:55:59.35+00
e4bd6f84-2f35-4a92-9b50-dab82e034bdc	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT258M"}	2025-04-22 15:13:59.35+00
a53d362c-4fc1-4d0b-a399-1642dab47378	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-04-22 15:14:59.35+00
673588b4-249f-401b-9dcf-45f3a72c78f4	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-22 18:56:22.771+00
41316506-d12e-47ca-97eb-f6405a6123c7	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT158M"}	2025-04-22 21:34:22.771+00
76d90a60-f96e-447e-91b2-53b7c30bd864	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-04-22 21:35:22.771+00
21a49bf6-cb5f-44d8-88d1-194d96001aa2	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-04-22 21:38:22.771+00
3f6db43a-d7ad-4ed6-8d00-096570d5885e	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.5221373170577654}}	2025-04-23 00:45:22.771+00
4c982213-fa73-4a92-992c-fcbf0e3fdbbf	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.5221373170577654}}	2025-04-23 00:46:22.771+00
76a35e07-81d1-432c-8c9c-55b479f89747	dc22db1c-f777-5c82-8588-8dae349e49f8	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9}}	2025-04-23 00:47:22.771+00
61b1721f-9b3a-4047-9442-4d83311a6d4f	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-23 12:42:23.234+00
da8790e8-f8fc-4d16-967b-391c7907f16c	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-23 12:46:23.234+00
6bb75fd1-d901-4f84-9e7d-5a2cfdb3bfe4	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT143M"}	2025-04-23 15:09:23.234+00
38cc79e3-894d-4401-9755-6184f1b531c6	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-04-23 15:10:23.234+00
f31c5c84-c568-41fc-830d-e097ab2562b1	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-23 15:19:23.234+00
2b9c7212-2dc8-4c77-b8cb-d0320b1c677a	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-24 16:24:22.78+00
fc589d01-6591-4c06-8c2f-68847a375b44	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT255M"}	2025-04-24 20:39:22.78+00
5e15812a-9421-4de8-bc93-fbc1204535fd	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-04-24 20:40:22.78+00
6b4d3104-3b5f-41dc-bd8c-747a1b638da1	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-24 20:44:22.78+00
87cdd507-56f1-4b2d-b7f0-68ac95dbcd86	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-25 11:42:22.771+00
beab5e52-78e7-4400-b2eb-c0f0c525a2d3	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT180M"}	2025-04-25 14:42:22.771+00
1fda799d-9372-471e-8c78-3af3635dbabb	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-04-25 14:43:22.771+00
5ba13d03-8808-4719-830c-9758ba1ed4c9	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-25 15:54:22.78+00
5c9605c9-6fd3-4ba9-9f6a-4225c32d1100	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-25 18:04:26.269+00
7b42d878-af44-4426-aaec-d35244c64a69	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-25 18:08:26.269+00
3d156ce7-222a-4f6f-bb8d-111ff502c096	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT159M"}	2025-04-25 18:33:22.78+00
43dc24b1-4c26-42cb-b6e0-d9423eb0b667	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.86}}	2025-04-25 18:34:22.78+00
3267a9ba-128f-4bca-9f4b-2ae4362b9366	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-04-25 18:36:22.78+00
ac7694a8-ec96-49e7-8203-cf9434c3800f	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT143M"}	2025-04-25 20:31:26.269+00
16cea0da-ba41-4738-a423-6e7e0c425822	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-04-25 20:32:26.269+00
ba740cc0-ca7a-4398-b18a-03d5e7e4e422	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-25 20:38:26.269+00
c384c72d-7674-4a1f-b829-a0e0a153eef3	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-26 11:59:22.771+00
ff8ed2b4-973c-4374-80c7-32225079093d	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT153M"}	2025-04-26 14:32:22.771+00
98e5d6d1-f3c2-46fc-b55a-d28b773fcc09	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 12, "scaled": 0.12}}	2025-04-26 14:33:22.771+00
c036d497-593b-4140-9eef-2f5a0dd9fc2d	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-27 13:57:26.856+00
12a5bf73-0d49-4cf1-9f80-f0ae3de117b6	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-27 14:02:26.856+00
c4dda2b4-4486-4bf0-bfc0-a6716341801c	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-27 15:10:22.771+00
e5d30fd0-b4c4-42f1-9fbe-05bff9f6c00e	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT131M"}	2025-04-27 17:21:22.771+00
c2c6a48f-f1e2-4a13-969b-7ef43084c8ed	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24}}	2025-04-27 17:22:22.771+00
1704c696-b72f-4ad0-bfd8-51eacf2e4b8d	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT316M"}	2025-04-27 19:18:26.856+00
ae68c7f7-0a85-43f3-b73a-fbca1ed5b863	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-04-27 19:19:26.856+00
df6d26a8-74eb-4c2e-a963-0720836b5952	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-04-27 19:29:26.856+00
024520b2-0528-4f41-a249-d439b61a4239	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-04-27 19:30:26.856+00
88c7ad1e-6e32-4cd4-9119-6abcbf5b6952	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41}}	2025-04-27 19:31:26.856+00
74cbee53-651f-4deb-b7d9-f0cd888e98fd	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-04-27 19:33:26.856+00
48483c40-346a-4fcf-9050-b02d453c524f	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-28 10:11:22.771+00
f8ad8a57-1d28-4a87-89da-fd6ac01831d8	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT140M"}	2025-04-28 12:31:22.771+00
7133a861-4f89-452c-b346-e25ba20ed914	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-04-28 12:32:22.771+00
928e71a5-9c7a-4432-8bff-22e5c17c10f8	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-29 15:30:22.78+00
b3ca4c62-4078-4938-8a39-eb3fc0997d3a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-29 18:04:43.466+00
fa7feba0-a158-4466-be92-7a6680699887	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-29 18:07:43.466+00
9c291d01-7f33-4cbc-8414-65222cbea080	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT191M"}	2025-04-29 18:41:22.78+00
b733f621-f4cd-4f0e-b27a-c5883658801e	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-04-29 18:42:22.78+00
875a7719-2846-4ffc-9645-a9fa5b0b6ff6	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-29 18:57:22.771+00
7a8ed628-a5b1-4270-a863-0dba3dad8d45	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT130M"}	2025-04-29 20:17:43.466+00
dcc34a4b-d45e-4301-b11a-c0fa251f30ff	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 21, "scaled": 0.21}}	2025-04-29 20:18:43.466+00
3fda0c22-eadf-4216-b585-6ffcfec233f8	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-04-29 20:25:43.466+00
67cd3a36-c4c0-4c33-be86-832f445689cf	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT157M"}	2025-04-29 21:34:22.771+00
e0f495b5-66fc-40ca-b7e0-e59d4283eaca	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.29}}	2025-04-29 21:35:22.771+00
d1614a63-7c63-4877-ae90-b4c5a10e74e8	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-04-30 17:45:22.771+00
e91c6d44-c315-4eab-b15e-50ea046d21a1	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT170M"}	2025-04-30 20:35:22.771+00
3cc82e22-b7a2-44c8-8984-ce6d64609e1b	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-04-30 20:36:22.771+00
1f57a771-78ee-4a36-bab7-b76cf32f0330	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.8646680996412364}}	2025-04-30 22:39:22.771+00
8671183b-e083-4983-8b86-3aa46a0803aa	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.8646680996412364}}	2025-04-30 22:40:22.771+00
09c9481b-a72e-4d78-b14b-0f36c2aca40c	dc22db1c-f777-5c82-8588-8dae349e49f8	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.57}}	2025-04-30 22:41:22.771+00
7ff6df27-9eaa-4e77-b676-8bee45033f61	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-01 18:21:51.923+00
fded8835-8c53-4e62-961e-0ef54aa7e6af	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-01 18:26:51.923+00
262d4a22-3825-48ca-9154-b6c8526b8346	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT281M"}	2025-05-01 23:07:51.923+00
75451055-8a51-4a83-ae74-1f83c7b3df12	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-05-01 23:08:51.923+00
8f3245b1-db80-4bb0-a514-1c223d326571	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-01 23:16:51.923+00
2bfd0a5c-a093-44a9-8308-e4209fad08d4	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-02 12:33:22.771+00
8cd4e807-3568-485e-a4a9-7d845692c99b	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT130M"}	2025-05-02 14:43:22.771+00
7486e3c2-a02f-4aae-b7aa-330653725054	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-05-02 14:44:22.771+00
09964a94-6e21-4656-a8b6-9f2d028034bd	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-03 13:47:19.742+00
9b49cc09-6afd-4c17-8480-9bd15a9320ba	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-03 13:51:19.742+00
01bb6261-c506-4092-9f6a-0f59f4fa9edd	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-03 15:55:22.78+00
bd80d36d-5106-492d-9434-742b0d69eb59	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT139M"}	2025-05-03 16:10:19.742+00
27d55d92-cbbb-4d8a-affd-5f771b7d620b	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 27, "scaled": 0.27}}	2025-05-03 16:11:19.742+00
2fd748db-7b51-4e44-803d-dd2407b31357	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-03 16:17:19.742+00
cd2c4d43-3415-4bfa-b805-29f729461b47	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-03 17:11:22.771+00
76aa3711-eb4e-4095-b9cb-a84e6e769272	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT196M"}	2025-05-03 19:11:22.78+00
090e005a-ad94-4b91-9910-c19f95705cdb	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-05-03 19:12:22.78+00
cefe13ff-1931-41c6-bae6-7d809d551262	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-03 19:19:22.78+00
fa63e659-610a-4168-a396-745deafd6af4	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT172M"}	2025-05-03 20:03:22.771+00
23108bec-7d86-49da-ba85-eaab99c952d0	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-05-03 20:04:22.771+00
caf4c46d-2677-49b0-b85d-93853dfe9977	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-04 11:15:50.332+00
96132af5-5c0e-418e-942d-172e7070d995	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-04 11:19:50.332+00
ec38b9a9-63f8-4b31-b8ac-a588f9530973	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-04 14:05:22.771+00
712aa299-2103-4117-b87b-9b0b9ea9ea26	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-04 14:08:22.771+00
1e5cd9dd-e86b-45cf-a4b4-41e47ffe0fcd	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT178M"}	2025-05-04 14:17:50.332+00
04251172-7dee-4f5e-bf21-1aea3d1b93b1	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 8, "scaled": 0.08}}	2025-05-04 14:18:50.332+00
62e9fc4b-3430-4009-b85f-096d17e4c796	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-04 14:22:50.332+00
fc0ebcea-3a0a-4a40-b63b-1010f7650240	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT154M"}	2025-05-04 16:42:22.771+00
ab61a040-48a1-4f79-8515-d6995b67cceb	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-05-04 16:43:22.771+00
4a7afd3e-a34e-4257-9247-66480e2dcb4c	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-05 14:28:28.818+00
b82ee3ea-2f0b-470b-b286-0980be70202b	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-05 16:14:22.771+00
f2b1202f-c7ee-4fab-a68c-e5f6724efe67	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-05 16:18:22.771+00
f47b5520-b944-4ca8-8870-722ebf27a919	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-05 16:42:22.78+00
4924b0bc-1105-417d-b46d-caff89956c7b	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT128M"}	2025-05-05 18:26:22.771+00
cffd2413-2a16-4221-8aad-390e4096ff84	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.38}}	2025-05-05 18:27:22.771+00
a6a738b5-3078-43fb-9a89-7d076dda5fa5	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-05 18:30:22.771+00
12d6b1c7-c123-4aa2-84a3-600804191bb8	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT247M"}	2025-05-05 18:35:28.818+00
cfb95dbf-8799-45cb-a7b2-3efffe315e9f	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-05-05 18:36:28.818+00
de22c1ed-7104-4af1-a912-07eb5f35c993	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-05 18:38:28.818+00
82b3f95f-f813-430d-b600-e3612199fd59	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT255M"}	2025-05-05 20:57:22.78+00
296ae760-41d5-49b6-a97e-e9ab6a4c5abf	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.57}}	2025-05-05 20:58:22.78+00
10ef2d32-3063-4189-8e8d-afb7581ba831	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-06 11:51:22.777+00
86a5d30b-2756-474c-85b8-869b3e3b7a56	1a9c0bad-5fba-539b-bfdc-52239934b7b4	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-06 11:51:22.788+00
27e881c5-f5ea-4724-a97d-c96f99d395ce	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-06 11:52:22.783+00
55263d8d-97ef-4bd6-82f9-bd69c1fecc17	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-06 11:54:22.766+00
a9879f7b-de8f-4e43-8eb8-7236463f127d	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-06 11:56:22.783+00
ad6873ec-1c34-4c69-987a-94e1be500754	1a9c0bad-5fba-539b-bfdc-52239934b7b4	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-06 11:56:22.788+00
3f1f0be2-e2d1-4872-8677-766996d751b5	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT56M"}	2025-05-06 12:50:22.766+00
1a33d72e-7390-4c5b-b507-5e476bf3326c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-05-06 12:51:22.766+00
a29bf68e-3662-4e33-9fa7-bed00f7dbfb8	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT63M"}	2025-05-06 12:54:22.777+00
2927fd4d-d7c2-4f5e-9ae4-c78166105614	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-05-06 12:55:22.777+00
a5b722ad-89b1-4785-8ea4-2afa9591869e	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-06 13:04:22.777+00
e1310793-7cb8-4a36-acc3-0372be3f1a61	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-06 13:15:22.771+00
a355ff05-d343-4750-bb8c-983def84c7be	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT229M"}	2025-05-06 15:45:22.783+00
df0a1953-4aed-410c-b2d9-8f5e3d7d5bc7	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 73, "scaled": 0.73}}	2025-05-06 15:46:22.783+00
60fc190d-a9ca-408b-8f98-b0d3e5d6d36e	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-06 15:52:22.783+00
935958dc-8890-4f62-9e3a-d9bdc1a56a81	1a9c0bad-5fba-539b-bfdc-52239934b7b4	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT256M"}	2025-05-06 16:07:22.788+00
abde0d55-4d21-402d-b0e6-8502aa5c631c	1a9c0bad-5fba-539b-bfdc-52239934b7b4	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-05-06 16:08:22.788+00
d7ad2c3e-4d75-405e-b9c1-d2a326405fa6	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT184M"}	2025-05-06 16:19:22.771+00
5344353d-2c1f-4f67-9120-4dbff7238296	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.2}}	2025-05-06 16:20:22.771+00
0fa6a37a-6f24-411b-ace5-9da67cd57c9d	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-06 16:24:22.771+00
dc0cfd20-281f-4a9c-9a7b-deb02b39b571	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-07 09:19:22.766+00
1e2130f7-2936-4ed5-bc01-72bb36bb4a5e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-07 09:21:22.766+00
86f5d5f9-1249-4f13-a572-dd0e2fe0d613	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-05-07 10:25:22.766+00
e9c08846-7b3f-4435-8882-a6d321227974	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-05-07 10:26:22.766+00
06af0592-f5b8-4a92-842b-cbe989ead4fd	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-07 10:29:22.771+00
af20b4d0-4c0c-4af3-b049-a31afb31c393	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT132M"}	2025-05-07 12:41:22.771+00
bce78255-1764-44c0-b949-75689c874d2a	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 4, "scaled": 0.04}}	2025-05-07 12:42:22.771+00
d0f7deb1-dbd3-4cf9-a1b1-69a9e534a0de	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-07 12:47:22.771+00
de2bcafe-0aee-469f-ae26-cf92045e95bf	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-07 14:24:40.8+00
a1babeaa-40d4-4aca-95c4-104d24373dbc	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-07 14:26:40.8+00
390a8045-3a10-4762-b967-96579e58ce38	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41366217272355116}}	2025-05-07 14:27:22.771+00
5af8d286-1b43-4085-a374-82eadff3fddf	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41366217272355116}}	2025-05-07 14:28:22.771+00
3f91f5db-8ba1-4c2b-9735-664df3cf871c	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 16, "scaled": 0.16}}	2025-05-07 14:29:22.771+00
2f889891-8248-4048-a276-8899f5021e3e	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-07 16:00:22.777+00
ca56b071-c416-4fe5-a39c-73b889f56be3	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT39M"}	2025-05-07 16:39:22.777+00
413c2378-2431-43c8-b11d-4a1586238b4a	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39}}	2025-05-07 16:40:22.777+00
ad0533ff-d3b2-4f38-ac7b-44b123355e1d	1a9c0bad-5fba-539b-bfdc-52239934b7b4	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-07 17:57:22.788+00
57b01bde-bf8b-4433-8ce2-0dbcf7199ac1	1a9c0bad-5fba-539b-bfdc-52239934b7b4	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-05-07 18:07:22.788+00
8a75841d-1cda-4275-85c5-4d313d5c40fa	1a9c0bad-5fba-539b-bfdc-52239934b7b4	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-07 18:10:22.788+00
25b39763-0a0f-41dc-85f8-9f6896ad0732	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT250M"}	2025-05-07 18:36:40.8+00
10cfcfc7-a733-43ab-a464-879f2787895e	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-05-07 18:37:40.8+00
5a9a2360-971a-48fa-b5d9-2db67309ee19	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-07 18:45:40.8+00
217f6a65-eb08-4e10-b21b-ac1003eb9975	1a9c0bad-5fba-539b-bfdc-52239934b7b4	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT186M"}	2025-05-07 21:03:22.788+00
486047f9-c781-4eed-901d-e10b145f9aee	1a9c0bad-5fba-539b-bfdc-52239934b7b4	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-05-07 21:04:22.788+00
c631cd3d-dd98-4de9-8916-7159c7bd08cf	1a9c0bad-5fba-539b-bfdc-52239934b7b4	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-08 09:29:22.788+00
6dcdcd2f-71b8-438f-8a05-2bf21ce20b65	1a9c0bad-5fba-539b-bfdc-52239934b7b4	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-08 09:35:22.788+00
1098cbcf-6cfb-4e44-b093-f3c7e786d045	1a9c0bad-5fba-539b-bfdc-52239934b7b4	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT107M"}	2025-05-08 11:16:22.788+00
011eb62c-d575-4be3-a332-1c8eeb07f40f	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-12 17:17:22.788+00
32e4f0ed-c82f-47a2-aeb5-824075a30ecc	1a9c0bad-5fba-539b-bfdc-52239934b7b4	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-05-08 11:17:22.788+00
caae6632-90d2-45b5-b5ca-55fa9d24e85a	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-08 13:57:24.904+00
011663b5-8ef3-4326-a112-812364d65475	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-08 13:59:24.904+00
e643b627-e6a0-4ee8-a5b8-a9359fdefec3	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-08 14:28:22.771+00
699175e8-c1c1-4edc-9424-c7b8c5d5f010	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-08 14:31:22.78+00
9885df49-0b6d-4a1b-ac7c-fc724a576fa9	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT126M"}	2025-05-08 16:37:22.78+00
6cd2fa82-e41f-4e54-8e11-7c9dd95402d9	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-05-08 16:38:22.78+00
707caae0-039b-4516-8b57-064d589d78e4	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-08 16:41:22.78+00
76922304-fa96-4ecf-920a-d766d6c84494	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT136M"}	2025-05-08 16:44:22.771+00
95a51cb0-49cd-40b6-abab-6ca6629b5c27	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 28, "scaled": 0.28}}	2025-05-08 16:45:22.771+00
c9cd308a-5669-4f56-a534-29a1a3627fe9	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT166M"}	2025-05-08 16:45:24.904+00
0eab04ad-42d6-4747-9461-a6c5b5fe4a9f	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-05-08 16:46:24.904+00
b265dca1-82f7-493b-b1eb-c4b27aaf550d	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-08 16:54:24.904+00
01922272-9643-4234-9578-c70617d43985	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-08 18:51:22.777+00
7e1ce8b9-4706-4a44-933a-98161402717e	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37533745655226086}}	2025-05-08 19:34:22.771+00
3e532d09-2aac-42f6-b052-71ccb8ece2f5	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-08 19:35:22.766+00
79e31c11-af3f-47ab-9670-ff6dd74b0d2c	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37533745655226086}}	2025-05-08 19:35:22.771+00
cea317cd-60ac-4838-a008-752dcc7109fd	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.38}}	2025-05-08 19:36:22.771+00
7ce6cce1-2bed-4d11-b132-a6a0593a1c0f	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT67M"}	2025-05-08 19:58:22.777+00
6a653c86-5286-429f-ae93-d8450aee7ff8	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-05-08 19:59:22.777+00
3ebbcc63-a4d5-466a-bcb8-bb03aeb0fc73	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-05-08 20:39:22.766+00
d945abed-b845-4e01-ba49-19b53212e0ff	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-05-08 20:40:22.766+00
9bcb9a21-a65e-4096-8b8c-d8b637a837e7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-08 20:42:22.766+00
35a440e7-f2a0-4699-ba42-af54435ae676	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-09 14:21:52.489+00
71412890-21f2-4d26-b4be-ce4f26246a70	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-09 15:37:22.771+00
eb129e57-924e-4663-a09c-322c862e5e60	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-09 16:07:22.788+00
04b60355-1dd2-44e3-bdd3-7d7d8491a78a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT110M"}	2025-05-09 16:11:52.489+00
38de9124-85da-4713-b54a-c6523fe77436	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24}}	2025-05-09 16:12:52.489+00
62c19ae5-d163-4632-9703-36121d993a9d	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-09 16:15:22.788+00
187c1d84-5bd4-48f4-85fc-d92fcb57e1c9	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-09 16:16:52.489+00
36a5ebf8-4c87-48aa-89a6-0e6d0288fa73	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-09 17:02:22.766+00
125f8753-79cc-4f88-a76e-71ceeb11d93f	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT125M"}	2025-05-09 17:42:22.771+00
d5a5a22e-af71-4adf-99b9-97b0673dcd90	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.57}}	2025-05-09 17:43:22.771+00
3110cce6-6812-4b96-845a-a214c73fde62	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-05-09 17:45:22.771+00
486c2af9-1596-4bc5-abaa-9a5e2c20ff66	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT61M"}	2025-05-09 18:03:22.766+00
50be3c06-a636-470a-8f8f-57aca1b5416a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-05-09 18:04:22.766+00
591b3026-65fc-4089-9cba-d43c61f20721	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5645451090508827}}	2025-05-09 19:18:22.766+00
e9ec02e5-5f8f-4fd3-8a3c-c7f1b630d78f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5645451090508827}}	2025-05-09 19:19:22.766+00
7cefcd8a-18fe-4960-b418-61170396c598	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 15, "scaled": 0.15}}	2025-05-09 19:20:22.766+00
21930730-aea1-4939-b805-29e899cb1771	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-09 19:47:22.777+00
b6094150-f64a-411e-9a90-81f66181b1b8	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.421232324511111}}	2025-05-09 19:59:22.771+00
07a879c9-ed03-46a7-b3fc-91f6afbad8b5	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.421232324511111}}	2025-05-09 20:00:22.771+00
f1306d86-3b50-4b60-afde-27097468c1b2	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-05-09 20:01:22.771+00
dd7ac65f-31dc-4e9b-b4b1-41a79102f321	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT241M"}	2025-05-09 20:08:22.788+00
044ef3b2-6e93-4865-809c-441ef81f0b36	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-05-09 20:09:22.788+00
eb8fb57c-a4aa-4990-a501-150fd8379bec	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-05-09 20:44:22.777+00
60f5f58a-01f5-4c16-861e-45eae0ad6f36	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-05-09 20:45:22.777+00
815e6525-950e-4225-84c9-553e53521298	1a9c0bad-5fba-539b-bfdc-52239934b7b4	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-10 08:00:22.788+00
01180865-bc56-4832-a353-b62fb82305ad	1a9c0bad-5fba-539b-bfdc-52239934b7b4	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-05-10 08:05:22.788+00
d2ef7216-d8ed-45dd-98f4-3313be9db93b	1a9c0bad-5fba-539b-bfdc-52239934b7b4	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-10 08:11:22.788+00
0f208b34-2793-4485-8a1c-9915e5d0decb	1a9c0bad-5fba-539b-bfdc-52239934b7b4	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT102M"}	2025-05-10 09:42:22.788+00
cd33fead-1cbe-4911-8bd1-3cea57538e9a	1a9c0bad-5fba-539b-bfdc-52239934b7b4	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.69}}	2025-05-10 09:43:22.788+00
62af86ee-83fb-4df0-babd-f5ff4cca90fe	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-10 13:17:22.771+00
7904572e-cec6-484f-b3c0-1a874dd7178b	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-10 13:22:22.771+00
001c195a-fc72-4d3a-9200-22b687721d13	a203229e-5fe7-5b14-a2da-9200a6214e7d	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-10 13:52:22.777+00
a40f1ade-de25-4bdb-a049-0f976517c907	a203229e-5fe7-5b14-a2da-9200a6214e7d	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT71M"}	2025-05-10 15:03:22.777+00
99756e15-68ff-4be6-82f0-8ab578c6cf0e	a203229e-5fe7-5b14-a2da-9200a6214e7d	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43}}	2025-05-10 15:04:22.777+00
0ffe0c6c-b8cf-481f-ba45-55ba36c20de7	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-10 15:17:48.334+00
8a0f17b1-24c8-43b0-9b65-6643042e7459	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-10 15:22:48.334+00
a9f3b90d-763c-4379-bc9d-e96d2464a65b	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT147M"}	2025-05-10 15:49:22.771+00
2ab5b6c1-bdb4-4ab4-9f92-c839a22b7a1c	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.82}}	2025-05-10 15:50:22.771+00
42f59972-6ae7-4aff-9e38-86fc3e7168b5	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-10 15:51:22.771+00
5c42d92c-7ba9-4895-b4f2-da93891c5c78	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT201M"}	2025-05-10 18:43:48.334+00
fe75e0b9-601f-4ec6-9cf3-30979ff2268a	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-05-10 18:44:48.334+00
99686c5e-9007-4678-8678-539d46c0da22	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-10 18:53:48.334+00
73683a7c-1bad-402e-bbb1-3a0dc12bc779	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.5421723660754532}}	2025-05-10 19:17:22.771+00
1d0855a7-7b92-4228-86ea-97eda7464126	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.5421723660754532}}	2025-05-10 19:18:22.771+00
49e729ce-a158-4844-b691-524cb7eefa22	dc22db1c-f777-5c82-8588-8dae349e49f8	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-05-10 19:19:22.771+00
8ce8a028-c63f-472a-a862-e06767070654	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-11 14:58:22.766+00
57ec7ed8-294b-4267-9dcc-91f9b89ac4ff	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-11 15:00:22.766+00
3b12b12b-c62c-4c86-bcf4-7d35193c0368	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-11 15:08:19.317+00
ab6480cb-2688-4220-99a4-a96ffcd3fb4a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-11 15:13:19.317+00
8bbcd907-3551-4171-b533-6f7b6137187d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-05-11 16:04:22.766+00
189b9dcd-a4d2-452e-82dc-19b67557449a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-05-11 16:05:22.766+00
edfef24d-5c5c-4046-84e8-3a94ea87fe3d	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT53M"}	2025-05-11 16:06:19.317+00
e606680d-2e78-4432-a578-9859996a785a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-05-11 16:07:19.317+00
7df10701-fc8e-47f8-8b63-ae1ab004d213	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-11 16:12:19.317+00
2bae37fd-5824-4df7-beac-64f23323f14f	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-11 16:27:22.78+00
06db90c6-8a71-4610-bde4-98d202e2e636	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT139M"}	2025-05-11 18:46:22.78+00
bb7211d0-1045-48f9-9e56-94bd39d1e48e	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-05-11 18:47:22.78+00
3ce40a3c-1be2-4157-9bd8-40ee00051d10	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-11 19:56:22.777+00
7c205dc6-dca2-4714-af1f-45467138997f	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT69M"}	2025-05-11 21:05:22.777+00
81df5e3d-68eb-41c1-8721-362810f80833	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.2}}	2025-05-11 21:06:22.777+00
d5e8e04f-7651-4e4f-8940-139fedb251be	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-12 08:49:22.766+00
077b253c-03a7-467b-99d5-79714a284d57	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT55M"}	2025-05-12 09:44:22.766+00
e7bcdd4f-061b-47ff-bd5d-582f72411be8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-05-12 09:45:22.766+00
dc2ba2b9-8640-4b02-84f6-c2728ec20a64	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-12 14:03:22.78+00
728760b0-1648-429e-9fda-10f6ae5c7d08	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-12 14:54:22.771+00
091191e3-3f68-48b4-a59d-f56cceef7190	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT87M"}	2025-05-12 15:30:22.78+00
24414b3f-9f1a-4825-9ba2-6a9085ce4e38	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-05-12 15:31:22.78+00
2f015345-b1cd-4d87-b7c8-d96b1b1e6162	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-12 17:14:22.788+00
0c2b5dfb-c85d-4a61-81e9-43546347db41	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT162M"}	2025-05-12 17:36:22.771+00
d383d284-a8c5-4c4b-ae1a-6cea8a82ec20	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-05-12 17:37:22.771+00
e698f1c2-d92c-4030-9e7d-e7d7b15a06f3	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-12 17:41:22.771+00
72d52c42-668a-4aa3-bca9-a93104841d06	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT188M"}	2025-05-12 20:22:22.788+00
8b6f9d19-f821-4527-be5b-4182e63a1b43	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-05-12 20:23:22.788+00
9086078e-b001-48c0-9a3e-1a362263cfa0	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-13 13:00:59.625+00
03dba6db-4b34-4ab7-b192-3270dc507f8d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-13 13:26:22.766+00
cb03d5ad-eb7c-40f1-9e0d-1a3783a3361d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-13 13:30:22.766+00
a1d4a2c8-69c2-4899-b9d5-45ab39f96837	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT63M"}	2025-05-13 14:03:59.625+00
7a840e37-06dd-4859-89a8-1ac56d78fee1	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-05-13 14:04:59.625+00
8570a461-6316-4fbf-ad56-e11bb7883930	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-13 14:09:59.625+00
c250dd03-dbf6-49da-bfdc-f79887b4704b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT56M"}	2025-05-13 14:26:22.766+00
5f8a627a-d028-4158-a536-37991b3dc545	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 11, "scaled": 0.11}}	2025-05-13 14:27:22.766+00
cf551115-62f6-4740-8172-e28ce6488acf	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-13 14:35:22.78+00
a659a3c1-ff45-4322-a2f8-89c313a1157b	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-13 16:02:47.482+00
04b23f51-56b7-43b6-baea-dd15282f0862	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-13 16:06:47.482+00
27d873db-6c42-4580-872c-3c7917d068fa	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-13 17:00:22.771+00
d225f804-1c7e-4071-ad3a-5a4ba985a70d	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-13 18:07:22.777+00
0db19a23-96ca-487a-9167-fd6ca6770ad1	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT228M"}	2025-05-13 18:23:22.78+00
6c0e7df9-0db7-4c2b-93d3-412bc83d0b07	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.6}}	2025-05-13 18:24:22.78+00
bac67c2e-8045-41c1-bd25-88b4dfcbc0b1	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT24M"}	2025-05-13 18:31:22.777+00
79ccec11-aa27-4c78-a7ef-bb881ff4fe2c	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-05-13 18:32:22.777+00
6886bc13-1726-4869-9d3f-f2698d80140f	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.3913685373626379}}	2025-05-13 19:14:22.78+00
4b2a2e2f-40af-4e23-a26d-a4a97e055c30	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.3913685373626379}}	2025-05-13 19:15:22.78+00
098765dd-adb0-4d1b-b89c-f5347c59f92a	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-05-13 19:16:22.78+00
50053b62-d9d0-42f5-bc11-f953f27f5d75	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT144M"}	2025-05-13 19:24:22.771+00
1a1e9e69-0bb6-4a81-b319-acd0827fdbc6	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56}}	2025-05-13 19:25:22.771+00
5a8f6a33-1f8c-42b1-9928-3c206e66bb3a	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT236M"}	2025-05-13 20:02:47.482+00
0cb11d64-6366-46b9-9666-24119f41648c	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39}}	2025-05-13 20:03:47.482+00
482e1b9c-8795-4f54-8875-fa2a32adb60f	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-13 20:08:47.482+00
a7689e6e-49bc-44ea-ac5a-3d41ee326b95	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-14 11:31:22.766+00
530aef73-d7b6-49b6-8e8b-8ab151036464	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-05-14 12:18:22.766+00
dcd7dc52-e5ef-407a-857e-d2cdf03f40bf	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-05-14 12:19:22.766+00
1c0dcb82-2829-4483-ab95-4ffec5d89a24	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-14 12:22:22.771+00
dc751ecf-b711-4ae9-a906-0fdeb3df52c2	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT141M"}	2025-05-14 14:43:22.771+00
6b979c07-cb43-4bb6-9618-6c78d53fd3c6	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-05-14 14:44:22.771+00
073b0428-dab1-4a56-9efa-da86d3500c20	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-14 15:37:22.777+00
726ac948-801b-47d4-8da1-c16ad5f1d1d6	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT68M"}	2025-05-14 16:45:22.777+00
50129b24-ceb2-489a-8c42-2fe881fb95b8	1a9c0bad-5fba-539b-bfdc-52239934b7b4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-14 16:45:22.788+00
29394e76-28f6-4d95-a6f9-728dad49cf47	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-05-14 16:46:22.777+00
f045d758-4432-4b64-a650-3b5b1c3368ae	1a9c0bad-5fba-539b-bfdc-52239934b7b4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-14 16:53:22.788+00
945f7a41-875f-48cd-9142-613dc6e4916f	1a9c0bad-5fba-539b-bfdc-52239934b7b4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-14 17:03:22.788+00
f6a20d7b-f83f-45b6-b1b6-1e827a8aa83a	1a9c0bad-5fba-539b-bfdc-52239934b7b4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT122M"}	2025-05-14 18:47:22.788+00
8c865c5a-312b-4b7a-98de-40fe8469d0a6	1a9c0bad-5fba-539b-bfdc-52239934b7b4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-05-14 18:48:22.788+00
ae9089e1-ce7d-43e2-bb47-d0ca0694dbbf	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-15 08:04:22.788+00
30977c47-6846-4ee6-ac18-0ed5d77997e1	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-15 08:07:22.788+00
ebbe46d1-8ab1-4ea0-a5b9-70f9614dfe88	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-15 08:11:22.788+00
1318255e-f6c9-409e-8f2f-a99435b94134	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT155M"}	2025-05-15 10:39:22.788+00
1f429669-d8b9-4f98-8174-3a74564ea08a	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-05-15 10:40:22.788+00
403172b4-24da-4888-8838-fec8c6e6a33c	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-15 11:13:22.771+00
35069abe-602d-414a-84af-9602923cf598	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-15 12:28:22.766+00
2d52fc5b-f709-47d9-a70b-dacad367eace	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-15 13:15:20.927+00
dda8224a-4382-45a7-a6be-b4e738b78696	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-05-15 13:25:22.766+00
4549f875-c041-465c-a4ec-bbfe8d28cd58	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-05-15 13:26:22.766+00
224eb3c1-f5e4-4237-8be2-2ed8e43f4f8a	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT133M"}	2025-05-15 13:26:22.771+00
6a64b511-25d9-424f-a857-9b51bec21602	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-05-15 13:27:22.771+00
1b8c7884-5c77-4637-ab88-537304c00e13	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-15 13:29:22.766+00
1b905a1c-a7fe-4035-ad22-0fe4cca4fa18	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-05-15 14:25:20.927+00
0eba2a64-a57f-4578-9dd6-65ec3f5922dd	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-05-15 14:26:20.927+00
41981acd-16f3-4830-ac8f-4b540eff2cfd	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.7933858421788142}}	2025-05-15 14:54:22.771+00
c6c53e31-f37c-451c-b764-f85a44212c6c	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.7933858421788142}}	2025-05-15 14:55:22.771+00
9a9e808b-ed92-4485-826d-ba5018864a07	dc22db1c-f777-5c82-8588-8dae349e49f8	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-05-15 14:56:22.771+00
29d1b718-eff4-42c5-9c99-06e025655249	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-15 15:56:22.78+00
0da77749-fb8f-465d-9f88-6eadbcc15c55	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-15 19:03:22.777+00
ad2e7e99-477c-4ccd-a75e-1096f8ac5a07	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT225M"}	2025-05-15 19:41:22.78+00
d8442bb8-f9a7-4598-a1bd-ca957c87c2f0	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-05-15 19:42:22.78+00
5a81a39a-946f-4849-b278-8b66584ffc2c	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-16 15:06:22.777+00
3bb57374-ebbd-461c-a8ed-233d732355f9	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT46M"}	2025-05-16 15:52:22.777+00
73088d93-22b9-4a77-b6d7-f49785fb876c	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56}}	2025-05-16 15:53:22.777+00
8d0e9b48-3149-4d42-8117-568093a6def6	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-16 17:35:35.308+00
c0f8fb88-fc06-4829-8fa7-56e966d98b15	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-16 17:37:35.308+00
44be59fb-6e6b-4f9c-9d42-ecee0fb86095	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-16 19:13:22.766+00
ae755a1a-58b5-43c6-9a82-8ccb0a8fee1d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-16 19:16:22.766+00
7eeb6bec-d6dd-4222-98ed-2daff459f70c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-05-16 20:13:22.766+00
c1a69ee3-af40-41fc-bfde-91b93bcffec0	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-05-16 20:14:22.766+00
21b238bc-8602-46a9-94f0-001015d50fb6	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.6946113334039603}}	2025-05-16 23:18:22.766+00
c8688708-dcbc-4a77-a7b0-37ddc647c09e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.6946113334039603}}	2025-05-16 23:19:22.766+00
1521f2f0-3d83-4a60-9750-7627b2f40a61	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-05-16 23:20:22.766+00
da31d58a-b6a6-44f1-ae89-4f399d430c13	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT346M"}	2025-05-16 23:23:35.308+00
dc958376-81ae-4b1c-a246-1b2caea804b4	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-05-16 23:24:35.308+00
57bbd7da-b6b8-439a-8cae-a763ff6d0687	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-17 10:28:22.788+00
8cea7ea0-6198-4479-a4ea-ae49230c4a47	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-17 10:32:22.788+00
e9989bcc-79c0-4e75-9fc1-c2f66ed1876d	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT168M"}	2025-05-17 13:16:22.788+00
62d9ce3e-54d3-428c-abb0-8d39684f7226	1a9c0bad-5fba-539b-bfdc-52239934b7b4	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-05-17 13:17:22.788+00
e1f0ee1b-3a1f-41d9-9ebc-2d8d1cc31596	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-17 16:06:41.344+00
a097fe37-d618-4935-8259-08e7bb512d6f	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-17 16:08:41.344+00
9a4f59a6-7416-4669-96f6-749ff36ea926	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-17 17:56:22.777+00
859b6996-90b6-47ac-89f3-7b2215c95bb3	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT122M"}	2025-05-17 18:10:41.344+00
522166e8-c3eb-45bd-a412-61865d8a7cf7	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 27, "scaled": 0.27}}	2025-05-17 18:11:41.344+00
e9a123e6-8702-4979-a544-5408c6e63fba	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-17 18:16:41.344+00
9e1ea347-0693-4c4f-9f17-6bba7168f535	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-18 11:28:22.766+00
c63429bd-0182-4dfe-a4e6-03a4b79e1228	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT59M"}	2025-05-18 12:27:22.766+00
c5393a76-715c-41f0-b229-f3fd6b386c0f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.32}}	2025-05-18 12:28:22.766+00
bb539cb3-9284-4d0e-881f-61ccaa44de45	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-18 14:53:22.777+00
1767ab46-d126-4c6f-a2e3-1cba46704fb7	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-18 15:00:22.78+00
41d94cbd-d0aa-49c2-be58-82a15f328526	1a9c0bad-5fba-539b-bfdc-52239934b7b4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-18 15:35:22.788+00
150a68a4-5103-4177-b266-638171858033	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-05-18 15:40:22.777+00
a0966ce9-9d68-4e66-a5b1-420b1b23929a	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-05-18 15:41:22.777+00
3aaece65-edb6-409f-b529-46a084fec79f	1a9c0bad-5fba-539b-bfdc-52239934b7b4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-18 15:44:22.788+00
c21ba4e4-6ff2-441d-85c5-1df642d36289	1a9c0bad-5fba-539b-bfdc-52239934b7b4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-18 15:54:22.788+00
f5b4c213-33d3-43d4-842d-314b9cc1b3b3	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT155M"}	2025-05-18 17:35:22.78+00
e9bfc10c-4c6f-4c46-b4ff-064c5a2a6487	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.57}}	2025-05-18 17:36:22.78+00
a2dead87-b311-49ac-a5d2-19c93d19a25a	1a9c0bad-5fba-539b-bfdc-52239934b7b4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT157M"}	2025-05-18 18:12:22.788+00
4b88f032-d88d-4b6d-82c6-7b0d15d906b0	1a9c0bad-5fba-539b-bfdc-52239934b7b4	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.86}}	2025-05-18 18:13:22.788+00
a7e7b981-e167-4900-b18d-984e0b0e4055	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-19 11:59:22.771+00
f641e54d-1c56-4b90-a241-364492c6dfc5	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-19 12:04:22.771+00
7947e39a-5a73-4f92-971d-6c2a06bf35b8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-19 13:05:22.766+00
404cd700-04ea-4696-ab3a-a6298d8e9a45	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT43M"}	2025-05-19 13:48:22.766+00
bcb61231-7f8b-40b3-9d2b-c67904ad02c1	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42}}	2025-05-19 13:49:22.766+00
26176ef5-43a8-4f2d-9722-0b4cf5ef603d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-19 13:53:22.766+00
9f03b173-7ee3-4c9c-9590-0c9d1a9305e0	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT162M"}	2025-05-19 14:46:22.771+00
16291ca5-b08f-476d-bbd1-7c5bfbf2dff0	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-05-19 14:47:22.771+00
8efcedb7-7fe6-4f3c-8bd1-cb4f29845283	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-05-19 14:50:22.771+00
9c2f1fb8-3e14-4189-aa2e-03462d2299ef	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-19 15:29:22.777+00
f2c00eae-c1f1-417d-8bb2-7dd87e9d8706	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-19 16:12:22.78+00
376d30bd-9a31-4004-8aba-99dbf8f356e2	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-19 16:14:45.269+00
8a590673-c09e-4476-bfb2-e46d145619d8	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-19 16:16:45.269+00
f04e99d0-f30a-4d4f-9d88-b94475fd8f2c	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT55M"}	2025-05-19 16:24:22.777+00
200ee69e-01fe-411c-bf7a-e14e9e697424	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-05-19 16:25:22.777+00
2d2fd12d-95ea-41f4-b580-11676215c66a	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-19 16:31:22.777+00
6169f6a4-b7a1-4ccd-8e0c-235da3811b82	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT230M"}	2025-05-19 20:06:45.269+00
248456c3-981d-444e-88b5-d77c885c2b25	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-05-19 20:07:45.269+00
4a5c850b-8c48-4b15-91d9-ff2d61c8c447	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-19 20:09:45.269+00
491bcec9-227a-49e0-94bb-86c2080ec0e6	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT254M"}	2025-05-19 20:26:22.78+00
b0b24efd-cc6f-4f88-a246-fa05ac3b2cdd	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-05-19 20:27:22.78+00
d4168034-115e-4ee2-9a60-6f309098769c	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-20 13:30:22.771+00
eac9843e-e3fd-4fec-933d-1d15a363b980	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-20 13:33:22.771+00
652417ad-b1f5-4de3-a557-509399676d7d	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-20 15:25:22.78+00
8dd9c4fa-2373-4c0f-afe2-286808b4c3af	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-20 15:26:22.766+00
0a8ee814-d6ad-4065-823e-d9db42b212ed	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT147M"}	2025-05-20 16:00:22.771+00
d625af15-c292-432d-97f2-a75ade464cbe	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-05-20 16:01:22.771+00
9c73d5d6-ae9e-49b6-8d7e-7342caac7c98	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-05-20 16:06:22.771+00
2180b6cf-3636-4fcf-ae56-adabe42d2a6a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT61M"}	2025-05-20 16:27:22.766+00
2c068018-63b3-46e9-a880-b7dae4c7f865	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 23, "scaled": 0.23}}	2025-05-20 16:28:22.766+00
264e0ad9-5622-4bc9-b3a3-878e651e71fb	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-20 16:30:22.766+00
1d49b65f-65df-4f6c-9857-a03129235e5d	a203229e-5fe7-5b14-a2da-9200a6214e7d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-20 20:58:22.777+00
0b3c20b8-0be4-4b5f-ac4d-7ab4378a4819	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-21 13:49:22.766+00
cbd869b1-cf14-4411-8f5d-fb4b639840e7	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-21 13:49:22.771+00
f32762f6-303e-4f13-b65e-8da0fab66b5f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-05-21 14:46:22.766+00
7cc3ac28-7957-435e-8efd-218c2069ccfe	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42}}	2025-05-21 14:47:22.766+00
439127b3-dc47-4540-a4bf-659bd15fd9f9	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-05-21 14:51:22.766+00
383a756d-a0a2-4207-8e94-3140565ea5e3	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT129M"}	2025-05-21 15:58:22.771+00
606a7bf6-dc5a-497b-9ede-a331862f6856	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-05-21 15:59:22.771+00
c3d4de2e-a671-4c9f-915d-017b2f836f8d	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-21 17:34:03.263+00
360aeba4-e886-4e3e-8583-3a48116d7afa	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-21 17:38:03.263+00
69450821-4dad-43d7-b310-9b23e487b7e3	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT175M"}	2025-05-21 20:33:03.263+00
e0b49d77-72a2-4e3c-aa84-4a6b4b595842	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.92}}	2025-05-21 20:34:03.263+00
d108db88-49cc-46ea-bf55-b329a8d97398	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-21 20:38:03.263+00
6ec37170-77c2-4ba7-84a2-b7ce79ea8670	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-22 11:52:22.766+00
c31313b1-8e86-48f9-a9ac-ae66bc48ee08	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT61M"}	2025-05-22 12:53:22.766+00
0c247396-e326-4516-883a-f9959fa80c99	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56}}	2025-05-22 12:54:22.766+00
f582b779-a860-4d68-96d7-c49715ebeda3	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-22 14:45:22.777+00
a9fa3304-c18c-46ff-a07f-5afd1f23edb0	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-22 15:07:22.771+00
181eb5dd-54c1-4022-a10e-c844f7e3213f	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT34M"}	2025-05-22 15:19:22.777+00
84ecad96-83f9-4c81-9854-0a8c65586dd0	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.69}}	2025-05-22 15:20:22.777+00
997fc82f-2e0e-4ae2-a204-657d7d8d7a5c	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT138M"}	2025-05-22 17:25:22.771+00
8fefd514-c37b-4e59-8c8d-27d575e9b055	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 83, "scaled": 0.83}}	2025-05-22 17:26:22.771+00
21b6dcc8-1d5d-4cbf-a124-5792b6e6a4c7	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-22 17:58:03.457+00
adb0c14d-7049-4eaa-9152-38202697db47	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-22 18:03:03.457+00
e283e560-ace1-4413-b51a-60fb3cd7581c	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.3787915409107114}}	2025-05-22 19:23:22.771+00
b8402b28-b6bb-47ad-a3ba-7bd4d6da5b5f	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.3787915409107114}}	2025-05-22 19:24:22.771+00
749a5ef9-11f4-4ea1-b67a-131406b19ee7	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-05-22 19:25:22.771+00
d5a266e1-3b01-4171-b06b-1fee3ac9cf58	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT124M"}	2025-05-22 20:07:03.457+00
d128d61e-1fd4-404e-82e1-865a61c67f55	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.38}}	2025-05-22 20:08:03.457+00
ae1bc92a-762f-4132-b13f-4505aabde9ac	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-23 09:49:22.766+00
840c7c1c-319e-4e1e-a7f8-ba643d0dd88f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT44M"}	2025-05-23 10:33:22.766+00
3d137127-3656-4ab3-b579-4e3737ea6121	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-05-23 10:34:22.766+00
2b756993-1806-4f09-9780-8a87071b69a7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.352721060837019}}	2025-05-23 11:50:22.766+00
62fb4bc1-805a-4b52-916d-43d03735ac41	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.352721060837019}}	2025-05-23 11:51:22.766+00
31ed8ea6-12d4-4c12-b351-97220ae1ce53	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 26, "scaled": 0.26}}	2025-05-23 11:52:22.766+00
d511b83a-ee9d-4c9a-9445-57cc65b7b097	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-23 16:10:22.78+00
651932dd-0399-42da-aac6-b0973da43a75	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-23 17:07:22.771+00
a8ca8bc5-b0fd-4cf3-bbf8-327f331091db	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-23 18:20:22.777+00
920e9eab-3cbf-42b1-ac8a-a4fe14f7562e	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-23 18:36:55.861+00
7d806b83-8c63-4b11-a457-e01187d25c6c	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-23 18:41:55.861+00
2d896a85-e71f-46d0-b0ee-1b507e2663bd	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT134M"}	2025-05-23 19:21:22.771+00
5dc93d56-6081-4c33-a87a-4531feef65a3	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-05-23 19:22:22.771+00
6626d3be-3519-432f-b4db-32b9964cbc9e	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-23 19:24:22.771+00
6725ec71-fab0-4e3e-9acd-44809cd0c435	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT254M"}	2025-05-23 22:55:55.861+00
0eaf4db5-8646-49cb-8d76-821b51b378c7	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.74}}	2025-05-23 22:56:55.861+00
b174dc35-1cb6-43de-a643-a779f4ca2cd6	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-23 23:01:55.861+00
4cb5bfd4-fc8d-4452-8382-7a9890099028	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-24 11:52:12.185+00
bd0e3c12-a908-437f-83a2-ae52284a68ff	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT83M"}	2025-05-24 13:15:12.185+00
6ded3b9b-dc0e-4e9a-9e16-826db8d3ed63	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.84}}	2025-05-24 13:16:12.185+00
66cf6b09-2856-4945-96ef-154ab816b4d9	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-24 14:12:22.766+00
7061fbc4-f2d4-4e10-96d0-2cab3c048d3f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-24 14:17:22.766+00
560456cd-f62e-45bc-a7a4-81a66bb90304	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-24 14:45:22.777+00
1c36435a-19bf-4374-a858-a414373077eb	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT55M"}	2025-05-24 15:12:22.766+00
e374a545-3b8a-48b7-a094-a5d560bc30e3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 12, "scaled": 0.12}}	2025-05-24 15:13:22.766+00
3ae78ecb-c255-47ad-b34b-9f7d228c0a3f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-24 15:16:22.766+00
a1f04108-9a4e-4d31-815f-42335c39f8ac	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT67M"}	2025-05-24 15:52:22.777+00
45456e5a-e97a-45e5-b08d-4f756c01fa7c	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-05-24 15:53:22.777+00
dc80f80c-529d-4f82-845c-47944495a0e8	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-24 15:57:22.777+00
9a97e1de-20a8-41f5-a76a-deb9c105153f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.3463499055682439}}	2025-05-24 16:27:22.766+00
d9998b6d-696d-4f26-8d35-3b34ff76d9e5	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.3463499055682439}}	2025-05-24 16:28:22.766+00
346ca68c-c63a-42ce-8723-b8e9f741d551	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-05-24 16:29:22.766+00
e6d9721f-3306-41a3-8bd9-94e7d7318b38	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-24 17:01:22.771+00
79aeb6fc-d2ee-49d1-b83a-6919fc54902b	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-24 17:06:22.771+00
1233e16e-1fba-43b8-9960-f0de82bd07c5	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT166M"}	2025-05-24 19:52:22.771+00
a054aa96-3eb3-46b1-a6c4-80b84413d0d9	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-05-24 19:53:22.771+00
8b1afb27-44ab-443f-a218-36276780076f	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-05-24 19:55:22.771+00
d2275ea4-9eac-46bf-ba68-f87656df4d46	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43011574843084627}}	2025-05-24 21:21:22.771+00
137995b4-7e9a-4434-b3c0-222ca0a5b00d	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43011574843084627}}	2025-05-24 21:22:22.771+00
055dcf55-f9a5-4982-ab1a-249dd150ca31	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-05-24 21:23:22.771+00
aaa1c12d-82be-4949-a216-011b679d233a	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-25 13:48:22.777+00
aeea043f-5380-4af7-ae04-ebacb8e14d4b	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-25 14:27:22.771+00
c7de1989-ac4e-464a-97f2-5935b83dcc29	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT60M"}	2025-05-25 14:48:22.777+00
b0e7854f-41f7-404e-9103-81655471dc90	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39}}	2025-05-25 14:49:22.777+00
86aaa537-2e33-4b98-8883-d4099f09a428	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-25 14:58:22.777+00
ced3873d-b250-4bad-a77b-863d3eafb09a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-25 15:09:22.766+00
9281220f-3f3e-49dd-9946-9d192451c5ff	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-25 15:28:22.78+00
9c7a9714-77f6-41fc-b21e-070e3326a090	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-05-25 16:06:22.766+00
c21d13b0-7406-4627-a1fc-e92c64e51927	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-05-25 16:07:22.766+00
c03ba878-1084-4637-8064-f9b5823216d3	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT124M"}	2025-05-25 16:31:22.771+00
1ce8a6c0-41ba-4120-aae4-1fb4830ba918	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-05-25 16:32:22.771+00
316dd1f9-753b-40b3-a2cb-2be7f6fa97c8	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-25 16:35:22.771+00
2f19e939-d576-4ba2-bfa7-a316c6f91fb4	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.3115935016081229}}	2025-05-25 17:12:22.766+00
9888f31c-e019-4c1a-97b9-a6ea51003747	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.3115935016081229}}	2025-05-25 17:13:22.766+00
ab3d8a47-f079-4301-9573-a6115a08beb2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-05-25 17:14:22.766+00
6763d85b-34a5-4b03-a8b8-3ba0673a9be6	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43946100591670373}}	2025-05-25 17:52:22.771+00
df9c39f2-783b-4216-9ce3-cf5ed6205bd3	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43946100591670373}}	2025-05-25 17:53:22.771+00
941a4603-3a2a-46d4-a8ee-bf633f37420e	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-05-25 17:54:22.771+00
304ff3d1-2e51-4169-b7a6-22e99307f9f8	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-25 18:29:42.005+00
17bdc23d-cb4e-449f-8c5d-d350adea5cf9	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-25 18:33:42.005+00
9f27350f-f4d9-4470-8c66-adf8e74dd918	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT203M"}	2025-05-25 18:51:22.78+00
335b1865-5125-4f75-81db-caa61fcf0cc0	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-05-25 18:52:22.78+00
e1998f2e-af93-476d-ba33-9d0a9893769b	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT392M"}	2025-05-26 01:05:42.005+00
170894af-68b3-40ee-9b1b-b4d3b6e9c543	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-05-26 01:06:42.005+00
fc48b498-4b01-4d44-bbc9-d0a4f010287b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-26 14:34:22.766+00
14668940-cc35-4c45-a8ec-b64e9ade5fbf	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-26 14:39:22.766+00
3760f9d6-5756-45ef-bac3-54208b30b5a3	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-26 15:01:22.777+00
281f6ab4-d5e7-4eeb-977a-e13e9d7625fa	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT43M"}	2025-05-26 15:22:22.766+00
68e7b92f-4173-401a-86f9-08fdf50d1e09	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-05-26 15:23:22.766+00
ba6a16df-ba8c-4e8e-a435-affbe368ddf7	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT67M"}	2025-05-26 16:08:22.777+00
11b1012e-ae3d-415e-bb76-82efba46316b	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.52}}	2025-05-26 16:09:22.777+00
59829037-9fd9-4ed6-aac3-36826ca832fa	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-26 17:19:22.771+00
6860c4f3-90c7-402a-83a8-496bb9257786	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.3858666596514306}}	2025-05-26 17:56:22.766+00
6f85f5ec-576c-4559-a25d-7bf086b83bc3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.3858666596514306}}	2025-05-26 17:57:22.766+00
7db70b74-87e5-4db2-8d2e-56cad473bf62	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-05-26 17:58:22.766+00
b72d4fc2-ea0b-4d66-9bdf-e47f64782513	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT162M"}	2025-05-26 20:01:22.771+00
6d6f782c-1d0c-46f1-bf56-aed3f64b7576	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 19, "scaled": 0.19}}	2025-05-26 20:02:22.771+00
9972d11b-1686-4f85-a727-1168d72f7f89	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.5159329157030264}}	2025-05-26 23:07:22.771+00
1cd3abf1-fd51-442d-a4c4-6bef8c444673	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.5159329157030264}}	2025-05-26 23:08:22.771+00
e45ed985-d015-4ecc-8b73-1c7da1754723	dc22db1c-f777-5c82-8588-8dae349e49f8	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 4, "scaled": 0.04}}	2025-05-26 23:09:22.771+00
69f6ec52-1043-4fee-9009-a437cd965594	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-27 15:28:22.777+00
940fff66-edb9-4ec3-b763-a09c3d08634b	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT53M"}	2025-05-27 16:21:22.777+00
95e610ca-8b1c-40b1-bc3f-1c49b473060c	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-05-27 16:22:22.777+00
ed24565e-8383-48a1-bff0-dc71baa361e6	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-05-27 16:30:22.777+00
34e5fbcd-b6e7-4570-84a0-cecc866a9e3f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-27 18:24:22.766+00
e9c42e86-ba6f-4fa3-ad65-f2b9065dcd18	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT63M"}	2025-05-27 19:27:22.766+00
b61d059d-7388-4f84-ad3e-2a68fbfdf7d8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-05-27 19:28:22.766+00
9d084d2e-ea96-486b-bd3c-5994ea47f3b1	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-05-27 19:33:22.766+00
f79bc9d1-5855-4320-915e-f66ca0c28c80	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.4179407665948665}}	2025-05-27 22:18:22.766+00
e31600b7-83a1-4b57-a02e-0314ec0d508c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.4179407665948665}}	2025-05-27 22:19:22.766+00
9c5441d1-d8c9-4e22-8c64-f307d570e8b6	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-05-27 22:20:22.766+00
04e7bb78-90a7-4d90-b08a-90a2e27c1a7b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-05-28 10:42:22.766+00
282bde68-820a-43cd-8884-5eaa1a001483	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-05-28 10:43:22.766+00
3bd1fe28-fe0d-4d27-b561-c3043975b890	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-05-28 10:44:22.766+00
d482eb95-d6ea-4a80-a758-9708d031e370	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-28 13:20:22.771+00
f5dbb3aa-5f15-4258-8d3e-a1e24533fc11	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT131M"}	2025-05-28 15:31:22.771+00
69cc3d4a-fdb2-4289-9d25-8797be15c376	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-05-28 15:32:22.771+00
208872e2-0ba0-4723-a7f8-a6816b8fb2c7	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-05-28 15:37:22.771+00
1afd25a4-250f-4b06-9e6a-a340b969ffab	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-28 16:11:00.509+00
c6d49da4-6823-4ff7-88dd-da6bdecbc2b3	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-28 16:14:00.509+00
a9dd3abe-0b5d-441c-9ad5-bd78ae364552	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-28 18:44:22.777+00
1d666626-ccc8-402b-a135-b743bec8d495	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT40M"}	2025-05-28 19:24:22.777+00
e798f61d-09ce-4f7a-b24b-9aa7a1b9206c	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9}}	2025-05-28 19:25:22.777+00
02d3f7c3-8539-4a3d-83b0-69765c3e1270	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT219M"}	2025-05-28 19:53:00.509+00
3edd861d-8ec6-498f-a2d4-d7926efcb539	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.29}}	2025-05-28 19:54:00.509+00
cb793d1c-42dc-471d-9a5f-afc550447369	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-29 08:15:22.766+00
9d5c2dd6-8147-4930-8d2c-ee0e47b730c2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT46M"}	2025-05-29 09:01:22.766+00
425c66cd-27e0-4106-bb51-b741048e6191	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-05-29 09:02:22.766+00
af6aa3e7-e25f-430e-933a-cf1f66be38fc	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-29 16:17:22.771+00
63cbe47d-c0cf-496c-999e-519dab0bfd83	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT160M"}	2025-05-29 18:57:22.771+00
eadc42a7-f684-40a8-a6b7-3ce037ff2ff2	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-05-29 18:58:22.771+00
8e1035e1-e127-4c09-ac53-4ffa8d2fcbfd	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-05-29 19:02:22.771+00
1645ac8b-7ccd-45e6-bb06-b19dbd092be3	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-29 20:48:22.777+00
2a4d1825-818d-4f84-aae2-9afe1192b091	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT51M"}	2025-05-29 21:39:22.777+00
1911b7f8-a22a-4ae0-ba43-608543fabdcd	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.38}}	2025-05-29 21:40:22.777+00
8a88a709-224d-4eb2-a117-80d90c811da6	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-29 21:49:22.777+00
0f619498-d22b-4dd5-8d11-512ec5a92f29	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-30 13:39:22.771+00
d09ccd3e-05aa-4d0d-83cb-a324e44d7d52	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-30 14:05:22.777+00
26644376-785e-468c-a7e4-7bb6b5b97caf	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-30 14:09:22.766+00
3759a3f1-bed0-489f-aac6-dce16ec6d331	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-30 14:29:07.577+00
9881c35e-1bd7-4b8e-87bb-79789121aa28	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT45M"}	2025-05-30 14:54:22.766+00
0fb4bc58-6918-44a9-99bc-e976783240f2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-05-30 14:55:22.766+00
570b9c6f-f6a1-48d4-aad5-961ea5477199	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-30 14:58:22.766+00
e06f2c75-a98c-4245-bdcc-36ef17914003	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT143M"}	2025-05-30 16:02:22.771+00
dd49b84a-fbc8-4b11-bb90-e08e77c5f0a2	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-05-30 16:03:22.771+00
260b6c25-11e0-42c9-ab8f-f1292ec4f0fb	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT101M"}	2025-05-30 16:10:07.577+00
8f2b6cce-8839-4543-8893-2cff63bcaedf	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-05-30 16:11:07.577+00
975df8be-4105-4bf7-a6ab-bb64380a0ce4	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-30 17:19:00.573+00
504e5868-df86-4068-a556-1865629dd852	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-30 17:24:00.573+00
115761cd-c0f5-4684-9912-a850aba511c6	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT256M"}	2025-05-30 21:40:00.573+00
6dd628f7-21ef-4ad6-aeab-be6ecb935579	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.51}}	2025-05-30 21:41:00.573+00
8805ca2e-39a7-49a3-a005-8556c7aeaa6e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-31 11:06:22.766+00
6104444a-41c7-44de-9b4d-3a6055e87a87	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-31 11:10:22.766+00
0388fae0-5569-48a0-9f5d-ecaf023480aa	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT50M"}	2025-05-31 12:00:22.766+00
ac3d4543-bc23-4b62-b9b0-4279a7161a0e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-05-31 12:01:22.766+00
a2c92157-50fe-4e93-bf73-37f9e8fec890	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-31 14:16:22.771+00
7c836339-28e5-46e9-bee7-3d004119f799	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-31 14:20:22.771+00
050436e7-8975-4483-94cd-eccf33bd1bc3	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-31 14:40:22.777+00
c961ac46-a879-45bf-aff5-60bceb41cad0	c0df20ab-c597-5adc-b23f-cebbe4d9a051	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-31 14:53:22.789+00
49058a56-8728-4b52-b431-e460d7050564	c0df20ab-c597-5adc-b23f-cebbe4d9a051	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-05-31 14:57:22.789+00
19ea6904-9b74-4709-99ce-a44f253f499f	c0df20ab-c597-5adc-b23f-cebbe4d9a051	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-31 15:06:22.789+00
2181d0b2-c2c4-4853-b9fd-30ed7061608b	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT65M"}	2025-05-31 15:45:22.777+00
957df8d4-d01b-4a5f-bddb-8ce0222d8751	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-05-31 15:46:22.777+00
26143965-1145-4d45-94cb-fc0d74aa3116	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-31 15:54:22.777+00
0d6a35f5-d8eb-4f77-9854-f5b13ca38a81	c0df20ab-c597-5adc-b23f-cebbe4d9a051	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT90M"}	2025-05-31 16:23:22.789+00
60f7a8b9-986d-4996-a1e0-c83e60af2ceb	c0df20ab-c597-5adc-b23f-cebbe4d9a051	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-05-31 16:24:22.789+00
b2de4261-760e-4eda-a0a9-13397d5b2ca6	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-05-31 16:57:22.78+00
250c7d25-6fdc-491f-9dbb-94b096ecca78	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT167M"}	2025-05-31 17:07:22.771+00
99e1264b-bf75-4027-844b-89da655050ee	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-05-31 17:08:22.771+00
8231df13-2080-456d-9271-b812cf4c8948	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT191M"}	2025-05-31 20:08:22.78+00
497b43c8-7fea-4822-9bbb-2142b6f48748	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-05-31 20:09:22.78+00
c0e583ff-c950-4b89-80bd-566b93ec8104	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-05-31 20:14:22.78+00
3fb924e9-af37-40e2-ac92-d5f64816d017	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.6397146437535203}}	2025-05-31 20:41:22.78+00
4db9349a-20eb-4981-9df9-dba688c4e854	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.6397146437535203}}	2025-05-31 20:42:22.78+00
6293f853-ed4d-4dda-90ce-fea3291093d9	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.75}}	2025-05-31 20:43:22.78+00
025c2521-5967-4b85-b8f8-3feef5f7182f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-01 14:48:22.766+00
7802af95-9430-42f9-812c-291c3ce65f23	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-06-01 15:52:22.766+00
ad207c3e-2773-4c3a-b62d-9a0278ec6cb4	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-06-01 15:53:22.766+00
2fe993f6-1e90-401d-9ac0-d4b9661ced39	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-01 16:26:22.771+00
c3db5fb1-9365-4962-af18-3e9eabfe42b6	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-01 16:29:22.771+00
777445d9-8a2f-4edf-9e46-695d94fd8caf	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-01 16:47:43.833+00
8f3d5440-a301-4899-a4a8-8daef267d94d	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT115M"}	2025-06-01 18:42:43.833+00
846b4c94-695c-43d3-ac21-1f1e11b8a629	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-01 18:43:43.833+00
fbbb5c04-fc28-4a54-833c-fb2557521681	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.3400601732412474}}	2025-06-01 19:13:43.833+00
b66490ec-e416-4b52-90c7-e7429034ec8c	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.3400601732412474}}	2025-06-01 19:14:43.833+00
f390581f-30f4-449a-90b2-f19d93a777d4	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-01 19:15:43.833+00
f4d08767-df13-44fa-92e6-e8fc7c001574	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT171M"}	2025-06-01 19:20:22.771+00
57a232df-3715-4ac3-ab7e-c01f76da2e48	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-06-01 19:21:22.771+00
8cc45d37-ea9e-419f-be94-4d6278e12f8b	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-01 20:58:22.777+00
6c8e0e08-611e-4c88-a652-b1e40b192002	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT37M"}	2025-06-01 21:35:22.777+00
41f37849-79e6-47e4-9ebd-4d6b03b9d417	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-06-01 21:36:22.777+00
ba2e70d1-d48f-42c8-8506-a66c503d163b	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-01 21:38:22.777+00
af890410-31b2-4ccf-aad7-b435a46f6e45	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.7491475265549081}}	2025-06-01 22:22:22.771+00
17d7aa7b-8db7-405b-9e23-d36e26308535	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.7491475265549081}}	2025-06-01 22:23:22.771+00
32bde543-c65b-4180-8529-315ec40370e1	dc22db1c-f777-5c82-8588-8dae349e49f8	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-06-01 22:24:22.771+00
7c20979d-64e9-45c9-9693-6862bebd2100	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-02 14:24:22.78+00
e26ee042-8625-4651-b7eb-45071fcc5df9	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-02 15:33:22.777+00
f5585a91-0bda-4295-9683-d662246f2335	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-02 15:44:10.459+00
2d7ed046-e443-4751-aad0-60181ed7b19b	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-02 15:49:10.459+00
17e41939-132c-47b7-861e-cd82b989739b	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT113M"}	2025-06-02 16:17:22.78+00
0d6cce65-979d-4cf9-9707-51a099299cbb	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-06-02 16:18:22.78+00
0cffe35a-cef2-4c6e-874c-70c93efead2a	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-02 16:27:22.78+00
752fc79d-ab1b-435c-8d5c-875de0aa113a	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT69M"}	2025-06-02 16:42:22.777+00
37063a9a-b762-45db-9f2a-01c7bf18ecfc	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-06-02 16:43:22.777+00
0e37b7cd-c017-4b94-b44b-3611b4e0092c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-02 19:05:22.766+00
ea5ded34-e677-4d03-ba45-59d75fcd2d59	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT197M"}	2025-06-02 19:06:10.459+00
336d95a7-78d6-475c-b871-342527466b33	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.51}}	2025-06-02 19:07:10.459+00
80fd5c39-b529-49f3-875c-ed470bc85984	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-02 19:11:10.459+00
e68e94f0-0461-4027-82de-6222c4a1561b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT52M"}	2025-06-02 19:57:22.766+00
c8c75523-72b5-460f-930f-b18e040e44db	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-06-02 19:58:22.766+00
ac3f7fa8-9fdd-42d5-8c5e-c6abf789b777	f8478e87-8fee-5ef3-95b1-41c971c4abab	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-03 11:51:22.774+00
318cea83-8e30-4026-8d21-68f4f462c5c4	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-03 11:51:22.787+00
fc2b5207-61c8-43db-9c7e-8082f00d2586	6001cdaa-df41-550b-adf6-6641e99307e2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-03 11:53:22.782+00
202d66aa-f931-427f-bd24-038ed9c002c4	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-03 11:55:22.782+00
272f016f-50c6-4d26-ac4a-259456f571be	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-03 12:00:22.787+00
bf39a8a5-7751-4b52-92ee-ec199c458e6b	f8478e87-8fee-5ef3-95b1-41c971c4abab	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT98M"}	2025-06-03 13:29:22.774+00
08d14c0a-dd11-4902-9881-3a834936c2ef	f8478e87-8fee-5ef3-95b1-41c971c4abab	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-06-03 13:30:22.774+00
6329dadd-4c7f-4396-9886-2911d8ea552a	f8478e87-8fee-5ef3-95b1-41c971c4abab	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-03 13:33:22.774+00
b0e4070e-4a49-444a-b651-712fc21805b3	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT104M"}	2025-06-03 13:35:22.787+00
50d21047-9eb6-4a01-876a-f05b0e6dda6b	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-06-03 13:36:22.787+00
ab89905e-1b5f-49a8-aee0-fa22fe404ab2	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT205M"}	2025-06-03 15:20:22.782+00
d097b89d-58cc-48a1-bdfc-da6839b2ca31	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-06-03 15:21:22.782+00
e968a7b7-6f8c-43b5-92e7-312f37feaa65	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-03 15:25:22.782+00
3b464e17-9c97-41a6-90b2-02e12eb998a7	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-03 16:29:22.777+00
43c376b3-f6e8-4efb-bad8-eec3f1c2f15b	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-03 16:51:22.771+00
2cf09169-2f4f-491d-bcc4-b7ec76bc9163	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT49M"}	2025-06-03 17:18:22.777+00
dcf6bb65-a6ae-483d-bdfc-a011061cfe5d	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-06-03 17:19:22.777+00
4ca1dd60-cc47-47bf-bfa8-4e2b8147ff31	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-03 17:27:22.777+00
84f7e1a3-83f9-4fa1-8f8a-e1db1826f504	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-03 17:32:22.766+00
c39d3caf-8d17-410b-83da-bd63aedcb386	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-03 17:35:22.766+00
39df5217-38a8-41fe-947f-1814efb9ec29	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT51M"}	2025-06-03 18:26:22.766+00
952b75c9-c0a8-4bc3-9439-571b2af34e00	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 15, "scaled": 0.15}}	2025-06-03 18:27:22.766+00
c045f819-7c34-4f80-8175-33c0acf9b632	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT168M"}	2025-06-03 19:39:22.771+00
f22f524a-59f9-47c5-b583-0048414e99b3	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-06-03 19:40:22.771+00
d3808416-4300-4239-a03d-d160c88848e7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49270471475730016}}	2025-06-03 20:11:22.766+00
d973720b-44a7-45f6-b315-ced9728cccda	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49270471475730016}}	2025-06-03 20:12:22.766+00
6a50f26a-d7a9-446e-9ef6-b4b7378a8b46	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-06-03 20:13:22.766+00
94c605c9-04ea-476f-b5bf-f382152a0faf	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-04 10:31:22.766+00
0d435659-0aa2-4b0c-b4d3-53f289a88520	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-04 10:33:22.766+00
9d209b74-fb2d-4a52-a14d-3986cfb602a5	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT59M"}	2025-06-04 11:32:22.766+00
c41513e3-0f95-4fa6-9201-7fdb344fbc50	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-06-04 11:33:22.766+00
a94c96b5-27fa-4fdb-aa7b-c07329a0f726	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-04 14:19:22.774+00
8016113b-910e-4227-b11c-142429e006ee	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.4477782635912426}}	2025-06-04 14:49:22.766+00
dcdb830d-f8f2-4545-8904-fe5583daf17c	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-04 14:49:22.777+00
ca35ff8c-87dc-4d6e-b870-7e2415fa2e5d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.4477782635912426}}	2025-06-04 14:50:22.766+00
3d0a668d-67c6-4773-9167-36b80f66f774	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 14, "scaled": 0.14}}	2025-06-04 14:51:22.766+00
a9609ca0-cf6c-4f63-a6b8-fb180942cdc7	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-04 14:59:22.762+00
d5cdcda1-fe1f-4848-b2cc-b77adc7fc218	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-04 15:34:22.78+00
638f6741-2b81-43b0-a8da-5880b0e4c635	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-06-04 15:36:22.777+00
0bc4f9eb-0351-49ee-ac70-de13c167a04c	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-06-04 15:37:22.777+00
79c4a03b-645d-4f19-82e2-5afa3c3103ad	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT119M"}	2025-06-04 16:18:22.774+00
28ba2981-7e6b-43ce-b92b-1cab5ec4a4b4	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.51}}	2025-06-04 16:19:22.774+00
c8839458-2c0f-4845-b8d2-f536c44cda47	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT82M"}	2025-06-04 16:21:22.762+00
6247438c-ba88-47ef-9734-9fd70c64d121	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-06-04 16:22:22.762+00
cd6eacc2-ec2c-4f3d-9336-e3c634aaccf3	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-04 17:17:43.588+00
5fbcef70-3275-43db-ba82-22dc9a8cd574	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-04 17:20:43.588+00
1a77a7dc-d8e6-4d9a-837e-eff55a7bafd3	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-04 17:46:22.771+00
b9939272-20ad-42b8-83e6-b19253890ae8	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT143M"}	2025-06-04 20:09:22.771+00
adc8d5de-c8b2-43ab-91c8-e61839ed268d	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-06-04 20:10:22.771+00
b9fc0693-80ba-4c43-b597-13c781e9ee0e	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-04 20:14:22.771+00
aa611f84-e63c-4801-b924-c5ffc0808917	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT266M"}	2025-06-04 21:46:43.588+00
211f57b4-4a6b-4617-9ceb-8fff17776db2	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 19, "scaled": 0.19}}	2025-06-04 21:47:43.588+00
5a8d247c-d9db-4df4-8131-553c3865a982	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-04 21:55:43.588+00
5a214f9a-ff55-4f00-a85a-0898b2654f6c	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-05 10:08:22.771+00
2a6ea0ce-aad1-484f-91e9-0d4b8bd143c3	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-05 10:10:22.771+00
e8cfd202-855d-4a45-85de-1489bdf6fea5	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-05 10:57:31.743+00
8e24d94e-b156-4d65-b000-22142fa36c4a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-05 12:25:22.766+00
a955111b-cb81-43af-8e18-198f26d13825	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-05 12:30:22.766+00
5eef64db-7d2f-4043-a376-300201557e74	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-15 17:59:05.982+00
3645be7b-1e05-4f9a-98d7-fce5e808b0f2	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT161M"}	2025-06-05 12:51:22.771+00
d511cfa4-f11b-4103-9dc1-768297573462	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-06-05 12:52:22.771+00
a0cf9ca2-631f-4867-99b9-74e54a8ea391	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-05 12:53:22.771+00
c9f0b557-fd65-4710-a6e4-3510e8f2cd49	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT60M"}	2025-06-05 13:30:22.766+00
11269459-aead-42bc-8e08-47073b4997ec	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.32}}	2025-06-05 13:31:22.766+00
92efcdd1-7e6a-417d-b218-23b1dce95f14	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-05 13:52:22.787+00
b8ead95d-f26e-4ee2-bac7-b2f897beb99d	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-05 13:59:22.787+00
41b49bbb-37f7-48f7-bb34-63d24daea36c	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT87M"}	2025-06-05 15:19:22.787+00
19f65b0e-310b-4cc3-ac97-7b3f367e7048	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-06-05 15:20:22.787+00
b467f1fc-d3d4-411e-9ec2-236a034c1153	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-05 16:31:22.762+00
6307d917-25c2-4d9d-bdd3-2eb3414b1203	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-05 16:36:22.762+00
5f084d4f-0535-4cd8-a197-4e2b8cac8698	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47140004406021274}}	2025-06-05 16:46:22.766+00
40ddb00d-f99e-479d-8e44-8a0984c56900	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47140004406021274}}	2025-06-05 16:47:22.766+00
e9ec9d60-4d25-4899-9e1b-8dbdb354e710	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-06-05 16:48:22.766+00
15b1b667-e7e8-4f3f-8803-fe69c6458f6d	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT96M"}	2025-06-05 18:12:22.762+00
b9d1b6de-6032-4641-85a6-3155b791ed26	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 17, "scaled": 0.17}}	2025-06-05 18:13:22.762+00
12370834-205c-43a1-8b37-a1486fba1f43	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-05 20:14:22.777+00
741122e4-a3ec-471b-8593-f4895cd0ad1b	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT65M"}	2025-06-05 21:19:22.777+00
143c47f8-63f7-4fbf-b47a-09f9c4d469c0	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.51}}	2025-06-05 21:20:22.777+00
423e23ae-c8e6-49cd-b59a-ee6cdb033cb5	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-05 21:29:22.777+00
407f311a-f0fb-4a11-932b-87930fd1d645	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-06 12:24:22.771+00
c87b0a40-20e0-4fb3-9da2-d64cd96049e1	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT143M"}	2025-06-06 14:47:22.771+00
3edc320d-a67e-4f24-b18c-fab17daae37a	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.57}}	2025-06-06 14:48:22.771+00
82b0fb24-888c-4008-8245-eaab60719c6e	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-06 16:07:22.78+00
b3fd3196-1dcb-48ca-903c-45b61639ab5a	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-06 18:40:51.386+00
fbf0eef2-1a93-4fbb-b0cd-4c851fb7c5f3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-06 19:12:22.766+00
ec121a96-7fbd-4f7c-b2e7-bf61c218b294	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-06 19:47:22.777+00
536c4e57-6631-4e6d-b89f-ef0e44e6e6bc	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT54M"}	2025-06-06 20:06:22.766+00
76876c20-944a-4e27-92db-1a1234ba73d4	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-06-06 20:07:22.766+00
926a3ccf-eb43-4845-8ecc-94e00943a720	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT34M"}	2025-06-06 20:21:22.777+00
d7b0f8e1-bc8f-4352-9084-f5656264fba2	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.6}}	2025-06-06 20:22:22.777+00
eecabfe4-f91e-4f6c-b53a-2120773d4d73	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT256M"}	2025-06-06 20:23:22.78+00
9dc86753-1647-447d-956e-b16fb61492d0	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-06-06 20:24:22.78+00
71a7e9e4-528f-4a97-aefd-312396056b1a	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT158M"}	2025-06-06 21:18:51.386+00
e8f409e7-b211-4d7d-ae08-ed923490e3cb	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-06-06 21:19:51.386+00
fd9cd1a9-06e1-48aa-879f-4e4a654f12ea	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43764654424062854}}	2025-06-06 23:14:22.766+00
825883b7-6c5b-4440-935b-2cada7266ea6	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43764654424062854}}	2025-06-06 23:15:22.766+00
bc432223-9841-47f4-b207-2489fec96c00	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 15, "scaled": 0.15}}	2025-06-06 23:16:22.766+00
e1cc1204-6564-44fd-9854-221a80b78eff	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-07 11:33:22.762+00
db6642a1-e647-4ad2-95a7-d4f416da58d7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-07 12:35:22.766+00
9d1ff40f-82dd-43ba-a174-ebb2317a8ba9	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-06-07 12:43:22.762+00
9ef734d0-05a0-40f6-9bd4-1b6d3890113c	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-06-07 12:44:22.762+00
ef1f9057-8055-4a70-a60f-edd98e870708	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-07 12:57:22.774+00
72231e58-8f55-4fa4-9699-144ced28ee59	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT48M"}	2025-06-07 13:23:22.766+00
72eb088b-dd5e-4cee-8448-1dfb8a8b9782	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT155M"}	2025-06-15 18:05:22.787+00
7993c70c-8c11-4b14-bb7e-d45249a8cf76	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 3, "scaled": 0.03}}	2025-06-07 13:24:22.766+00
2539d5c0-fafa-4003-9996-20a71499c455	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-07 13:26:22.777+00
5056de99-63af-4da0-9700-312dc353f175	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT28M"}	2025-06-07 13:54:22.777+00
19d36540-c205-4c6e-8422-72dc0fa37309	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-06-07 13:55:22.777+00
b9160680-e39f-4310-acb0-c383e4480e9e	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-06-07 13:58:22.777+00
17aeb64a-6683-485e-aad9-f06730d54803	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-07 14:28:39.856+00
9511017b-c401-4210-b5ff-9dff90427c2a	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-07 14:30:22.777+00
ccc7983e-f632-43c7-b7e9-2d9956b2bfa9	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-07 14:30:39.856+00
18bc0c2b-b2f3-44e4-9182-77bd1bc80323	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-07 14:31:22.777+00
c3537ab3-e89c-4ae6-8681-b1551f9e4590	a203229e-5fe7-5b14-a2da-9200a6214e7d	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.84}}	2025-06-07 14:32:22.777+00
bd0a773b-26b1-4585-a22b-211643ca637a	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT114M"}	2025-06-07 14:51:22.774+00
a201c3a7-51b1-4e51-a16c-2ce5510dbbaa	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-06-07 14:52:22.774+00
0ae7ad39-3440-4e25-8d5f-c5d8e9c267b3	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-07 15:45:22.787+00
7299f451-1de3-4070-9693-5efa1c6bf56e	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-07 15:53:22.787+00
e2e689a0-b88a-4e9b-a306-2e4bf00a264f	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-07 15:59:22.787+00
eeb6f100-9796-4452-b255-68391030c051	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-07 16:06:22.771+00
116e964f-fcbc-4ee7-8576-462f44b874cd	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-07 16:09:22.771+00
c2fac319-7fab-419e-abe3-ba8a5a72ef96	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.5370264479015346}}	2025-06-07 17:10:22.766+00
7e8f2a59-b255-4c26-87fe-4e3af62d46d0	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.5370264479015346}}	2025-06-07 17:11:22.766+00
10784c2e-86ef-47b8-9cbc-46b25c1024e0	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 13, "scaled": 0.13}}	2025-06-07 17:12:22.766+00
eb7d1bd8-4771-47e2-9a8d-7614799ab0cb	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT163M"}	2025-06-07 17:13:39.856+00
5416165f-2864-4433-accc-0a56b8f0cca8	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-06-07 17:14:39.856+00
18b384d2-7f62-48c0-b465-9eca74c02572	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-07 17:20:39.856+00
82752c19-6549-4564-a629-cfd3ad315ac4	6001cdaa-df41-550b-adf6-6641e99307e2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-07 17:59:36.745+00
9e78e2dc-a20a-4f2e-ada2-006825271c14	6001cdaa-df41-550b-adf6-6641e99307e2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-07 18:03:36.745+00
c9a20ae9-cdcf-4837-a8d1-8a21caeb7245	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT132M"}	2025-06-07 18:21:22.771+00
23b089c3-c436-45fa-aec2-1ab50c0bffe7	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-06-07 18:22:22.771+00
86c58ca7-e541-477b-8043-103ebbfdbf05	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-07 18:27:22.771+00
426c6ceb-3cd5-4026-9a8e-39307167df9f	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT197M"}	2025-06-07 19:02:22.787+00
25794942-82d3-41f1-85a1-3ffa99fa4043	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-06-07 19:03:22.787+00
46ed33a6-be21-4c30-a0df-1410774de891	6001cdaa-df41-550b-adf6-6641e99307e2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT200M"}	2025-06-07 21:23:36.745+00
dbb23608-1057-49fc-a0e2-5c89d866494e	6001cdaa-df41-550b-adf6-6641e99307e2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56}}	2025-06-07 21:24:36.745+00
79a71915-8778-4e4d-9ebe-4dc8f627483c	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.6346138929945573}}	2025-06-07 21:44:22.771+00
3022a51d-350b-4787-921d-76821db274f4	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.6346138929945573}}	2025-06-07 21:45:22.771+00
43ac5a42-3299-45f0-a95d-b0f9b57168c4	dc22db1c-f777-5c82-8588-8dae349e49f8	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.84}}	2025-06-07 21:46:22.771+00
1c623d52-06b2-4eb6-975e-a33aaa93096f	f8478e87-8fee-5ef3-95b1-41c971c4abab	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-08 15:26:22.774+00
87d9ad37-9252-45fe-9a90-8a0e110bf278	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-08 16:24:22.777+00
50fac5a0-f1f7-4e41-94de-689a64555ab4	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-08 16:57:22.78+00
db92f939-a38b-4006-9894-a7ee9f5479fd	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT37M"}	2025-06-08 17:01:22.777+00
20ec5b02-0ea6-4fa6-9a68-84f8e0115653	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-06-08 17:02:22.777+00
fa369d0d-87ba-48e2-83c2-cd06715b91a6	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-08 18:00:22.777+00
04869284-d68c-4915-bc6f-271ad3982824	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-08 18:01:22.777+00
457c1baa-5df4-4496-ba13-6bb2c2f88458	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-06-08 18:02:22.777+00
e09e70b5-c928-401b-90de-89af96d22dfe	a203229e-5fe7-5b14-a2da-9200a6214e7d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-06-08 18:08:22.777+00
6f60e70e-7159-411d-a227-41f915aafea8	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT140M"}	2025-06-08 19:17:22.78+00
2a54dc8a-5296-42b9-8d05-a088b0c56bae	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-06-08 19:18:22.78+00
59c67bab-22b4-4952-aac0-fad43e7c57be	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-09 10:35:15.756+00
012a9d02-fadf-4101-aa24-a9f6018d21b3	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-09 10:40:15.756+00
dc31b859-16e5-45ae-bd82-7c96ab34447a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT179M"}	2025-06-09 13:39:15.756+00
d4059816-6788-4352-adf1-3da4b6178120	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-06-09 13:40:15.756+00
b4465a30-459a-450d-b884-6c5b52930166	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-09 13:47:15.756+00
0d55f819-78a0-43c9-a958-e2cdaddd9600	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-09 14:34:04.083+00
7862224b-ab6d-4886-afb4-39c602c70894	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-09 14:39:15.756+00
5c4c3ee1-59cb-4497-b053-509baf3350d3	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-09 14:40:15.756+00
ee5e8330-8c6d-48dd-a3de-9c1cbc3003a1	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 28, "scaled": 0.28}}	2025-06-09 14:41:15.756+00
150636a4-6c39-4dc0-ae06-ace3bb74d3ad	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-09 14:42:15.756+00
00e6b39e-6aa2-41c7-9d5f-46b3dbe3e6ae	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-09 15:10:22.774+00
e098368c-1f0a-4436-b4b5-8fb83713d625	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-09 16:03:22.78+00
416f431a-69c5-49f8-a7c4-a26317e7a669	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-09 16:16:22.766+00
05fced6b-000f-4c65-bfdf-e6895145dfc5	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-09 16:16:22.777+00
22713273-e885-4cd7-b803-eaa704dcdef1	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-06-09 16:20:22.774+00
8771250e-b81f-4895-af32-6a6b07a2cc8b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-09 16:21:22.766+00
46eead30-d4b2-412f-8b5a-4ec6def298c5	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-06-09 16:21:22.774+00
38593d78-64a7-46c2-8814-ceafec368082	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-09 16:23:22.774+00
9520f7b4-2822-4dad-8619-a15ca0b3e689	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-09 16:40:22.787+00
280b1ef6-d11b-4eb5-b809-14cd8d9466b6	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT130M"}	2025-06-09 16:44:04.083+00
b093cd2e-ac08-465c-b29d-0a82a36efb02	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.81}}	2025-06-09 16:45:04.083+00
9609faf8-4b1f-442d-9a99-2851cd91aebc	6001cdaa-df41-550b-adf6-6641e99307e2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-09 16:47:47.862+00
0f111bce-eff4-4faa-9191-3f7f681a90c1	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-09 16:49:22.787+00
33156920-effa-43ec-bd22-43acadf68fb6	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-09 16:56:22.787+00
32c269ac-0bde-48b7-90e1-4c2fe0ccc127	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT50M"}	2025-06-09 17:11:22.766+00
02f50652-8f17-44d0-806d-bd6aa9419f2d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-06-09 17:12:22.766+00
f029a2a8-5756-440a-9703-ddb9cbbfcadd	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-09 18:15:22.771+00
0e0f87e4-ce78-45c3-8f3f-ab11b6d293f9	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT215M"}	2025-06-09 19:38:22.78+00
26e4f6ff-c5bc-4e89-855b-5c481ad853cc	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.82}}	2025-06-09 19:39:22.78+00
b1eacc68-1d5b-4ad8-b450-59eb75408cb4	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-09 19:47:22.78+00
3d308cfd-dc6e-4762-91d5-8df23d36e7cc	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT188M"}	2025-06-09 19:48:22.787+00
23af6035-01f1-4c91-9edf-d71c2f449e02	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-06-09 19:49:22.787+00
f5162e08-3ca1-480d-b9ed-666c90e2447a	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT123M"}	2025-06-09 20:18:22.771+00
771bc447-82e9-44fe-82b1-7f731bb82a79	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-06-09 20:19:22.771+00
3589c387-1c17-4db2-8138-9b6550d3abea	6001cdaa-df41-550b-adf6-6641e99307e2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT288M"}	2025-06-09 21:35:47.862+00
4e91181f-efc5-42c5-895a-a815ab003a80	6001cdaa-df41-550b-adf6-6641e99307e2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43}}	2025-06-09 21:36:47.862+00
18388939-78ca-4818-99dd-f1172a4381f3	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-10 10:05:22.771+00
53a882f5-7aec-496b-90bf-ee85d7b33da6	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-10 10:08:22.771+00
a5bccc1e-e647-4dea-9c6e-0adef4fc408f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-10 11:57:22.766+00
0aad745f-2402-4091-9a3f-6bc8aeb587dc	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-10 12:00:22.766+00
bfaf4a34-0a59-4d8a-b734-d18517ed7ef9	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT155M"}	2025-06-10 12:43:22.771+00
45444331-8315-4e69-b99a-53d763c8cdb8	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-06-10 12:44:22.771+00
67a92313-aac3-4eca-ad6a-dd20498968f1	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-10 12:50:22.762+00
357a86d5-9a3b-4261-93ed-132590cd07b0	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT63M"}	2025-06-10 13:03:22.766+00
f872c5e9-4e87-427f-94c7-c8f18ed11451	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT130M"}	2025-06-17 18:44:22.787+00
dbaf7bbd-e2c2-4175-b8a9-ac1747f4975d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41}}	2025-06-10 13:04:22.766+00
e5416745-314a-4054-891d-2badfc3a0ab3	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT76M"}	2025-06-10 14:06:22.762+00
37fe1723-bb0b-43f4-acb5-81d2594d3b9f	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-06-10 14:07:22.762+00
3e38c9a7-e1f3-4625-9338-9d4287901cad	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-10 14:51:22.774+00
d6c97fbe-8a0e-43c8-8f36-829ff103746b	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.38182834747510785}}	2025-06-10 16:17:22.78+00
a6afdea5-8b20-4e65-98ce-7f3b7bce3c6c	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.38182834747510785}}	2025-06-10 16:18:22.78+00
6f11bc70-10be-4957-965a-26b0d389bc1c	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-06-10 16:19:22.78+00
53595226-2b36-42d1-a049-47fcd9787d32	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-10 16:21:22.777+00
650a5a6d-ac88-4c58-8e7b-5c3dd929af27	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT69M"}	2025-06-10 17:30:22.777+00
f3ca31bc-57f3-480b-bc73-3ef3e2a9562f	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-06-10 17:31:22.777+00
8df7480e-eb27-4a2c-af19-6e02a8f8cf00	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-11 08:33:22.766+00
f5ebdb01-0813-47e5-bcef-4fbb9e7eb299	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-11 08:37:22.766+00
db2b97d2-5cb2-4051-a16a-dd2ccd116fb8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-06-11 09:34:22.766+00
6892d9f3-81aa-4d12-af5a-6b038bfde378	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-06-11 09:35:22.766+00
b61f0097-a008-48f6-b8dc-a391888dcd3b	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-11 11:52:22.771+00
f820dd21-837d-4c6e-97d7-39c4aabe9e81	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-11 12:22:22.774+00
5b0ca6c1-2ea7-4439-bb6a-f6bc2113d754	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT88M"}	2025-06-11 13:50:22.774+00
1e765d27-80e9-4e87-98c0-4f0aa934e495	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.6}}	2025-06-11 13:51:22.774+00
02554886-6c92-41dc-843f-2540068e4f60	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT179M"}	2025-06-11 14:51:22.771+00
80789656-1c21-4955-a766-344ee958fdbb	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-06-11 14:52:22.771+00
ac6798e3-af14-4e76-9e5d-7d6d2e7f9133	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-11 16:31:13.017+00
49a4d709-e664-4983-a48f-1bfe5a459bbe	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-11 16:36:13.017+00
08d041e1-6328-40b2-8edc-5154f822b9cc	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-11 16:46:22.762+00
2fa903f2-0cc0-44f2-82e9-0d98e38a7d45	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-06-11 17:56:22.762+00
591a650b-11d6-42d4-b24a-f6114ce08978	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-06-11 17:57:22.762+00
3c0506b0-ce2c-4d0a-a616-59cce278855e	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-11 20:25:22.777+00
eef9c212-7479-44b9-9671-5b5724b8e047	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT233M"}	2025-06-11 20:29:13.017+00
ebe4dfb8-0f94-4b74-8a23-f26799571bd6	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-06-11 20:30:13.017+00
528ab0f6-37e4-4ccb-9b35-d4ee05c4928f	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-11 20:35:13.017+00
e2c1c8df-6ae0-42a8-b978-dfdfbdea9041	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT42M"}	2025-06-11 21:07:22.777+00
0c1cc3f2-c162-407f-8915-709a31812b4d	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.75}}	2025-06-11 21:08:22.777+00
a7768a4f-8454-4d9d-967e-aa54544f0c94	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-12 11:53:22.774+00
9ac67db5-5d41-43ea-9310-c75d80757fb0	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-12 12:25:22.771+00
9f2c8a37-b73a-4b19-9dd4-4fea82ccd22a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-12 12:44:22.766+00
af9fb1cb-819c-4cd2-86b3-e905d985f2c8	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT79M"}	2025-06-12 13:12:22.774+00
87290cd8-b707-45b0-911b-e453f1ebb137	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.6}}	2025-06-12 13:13:22.774+00
48382c9b-583e-40d5-bfee-7ce81d2fddff	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-12 13:18:22.774+00
412522dd-e9ee-4b97-8e40-bf7eac94447d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT43M"}	2025-06-12 13:27:22.766+00
9dfc7296-d3c7-4554-a596-4eec3dcc12a2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-06-12 13:28:22.766+00
f674ce37-7c0d-4c18-a82a-8f0a51d918fe	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-12 13:57:22.787+00
3d0ba884-49e3-4ad6-be62-560a0b067ce9	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-12 14:07:22.787+00
9bc7f7a8-63cb-484c-869a-70bb2d2f26cc	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-12 14:17:22.787+00
ab89d474-d2df-4265-b1e1-71d4f6b15883	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT148M"}	2025-06-12 14:53:22.771+00
98ce59cb-183e-401b-9aa5-c82a83c9337c	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-06-12 14:54:22.771+00
ffd32411-f2eb-49b0-bda4-362b49c508b3	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-12 16:01:22.777+00
cbd50d7c-0319-4a91-a83d-4049fe1e0358	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.3123918704831568}}	2025-06-12 16:16:22.766+00
0dbb51cb-b0a0-41ee-a136-8df7ceb9a906	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-20 19:51:07.211+00
e8632d68-0b8f-437d-9b47-99d6ddbf2b33	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.3123918704831568}}	2025-06-12 16:17:22.766+00
dc9a9b05-97fb-4d85-8c81-6449e16d0fcc	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24}}	2025-06-12 16:18:22.766+00
2d6b086c-0592-4429-b5d5-941870700381	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT59M"}	2025-06-12 17:00:22.777+00
42824859-4340-44f3-aeeb-d4dc13fe49cf	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT183M"}	2025-06-12 17:00:22.787+00
01baa810-4576-4a81-a739-d799fe218bca	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-06-12 17:01:22.777+00
600a4a82-1c8c-43dd-8b57-5ec2264ef927	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 70, "scaled": 0.7}}	2025-06-12 17:01:22.787+00
58d1cf63-bae5-41d8-8360-0e2d1065a359	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48617311146218756}}	2025-06-12 18:10:22.771+00
e4e71941-7439-466b-b2eb-5015500d5003	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48617311146218756}}	2025-06-12 18:11:22.771+00
a9334466-c847-4fd5-9117-d3f5454eba04	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.85}}	2025-06-12 18:12:22.771+00
f66fa685-9a45-4485-8c14-ba3101888432	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-12 19:22:37.807+00
fa0e11fa-9aad-47df-b679-c788410888c1	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT196M"}	2025-06-12 22:38:37.807+00
39c0bd6b-e477-4275-9699-756f15e26d5e	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.77}}	2025-06-12 22:39:37.807+00
be0cb538-5277-4d94-813a-85cc0148c991	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-12 22:41:37.807+00
4d84b189-389c-4ea9-a7d3-7b1220e3da6d	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-13 11:39:24.983+00
69dec3c2-02e3-4a85-a6ff-9f38d31fb871	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-13 11:43:24.983+00
ecb1fe80-d715-4713-a0dd-9e61149d4516	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-13 11:52:22.766+00
436dc1ff-4787-4631-bcff-a396deb910a8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-13 11:55:22.766+00
aa6498a8-feba-4f8c-8be6-6a8d3c5a6f51	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT52M"}	2025-06-13 12:47:22.766+00
265b828d-3506-4fb6-a3f8-5a0f9332eaf7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-06-13 12:48:22.766+00
9a6cc247-2d75-4115-858c-7d19b34c779b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-06-13 12:50:22.766+00
086d97e8-d675-42cb-b95b-fc75a09aed06	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-13 13:16:22.774+00
37e60eef-44e6-4387-9eab-c6ea0ebf5405	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT117M"}	2025-06-13 15:13:22.774+00
40d4625c-8e23-4470-99af-665c1fc6b372	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-06-13 15:14:22.774+00
5c875e1b-18a3-4881-97f1-752648685274	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-13 15:21:22.774+00
df2447ff-c077-423c-9226-e550cccef372	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-13 15:29:22.78+00
36747c4a-2b07-4b82-82ba-135d786a4517	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-13 15:31:22.771+00
d2a0658c-58a2-4809-8080-605e90cf6bf4	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-13 15:33:22.771+00
56fc593d-23e9-494f-b7a1-c49c88c5b077	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT239M"}	2025-06-13 15:42:24.983+00
46db4f22-2093-4ee8-bfb6-b1fc93ad027c	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 13, "scaled": 0.13}}	2025-06-13 15:43:24.983+00
36f6c7ae-6540-4b5d-9ff8-17e1e75ea6e4	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-13 15:51:24.983+00
66cc726c-7e25-4fdd-ae7f-715b25291208	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-13 16:01:22.777+00
1a1bd596-2d58-477e-8285-787efc738e4b	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-13 16:29:24.983+00
f73f89d6-7421-4613-bb78-b6aeb9e80708	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-13 16:30:24.983+00
0603450c-e1ff-421b-a5c0-a56b2c7fbe44	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-06-13 16:31:24.983+00
4d3f768f-89d6-4d64-9953-a09dd105dc51	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-13 16:37:24.983+00
1452d2d8-f6b2-405a-99a3-6a9cc79818fc	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT124M"}	2025-06-13 17:37:22.771+00
a1dc0010-5608-4ba4-ad95-2d74ed8e07df	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-13 17:38:22.771+00
106e87e9-3b61-4294-89e0-30e507ddebfb	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT150M"}	2025-06-13 17:59:22.78+00
39b25699-7fcc-4262-aa72-358e5c0b8220	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-06-13 18:00:22.78+00
6c9e0c48-b76f-462f-a756-6789d3864011	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.5136118967889848}}	2025-06-13 19:08:22.771+00
8d4cf80d-6459-4397-9eca-a501c7744992	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.5136118967889848}}	2025-06-13 19:09:22.771+00
375abd02-5321-4950-acbb-110c77213f5a	dc22db1c-f777-5c82-8588-8dae349e49f8	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-13 19:10:22.771+00
9fede869-8ec5-40d5-be3a-5570f19fd90d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-14 13:44:22.766+00
0cd89b53-4e31-43b3-8992-2664c8c42035	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT54M"}	2025-06-14 14:38:22.766+00
8d73f3c1-ffb4-49f9-b51a-dfbb0586ebd6	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-06-14 14:39:22.766+00
aaa5fe37-d9f8-4e20-a380-9a421742b82a	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-14 15:46:22.774+00
c6fd3e91-bc72-4634-9fc0-5fa3cb1654d0	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-14 16:13:22.78+00
d5893232-fd42-462f-961d-dd7a5c5cc59c	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-14 16:23:22.762+00
15b8612f-588e-407e-98b9-0ba2a4be0990	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35019150733675514}}	2025-06-14 17:38:22.766+00
ad0dffbf-8d1a-499f-98f1-3b235fe30bf0	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35019150733675514}}	2025-06-14 17:39:22.766+00
270222a0-a400-44e7-b31d-4020c7a72772	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-06-14 17:40:22.766+00
63e678fc-0775-42d4-ab1d-1b2788e72ae4	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT126M"}	2025-06-14 17:52:22.774+00
9d655f6f-d7c2-4619-91a0-5d9c17d8ecd3	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT90M"}	2025-06-14 17:53:22.762+00
f3fd312b-98a5-4eea-bdbb-4e0091326e96	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42}}	2025-06-14 17:53:22.774+00
15bd38e6-a13c-4c76-aba4-68016b4b03ae	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 15, "scaled": 0.15}}	2025-06-14 17:54:22.762+00
e10dd877-c67b-49eb-bb23-49cef4edf194	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-14 17:56:22.774+00
51ce039e-79ff-42bf-a16c-d9eb2ce57568	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT167M"}	2025-06-14 19:00:22.78+00
f5f98443-3600-4ee3-97e4-2803efc9cbc9	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.51}}	2025-06-14 19:01:22.78+00
8919d25a-3e0a-465d-b455-9d8f8bff45f9	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-14 19:31:22.777+00
b444477d-621d-462e-949d-cbc286d10051	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT31M"}	2025-06-14 20:02:22.777+00
43f4d8ec-6bff-46db-9c41-f1fb55ee2806	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-06-14 20:03:22.777+00
cea05972-e784-4fc4-8ed5-e096b25ef099	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.8856349384919315}}	2025-06-14 20:14:22.762+00
417735ec-d576-4754-bea4-eab932137208	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.8856349384919315}}	2025-06-14 20:15:22.762+00
c7d8eae4-348c-4e90-8cd7-7adda1bff874	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 27, "scaled": 0.27}}	2025-06-14 20:16:22.762+00
def35b02-c9ab-4d7b-a935-264f2b791456	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-15 09:02:22.766+00
d9d0a3d1-2b89-48ee-8bc5-b67f64cd2684	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-06-15 10:06:22.766+00
8de5515e-94bf-494f-9d91-36f258830432	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-06-15 10:07:22.766+00
48c845df-14a5-4369-8b91-0803ce100351	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31029845579214016}}	2025-06-15 13:42:22.766+00
62f91d69-0ea2-4f13-8380-250fd61afc2c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31029845579214016}}	2025-06-15 13:43:22.766+00
7f498de8-4c7d-4e07-9cd4-c564128516b8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-06-15 13:44:22.766+00
c99117ba-c982-4a93-adc5-a1ce54ea1877	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-15 13:58:26.075+00
2ebba995-7fed-4af6-a914-f0921c0c267d	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-15 14:01:26.075+00
99f0fa98-773c-4af3-83d5-934dac05af1b	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-15 14:29:22.777+00
ad77ac16-8c28-4a46-b2ea-16a36ca24935	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT38M"}	2025-06-15 15:07:22.777+00
3883069a-b9f7-4e4c-bc92-40d3eac31bc9	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.74}}	2025-06-15 15:08:22.777+00
a0d3fc42-123e-4b83-bd81-6f712287721a	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-15 15:11:22.777+00
70630240-b943-4c6e-8cb9-877e04209077	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.6764164902853039}}	2025-06-15 15:17:22.78+00
8ea9bc6d-d56e-4f46-b54a-422a1cd7f173	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.6764164902853039}}	2025-06-15 15:18:22.78+00
85806361-29b3-4715-8601-0a79e2b98afa	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-06-15 15:19:22.78+00
276a0d5f-4278-455d-ab0c-ae984c7c0633	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-15 15:26:22.774+00
2d0b2c73-72e1-49ee-8cf5-1fd00b04e036	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-15 15:30:22.787+00
4c5eaf8c-9bb3-4111-9859-841db9878582	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-15 15:38:22.787+00
b8edb7dc-aa04-4850-8f0b-0dba3bcad054	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-15 15:44:22.787+00
2d70b0e3-11d2-4725-b7e4-01c505291d1d	6001cdaa-df41-550b-adf6-6641e99307e2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-15 15:59:29.067+00
73a87271-d43e-433b-be09-eac9812de753	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-15 16:01:29.067+00
755f83fc-8180-4e06-99ba-4190a7e46dce	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT85M"}	2025-06-15 16:51:22.774+00
1d2e0cb7-4a46-494b-8b0d-1b66254d3004	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-06-15 16:52:22.774+00
e72d146f-d21e-4a28-a124-7f73120f213a	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-15 16:57:22.774+00
2c1557b2-ceb8-4195-bdcb-58b23f061290	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.32}}	2025-06-15 18:06:22.787+00
a07c9017-371a-4859-9e0b-38ec479d56db	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT295M"}	2025-06-15 18:56:26.075+00
e5b4681c-60ea-45ce-b47d-e0528cc5d8d2	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-15 18:57:22.771+00
0adcda47-f3e3-481c-af55-77d8943355dc	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56}}	2025-06-15 18:57:26.075+00
41bb6297-bf0c-4438-8891-3984e1c5ca88	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-15 19:03:26.075+00
df104c4d-54be-4b7e-9516-0b632610bdf8	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT249M"}	2025-06-15 20:10:29.067+00
d9ecc6a9-c605-45b1-a05d-389826f18987	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-06-15 20:11:29.067+00
c3d2c043-ad6e-4c2b-801f-8c98a5dc7e7b	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-15 20:16:29.067+00
327cb127-403f-41dc-8b5b-9567f1b0548d	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT156M"}	2025-06-15 20:35:05.982+00
efb5164e-d3b9-4c0f-9c2e-58d0f972134a	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.32}}	2025-06-15 20:36:05.982+00
bc51a624-f129-44ba-9e2e-7f00ba1c1d44	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-15 20:42:05.982+00
3762871e-1919-4b12-b679-3f916d98cb7e	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT157M"}	2025-06-15 21:34:22.771+00
dfb44ac2-fcdb-463b-9af2-182079743194	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-06-15 21:35:22.771+00
ed38b74f-55e2-4d02-a3e2-be881e57522d	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-16 12:12:22.774+00
7189da0d-8013-4cdd-9056-4bc87c41241a	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT49M"}	2025-06-16 13:01:22.774+00
fb2278e7-5399-4572-9a25-e86a579ebcc3	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-06-16 13:02:22.774+00
7d6cc2ad-98cd-42c6-a833-2f671dce6584	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-16 15:31:22.771+00
4325d5b1-4187-4538-92a0-74fa12bc7d78	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-16 15:33:22.771+00
a92cf623-2082-4acc-b03b-e93d679b6f0f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-16 17:03:22.766+00
2455a750-9ede-4714-ad0f-1fe246902c1e	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT134M"}	2025-06-16 17:47:22.771+00
c9f4d899-a6d0-4740-8910-869466c6af6f	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-06-16 17:48:22.771+00
81cf8769-c0c8-4fc8-b006-adb14ef62a9b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT54M"}	2025-06-16 17:57:22.766+00
6212e8f3-c0c8-4816-ab44-171bd4919eb4	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.74}}	2025-06-16 17:58:22.766+00
ff716219-bb86-4e99-8115-18f5f0e75d7d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.328515097612292}}	2025-06-16 20:26:22.766+00
a2388697-b41f-4f64-8cf7-a25b69dcf416	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.328515097612292}}	2025-06-16 20:27:22.766+00
2e799937-1b30-4b00-ac47-1fab9530c6d9	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-06-16 20:28:22.766+00
55195a88-cda7-43c3-88e2-13445621b3f0	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-17 10:05:22.766+00
3c496812-0333-49f5-963a-2a14b70fc90c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-06-17 10:52:22.766+00
6f2605af-e5e3-4a2e-9c9c-d3d239c07fd5	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-06-17 10:53:22.766+00
5fe1bf19-306c-406d-83a6-fa71eea8a90e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36184101462557455}}	2025-06-17 12:03:22.766+00
d0d39abb-e9aa-4ba0-b094-7c60b5c79976	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36184101462557455}}	2025-06-17 12:04:22.766+00
e9ede2f7-5f65-480c-9cb8-822cb3dc4a20	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-06-17 12:05:22.766+00
085ad632-37de-489e-9987-7ba101b37b81	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-17 13:25:22.774+00
33dc37a9-1f46-4b63-a998-7583aba05750	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-17 14:56:22.771+00
ebdb7b60-88b2-4af2-8840-6a94514b97a9	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-17 15:53:20.052+00
0869a253-0b31-411e-a0bc-a145210ee887	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-17 15:56:20.052+00
5e1038df-108e-4f54-9123-6203fe149de4	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-17 16:09:22.777+00
9d054bb9-dab2-4088-80da-a8b2773bb9c2	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-17 16:34:22.787+00
55010a65-a174-4960-8a9e-28d6ea82d372	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-17 16:39:22.787+00
756e171d-fb33-4611-848f-e8ee4555e61e	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT42M"}	2025-06-17 16:51:22.777+00
5955e0a1-bd27-4d8c-a883-4f8318a4c652	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-06-17 16:52:22.777+00
bdda454f-896e-43a9-849f-62d6620a06a7	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-17 16:59:22.777+00
f7aec27b-5b81-4e87-8fd7-05055a8bde88	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-17 17:40:22.762+00
a482391c-4693-42aa-87c3-a72e764141de	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-17 17:44:22.762+00
c1a4226b-5e53-4246-8912-edbc5cefdebd	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT184M"}	2025-06-17 18:00:22.771+00
8ed24a9d-3059-4a64-b556-1eaf88d99c83	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 96, "scaled": 0.96}}	2025-06-17 18:01:22.771+00
07929814-3cbd-4177-85b6-15ef4ce413ee	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 73, "scaled": 0.73}}	2025-06-17 18:45:22.787+00
aa9565fc-d30c-4939-b1b4-cff27d530dcf	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT69M"}	2025-06-17 18:53:22.762+00
10283883-4442-496f-ada6-4fd805be77b2	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-06-17 18:54:22.762+00
4a6b75a2-6d90-4b59-92b5-03846729b2b7	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT215M"}	2025-06-17 19:31:20.052+00
40ff94c8-998a-4793-868f-fe88696644cc	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.85}}	2025-06-17 19:32:20.052+00
265d739a-4c87-4cc3-a3f1-11e7adc34629	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-17 19:37:20.052+00
8e3cd5b9-ec96-45e8-ac54-b3da66ebb155	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-17 20:04:20.052+00
450531b6-073a-4771-9f4c-4a06f7623f20	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-17 20:05:20.052+00
66ae5cd5-d418-4f3f-bc17-d3a26c4914df	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-06-17 20:06:20.052+00
ad7ecf77-868e-4765-b87e-0899a6835b06	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-17 20:09:20.052+00
655975e8-d937-4363-bfac-d6d860d80b01	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-18 13:39:22.766+00
0af8ab22-0470-4b13-9565-b684cdff44c3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-18 13:42:22.766+00
cff11b77-fc22-4074-9687-12b8b2678e47	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-18 13:46:22.762+00
9c9b9b4a-fac1-47d2-a048-9825af606b80	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-18 13:49:22.762+00
353238ee-d75e-4882-a5a4-fa54ae14ce07	f8478e87-8fee-5ef3-95b1-41c971c4abab	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-18 14:07:22.774+00
6e7c5097-1c18-4da1-927c-75892cd22ff4	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT56M"}	2025-06-18 14:38:22.766+00
54102578-139a-4128-ae13-acabad8913c4	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42}}	2025-06-18 14:39:22.766+00
17e3bc8d-a075-424b-920b-8e5f3b28d67e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-18 14:42:22.766+00
bcb29e39-446d-472e-81d8-6f1cf7946486	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT75M"}	2025-06-18 15:04:22.762+00
e1cb2443-5ac9-4201-bd6a-c84cba73aa9f	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-18 15:04:22.78+00
dee248fd-3626-4b17-9f67-d8deb5b50391	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-06-18 15:05:22.762+00
f717ff45-cbe2-45a3-b721-c8d3650b580f	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-18 15:27:22.771+00
8db0b630-24b6-4336-808d-e2f488f97514	f8478e87-8fee-5ef3-95b1-41c971c4abab	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT111M"}	2025-06-18 15:58:22.774+00
c8ce2624-75be-453f-87f8-6f3a93a06c50	f8478e87-8fee-5ef3-95b1-41c971c4abab	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-06-18 15:59:22.774+00
25fe56d2-4157-4f16-83d5-f75ef8118886	6001cdaa-df41-550b-adf6-6641e99307e2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-18 16:43:23.707+00
e5b9ea4b-f900-404b-bca2-1a0894a9960b	6001cdaa-df41-550b-adf6-6641e99307e2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-18 16:46:23.707+00
d740eac9-a8af-4178-88a5-62e9333dd2d3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.40574642937316135}}	2025-06-18 17:06:22.766+00
e62159c2-0c34-4955-b331-95824dfbe5aa	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.40574642937316135}}	2025-06-18 17:07:22.766+00
40276b3e-32ba-4696-a3ba-f66037abd7e9	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-06-18 17:08:22.766+00
632afcfb-ff48-4708-a97c-097a34f2ba16	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT143M"}	2025-06-18 17:27:22.78+00
ee658b67-7993-4450-9a4e-0782ff50c5ad	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72}}	2025-06-18 17:28:22.78+00
7bb2ffee-47c8-4ac6-b6bf-61bc60632b76	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT165M"}	2025-06-18 18:12:22.771+00
94184bb2-aacf-45de-88da-623f1a77f11b	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-18 18:13:22.771+00
f56e7102-086c-4586-b280-1c4bfa077390	6001cdaa-df41-550b-adf6-6641e99307e2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT170M"}	2025-06-18 19:36:23.707+00
01c7f8e6-9a36-4dc7-91e8-7d085456df92	6001cdaa-df41-550b-adf6-6641e99307e2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-06-18 19:37:23.707+00
54672f40-f632-4a75-9db8-f628ef0da128	6001cdaa-df41-550b-adf6-6641e99307e2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-18 19:46:23.707+00
18fc0db6-81c4-49fd-a3ef-8703002171cd	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-18 20:46:22.777+00
bc5b3caa-51be-485f-b6ac-e28b9de8b560	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT29M"}	2025-06-18 21:15:22.777+00
8f9c2003-c8c5-458a-b8c5-a1b4c8ca88a8	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-06-18 21:16:22.777+00
6f08f6e6-a5c4-4ff3-86e8-93d1bea72745	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-19 10:07:36.081+00
130d7e61-47a3-4d7c-a4ed-836570039810	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-19 10:10:36.081+00
312becae-10eb-4136-8d71-db6eedf99ff1	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-06-19 14:02:22.766+00
8d080d8b-109b-467b-aa7f-ee663bebba37	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-19 14:02:22.771+00
fc8833fa-6c81-45f4-bcb6-3b9f3ff5ac48	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-06-19 14:03:22.766+00
d4552120-cfa4-43ee-a78c-f27408a1566e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-06-20 20:37:22.766+00
ecf0a145-caeb-4b6c-9827-497a5b3a1aef	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-06-19 14:04:22.766+00
f2beffde-8e7f-4570-948a-5b425e53863a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT380M"}	2025-06-19 16:30:36.081+00
08024dd5-f38d-4664-8772-b40964280d3a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-06-19 16:31:36.081+00
5e345249-cc31-47a1-bf4e-5d43329f0ea6	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-19 16:36:36.081+00
0a8b1723-cda1-4f40-a732-c149faf713a2	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT157M"}	2025-06-19 16:39:22.771+00
6dceff43-24bf-4477-a72b-e35bff1e95f8	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.84}}	2025-06-19 16:40:22.771+00
9f6928e0-2917-471c-a6c7-f1cc4631556c	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-19 18:04:22.777+00
cd4cc4ae-bd5d-487a-9502-8d3c34a59160	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-06-19 19:08:22.777+00
3de622a9-2d3e-4f03-adc3-b41711c9c12d	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-06-19 19:09:22.777+00
936e5f8f-cb9e-4730-976d-bbc83fbb91f2	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-20 11:31:22.771+00
34550040-fd65-43d7-b34b-f12982035613	f8478e87-8fee-5ef3-95b1-41c971c4abab	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-20 12:50:22.774+00
e6d08dd2-3f37-41aa-bfa9-28242eb32815	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT125M"}	2025-06-20 13:36:22.771+00
180de58e-5a34-426e-a572-b6e0f0309d0c	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.99}}	2025-06-20 13:37:22.771+00
20950076-2513-47ba-8cb5-c5df69b0ff33	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-06-20 13:41:22.771+00
27ba3464-3122-4406-bbe0-0897c8fe9773	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-20 14:41:43.224+00
ac14c281-cb98-4cb0-9c6e-d937286bd730	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-20 14:44:43.224+00
f273bb8a-65ce-41e3-a1cd-e5c8a1e963ef	f8478e87-8fee-5ef3-95b1-41c971c4abab	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT118M"}	2025-06-20 14:48:22.774+00
51adbe0f-f162-4035-8fbf-06444f4843d5	f8478e87-8fee-5ef3-95b1-41c971c4abab	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.69}}	2025-06-20 14:49:22.774+00
0a293823-bdfb-4bc6-9d46-d41ce136b70c	f8478e87-8fee-5ef3-95b1-41c971c4abab	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-20 14:57:22.774+00
7d480a71-6e83-4248-8596-45eb630dfd12	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.5268625721340896}}	2025-06-20 15:36:22.771+00
fef6f200-d11d-417c-8f44-dd48362cc4f4	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.5268625721340896}}	2025-06-20 15:37:22.771+00
2e34df97-9d09-48a6-9649-fb36e73e4708	dc22db1c-f777-5c82-8588-8dae349e49f8	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.89}}	2025-06-20 15:38:22.771+00
ea438e9f-5662-40ee-8db8-0519be58878c	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-20 16:13:22.787+00
e44f9d33-b4c5-4fa3-a6db-46bb42e23602	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-20 16:23:22.787+00
94fb86bf-0a3a-4519-8b2b-edf939e795a4	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-20 16:32:22.787+00
4b2f10a9-6277-438f-937c-b38c1ee44ea5	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.5587234552528622}}	2025-06-20 16:38:22.78+00
97c5c0c2-fa8b-403f-acf6-16fc0eab09c4	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.5587234552528622}}	2025-06-20 16:39:22.78+00
f2f872c6-2d9f-47db-8009-d1d15e76fab9	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-06-20 16:40:22.78+00
42584046-5caf-48fb-8f04-e01b7ed6a154	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-20 16:44:22.78+00
2d766e78-46d3-40cc-be47-3d9e2696ee10	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-20 17:03:22.777+00
a72cec30-fa7d-4a58-8011-4085a7ed7247	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT49M"}	2025-06-20 17:52:22.777+00
b87948b9-b94f-4e8c-ba04-82369af695b5	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.84}}	2025-06-20 17:53:22.777+00
12c21317-514f-4994-b0e2-33ba91e85c64	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-20 17:59:22.777+00
cc7e9d4f-dc1a-4e7e-bf1e-2e8eb6cbe00d	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT205M"}	2025-06-20 18:09:43.224+00
57f031c7-2df1-4daf-96c0-fda12b522e71	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-06-20 18:10:43.224+00
21453ff8-7fbf-43f7-836e-8f9ac8907744	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-20 18:19:43.224+00
c96098e4-a49f-4f86-857f-1b9bfa640df1	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.5305910479381826}}	2025-06-20 18:34:22.777+00
f3178047-f25b-4f64-8353-cffe12d4c86b	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.5305910479381826}}	2025-06-20 18:35:22.777+00
1634cbc8-85ee-4afd-8e1b-4fa6695a9559	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.99}}	2025-06-20 18:36:22.777+00
ec58cabe-6548-4609-9e4a-faa49fc9dc42	a203229e-5fe7-5b14-a2da-9200a6214e7d	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-20 18:37:22.777+00
d3a10208-5885-4c02-a6d7-fee1d29cd5c2	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT165M"}	2025-06-20 18:58:22.787+00
278bcf8e-cb59-4203-9346-5bc6eaf964e7	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 49, "scaled": 0.49}}	2025-06-20 18:59:22.787+00
dd21d035-6b39-4fb8-b96f-7b29a4680b96	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-20 19:40:22.766+00
3a33cd3e-7f9c-4106-bafd-68fdd5b24ef2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-06-20 20:38:22.766+00
dc276256-c2e4-4e82-9f4e-4d08c4921c4f	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT164M"}	2025-06-20 22:35:07.211+00
66a04601-7b48-4def-9db2-0d4a190bee26	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-06-20 22:36:07.211+00
c8c7e9e7-6c67-44d6-9128-f88122c1b634	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-20 22:41:07.211+00
231f6837-371f-4ce4-ba08-3d782ebb8c3c	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-21 11:29:22.762+00
7773db9a-fa76-481b-86e4-0175f908ff46	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-21 11:34:22.762+00
848ba229-1d92-41c7-8689-62676a6ef1b7	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-21 11:39:22.787+00
4233f7a9-e905-41dd-98b3-47b6ca333a76	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-06-21 11:48:22.787+00
037539c6-d1f1-48fa-8fa8-f8e6d2da76df	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-21 11:54:22.787+00
6b4e9923-f028-41a0-b874-91d7b430c35c	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT91M"}	2025-06-21 13:05:22.762+00
870d8fa7-4d15-42a2-8610-a78f12f01a14	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-06-21 13:06:22.762+00
26b3740d-6c6f-414e-af6a-26206d6771c7	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-21 13:11:22.777+00
fa107da8-2349-4415-87a6-e9be5289389b	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-21 14:08:22.774+00
aefa0702-a632-44ce-b6c5-bd1abe7d53fc	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT71M"}	2025-06-21 14:22:22.777+00
6c73428b-7ad8-4304-953d-1167e195ba47	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-06-21 14:23:22.777+00
33f94038-0420-4cbb-92a6-bdfceabc04c9	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-21 14:28:22.777+00
fdde9e49-aa20-4d33-a76d-5f3c2e38a81f	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT170M"}	2025-06-21 14:29:22.787+00
3b746469-ba53-4d5a-aefa-263c9f89f9d5	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.69}}	2025-06-21 14:30:22.787+00
63ce3169-b13d-48f5-a075-927aae097233	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-21 14:33:22.777+00
0e1d0881-dc84-4784-ab3c-f6226e257ea3	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT54M"}	2025-06-21 15:02:22.774+00
43fc5680-3e2a-43b8-9ad8-0771508ab5b2	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-06-21 15:03:22.774+00
625861aa-94aa-49a1-b733-32d36cd87c8a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-21 18:53:22.766+00
afebf52e-1726-47d5-ba56-2740d0ede809	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-21 19:02:57.06+00
0b242278-701b-4154-8021-5a233ad5ced9	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT48M"}	2025-06-21 19:41:22.766+00
30e91718-cb4f-4cb7-a229-37f9105dda30	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-06-21 19:42:22.766+00
99054b1e-3aa9-4bdf-9417-667787cf63a3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-21 19:43:22.766+00
2eb36033-5e28-4f59-acc3-0cbea10928de	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT66M"}	2025-06-21 20:08:57.06+00
350946ff-7f2d-4def-b015-5775de7c22d3	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-06-21 20:09:57.06+00
a217b034-65a1-4ee7-adda-57a9a82243f7	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-21 20:18:57.06+00
71e9646c-5f1e-4617-a4ef-58c69eaf76b9	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.3820037693358699}}	2025-06-21 20:30:57.06+00
69af88fa-c2e3-4745-a232-8fe42ac5745b	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.3820037693358699}}	2025-06-21 20:31:57.06+00
097ef098-bbae-4c63-8ad3-91c59ad7d74d	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.77}}	2025-06-21 20:32:57.06+00
b2575322-d923-44d7-b349-9138f3a2dcae	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-22 11:25:22.774+00
37c3663e-6b73-41d8-8999-0c0f1e6de1c9	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-06-22 12:22:22.774+00
2fae10a6-d56a-46bb-be5b-c9358ce0e012	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42}}	2025-06-22 12:23:22.774+00
dbc7f9a7-7912-48b8-a1a6-800782681ded	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-06-22 12:27:22.774+00
5a2f70c5-482e-4ef7-bb51-7fee1f5ffad8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-22 13:01:22.766+00
5e209782-5ad5-426c-8756-d7bd6d6ce5d8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-22 13:06:22.766+00
985e09cc-058d-4d61-8bd9-ea08131ca375	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-22 13:29:22.777+00
e5761b45-5785-4dc9-8c6a-4df53bff4e29	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT49M"}	2025-06-22 13:55:22.766+00
fdaa85e8-aab5-4294-8176-51f94b0412a2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-06-22 13:56:22.766+00
80e787c4-2b12-4fd1-a2e7-150564220682	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-22 15:48:22.762+00
58c0bd26-98de-43c8-8c6e-f270982d1bb9	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-06-22 16:52:22.762+00
47d9c57e-fb93-4e6c-a9c0-56bc28d46ba0	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-06-22 16:53:22.762+00
3a5d388b-f49b-428c-beb1-9801efaacec7	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-22 18:49:05.748+00
65ca6f54-ad0f-42ac-92ba-ae59fee47fa2	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-22 18:53:05.748+00
abe9ea5b-ff29-441a-a1b0-04d62a05ea3b	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT337M"}	2025-06-23 00:30:05.748+00
430c7330-4c1c-4222-9bbf-34531dd3de49	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-06-23 00:31:05.748+00
37456520-b088-4a62-8049-4596cdd181cf	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-23 00:34:05.748+00
8df15d47-3b95-4d3c-9e1d-e9c171a8e0e1	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-23 11:57:22.766+00
a3e0af49-9777-490a-b59e-05e881f4f003	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT60M"}	2025-06-23 12:57:22.766+00
7ed324c1-fe2d-48d7-943c-cadfdd3255a0	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 52, "scaled": 0.52}}	2025-06-23 12:58:22.766+00
df67e72d-05e1-4d26-ac74-dd28443e4c21	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-23 14:17:22.774+00
615aa2e7-9483-42d1-a387-0c33f61da7e8	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT66M"}	2025-06-23 15:23:22.774+00
d366ec42-2c72-45c3-8435-7f9810d140aa	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-06-23 15:24:22.774+00
175efd74-5fb0-4b13-8917-58daa8968fbb	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-23 16:51:22.78+00
b2232bfb-6a71-4269-9a14-eb8cd0fa3270	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-23 18:15:22.777+00
f457345f-3b6a-4e20-960b-634f23efd862	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-23 18:22:28.26+00
df4735b6-5dbd-4405-b47f-0fd3bee54578	6001cdaa-df41-550b-adf6-6641e99307e2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-23 18:24:28.26+00
4e6f828f-6ab7-4870-9475-9d384c8dbb4b	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-06-23 19:25:22.777+00
44abe23b-2ac0-4637-9592-dd23d5be2820	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-06-23 19:26:22.777+00
60a666b4-0fce-44e3-abad-09927cf29853	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-23 19:35:22.777+00
8f03ace6-db7c-4cca-9924-08256a944966	6001cdaa-df41-550b-adf6-6641e99307e2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT328M"}	2025-06-23 23:52:28.26+00
fd275919-838e-4d6c-90cc-572661c030b2	6001cdaa-df41-550b-adf6-6641e99307e2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-06-23 23:53:28.26+00
687aefb7-2767-4c44-b898-bfb9deb39b41	6001cdaa-df41-550b-adf6-6641e99307e2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-23 23:59:28.26+00
42761845-9c8e-45dc-9813-a84e03953dde	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-24 11:41:22.766+00
a403ff89-94d9-454c-9178-97c32591078b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-24 11:46:22.766+00
17ddcfca-4714-43c1-b285-0f08e0640cd9	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT52M"}	2025-06-24 12:38:22.766+00
7261a1a2-d916-4a9f-b1db-f12e9971be6a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-06-24 12:39:22.766+00
83470b9b-d65c-4e3d-8fb3-dd5924bb679a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.823951779567881}}	2025-06-24 14:13:22.766+00
03422a45-18c0-4383-b5e9-fdb39320d757	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 82, "scaled": 0.823951779567881}}	2025-06-24 14:14:22.766+00
dc61bfbb-9fa3-4fb7-a4db-5468e78cba78	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.57}}	2025-06-24 14:15:22.766+00
cd07111b-1244-4815-b849-175a8054d78c	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-24 15:22:22.774+00
de484387-293f-44f4-a6dc-715759035edb	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT48M"}	2025-06-24 16:10:22.774+00
b7673055-6e6d-44dd-9383-602992d3a90e	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-06-24 16:11:22.774+00
a6e28ccc-7a9f-4f5b-971d-3dfbcc555cb2	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-24 16:18:22.774+00
27137a79-ba08-4336-838c-4ded5e588179	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-24 17:53:00.751+00
0d41c26e-37dc-4a02-9774-748a13691db8	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-24 18:49:30.915+00
31e019de-1430-4cb1-8021-883ba88cee8f	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-24 18:53:30.915+00
e94a9dbe-3443-4515-a5af-ac55935100e1	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT153M"}	2025-06-24 20:26:00.751+00
30f01e28-d6ef-4705-811a-991e7cf31742	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-06-24 20:27:00.751+00
aa4a92f8-9eec-400e-b2de-74cab4e415e7	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT285M"}	2025-06-24 23:38:30.915+00
a160582a-4909-439f-9ba1-7b08bdd7aaac	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.74}}	2025-06-24 23:39:30.915+00
e5fbf78b-7fe3-42ec-adb0-922785d68173	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-24 23:46:30.915+00
a8940828-53b4-45f6-b90b-41338981a345	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-25 12:10:22.774+00
29b4cb5a-643d-4ce3-a767-a0eea4151737	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-25 12:40:22.762+00
8ecf6616-6630-4030-aa8c-d944faa8c674	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT81M"}	2025-06-25 14:01:22.762+00
7d87dd72-2f1d-4d77-a0f8-380d76356bc5	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-06-25 14:02:22.762+00
c2b98353-5c67-413b-88aa-cd564bc39bbe	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT124M"}	2025-06-25 14:14:22.774+00
7683d381-7956-4054-a6ca-eeb2de87718e	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-06-25 14:15:22.774+00
1f593de8-e707-48e8-8c8a-5b6a4d75748a	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-06-25 14:21:22.774+00
1a263fd7-b40a-4133-87e1-656fc873c458	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-25 15:54:22.777+00
20ad8ea9-2100-458f-8f2a-a6292d3dcafb	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT67M"}	2025-06-25 17:01:22.777+00
00bd3c8e-3305-4bce-a560-60063907a08b	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-06-25 17:02:22.777+00
44548367-3cf5-4bbc-a48c-fae48c343df1	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-25 17:04:22.777+00
415dc0f6-d16a-4199-bdc4-93a59bfe265e	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.6495001957419475}}	2025-06-25 17:52:22.762+00
3d627d0f-77d0-4705-824a-7e732d4bfbcd	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.6495001957419475}}	2025-06-25 17:53:22.762+00
e7ecd975-c017-414c-8024-7ed4057449b0	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.51}}	2025-06-25 17:54:22.762+00
72172738-1541-42f6-b032-14943ee9fefa	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-26 12:19:22.766+00
bdf73d25-e770-4c06-b57a-f73153b66523	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT53M"}	2025-06-26 13:12:22.766+00
1558a663-522a-4a38-ba2e-57de38d75fcb	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-06-26 13:13:22.766+00
775dc405-1a54-44ae-a15e-7fee4de3c9f8	6001cdaa-df41-550b-adf6-6641e99307e2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-26 15:16:24.361+00
3d4ac4e9-f76a-4726-ba93-d13a891918eb	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-26 15:19:24.361+00
dadcb803-7583-4037-b2f1-324ad9549170	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-26 16:19:22.777+00
3d4796fa-cff7-4716-9deb-0b9ec6deb722	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT53M"}	2025-06-26 17:12:22.777+00
27900545-5f80-458f-a67b-d81fcaedb02b	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.87}}	2025-06-26 17:13:22.777+00
574ad54a-9c9a-4745-8c02-6cac141b58e4	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-26 18:24:42.03+00
8a475757-c7c4-4d86-8df8-c2b37832038f	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-26 18:28:42.03+00
8e2af894-4869-4779-af64-5a70dee269d0	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT192M"}	2025-06-26 18:31:24.361+00
bcf18a4b-b32d-4aff-a4c4-7fdb7b73d7fe	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-06-26 18:32:24.361+00
dff20a08-183e-45fc-a82a-41d02f4d16e9	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-26 18:34:24.361+00
f71fcf1e-1d7e-4db0-a1c4-83451b68957c	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT331M"}	2025-06-26 23:59:42.03+00
7a5010a7-9564-45a4-b5e4-522ff03a8fc1	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-06-27 00:00:42.03+00
b53c6bd5-ee05-44c3-beff-c00f4df34510	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-27 00:04:42.03+00
f8e27aec-2dbd-47d0-a2a4-94b53f68f0c0	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-27 13:01:22.774+00
a527236c-8119-45fd-bab4-6240b5a50ec0	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-27 14:14:22.766+00
39c81cc4-6cef-4327-952a-86805f0723cc	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-27 14:16:22.766+00
ccf0ddab-8ae4-44a5-8c8a-e108fb519fbe	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT48M"}	2025-06-27 15:04:22.766+00
8eb0275e-5f6f-4e1f-b6e4-2b914393951b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 16, "scaled": 0.16}}	2025-06-27 15:05:22.766+00
4d30be53-ee76-4806-8391-d1e59aa26748	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-27 15:06:22.78+00
7ad768d5-7d19-43d8-b25f-ef999cce7bfc	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT216M"}	2025-06-27 18:42:22.78+00
d6b27eea-78a2-48ad-89a5-74e6dd82737f	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.69}}	2025-06-27 18:43:22.78+00
ae63da8a-1077-4caa-aef1-88a6cbb6df49	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-27 18:45:22.78+00
34fbb032-7854-4547-bc89-ee9bd99c7950	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-27 20:03:22.777+00
8c21fbf3-519c-4c5e-ad8c-467a39f60a65	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT44M"}	2025-06-27 20:47:22.777+00
6328bd5e-aa90-44ef-b79a-2aa56349ac8c	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41}}	2025-06-27 20:48:22.777+00
72a58c2c-732f-47f7-b9e9-2aa406179792	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-27 20:57:22.777+00
5e52f079-41f2-4d82-bd12-85c584d581d2	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-28 14:02:22.78+00
b2ba5339-ee5e-4506-b3b2-a2b3072d7f6b	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-28 14:55:22.762+00
b740e87f-3643-4482-8735-59c5d5960093	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-28 15:40:22.774+00
b1d31279-0716-4796-ad1f-37b7d197fb72	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT108M"}	2025-06-28 15:50:22.78+00
750491a9-06c2-4c1f-8338-c9534c132db3	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-06-28 15:51:22.78+00
1a5d28ad-0394-4ff6-ad85-b38367694a13	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-06-28 16:05:22.762+00
d0242093-2726-4040-a844-b7858c835eca	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-06-28 16:06:22.762+00
bdbfcc39-a865-455f-a18d-c21362e93b90	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT55M"}	2025-06-28 16:35:22.774+00
02febd5c-2453-409f-8628-4a8e76785fc9	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24}}	2025-06-28 16:36:22.774+00
0ed1038a-e259-4402-a7c9-62fa16dd54ad	6001cdaa-df41-550b-adf6-6641e99307e2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-28 16:37:50.889+00
f3a076c8-6d06-4455-9d18-d8e81fcc7cf9	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-28 16:38:22.774+00
59f1d9f9-d371-4169-bf21-993338b63ef7	6001cdaa-df41-550b-adf6-6641e99307e2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-28 16:39:50.889+00
e8256d62-581f-4721-b300-fdfdc48eb3f0	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-28 18:03:56.024+00
76343382-e306-4179-8ebc-2541c09f9234	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-28 18:08:56.024+00
460e63dd-2f7e-431b-b371-9bec41f5dc21	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-28 18:15:22.766+00
9146501b-4a25-4748-90ee-38fc7c5c34e0	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT60M"}	2025-06-28 19:15:22.766+00
a0e65f4b-0923-4fc6-bdc4-922e3034160d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-06-28 19:16:22.766+00
1fed8919-2997-462e-a058-9d0c0961758f	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-03 13:58:22.774+00
55cfc89a-7bad-4754-a9df-88b813d12f99	6001cdaa-df41-550b-adf6-6641e99307e2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT207M"}	2025-06-28 20:06:50.889+00
cf214a93-8ea6-4d5c-86c8-a32608cc9ed0	6001cdaa-df41-550b-adf6-6641e99307e2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-06-28 20:07:50.889+00
6db9b730-a09d-483b-aba1-96e416c0fa9a	6001cdaa-df41-550b-adf6-6641e99307e2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-28 20:09:50.889+00
c7ab30b6-54a9-4fd7-b7b2-a1bda427a13c	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT187M"}	2025-06-28 21:15:56.024+00
6a44f163-34eb-4533-b2fa-0d3d81594d3a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.2}}	2025-06-28 21:16:56.024+00
458853d5-0d2e-46f4-9af5-d92cf4fb63bf	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-28 21:18:56.024+00
f711c4d1-7818-41dd-a3ab-8a54153308bf	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-28 21:58:56.024+00
aaec92fa-1b89-4c08-823b-5c5d9258ecd3	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-28 21:59:56.024+00
3e1eaf0d-e457-4f2d-a2a6-cd39c9465f84	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 3, "scaled": 0.03}}	2025-06-28 22:00:56.024+00
7a358371-9b90-4374-90b4-241ff2aeb0d1	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-06-28 22:04:56.024+00
7d42e7c7-f967-43b3-ac58-b9528adaddfd	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-29 12:24:22.774+00
ff4c93b5-ac2a-4493-9491-b6cd24085d4f	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT127M"}	2025-06-29 14:31:22.774+00
325bb2eb-299b-4e76-a0b2-9b1f333f3ceb	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72}}	2025-06-29 14:32:22.774+00
a813a5de-d3fc-4088-a960-2a92149bc4c8	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-29 17:35:22.787+00
0178915a-6bb9-4b2c-8429-7261c87d7859	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-06-29 17:39:22.787+00
632b48fe-dc43-404e-87ca-e311cdecff44	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-29 17:46:22.787+00
cc2ffba5-47a4-4ca3-a674-16b5c9b88cac	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-29 17:50:22.766+00
2a5b4ba1-0d25-41d7-92d1-797d5f820f95	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT50M"}	2025-06-29 18:40:22.766+00
01ed140a-fb92-4652-bd7a-ab9e98e5f619	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-06-29 18:41:22.766+00
3fe625b1-8f2b-4359-8039-42346ea4f97b	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT186M"}	2025-06-29 20:41:22.787+00
6099b555-bf33-4fc5-a1ff-98b82d117770	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.57}}	2025-06-29 20:42:22.787+00
7c1956ef-6c43-4751-b5b7-9d051ecd6aa2	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-29 20:51:22.777+00
6e2a3cf0-f91e-4df4-b86d-7d376c219090	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT32M"}	2025-06-29 21:23:22.777+00
2ff048a7-fc8d-494e-bfd5-90bd9adfcf22	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-06-29 21:24:22.777+00
b4c39035-bfd0-4b5e-bb42-c756e1a3d231	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-29 22:20:22.777+00
05d74b32-4df0-4e52-9cd3-5f454cf487ff	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-29 22:21:22.777+00
5c7a8a09-053a-482e-87d8-d2caffbb218f	a203229e-5fe7-5b14-a2da-9200a6214e7d	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.61}}	2025-06-29 22:22:22.777+00
8999ef08-c528-4099-a83a-32b332d37060	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-30 10:44:45.947+00
2136ca51-a714-4436-a599-c829768b63db	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-30 10:49:45.947+00
8fd4f2a9-9576-4071-8c79-e15c4fe2bbe6	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-30 13:30:22.762+00
bccb9562-fc11-4b75-a544-efd1298767d8	a203229e-5fe7-5b14-a2da-9200a6214e7d	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-30 14:28:22.777+00
436e3297-6fdd-4565-b86b-9992af484435	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT67M"}	2025-06-30 14:37:22.762+00
ce97c33f-2448-4a5c-80fb-febb43a02270	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-06-30 14:38:22.762+00
b6554286-3a58-41b1-a76c-9e84254d999b	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-06-30 14:39:22.762+00
017fbb68-5422-42b3-a40f-5ced196c0408	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT234M"}	2025-06-30 14:43:45.947+00
a9a4db6f-1562-4218-b675-7841554519a5	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24}}	2025-06-30 14:44:45.947+00
f612a1e4-84dc-45f5-98e7-974252445625	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-30 14:45:22.766+00
a795b474-bb62-45b5-b920-9bfb61996521	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-06-30 14:49:45.947+00
a94ce688-f948-4051-b7b7-1ee2d1ccdeba	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-06-30 14:50:22.766+00
c5583032-6610-4da9-a7d9-5d70f4f4ff46	a203229e-5fe7-5b14-a2da-9200a6214e7d	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT24M"}	2025-06-30 14:52:22.777+00
0d9f320f-9d50-4b63-a1b6-5d11930c6409	a203229e-5fe7-5b14-a2da-9200a6214e7d	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-06-30 14:53:22.777+00
dc35d26a-3fda-4f0d-998a-179a3a15116b	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-30 15:11:45.947+00
5cf8f11e-2349-47ff-931a-7c704e4fb29d	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-06-30 15:12:45.947+00
ec4902bb-3971-4dfa-ac76-285cf2093af0	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 4, "scaled": 0.04}}	2025-06-30 15:13:45.947+00
16438536-6522-4e47-8e1f-0013975f601c	a203229e-5fe7-5b14-a2da-9200a6214e7d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-11 19:19:22.777+00
28cc14da-d8d1-454d-a550-8161df115446	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-06-30 15:18:45.947+00
27b53184-220c-4804-8e03-fc377ab4d2a3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT50M"}	2025-06-30 15:40:22.766+00
4df85bda-222f-4a0c-b704-9d1a2185a1c7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 11, "scaled": 0.11}}	2025-06-30 15:41:22.766+00
bef1cc50-8232-49e3-ad69-9c80d49d2bd3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-01 10:04:22.766+00
fca06fc2-aa7b-4433-95f4-0a8498c7d4b3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-01 10:08:22.766+00
1e701bb0-ebf1-4a7e-a44d-cd271e25635a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT50M"}	2025-07-01 10:58:22.766+00
9a142f79-2ea3-46bf-9cfd-610b6b9d453d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-07-01 10:59:22.766+00
866e6ae7-8930-4fe6-93d7-08c86bc5238b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-01 11:00:22.766+00
008a8e21-fced-47cc-a4cf-da835a3805fb	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-01 11:56:40.37+00
8b680572-256c-4fe3-838a-c17e7359eb11	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-01 11:58:40.37+00
5e1b13f5-dc43-4cbb-9e73-ed5058361874	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.7439237622930357}}	2025-07-01 13:09:22.766+00
d4562c03-27af-4f0d-ad46-40dab78794db	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.7439237622930357}}	2025-07-01 13:10:22.766+00
73ccf24f-de82-4ee5-8a64-754f10d01d8a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 11, "scaled": 0.11}}	2025-07-01 13:11:22.766+00
74e1157a-5cec-4555-b6e5-0b7f2344d516	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT191M"}	2025-07-01 15:09:40.37+00
ca38be80-a999-4f61-920f-4e908c4281d8	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.86}}	2025-07-01 15:10:40.37+00
171ad877-2ec5-4e3d-8479-ed1a347992d1	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-01 15:17:40.37+00
678da5a6-aeb1-468a-9f76-75f4fc5cfdc5	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-01 15:38:22.78+00
00a4b5f8-bffe-49ef-823f-11a935b28410	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-01 17:00:22.762+00
b8f2983e-76b8-4bac-a0f7-eb393f13fe62	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-07-01 18:10:22.762+00
847e712c-9dd9-4e33-9ba2-43e9ca6cefec	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.77}}	2025-07-01 18:11:22.762+00
f69761f1-7fea-42f9-a143-1de4b82ba937	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT156M"}	2025-07-01 18:14:22.78+00
e222058e-4df4-4445-9749-ac1a729111a4	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.89}}	2025-07-01 18:15:22.78+00
ba81aa1d-dd78-4f21-b3d4-d25c6415cef0	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-01 18:19:22.777+00
7b67ca81-69a6-4658-abda-bd26306ac813	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-01 18:24:22.78+00
09929774-3994-49ae-bc15-9d74b038fe1b	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT37M"}	2025-07-01 18:56:22.777+00
2e0218d8-708d-4764-99fe-a87e47718647	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-07-01 18:57:22.777+00
7f6ea78f-e5f5-4f6d-bf1c-e7e81ed5b9ed	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-02 14:17:22.762+00
6d6487e0-f98c-463f-881c-97ae0e5b7675	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-02 14:20:22.762+00
d86a0797-07c9-4de5-a48b-992d2f239c08	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT84M"}	2025-07-02 15:44:22.762+00
84dc464f-9fd8-499b-9000-f6e7185ca3b1	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-07-02 15:45:22.762+00
3a511c47-99b9-49c9-b078-185a460ab828	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-02 15:48:22.762+00
e6612e65-7349-4453-bca9-5cf17a495a06	6001cdaa-df41-550b-adf6-6641e99307e2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-02 17:13:20.044+00
d02924bb-592c-4c8c-859f-b18a4f427351	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-02 17:17:20.044+00
bb94d170-4df2-4d93-9cc5-931bac750e09	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-02 17:51:22.777+00
380520bb-4e58-419f-9f74-6c94330276ea	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT68M"}	2025-07-02 18:59:22.777+00
f9752061-075e-48d6-8f1d-a11cebc3b99a	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.6}}	2025-07-02 19:00:22.777+00
e95173a1-567b-41c1-96ea-162daf7f21e2	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.8543533886484722}}	2025-07-02 19:15:22.762+00
40d90e96-4555-4e33-bdc4-394009ae4ac8	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.8543533886484722}}	2025-07-02 19:16:22.762+00
77e6878f-2c62-4fc3-a329-2de63b916b0f	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-07-02 19:17:22.762+00
8763bdc3-6016-4a3b-b13d-28ee5512684b	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-02 19:25:22.777+00
37c75e62-a93b-4acb-897e-47d5d3663520	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-02 19:26:22.777+00
a09b5da9-df6a-44e3-9296-e3f1fe6ca63d	a203229e-5fe7-5b14-a2da-9200a6214e7d	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.77}}	2025-07-02 19:27:22.777+00
c11451d2-0f77-4d11-9a84-aa550dfc45d4	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT164M"}	2025-07-02 20:01:20.044+00
4322aa97-319f-4bde-953a-ae12073a8500	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.2}}	2025-07-02 20:02:20.044+00
cb7ef331-a323-4948-bd94-4a045ea1bcbc	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-02 20:10:20.044+00
5d56e402-f101-422e-839e-c50b3432d90f	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT95M"}	2025-07-03 15:33:22.774+00
c422bb61-3210-4cc7-ba4c-375b2538672b	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 73, "scaled": 0.73}}	2025-07-03 15:34:22.774+00
dcfc9d4d-1349-4a44-8788-235bcaae5874	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-03 15:37:22.774+00
c02afcea-1e79-418a-8ce5-4c36385ead4e	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-03 16:19:22.777+00
536b5c6b-1870-44b3-81e7-cda89ec6422a	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-07-03 17:16:22.777+00
34b07e7b-0464-491a-b38b-21f437208217	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-07-03 17:17:22.777+00
c0f5740a-a4a5-4308-8855-c73869ef222a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-03 17:22:22.766+00
7fb4147d-c7d2-468d-9bab-7419797415f2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-03 17:24:22.766+00
9b06f31f-ef2a-4cf0-8b5b-d4f8018d4cd8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT59M"}	2025-07-03 18:23:22.766+00
3aa91a3c-a29f-4768-99ea-8e3cc55db2cb	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.74}}	2025-07-03 18:24:22.766+00
fa55629f-dc12-432b-9945-fe6a1e42284c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-03 18:26:22.766+00
efc8f16b-86b3-40d6-b30a-5e0fb4e91b06	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-03 18:27:49.201+00
20963264-fd64-4cbd-b334-801f34ddad86	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-03 18:31:49.201+00
c4f910f2-e0dc-4718-92b4-29be19627807	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT208M"}	2025-07-03 21:59:49.201+00
c9485797-8ad4-4cc9-b7ef-6694b18e9afb	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.87}}	2025-07-03 22:00:49.201+00
c3997c94-8c82-473a-b0db-0e1f3b14fcfc	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-03 22:05:49.201+00
d1778115-0010-4fd4-b86b-de7777cc580a	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-04 11:29:22.774+00
d214d0e9-fbf0-42d0-8465-95c0c2199a57	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT52M"}	2025-07-04 12:21:22.774+00
9419dca2-f7e5-4458-a06a-e93af93642a1	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-07-04 12:22:22.774+00
f79cc71c-6066-4cde-aab3-1f861766d358	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-04 13:25:22.777+00
1f291aad-5dbc-420c-979a-8825f7c5404f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-04 13:28:22.766+00
2620c854-b753-4453-af9c-df656fb7cc40	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-04 13:33:22.766+00
45fd2d18-1ab8-4c0e-aa30-0d7f8af717f7	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT63M"}	2025-07-04 14:28:22.777+00
ce24ec26-3c38-4905-9a2c-9f37dd8a4901	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.2}}	2025-07-04 14:29:22.777+00
f1b31060-c08b-491a-97ac-9434c1dd4c26	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-04 14:36:22.777+00
04a2a728-a0d4-47e5-8ec5-bddfd9a73c2a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-07-04 14:37:22.766+00
9747b349-4022-4219-bc95-caf22477b45b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.92}}	2025-07-04 14:38:22.766+00
248ab006-763e-4927-a8dc-8ee51fd717cc	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-04 16:40:22.78+00
190110e5-0f95-44b5-a810-4bd150dd7834	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-04 17:51:44.498+00
1571c94f-bdad-4e93-a110-920912f496ff	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT222M"}	2025-07-04 20:22:22.78+00
a0ccf262-0f85-4af6-b324-3bf756c60642	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-07-04 20:23:22.78+00
03b035f8-247b-4c5d-bf9b-0d504adfcc8d	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 16, "scaled": 0.1675688110922417}}	2025-07-04 20:39:22.78+00
e64948dd-2f57-4be1-a72f-7a04f6a08b59	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 16, "scaled": 0.1675688110922417}}	2025-07-04 20:40:22.78+00
887c25f1-b89f-4bac-9333-6c03ce349264	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.32}}	2025-07-04 20:41:22.78+00
1efab20c-263d-4d72-ad64-731ae2e151cc	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-05 10:40:44.523+00
9c179b84-5c65-46ea-9917-5313840392c5	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-05 10:43:44.523+00
98904a50-8d61-44c5-8825-1f7cc9481bec	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-05 13:20:22.762+00
db585825-26d6-4fb9-8599-69e85980c9eb	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT167M"}	2025-07-05 13:30:44.523+00
8f06dae5-f6bf-43b9-b4a2-1a4df2cbe9e3	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-07-05 13:31:44.523+00
54717f1e-6869-40c4-bb0e-a5a1006db409	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-05 13:33:44.523+00
0fdac5d6-3f31-4cc5-a33c-77b6bd5bb998	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-05 14:13:22.766+00
55e97d0b-290c-4baf-b6f8-a7077053b541	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-05 14:15:22.766+00
f90635ba-2c49-430d-8434-619e495d90f7	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-05 14:16:44.523+00
713bb924-b220-455f-99ea-403b65d40d16	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-05 14:17:44.523+00
9fb6051f-7cb4-4c87-8a99-7d8b671c3d54	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.29}}	2025-07-05 14:18:44.523+00
323bb6d5-898e-4a47-a2c9-fc53dfb0af17	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-05 14:24:44.523+00
f5a50ba2-2f5d-4344-b61a-47f7acae9d0d	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT97M"}	2025-07-05 14:57:22.762+00
a3104077-640c-4ab7-881a-06bbd1767951	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-22 17:43:22.777+00
e3e877a8-c33e-4c03-9edc-a04a2d066c8f	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-07-05 14:58:22.762+00
441c0aab-005d-4bfe-aae1-8cbc9545e461	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT58M"}	2025-07-05 15:13:22.766+00
79f92a2c-b6fd-4a18-9fe6-cf5b8cc62eb7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-05 15:14:22.766+00
8c577c02-5666-4a2e-a623-aa42c2c7d978	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-05 15:16:22.766+00
45053fe8-bbd8-4c9b-855b-3b2e26b97e91	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-05 15:55:22.78+00
ed5af2d4-1f71-443c-864b-837b985bf386	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-05 18:46:22.777+00
20eab1dc-6ea0-4db8-b3e9-4b9642f2b26f	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT41M"}	2025-07-05 19:27:22.777+00
04d30f2f-f98c-460c-b028-d30dcacac730	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-07-05 19:28:22.777+00
84e72d9f-0371-4094-9358-e6d6dd060cb4	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT226M"}	2025-07-05 19:41:22.78+00
e9e25fcd-64a6-4db4-86a4-30a8d2463612	834baf8e-d66f-5450-95e4-6b6ae7ea1cc7	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-07-05 19:42:22.78+00
b65856b8-89f1-444a-a4a8-d41e9cdef905	6001cdaa-df41-550b-adf6-6641e99307e2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-05 19:47:32.238+00
d64d6b76-aa1d-4a9b-b652-61c831e95dcf	6001cdaa-df41-550b-adf6-6641e99307e2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-05 19:50:32.238+00
17923519-8a42-4c2e-8a74-47f53e5d70d6	6001cdaa-df41-550b-adf6-6641e99307e2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT84M"}	2025-07-05 21:14:32.238+00
4d615f98-fda3-4c46-9c50-53fe3f840007	6001cdaa-df41-550b-adf6-6641e99307e2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-07-05 21:15:32.238+00
07a2d373-8594-4388-aa46-d369963dc5b1	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-06 11:25:22.766+00
eddcc03a-6488-480a-951b-6cc82eb78434	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-06 11:29:22.766+00
9e5070fe-23fe-4713-b33a-424f8efdc8d2	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-06 12:18:22.774+00
2e7471ab-dbac-44b8-a499-dcfff4d9f1c3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT59M"}	2025-07-06 12:28:22.766+00
5b2965c5-303f-48c1-98d8-8d918423938e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-06 12:29:22.766+00
eb654def-a4d5-4899-be58-8f2b125bbc0e	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT122M"}	2025-07-06 14:20:22.774+00
371d2bdd-a217-4b89-b9a6-b5542f36092c	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 70, "scaled": 0.7}}	2025-07-06 14:21:22.774+00
f1c15103-3abd-433e-ba9f-54c62b8424ee	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-06 14:39:14.455+00
f4357405-45dc-4c82-a470-528e290da5e3	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-06 14:43:14.455+00
08fd1979-90ca-4eef-9afa-8bcf01724ba7	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT292M"}	2025-07-06 19:35:14.455+00
1c7a65ec-adfe-4bb9-8256-4461f670a451	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.2}}	2025-07-06 19:36:14.455+00
62a4b665-9099-4242-84ff-9b079200d82a	5a3dfb6a-0bf1-5ba2-94a5-f4deed6b92ac	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-06 19:45:14.455+00
55b70163-946a-4e56-95cf-a1d2943afbe3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-07 11:04:22.766+00
2a0cf02c-2f6b-4531-bef7-78edcec5023a	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-07 11:07:22.762+00
73c73e76-d9b5-4907-abd6-8b97bc2f263a	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-07 11:11:22.774+00
aaad7a69-4a70-4ff1-b926-d70ad584666e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-07-07 12:01:22.766+00
55b4717a-d9ea-4847-ae56-6608b4cadd5e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-07 12:02:22.766+00
fae29694-944d-4be4-9ea4-f0e1c0498592	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT69M"}	2025-07-07 12:16:22.762+00
f498e66a-a21e-48b3-94b1-9a31d2a1b194	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 91, "scaled": 0.91}}	2025-07-07 12:17:22.762+00
2462a48d-8606-4894-933f-6621d5235b37	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT80M"}	2025-07-07 12:31:22.774+00
7d4e7f68-becb-4374-96c2-10d86163e333	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.65}}	2025-07-07 12:32:22.774+00
afed1505-4a20-41f4-acee-423557e88189	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5615547564673737}}	2025-07-07 13:44:22.766+00
a756a153-cfdc-4374-81b3-be418e5be522	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5615547564673737}}	2025-07-07 13:45:22.766+00
b0e39a8e-c5e4-4972-a81d-bb0fa0178abc	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.84}}	2025-07-07 13:46:22.766+00
57e0849b-e79f-419b-8251-426abb42fddd	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-07 15:39:22.777+00
36ab25f4-1fa8-4512-90a7-496564450717	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT37M"}	2025-07-07 16:16:22.777+00
d8c964b3-36c7-4b41-886c-bc03bba8a0fe	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-07-07 16:17:22.777+00
d1f937cd-fa1e-4047-af9c-45b82d7f052c	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-07 16:23:22.777+00
a343cbdc-6e4b-4d4b-8da6-cbc438a83299	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 91, "scaled": 0.9168496368447459}}	2025-07-07 16:33:22.777+00
5151df2d-8e78-47d8-a7ea-3d6c80bf7c86	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 91, "scaled": 0.9168496368447459}}	2025-07-07 16:34:22.777+00
ca16397e-c4a9-494a-8f6b-4adf81e9ce1a	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-07-07 16:35:22.777+00
4db901ef-3954-4409-8736-bd43f6f578ee	a203229e-5fe7-5b14-a2da-9200a6214e7d	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-07 16:43:22.777+00
6dc28732-5c98-47ed-b6d0-72dd270d06ed	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-07 18:58:01.431+00
f0bd751f-fb99-422e-b65f-622b97b4d730	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-07 19:01:01.431+00
6dcf8101-c27a-497c-8ae2-6cfdd208beef	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT466M"}	2025-07-08 02:47:01.431+00
66cd878a-b8c9-46b7-a845-ca635b1ae050	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 73, "scaled": 0.73}}	2025-07-08 02:48:01.431+00
374514fc-e3f3-4d27-bc24-bf0d522829e3	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-08 02:57:01.431+00
6b11f7da-7648-4dc3-be62-0e09d2c9fa1e	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-08 13:01:22.774+00
239cb1c0-b12f-4ee8-928a-1bb348bf425d	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT58M"}	2025-07-08 13:59:22.774+00
2684246d-edce-4048-81df-921848c5d835	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-07-08 14:00:22.774+00
5b1a35f5-bcd2-4aeb-a10f-3baa184253ff	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-08 14:07:22.774+00
05b1c4bb-d8f8-45fe-80d7-3b87481dbeea	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-08 19:42:22.777+00
7f48b312-f7a4-4dd0-b6ff-c6ed799e5040	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-09 12:21:22.774+00
70b7aecf-51d8-4b8c-9f8c-b575ef9ddf09	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-09 13:45:22.766+00
1ff91ed9-8d24-4db2-a878-34f4fdf16eb8	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-09 14:17:22.762+00
f7c2a8d5-eeeb-4a83-84c9-1ff66a84007d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT62M"}	2025-07-09 14:47:22.766+00
0e267e99-d1c3-403b-ac10-c0910d1403e1	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.77}}	2025-07-09 14:48:22.766+00
a01a7890-0014-479a-a24b-2f77e7eb2884	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-09 14:51:22.766+00
5f1ecdbd-563f-46eb-9f26-9bf0971250f3	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-07-09 15:27:22.762+00
3e8775a5-9d42-4392-8256-f830195ddec8	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-09 15:28:22.762+00
518c754f-38c7-42d5-9804-526994395fc7	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-09 15:30:22.762+00
550a4c1b-2d39-426f-aab8-d96c82c425da	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-09 16:41:22.777+00
ce07d9a7-e12c-4900-b20b-029a811d80ac	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT41M"}	2025-07-09 17:22:22.777+00
64424cb1-6dd1-428b-83ca-39b6bfc63381	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 6, "scaled": 0.06}}	2025-07-09 17:23:22.777+00
dec62dde-126d-47b1-a717-c192135dfa26	6001cdaa-df41-550b-adf6-6641e99307e2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-09 18:13:43.389+00
dd55010c-6f25-46ca-bc2c-49ab086ac3d6	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-10 10:17:22.766+00
5e30e733-c391-4c78-a821-59681b49398b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-10 10:21:22.766+00
987de4fc-0109-40d1-8e59-7e1c9b67ac9d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT59M"}	2025-07-10 11:20:22.766+00
4e750017-d81c-403e-9c23-19a981ccf688	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-07-10 11:21:22.766+00
6a7b0e97-bb1c-45ad-b886-c7d2c2da3747	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-10 17:58:22.777+00
d895a14e-291b-4cee-a761-c69e0ebe2641	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-10 18:35:40.798+00
78185ff4-4361-4225-b2c9-1a52e827c2de	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-10 18:37:40.798+00
2703f07e-1f47-4f03-af07-f589e528b387	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT44M"}	2025-07-10 18:42:22.777+00
6f1da864-cda6-4391-a3d6-bcc58af6317c	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-07-10 18:43:22.777+00
53881cfa-e336-44a5-bcb6-c25a3dd54bf8	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44578576511169776}}	2025-07-10 19:19:22.777+00
80fda9ff-76d2-4360-a195-5d367c066543	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44578576511169776}}	2025-07-10 19:20:22.777+00
4b3d8e34-5985-4a10-8c90-5c97db456da3	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41}}	2025-07-10 19:21:22.777+00
bba76e8d-a5ee-44d8-94f5-1435cc1026a9	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-07-10 19:25:22.777+00
bc49668a-d59d-4868-a57b-4eb30108fbf3	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT447M"}	2025-07-11 02:04:40.798+00
179a4231-ec90-4f3c-b4c6-85d3797e3b52	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-07-11 02:05:40.798+00
5f228b3c-a7e4-4239-be90-dbb21522fce8	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-11 02:13:40.798+00
8b11586b-2bf2-4f86-a271-6b242554b914	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-11 11:12:22.774+00
a62cee00-410d-45ac-af4d-9889b0562972	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT129M"}	2025-07-11 13:21:22.774+00
72bfdf29-20aa-4cf2-9664-85364ffb350a	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-07-11 13:22:22.774+00
98329a47-1244-44c9-8850-f73851037a1b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-11 16:57:22.766+00
a82962b9-c96f-407b-8fba-53c67fa7b463	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT61M"}	2025-07-11 17:58:22.766+00
c463d6f3-1022-4bb7-a479-f3aacebd5a3d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.75}}	2025-07-11 17:59:22.766+00
908d4008-6976-49ce-b2e7-bc3df5d74f2c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-07-11 18:01:22.766+00
a5c2b457-1c9d-4406-95d0-cc372671aec3	a203229e-5fe7-5b14-a2da-9200a6214e7d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT28M"}	2025-07-11 19:47:22.777+00
bbfcd7b1-5fab-45d4-a6f6-6fc6a6fff72f	a203229e-5fe7-5b14-a2da-9200a6214e7d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-07-11 19:48:22.777+00
598dc34c-de7c-44a8-a56f-92af2eb41976	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-12 10:38:22.766+00
64fbb1fc-1710-4d10-baaf-f086198ab4bd	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-12 10:42:22.766+00
bb05d925-1c6c-4c23-a8a8-6bc12ff1d924	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT54M"}	2025-07-12 11:36:22.766+00
450c1f92-aecf-4274-8750-06c5aca5c8e5	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 95, "scaled": 0.95}}	2025-07-12 11:37:22.766+00
349a58a9-c835-4a03-b775-88bcd7ac3a08	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-12 13:31:22.777+00
b42eb5ec-458c-466d-8d8e-465f98f8d1ec	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-07-12 14:28:22.777+00
32f83406-b786-4b0a-a892-f7b2f24d8c4c	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.57}}	2025-07-12 14:29:22.777+00
64827e41-173d-4bfc-8f51-2ddb5e48049b	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-12 14:38:22.777+00
3feeda82-f2e7-4980-bb5f-3dfa01112281	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-12 14:56:32.673+00
bf3fa643-6be3-4b92-8246-9014f978168e	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-12 15:00:32.673+00
26eb1016-b917-4ee4-a7b7-046219f58521	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-12 17:06:22.762+00
8f272ed9-5582-4b37-9584-1422ed6d455e	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-12 17:09:22.762+00
5f701c13-c51e-4909-8841-28c61f8eda4b	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT67M"}	2025-07-12 18:16:22.762+00
e7704b83-77d2-4999-b798-4c41a30eda09	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-12 18:17:22.762+00
84f92ac0-6056-4f12-af19-dee5bdbc615b	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT241M"}	2025-07-12 19:01:32.673+00
c7304518-50ab-4084-9977-b496f5cff654	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.99}}	2025-07-12 19:02:32.673+00
76a209bf-257b-4399-896d-53e00f38aaae	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-12 19:09:32.673+00
a89ba61d-e9da-430a-87ab-4a72bda9ae3e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-13 10:37:22.766+00
53b75960-c26c-4b4b-8e60-d86ac6ba0823	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-13 10:42:22.766+00
46239b1f-8096-4e30-a9b6-4f32776777e6	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-07-13 11:29:22.766+00
ffa5aa8a-03e6-4707-9376-f9630a7f6090	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-13 11:30:22.766+00
46a0f717-1dbc-4480-bc0b-fc088cc52c3a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5065606905297771}}	2025-07-13 13:49:22.766+00
ee24a57b-5346-4146-9313-fded2b4f3ab7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5065606905297771}}	2025-07-13 13:50:22.766+00
28c44493-3514-4d75-bc82-93312c12653f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-13 13:51:22.766+00
77e961f6-ea04-484c-8de5-052fb3a7ab30	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-13 14:01:22.774+00
43e8af6c-756a-41e3-8597-363cb091d646	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-13 16:37:22.777+00
7c922c14-9306-45d9-a480-52fb69dbefb3	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT40M"}	2025-07-13 17:17:22.777+00
7303d885-d4a2-497f-a414-8044db7861c3	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 26, "scaled": 0.26}}	2025-07-13 17:18:22.777+00
8dfb50eb-5bfd-4832-8ec6-a9e7574335c7	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-13 17:27:22.777+00
1d0bdb76-2747-4676-8a02-2507746ce1bf	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34793355643379736}}	2025-07-13 17:57:22.777+00
8bf1e104-2862-4266-8457-3b5af1d00008	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34793355643379736}}	2025-07-13 17:58:22.777+00
f737a49d-00d8-4959-ada2-ab8cbcdc8d24	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 6, "scaled": 0.06}}	2025-07-13 17:59:22.777+00
9631b14a-ee23-4829-b0d7-bed7ea46a148	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-14 11:00:22.774+00
e38afa2b-ac20-45c2-a927-6ed15344f01a	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT88M"}	2025-07-14 12:28:22.774+00
d04ef0c4-844e-4cc3-a791-b21cbab06aac	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.51}}	2025-07-14 12:29:22.774+00
44ca7a04-495a-4795-aa4f-fa23a5396bd1	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-07-14 12:38:22.774+00
72643a1c-804b-47ac-8caa-46257ac0949c	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-14 12:43:22.774+00
72510536-a591-437c-8fcc-763550309678	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-14 13:52:22.787+00
f5e64387-0cd3-46ea-a4f2-195f984b4f0f	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-07-14 14:02:22.787+00
22c26afe-c151-42a5-9a86-7ca1bbf2544c	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-14 14:11:22.787+00
436ab80f-803c-4cb9-9286-bb710695a945	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT81M"}	2025-07-14 15:13:22.787+00
a8909b06-78ca-4b45-a970-fbf13b2f2634	0eb7d400-30ef-5ea7-a5de-f3a196fa569d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-07-14 15:14:22.787+00
937e4174-e4df-4c75-b9ce-ad596d63d767	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-14 16:12:16.034+00
8ee45f1d-4693-4b25-998a-63eff7dff31d	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-14 16:16:16.034+00
963fba53-82e7-4ebf-8f76-b34133e4c98c	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT212M"}	2025-07-14 19:48:16.034+00
e7a02da2-7211-48c4-927e-bc8916997af6	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-27 14:35:22.766+00
e553339a-2d0a-4148-b998-9faf9ad40ee3	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 93, "scaled": 0.93}}	2025-07-14 19:49:16.034+00
7e870305-71ba-42c2-a47c-2710ad29aaa7	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-14 19:55:16.034+00
8e09ecaf-d436-44ec-9529-f4ae4a7735eb	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-14 20:00:22.777+00
d194d461-5ec1-4c6b-a78a-3dc09bfeafd6	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT32M"}	2025-07-14 20:32:22.777+00
a7360db5-ae4c-4d49-951d-b75894142ce7	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-07-14 20:33:22.777+00
8361b8aa-394a-4c1e-8d0b-90fca0d6914f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-15 09:06:22.766+00
3ea44858-1e5f-475f-ad1b-86c525037e33	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT52M"}	2025-07-15 09:58:22.766+00
0b04df0f-ed67-4ae2-a59a-d4d3448f4bdb	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-07-15 09:59:22.766+00
1e1c45dd-61e1-4521-a87a-6b6db7ffb56c	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-15 11:06:22.762+00
298686f9-bc76-4d07-bb59-2d9e6ffc787c	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT95M"}	2025-07-15 12:41:22.762+00
7993b76b-7a19-4e88-ad3c-a35d2e923bd7	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-15 12:42:22.762+00
e463d6b1-5b58-4b59-8a85-eadfb3d422f1	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-15 12:46:22.762+00
c9aa6926-7a68-4f11-92f8-f8427d974e66	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-15 17:23:22.777+00
669eeacb-00d5-4178-a8c7-ad4cfc1e86a3	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT26M"}	2025-07-15 17:49:22.777+00
1a8b462c-060c-47e7-9023-a392f524f454	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 48, "scaled": 0.48}}	2025-07-15 17:50:22.777+00
4a09b223-79b8-4141-b3aa-d66f2942b7f1	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-16 11:17:22.774+00
45836891-e98c-4cc7-959e-a0b8cf6fd59e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-16 13:10:22.766+00
b4fef593-32c9-4d86-99c7-e07db4673748	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-16 13:15:22.766+00
f281541e-ab6f-4dd2-b20e-1ac819724546	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT62M"}	2025-07-16 14:17:22.766+00
8c3ccaac-e9a9-493a-b553-aaa6a4749a2d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-07-16 14:18:22.766+00
72c791c0-78e9-45c3-9dac-156be600ff10	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-16 14:51:08.246+00
768969ed-302f-4a2c-9bf5-37105ba84811	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-16 14:55:08.246+00
19c26124-1bb5-4407-8b39-5ea59562e8b0	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-16 19:13:22.777+00
cff77468-7d3b-441f-8647-25ad2a2dc680	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT55M"}	2025-07-16 20:08:22.777+00
922fdd13-3498-4aaa-9686-fd1c35091a22	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72}}	2025-07-16 20:09:22.777+00
dab73c7f-30b3-4baf-918c-8fc664e6cf3e	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4040290837766999}}	2025-07-16 20:52:22.777+00
158abf9c-d034-40f8-815a-889129ba398e	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4040290837766999}}	2025-07-16 20:53:22.777+00
508012f4-c11f-441b-9741-143a681b9a6f	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-07-16 20:54:22.777+00
63babddb-59e1-40c6-8c68-f8ec78422e5a	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT362M"}	2025-07-16 20:57:08.246+00
ee6c73b9-d17c-4c84-8eb6-ce02e9a35f4b	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-07-16 20:58:08.246+00
817c38ea-2503-48af-8708-cdabf2b42d48	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-16 21:02:08.246+00
158a198e-8563-4890-9b9b-d5b4351ea183	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-17 09:23:22.766+00
0c3d869b-5c73-4e25-9be8-e258deda9df4	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-17 09:26:22.766+00
8ba3dcd0-93f2-4fd1-8036-e24bb891f656	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT57M"}	2025-07-17 10:23:22.766+00
ba38fd9b-4f86-4a8c-ac3b-255c2e1d6b3c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-07-17 10:24:22.766+00
7752bc41-3585-4c57-bd3e-022fa0109a39	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-17 14:54:22.777+00
eb237b9d-0144-4022-a627-834854ac136c	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-17 15:07:22.774+00
d141617a-eadc-4e92-b4bc-6b6bc694b2a3	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT54M"}	2025-07-17 15:48:22.777+00
6f4e5371-2274-4045-808b-36cf8aa9dd02	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-07-17 15:49:22.777+00
66845a7d-d317-444b-bee4-b6e62633c281	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-17 15:57:22.777+00
45d0cd37-88c0-4c1f-a8bc-da37596817e0	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 95, "scaled": 0.958265059264148}}	2025-07-17 16:17:22.777+00
862140ce-da94-43ca-a9f3-54060e113901	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 95, "scaled": 0.958265059264148}}	2025-07-17 16:18:22.777+00
cb6895b1-5e97-466d-9be3-4a282d8b8f1e	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41}}	2025-07-17 16:19:22.777+00
ac10345c-1da1-49c1-a862-a7fdd2cd2e40	a203229e-5fe7-5b14-a2da-9200a6214e7d	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-17 16:22:22.777+00
cf4cfbeb-ac71-402f-9459-d75d53e99c31	6001cdaa-df41-550b-adf6-6641e99307e2	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-17 17:04:40.976+00
c013f431-2440-49a2-af44-16d52bd9d201	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-17 17:11:22.762+00
4d4a020a-0ace-463a-ac82-7bd61d812904	6001cdaa-df41-550b-adf6-6641e99307e2	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT68M"}	2025-07-17 18:12:40.976+00
b7632555-62f7-42ac-9f38-ebe4e8512be5	6001cdaa-df41-550b-adf6-6641e99307e2	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-07-17 18:13:40.976+00
f646b6e5-bd8f-4b64-854f-cb93aa461641	6001cdaa-df41-550b-adf6-6641e99307e2	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-17 18:20:40.976+00
585757b9-8774-4f53-a8b7-fd63bd74d889	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT82M"}	2025-07-17 18:33:22.762+00
fa9c0e3b-6a15-4333-a215-e11911766d31	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.87}}	2025-07-17 18:34:22.762+00
455d8e2d-27bb-4f7c-8071-9498616ed182	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-17 18:35:22.762+00
81f3f567-8583-47ee-af63-652ca74cffec	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-17 21:21:22.762+00
8dad1563-b6b7-4daf-9ef4-efe6d56963d0	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-17 21:22:22.762+00
019c5852-0d39-4d94-9902-5a71b0394f00	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-17 21:23:22.762+00
cc13531e-172d-42d7-a61c-47f12edb94d3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-18 08:24:22.766+00
492f4efc-1fa3-4f6e-9331-872096f254f5	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT58M"}	2025-07-18 09:22:22.766+00
a6905f01-9e47-482c-9b8e-d9005fa224ba	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-07-18 09:23:22.766+00
63a7362e-dad3-4953-a4b5-77a2e5c0407b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.3707983198649843}}	2025-07-18 11:10:22.766+00
5c01c8f1-ad4f-4b09-85c5-06b2eb96f57d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.3707983198649843}}	2025-07-18 11:11:22.766+00
9e5384b2-192e-4172-a7c3-21b78856d155	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.53}}	2025-07-18 11:12:22.766+00
98c8b78b-4ba1-439c-9850-2c45eeaee840	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-18 14:02:22.774+00
0bdf79f8-5c46-481a-b365-e37eb0700194	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-18 14:07:42.762+00
469e8b3f-c3cf-49cc-b062-f2e2a91104e6	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-18 14:09:42.762+00
67b7f33e-ae5e-4022-8037-e247a4a01f97	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT428M"}	2025-07-18 21:17:42.762+00
e2df1df8-9d4e-4e52-85a0-5d3823aa8e95	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.88}}	2025-07-18 21:18:42.762+00
2a21b7f7-378e-4284-9838-a2100b818fbf	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-18 21:22:42.762+00
3aa13912-4210-4561-a0de-a76dd37ce813	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-19 10:43:22.766+00
67b4080c-ea7d-4468-9616-993f637cd141	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT58M"}	2025-07-19 11:41:22.766+00
e1cd6cb8-047b-430d-b33f-389860c6d240	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-07-19 11:42:22.766+00
abeeeedf-7cc7-49fd-b18b-26e828177f57	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-19 11:44:22.766+00
3d70c0bc-e201-4962-b1b1-d038f18e88d8	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-19 15:22:22.774+00
e37d7159-1f4b-4f6b-a853-cd86c926961d	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-19 15:35:22.777+00
de53395d-3f2d-4bb5-b5ba-0077fc2d0676	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31678602274426326}}	2025-07-19 16:17:22.777+00
89c48f66-d7e4-4fe5-8409-14c34a6b861e	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31678602274426326}}	2025-07-19 16:18:22.777+00
3d2aa2e3-8df3-4547-b619-bf7cf04ca933	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 70, "scaled": 0.7}}	2025-07-19 16:19:22.777+00
df70cf62-204c-469d-a968-1a35720e5ccd	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT67M"}	2025-07-19 16:29:22.774+00
04dd22a4-0868-41de-9bb2-f8908fcb53dd	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-07-19 16:30:22.774+00
27d2023f-a7cf-40e4-a14b-0fabd15e67ce	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-20 09:27:22.766+00
11bc4058-a7c1-45d2-98b2-7611327d5214	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT46M"}	2025-07-20 10:13:22.766+00
9a664ede-cbda-4b61-b36b-8e53472459ee	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-07-20 10:14:22.766+00
87be99eb-c418-4fb5-bf57-271816285d3c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-20 10:18:22.766+00
0e0016b0-6b46-4020-b48a-f5f4c763b989	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-20 11:31:22.774+00
05f17042-ebc5-4288-ab37-1f02c07592a2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.4144508138909572}}	2025-07-20 11:38:22.766+00
72e23c96-5ee4-472e-b299-84b99b2c2bcc	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.4144508138909572}}	2025-07-20 11:39:22.766+00
5d73e4f4-bd3a-4e61-b350-9f9882e742b2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.6}}	2025-07-20 11:40:22.766+00
a7283301-af5e-49dc-8b89-b8402126a455	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT54M"}	2025-07-20 12:25:22.774+00
e42c0bd1-06a0-47f6-af43-6a3963324da5	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-07-20 12:26:22.774+00
81a14ecb-6c45-4644-9042-a31b0d218433	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-20 15:24:22.762+00
ebdc10d6-67d2-4879-86ee-481e65cf694d	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT75M"}	2025-07-20 16:39:22.762+00
225711d6-3958-4bb5-aea6-aefa54715186	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-07-20 16:40:22.762+00
9003e115-e268-43fa-8889-3d26413663f2	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-20 16:43:22.762+00
de412d82-70ae-4907-aba6-0e5104e234de	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-21 09:43:22.766+00
f772bc98-58b5-41d3-bb64-a35d21151b16	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT58M"}	2025-07-21 10:41:22.766+00
57948157-3dbf-4475-9d94-46553bade2ec	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-07-21 10:42:22.766+00
a2918699-4440-42f9-a2f6-2cb78d675ca6	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-07-21 10:44:22.766+00
8b8c77fa-c985-48bf-8928-42b820e9f262	f8478e87-8fee-5ef3-95b1-41c971c4abab	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-21 10:56:22.774+00
ea3c41e3-d01f-48ca-b2f9-d165d1d8ef10	f8478e87-8fee-5ef3-95b1-41c971c4abab	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT125M"}	2025-07-21 13:01:22.774+00
6a1a88c0-14d8-4ef7-973f-2ae69a4cfecf	f8478e87-8fee-5ef3-95b1-41c971c4abab	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.81}}	2025-07-21 13:02:22.774+00
ebbc94e6-2c81-411e-addf-09bad39a5ad2	f8478e87-8fee-5ef3-95b1-41c971c4abab	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-21 13:07:22.774+00
4098a0a5-b57f-406c-9f8c-a2b386fa0990	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.4115566640374237}}	2025-07-21 14:26:22.766+00
f9f66791-f5df-440f-bf39-481d6cd77bee	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.4115566640374237}}	2025-07-21 14:27:22.766+00
cf4ede74-3e60-43b5-9029-38ec111c93b4	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.6}}	2025-07-21 14:28:22.766+00
6f80e6f5-8ffd-46c1-978f-987de8bca659	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-21 14:47:22.777+00
dfe4c3c4-7577-445d-bce5-49c2f29e5a5b	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-21 15:38:42.487+00
015f6a78-29b4-4050-9b5a-9ef37e6c0a73	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-21 15:41:42.487+00
8489b61a-d7d4-4928-ac35-90e8845daf6b	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT66M"}	2025-07-21 15:53:22.777+00
bc8149dc-aa09-4eaf-9b4b-19e746190282	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 84, "scaled": 0.84}}	2025-07-21 15:54:22.777+00
4a2c856e-53f9-42eb-b7ad-94a798849d34	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.6614770354286663}}	2025-07-21 16:37:22.777+00
4d519e4f-86ff-4f4d-b077-7b834c2f2d8c	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.6614770354286663}}	2025-07-21 16:38:22.777+00
9184a345-146f-49e5-af41-d76ee808f034	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-21 16:39:22.777+00
7f2f7680-2b15-4a32-9328-00a04fc13940	a203229e-5fe7-5b14-a2da-9200a6214e7d	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-21 16:44:22.777+00
658c939a-9a9c-4faa-8f3b-25025c72d255	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-21 18:26:34.915+00
9157fb39-67c6-48e8-82bb-0db4f230b699	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT135M"}	2025-07-21 20:41:34.915+00
5e2eeddf-ca52-43ae-a6cf-6b6d2e9a3add	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-07-21 20:42:34.915+00
22b63d83-51f7-496e-a36d-f7d6b2b5154a	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT394M"}	2025-07-21 22:15:42.487+00
5aaee88e-e349-4930-b6fc-cf7720059373	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.69}}	2025-07-21 22:16:42.487+00
9450cfb9-3732-44dc-ba7a-1afd376fb3c4	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-21 22:25:42.487+00
cf0fd1b2-10fa-461d-8ca3-00a81e5d9c31	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-22 10:48:22.766+00
6a9775d3-e40a-44ac-a263-1f783acabf63	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-22 10:50:22.766+00
7d07117a-f0f6-4d97-8ce4-a4e187c6ef59	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-07-22 11:54:22.766+00
ac6f43dc-a077-4bbf-9b64-cb50f681e3f5	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-07-22 11:55:22.766+00
a0add738-8b53-4499-b767-cb82d7d0c273	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3036261000530041}}	2025-07-22 13:30:22.766+00
3e6e1727-083d-4ff1-a2df-861ea898e28c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3036261000530041}}	2025-07-22 13:31:22.766+00
8cc8ffc2-42ce-4ee5-924e-f6c1512eb49e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.69}}	2025-07-22 13:32:22.766+00
060a9d9d-00fb-41f9-946d-2fedae943e34	f8478e87-8fee-5ef3-95b1-41c971c4abab	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-22 14:43:22.774+00
e7080342-811b-47bf-9d44-ca2edaf55e5a	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-22 15:47:22.762+00
5cfefedc-7441-485c-a97f-fc1e6e3e6378	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-22 15:49:22.762+00
ef26389e-75cb-476c-b165-16e2a83dee16	f8478e87-8fee-5ef3-95b1-41c971c4abab	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT118M"}	2025-07-22 16:41:22.774+00
511be723-9a57-4a18-96e1-7d53143ffb43	f8478e87-8fee-5ef3-95b1-41c971c4abab	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-07-22 16:42:22.774+00
497a185e-0f1d-4a94-9ae4-62a7c6f8696e	f8478e87-8fee-5ef3-95b1-41c971c4abab	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-22 16:45:22.774+00
5e1d06f5-2eb3-4688-9b84-9b00f83ca289	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT94M"}	2025-07-22 17:23:22.762+00
37df5722-3614-4e05-a1c2-d7da0c84adca	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-07-22 17:24:22.762+00
bb6e8169-c785-4dc7-82f2-07e175e8d273	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-22 17:25:22.762+00
1d95440f-5e9e-4020-93c6-a104ef682277	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT34M"}	2025-07-22 18:17:22.777+00
7d8ecd00-ba47-48c1-9147-6d49fa2316d8	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-07-22 18:18:22.777+00
1376ae13-0ad0-4775-8e14-3a929efb9523	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-22 18:20:22.777+00
5562b755-cb88-4521-9fb1-243ad931a115	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-23 12:01:22.774+00
793cff81-a02e-431a-978a-f83bff240060	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT95M"}	2025-07-23 13:36:22.774+00
d71ee6aa-5fcc-4fb0-bdc1-88cd9f3adfae	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-07-23 13:37:22.774+00
6dcf5617-65d4-4345-9be0-6d72093a71b4	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-23 14:13:45.625+00
39d8eb41-f8f0-442d-ba00-2db641e313fa	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-23 14:16:45.625+00
ed4a1bdd-7adb-444b-9128-235f8cf081b3	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.7956289070198239}}	2025-07-23 14:28:22.774+00
8766d6e7-fa23-4360-87f4-71ab2c0a9540	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.7956289070198239}}	2025-07-23 14:29:22.774+00
b876497b-6050-4a01-9c10-9db669ec1af8	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-07-23 14:30:22.774+00
6f4fad89-6808-451d-bd67-9466daac8c81	f8478e87-8fee-5ef3-95b1-41c971c4abab	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-23 14:34:22.774+00
c4d5629b-3bc4-4b3f-9ff6-9c108f1a9195	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-23 15:10:22.766+00
ad6a9e91-dc10-4b29-8a91-e333bf7b2121	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT60M"}	2025-07-23 16:10:22.766+00
47c14745-d236-4205-9a3d-36bbd4b239fd	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.85}}	2025-07-23 16:11:22.766+00
805bf20e-3808-4336-b842-353d1576dc40	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-23 16:55:22.777+00
a9616135-ab44-4a3e-85d5-7848739de2a2	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-07-23 17:59:22.777+00
a0180007-3420-4741-867f-166f570fae3d	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-07-23 18:00:22.777+00
e5675e8d-d71f-40f0-878a-72d88b797f45	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44696253574493505}}	2025-07-23 18:16:22.777+00
307016c0-3d0f-4e9d-b2db-78e1fd7a2d59	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44696253574493505}}	2025-07-23 18:17:22.777+00
43d9a10a-4e13-4345-99d5-c9cba13d8453	a203229e-5fe7-5b14-a2da-9200a6214e7d	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9}}	2025-07-23 18:18:22.777+00
eff4f09e-e937-4764-b67f-6c15d47bba1e	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT344M"}	2025-07-23 20:00:45.625+00
a7fe96d7-2384-4d8e-9430-301447d613ed	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.4213189813875495}}	2025-07-23 20:01:22.766+00
ae808f8b-7f0d-4711-aea1-3bca5e85eb67	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.89}}	2025-07-23 20:01:45.625+00
21a4af90-8afe-47c9-8efa-e3d136ab58f9	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.4213189813875495}}	2025-07-23 20:02:22.766+00
cabfe327-1b16-43e1-9ef9-7c6eed15823b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-23 20:03:22.766+00
e6f88c29-4e69-4bb1-a040-b232183fe325	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-23 20:04:45.625+00
a7a4f6f2-50c4-4a9b-b790-a8f7d4b76894	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-24 13:25:22.777+00
89276677-9c7f-44ad-991d-43b0da662308	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT27M"}	2025-07-24 13:52:22.777+00
4d5a9e93-8634-4d3f-a71b-2b2d6de03b8e	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-07-24 13:53:22.777+00
37647aef-0f80-45ed-9779-eeb7f83c1de6	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-24 14:07:22.774+00
6238fa74-9e0a-4a38-9adc-ce1074976b1c	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.3246510744850502}}	2025-07-24 14:40:22.777+00
0ed1c914-4b6b-42c8-bce7-371257931e6c	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.3246510744850502}}	2025-07-24 14:41:22.777+00
06120beb-60e9-4a12-b33e-9624fb65c86f	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-07-24 14:42:22.777+00
5e5a7c41-d6ce-49e6-b70a-3bf358f6f117	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-24 15:00:22.766+00
c08dc268-b1ec-40d5-8e02-89a777845c74	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT60M"}	2025-07-24 16:00:22.766+00
05e16d8d-c47f-49ad-ae90-a4671b580392	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-07-24 16:01:22.766+00
c1d33a46-8012-492d-b10b-6a5ecd111885	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-24 16:06:22.766+00
ce275291-77d7-4910-b7c5-41eb8e98f951	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-24 16:42:22.762+00
cceea46e-4e6f-412c-90c7-486bc3dcbb6b	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT77M"}	2025-07-24 17:59:22.762+00
860cd50f-08c8-4349-b22e-3dc6c667e246	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-07-24 18:00:22.762+00
1d00de0d-e365-45a2-80af-eb890f371d51	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-24 18:01:22.762+00
9ee5ce91-a967-4627-9660-af722cf4bc54	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-07-27 15:22:22.766+00
edfd9af7-4208-452d-bf26-e22340a8fb00	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.4604235570612312}}	2025-07-24 20:06:22.766+00
1c35184c-f99a-4176-aca3-c42341b8d6fa	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.4604235570612312}}	2025-07-24 20:07:22.766+00
373f1843-0765-4a66-92ce-6c6f43e30d65	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-24 20:08:22.766+00
b482a4d0-1350-4220-a5df-c9ad1205d48f	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-25 12:28:22.774+00
fd018c1b-7031-493f-a412-375dfa0cdd0c	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT96M"}	2025-07-25 14:04:22.774+00
8b483f34-eb12-4c7e-98aa-f25d194255d1	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-07-25 14:05:22.774+00
cb857cfb-5491-41c5-a57b-be468f8faa91	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-25 14:11:03.886+00
14628321-d52a-42db-8f98-57b9fb9a9904	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-25 14:13:22.774+00
d6efedd1-6a65-423e-b078-818e4509dc3b	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-25 14:14:03.886+00
1b7fa8c2-b69f-45f1-98ae-a9c90cd6aed7	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-25 17:10:22.777+00
b07cfccc-c4ce-4ca8-9f2a-5acc829ea075	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT61M"}	2025-07-25 18:11:22.777+00
f93f98f2-8a10-4436-be70-84a424d7a9a0	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9}}	2025-07-25 18:12:22.777+00
1f5376c0-ccf9-48bc-8a44-9dbbaa9028f9	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-07-25 19:41:22.766+00
6c697825-8faf-4210-8cd7-5cc4b4d1f535	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-07-25 19:42:22.766+00
81c6c387-c19c-4381-af24-3d8874bfe929	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 83, "scaled": 0.83}}	2025-07-25 19:43:22.766+00
7c4514c8-8ef6-4bc2-9b81-e1a998997cba	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT409M"}	2025-07-25 21:03:03.886+00
3b2c5d8c-91eb-4e3b-934d-1334e75651fe	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-07-25 21:04:03.886+00
c79d56e3-6304-43ae-8924-105476b1efa0	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-25 21:07:03.886+00
84e2abe6-8f2b-4c50-8c7c-40aa13a1029b	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-26 14:37:22.774+00
9b87c574-c46f-4535-9081-55d3876f3877	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-26 15:03:22.777+00
f24d0175-0d11-446a-b376-86d5495b3ac6	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-26 16:08:22.762+00
981f2b3e-9e44-4037-be23-4a20be3860b2	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-26 16:13:22.762+00
17452ba5-61c8-4048-93bf-5488b469b265	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT72M"}	2025-07-26 16:15:22.777+00
30cd602f-f59b-41cb-8426-43ec58b10eef	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 15, "scaled": 0.15}}	2025-07-26 16:16:22.777+00
75914468-8eaf-4e7a-bb35-cc19730157b8	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-26 16:24:22.777+00
77723f01-b42f-4571-bbb8-40df92d0c84b	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT116M"}	2025-07-26 16:33:22.774+00
a7ac4932-62bc-4b76-8516-9a1f3c46a147	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-07-26 16:34:22.774+00
32a0bdf5-5a49-46fc-934c-de04e779a30e	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.6887972083579121}}	2025-07-26 16:34:22.777+00
6799bf4d-0f96-47fb-b4b5-53d329c3e12e	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.6887972083579121}}	2025-07-26 16:35:22.777+00
438092d5-bd63-451d-9846-8cc67ddd3a6d	a203229e-5fe7-5b14-a2da-9200a6214e7d	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-07-26 16:36:22.777+00
415f376b-0dc3-4b67-9375-5a48b35eb2e4	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-07-26 17:23:22.762+00
3d68a653-69fd-431f-ab0a-abc408da4d64	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.57}}	2025-07-26 17:24:22.762+00
f80d1466-79e8-459b-99ae-23a00edc1850	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-26 18:50:22.766+00
f741094b-1891-4b6e-af94-c90ccd00a0fa	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT53M"}	2025-07-26 19:43:22.766+00
6713cbdb-7ce3-4b6b-afdb-2167db1eec58	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 75, "scaled": 0.75}}	2025-07-26 19:44:22.766+00
24e3bcb7-b2f1-4232-bced-bfbd8d806df8	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.6182090922457788}}	2025-07-26 20:14:22.762+00
fb14ec1d-156c-41a9-b24e-7246331982b3	6001cdaa-df41-550b-adf6-6641e99307e2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-26 20:14:35.44+00
afe400ce-a77f-40b2-b906-b4cc86c5f3c8	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.6182090922457788}}	2025-07-26 20:15:22.762+00
5cc4695e-4d01-48f5-91bd-b3c6149d25b1	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39}}	2025-07-26 20:16:22.762+00
7cd6ba0f-dcd8-405d-b7db-2db8274f55a3	6001cdaa-df41-550b-adf6-6641e99307e2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT78M"}	2025-07-26 21:32:35.44+00
e3aa26dd-ccad-405d-8292-e00b09c1cdc2	6001cdaa-df41-550b-adf6-6641e99307e2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-07-26 21:33:35.44+00
62647648-c675-4c9b-9003-96d2a5845c96	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-27 11:20:22.774+00
02e861b5-8138-4af1-8381-1b3ecf4fbe61	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT62M"}	2025-07-27 12:22:22.774+00
6df8f071-1c34-497a-962d-15dee895f903	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-07-27 12:23:22.774+00
848831eb-25ec-4fdf-abb6-13e576b7a3a1	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-07-27 15:23:22.766+00
56fa623b-5272-4ad1-b0f6-9e27f6481a9e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-27 15:26:22.766+00
ee313cb7-4775-44ae-875c-ccea83addfe5	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-27 18:37:22.777+00
8fb450b7-77b4-49e2-9658-9d1db38234dc	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT53M"}	2025-07-27 19:30:22.777+00
4c650696-e49b-4d81-8107-30444d4e6333	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-27 19:31:22.777+00
b0929f3c-9e8a-4b3d-95ff-afbfe20abace	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.3843277484365125}}	2025-07-27 20:11:22.777+00
93c5179f-ebef-4a6a-a406-fb901eebe452	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.3843277484365125}}	2025-07-27 20:12:22.777+00
c846342d-6c13-4d4b-9b27-49f13ec5c60d	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-07-27 20:13:22.777+00
d5362f4e-fbbc-4846-ad50-13f2d6cab9ec	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-07-27 20:20:22.777+00
731b6780-d711-4a52-ae69-fd2295b824ec	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-28 15:10:22.313+00
e67b6d6d-259e-40ca-98d5-9c47b518fc3e	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-28 15:15:22.313+00
57c27015-6704-47f7-a3bb-7adbb68b5901	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-28 15:20:22.774+00
6d088392-97bf-4b5d-8e93-8a157a89eb9d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-28 15:40:22.766+00
f598204c-7716-4dcf-996e-e18236de3ddb	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-28 15:45:22.762+00
f5747f8f-6a3d-4894-9f99-ee2bbdb9ce79	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-28 15:50:22.762+00
e35e1a15-e0de-4983-a202-b479b1b8b61c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT60M"}	2025-07-28 16:40:22.766+00
bacb7128-d264-48fb-8834-77d8ad3cb53d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41}}	2025-07-28 16:41:22.766+00
d5782f5f-7235-49ff-9456-a19e5aa073f0	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-07-28 16:44:22.766+00
18c164d1-d629-4cb9-a65e-aa0261ebaef9	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT75M"}	2025-07-28 17:05:22.762+00
e7df7e92-c254-45f4-9dda-a82e48a26bfd	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-07-28 17:06:22.762+00
6bff1d32-e7ef-455e-936a-6741dd086f98	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-28 17:10:22.762+00
1f3cc443-c8cb-421f-bc71-553fb5deed9c	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT142M"}	2025-07-28 17:42:22.774+00
6b741003-dc04-4e98-9c57-a7ddc5c9cb31	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43}}	2025-07-28 17:43:22.774+00
8deb357c-8840-4277-b974-7d13bfa4c3f6	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-28 18:27:22.777+00
fef8914a-de6f-4ab4-88c3-f9c6345ad58e	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT228M"}	2025-07-28 19:03:22.313+00
7d0c9703-101f-4423-9912-9f26d0b9fd32	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT36M"}	2025-07-28 19:03:22.777+00
d01b7b88-6628-4f85-a02b-c0902b10b998	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 94, "scaled": 0.94}}	2025-07-28 19:04:22.313+00
06fca4ed-73fe-476b-80b1-b576044bd24e	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 67, "scaled": 0.67}}	2025-07-28 19:04:22.777+00
7c09db70-3532-4c75-8653-c7f5b81cc563	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-28 19:13:22.313+00
2db4b191-b124-4c23-9f7c-879315c33e2a	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-29 10:23:22.774+00
7654f42c-9954-4282-a8d6-d3ea40d3ae01	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT84M"}	2025-07-29 11:47:22.774+00
7125c384-91f6-42eb-af74-fde9766bf685	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-07-29 11:48:22.774+00
786bc4b4-9cb9-4460-9a67-2daedd2691e8	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-29 11:51:22.774+00
92871258-0599-4ded-9232-10fd7df7c827	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.8674060438090498}}	2025-07-29 12:21:22.774+00
efa7e831-b793-48a4-a05a-7c9306e87f62	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.8674060438090498}}	2025-07-29 12:22:22.774+00
da426635-8b5e-4d63-bfed-30f25d53c85b	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 38, "scaled": 0.38}}	2025-07-29 12:23:22.774+00
a3f21104-569f-43fb-88c8-2660acf89fcf	f8478e87-8fee-5ef3-95b1-41c971c4abab	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-07-29 12:24:22.774+00
95516c79-c913-4eeb-adad-44b0a5606dca	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-29 12:57:22.766+00
5e3cb547-d838-4546-b154-3ac7a0c7a8b0	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT61M"}	2025-07-29 13:58:22.766+00
f852a3cd-85ae-4620-8a2b-618ac3e2e71a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.57}}	2025-07-29 13:59:22.766+00
d3f18375-a10e-42b7-93af-15f7abe86744	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-29 17:29:22.777+00
c247f257-da84-4082-ab39-09482742509f	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT25M"}	2025-07-29 17:54:22.777+00
ee25aab7-8d3d-4f41-973e-b12916c204aa	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 83, "scaled": 0.83}}	2025-07-29 17:55:22.777+00
d8f56c01-75d4-46a4-b52d-11c9641432f9	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-29 18:01:22.777+00
bf9bdc2b-1fb3-4141-bc58-f9f0bde35e3d	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-02 13:33:33.451+00
34794623-c0a3-486e-bd44-f62e794a5f70	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5067788356407702}}	2025-07-29 18:56:22.777+00
4bb3190d-71d6-4a7d-8a63-ab22e467391e	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5067788356407702}}	2025-07-29 18:57:22.777+00
a140931f-6ff3-4a52-9c3c-e36bbb2167fa	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.69}}	2025-07-29 18:58:22.777+00
8fb39191-e724-4ca0-91f4-efec97d92890	a203229e-5fe7-5b14-a2da-9200a6214e7d	9a044b1c-e0aa-54f5-8787-f52ec405b4d8	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-07-29 19:06:22.777+00
9e6c298d-684a-4f6d-880b-54c34758333a	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-30 13:23:24.146+00
f0bf2770-4b99-4536-943a-a5677e3e074b	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-30 13:27:24.146+00
faa061b0-8372-4b88-ae2d-488ae56550e0	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-30 13:29:22.777+00
44c2daf1-8e99-4c00-b5b5-fbdd52100a25	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT173M"}	2025-07-30 16:20:24.146+00
b18c3826-0b6e-4cb3-b1a1-f254ab945c5a	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-07-30 16:21:24.146+00
47433b80-4108-43e8-b7f8-137cea9ab90a	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-30 16:27:24.146+00
702d9c19-16f3-419b-a341-f58d4e96a346	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-30 17:46:22.766+00
7139b124-6a36-4c68-bcf8-8c3a1c62a8de	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-07-30 18:33:22.766+00
fa98c675-d28b-4d93-be5a-8759f1d84670	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42}}	2025-07-30 18:34:22.766+00
e28174b5-7625-40ae-b5d7-6e77d507da87	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-31 12:54:22.774+00
47d6b546-30a6-40a1-9fb3-a09e64ca8e9a	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT142M"}	2025-07-31 15:16:22.774+00
6811b351-bcc9-4861-af4b-e489a0c26db7	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.6}}	2025-07-31 15:17:22.774+00
36321d99-85a1-4bf0-a975-bd0fb0401e13	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-07-31 15:35:22.766+00
beef2f56-5a51-4693-87aa-f85ca9becf07	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-31 15:40:22.766+00
f078d279-35db-402f-baa4-415bf30ba515	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT63M"}	2025-07-31 16:43:22.766+00
f427a31e-d8dd-4952-b224-1397921b900a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24}}	2025-07-31 16:44:22.766+00
562bedcd-bf19-4544-9ab6-2e7116dcc47b	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-07-31 17:48:22.762+00
bf142a21-8698-4b6d-9813-987c41396029	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT68M"}	2025-07-31 18:56:22.762+00
fd9e74c3-d6f1-4226-9e58-793439ef54a9	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 16, "scaled": 0.16}}	2025-07-31 18:57:22.762+00
6e9215e4-d7e1-41f9-8c99-ce56497b12e1	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.6195173345050449}}	2025-07-31 19:12:22.777+00
44ad51e4-b2db-4b99-b429-80e6299d7c75	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 61, "scaled": 0.6195173345050449}}	2025-07-31 19:13:22.777+00
8c5470ad-380c-4f64-8dbd-7d346dd358a9	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-07-31 19:14:22.777+00
4f80d89d-1342-4eab-b1b2-31509b338bd1	a203229e-5fe7-5b14-a2da-9200a6214e7d	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-07-31 19:17:22.777+00
c57f67d0-b6eb-401f-adf2-36b15497b13a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.7678615955182251}}	2025-07-31 20:43:22.766+00
c37d3c71-8bb3-458e-bc00-5b3cef5cc62e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.7678615955182251}}	2025-07-31 20:44:22.766+00
16eb5c81-7ab1-45a7-bd67-877a36d5d36c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.36}}	2025-07-31 20:45:22.766+00
83053764-b1c2-4160-9f1e-959ba4fb9cae	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-01 14:14:22.774+00
ccfc1fb4-c9d0-4baa-9161-2652e0214eda	a203229e-5fe7-5b14-a2da-9200a6214e7d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-01 16:02:22.777+00
4e0ce48d-7c06-4d33-a4a9-6b1fc800c9dd	a203229e-5fe7-5b14-a2da-9200a6214e7d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT26M"}	2025-08-01 16:28:22.777+00
76283b8f-9648-4930-ab89-3061e1591a43	a203229e-5fe7-5b14-a2da-9200a6214e7d	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 51, "scaled": 0.51}}	2025-08-01 16:29:22.777+00
0def4a5e-2901-4e89-81a7-73c5492fdabe	6001cdaa-df41-550b-adf6-6641e99307e2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-01 17:17:02.728+00
5d453dea-0e40-472d-92e1-03deb2b441c8	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-01 17:21:02.728+00
af206638-fb7f-4b0b-9815-1c56c6ef49c9	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT90M"}	2025-08-01 18:51:02.728+00
48e6ece6-04b8-4b88-bdd9-94b081d9de14	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 19, "scaled": 0.19}}	2025-08-01 18:52:02.728+00
23a8f03f-8463-4447-be78-a19975931fcd	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-01 18:55:02.728+00
349ebc7c-7d12-4d22-afdf-b529ce9b72f6	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.6529470387440022}}	2025-08-01 19:08:02.728+00
c1d3aced-73a0-4e3b-ae31-9d8e8f8b6ff1	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 65, "scaled": 0.6529470387440022}}	2025-08-01 19:09:02.728+00
41413d9d-7329-4294-bcc9-ee26ab8d107b	6001cdaa-df41-550b-adf6-6641e99307e2	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 1, "scaled": 0.01}}	2025-08-01 19:10:02.728+00
749a0c96-03e0-4074-8fcc-49042a2de4b1	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-02 12:29:22.766+00
c9270e53-a8c9-4b9f-b61c-b64f8751db64	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-02 12:40:22.774+00
7c689b1c-5d7e-4134-8276-709a93612977	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-08-02 13:33:22.766+00
cd71d17c-5dba-4dbb-8051-04adc442a0a7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.77}}	2025-08-02 13:34:22.766+00
b5f08608-3569-4164-a031-9f4ed6f5aac5	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-02 13:35:33.451+00
732a240d-059c-4690-805d-64f3bb0de750	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT62M"}	2025-08-02 13:42:22.774+00
b86ba66f-2134-4b2b-923b-e3831548c03f	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 70, "scaled": 0.7}}	2025-08-02 13:43:22.774+00
3e50790c-973b-4f9a-9789-a7ff7aacffbb	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-02 16:24:22.762+00
393b192d-0533-4e3b-83c2-58e242fcd15c	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT227M"}	2025-08-02 17:22:33.451+00
87d68d8a-c482-4b49-82df-30fab4e12452	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.77}}	2025-08-02 17:23:33.451+00
1fe718a5-d0ed-4b56-a0ca-0fec2f47f994	9631246f-5b7d-5b58-b9cb-cf589dcb81f2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-02 17:31:33.451+00
5dedbbfc-9fcf-4300-bf0d-bf40ab664e05	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT72M"}	2025-08-02 17:36:22.762+00
83fbf4a5-e107-4e10-ae32-09c1d0b90c2d	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-08-02 17:37:22.762+00
aa2921a4-ad0c-4bf9-8e22-b13f22741d39	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-08-02 17:42:22.762+00
f937c684-3d50-4d8f-8ba6-3dd957903fc4	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-02 19:54:22.777+00
43ffd9be-be83-4d63-a2f7-14a20bcb3227	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT43M"}	2025-08-02 20:37:22.777+00
f4b1fb06-f664-4424-8ffa-d6e693498523	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 23, "scaled": 0.23}}	2025-08-02 20:38:22.777+00
8517f351-09d0-4cb8-838f-ccb707502dd6	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.4538484875806103}}	2025-08-02 21:16:22.777+00
835856cf-c69d-4da4-9e1b-8a01c4fa6732	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.4538484875806103}}	2025-08-02 21:17:22.777+00
778aaaa0-cdaf-4c8e-855c-31a7b731934e	a203229e-5fe7-5b14-a2da-9200a6214e7d	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-08-02 21:18:22.777+00
41dc5434-f022-4975-b91b-665ccb446589	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-03 10:41:22.766+00
04c0e715-7af1-412a-a50f-6117d7e85dd6	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-03 10:43:22.766+00
07f525fd-9b65-4387-9a0d-847b33a9922a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT50M"}	2025-08-03 11:33:22.766+00
cb49dc63-9afd-4cde-9e22-b6466674cd6a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 91, "scaled": 0.91}}	2025-08-03 11:34:22.766+00
d73e164b-e427-4081-968e-56db647322cc	f8478e87-8fee-5ef3-95b1-41c971c4abab	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-03 14:25:22.774+00
4a184f3e-a224-41b2-87ec-2e7429da6de5	f8478e87-8fee-5ef3-95b1-41c971c4abab	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT79M"}	2025-08-03 15:44:22.774+00
22e76ebd-88fe-4db1-8460-1d9e05172fe2	f8478e87-8fee-5ef3-95b1-41c971c4abab	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-08-03 15:45:22.774+00
226724f8-1342-4b68-9d9b-be49010b0060	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-04 12:02:22.774+00
3f2c238c-bb4c-4fa9-b238-511c186fc60a	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT67M"}	2025-08-04 13:09:22.774+00
3689611e-4152-46e0-a6ff-49ee57cf7e2b	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 24, "scaled": 0.24}}	2025-08-04 13:10:22.774+00
e66ac5b4-11b5-4687-9210-5f54b6dbaf8a	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-04 13:14:22.774+00
0205db33-38f7-417a-9329-eb6782554db7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-04 13:19:22.766+00
f106c26b-b80e-4c6d-951e-be1fb3177ce1	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT55M"}	2025-08-04 14:14:22.766+00
48cf1183-98f3-47f5-90fc-a4d3d293184b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-04 14:15:22.766+00
65802102-3a93-49f6-9312-2f5834f4861f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-08-04 14:18:22.766+00
0119644d-2813-4621-8c42-732c2983ef0d	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-05 11:34:22.762+00
a6cef2df-3536-4a5f-8b20-40b012642c57	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-08-05 12:44:22.762+00
aa5b26c0-6aee-4d05-9165-a24b053a2777	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 14, "scaled": 0.14}}	2025-08-05 12:45:22.762+00
343f1ebd-c0b1-4d1a-a684-d4a29b65df2d	f8478e87-8fee-5ef3-95b1-41c971c4abab	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-05 12:48:22.774+00
c694ecac-7859-4609-a1f3-2ec0550adf3e	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-08-05 12:49:22.762+00
46dfb8f8-056b-4728-a444-cdc989cffbd8	f8478e87-8fee-5ef3-95b1-41c971c4abab	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT79M"}	2025-08-05 14:07:22.774+00
9326dc93-4f92-44de-86d6-a1967e2ab41b	f8478e87-8fee-5ef3-95b1-41c971c4abab	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-08-05 14:08:22.774+00
85564318-f191-4f43-bf7b-c8015a8a6c7e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-05 17:49:22.766+00
6321de78-ed5d-4b62-b67b-71c9a11192f6	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-05 17:52:22.766+00
a6d7b3ce-0a76-469d-afa1-043f3a36bc56	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT61M"}	2025-08-05 18:53:22.766+00
b64e06df-52fd-4772-a4b6-7f324cee211b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-05 18:54:22.766+00
d0b27994-aaa1-41d3-8440-015c7e46749b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-08-05 18:57:22.766+00
0d897631-5399-448d-9c4a-b946e40c7b81	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.6979382530045504}}	2025-08-05 21:55:22.766+00
4d06943c-b751-417f-a796-ec82846ed2ee	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.6979382530045504}}	2025-08-05 21:56:22.766+00
21681025-d3f3-43ae-b0dc-08a789b0103b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 90, "scaled": 0.9}}	2025-08-05 21:57:22.766+00
414240b2-b70c-49c6-bf8d-e0b5bd1f7b02	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-06 11:29:22.774+00
eba5ace6-9e00-4097-abe2-e52ca319fdc6	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT115M"}	2025-08-06 13:24:22.774+00
cec9241b-5832-4118-a4e1-e9ed1a0d700f	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-08-06 13:25:22.774+00
85a4c112-1b90-40a8-8b8d-3cca901f468e	6001cdaa-df41-550b-adf6-6641e99307e2	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-06 15:43:42.946+00
67e4934a-1601-4729-ae73-f725e084d5ef	6001cdaa-df41-550b-adf6-6641e99307e2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-06 15:45:42.946+00
a7efe118-5bfe-40a9-aa14-3961f6c6e4a9	6001cdaa-df41-550b-adf6-6641e99307e2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT290M"}	2025-08-06 20:35:42.946+00
7322cfc2-c5de-4a29-ba8f-50c0a42fe876	6001cdaa-df41-550b-adf6-6641e99307e2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-08-06 20:36:42.946+00
77699c78-7133-42c1-999d-4a9639ea871f	6001cdaa-df41-550b-adf6-6641e99307e2	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-06 20:40:42.946+00
b6ca1e9f-978f-4082-8602-b1a758ccb678	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-07 11:20:22.766+00
4bf61561-b871-4afd-ac7e-56600ab36b21	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-07 11:22:22.766+00
213b24bd-3c3b-41cf-ba67-c80565959797	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT61M"}	2025-08-07 12:23:22.766+00
cabf7a6d-2515-4ad3-94f6-7cc9dd6b3ea6	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 73, "scaled": 0.73}}	2025-08-07 12:24:22.766+00
03678e52-2ec5-4d8b-ab40-4ed78cbcdcdd	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-08 13:01:22.774+00
2bc40371-a6b5-4fa2-b1f4-6ef3ecd72659	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-08 13:29:22.766+00
761475d0-6e58-402a-9270-a32d4a44682d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-08 13:34:22.766+00
b36f40e2-287f-4ad1-9bb9-3e3068618480	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT56M"}	2025-08-08 14:30:22.766+00
3c603b9d-9001-496e-873c-dd5bc096c0d7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-08-08 14:31:22.766+00
cc6e914f-7637-45f5-a029-892b75afab3f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-08-08 14:36:22.766+00
cb7bf535-e438-4896-b56f-d3b6ae6530d5	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT144M"}	2025-08-08 15:25:22.774+00
ed2819cb-8144-4bfd-a96b-9b8396be7c7b	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43}}	2025-08-08 15:26:22.774+00
6e9d6a84-2e4a-4429-adcc-5e1dd91f12bc	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.3218663924868297}}	2025-08-08 15:57:22.774+00
72a46c68-def0-4b2f-a913-0d5898fd309d	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.3218663924868297}}	2025-08-08 15:58:22.774+00
f2ab2fd3-e3cc-4046-b609-e4fd9f3eb5b5	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-08-08 15:59:22.774+00
ed705854-b7e1-4866-9ec1-9af542b753e2	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-08 17:50:22.762+00
3bb1baaf-acb2-48c1-81f9-3b736bc8c7a9	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-08 17:53:22.762+00
23bf6e79-75ab-4b7d-beec-edee33cefed6	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT96M"}	2025-08-08 19:29:22.762+00
0b4caedc-c2da-47f9-bd88-ed13894bc2ac	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.29}}	2025-08-08 19:30:22.762+00
8918d299-74da-460d-86ab-55088e510a4f	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-08-08 19:31:22.762+00
b0ec3b7f-9965-4428-bc7f-21cf6bf87004	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-09 09:09:22.766+00
dcdd71c8-7fbf-4bae-acb4-5c53f6502808	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT63M"}	2025-08-09 10:12:22.766+00
e4924c24-1e04-4cf7-94eb-631b237eb286	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43}}	2025-08-09 10:13:22.766+00
33f08335-f3f6-456d-ae04-3e50acf118a8	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-09 14:44:22.774+00
585e95fa-1922-45c6-8180-45418634eafd	6001cdaa-df41-550b-adf6-6641e99307e2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-09 16:12:27.739+00
c4710df5-f126-4de5-bc00-3bd6e06d1df4	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-09 16:14:22.762+00
df8eb521-35d3-4c1b-9d45-9e685f32557a	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-09 16:16:27.739+00
7f452c84-de7a-4ecc-859e-24894548035e	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT136M"}	2025-08-09 17:00:22.774+00
20f48772-27cd-4067-9a5a-9959d283e21b	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 12, "scaled": 0.12}}	2025-08-09 17:01:22.774+00
8f30a573-5bdb-4b09-b814-56c4ea037680	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT84M"}	2025-08-09 17:38:22.762+00
252fbda5-454e-4860-a8ad-ae7f45f84d9f	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39}}	2025-08-09 17:39:22.762+00
26ebf15f-efc0-4de6-ac45-fa8711b17245	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.7884854978333795}}	2025-08-09 20:02:22.762+00
42135183-cecf-4554-875b-4114caee60d4	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.7884854978333795}}	2025-08-09 20:03:22.762+00
1a1d698f-8ffb-45f7-b796-7e2b36efcdb7	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 19, "scaled": 0.19}}	2025-08-09 20:04:22.762+00
0e1df65d-b512-411f-a7fe-6e09075aa8cd	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT307M"}	2025-08-09 21:23:27.739+00
58697d0a-7a14-4f65-9ac5-91e648af053b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-14 19:55:22.766+00
5ea94921-defa-4d73-9ad6-e0ff9accf145	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.81}}	2025-08-09 21:24:27.739+00
71a88cd5-77ee-4e73-8807-8742f178defa	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-09 21:26:27.739+00
3de36899-be03-4a63-8b16-84727cd1781d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-10 19:00:22.766+00
c13f6ed5-5afb-4274-921d-c7a83f7ace92	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT58M"}	2025-08-10 19:58:22.766+00
cb43919b-ec16-4ac7-b572-19f4f84cc49f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 29, "scaled": 0.29}}	2025-08-10 19:59:22.766+00
d666f3e6-53ca-4494-a2d0-1524219f0a43	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-11 15:33:22.774+00
c0826621-d55d-4798-8ef9-223c7ba79588	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-11 15:49:22.766+00
3a9abc51-2efe-4b3d-88b1-0657b63c9e02	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-11 15:52:22.766+00
2d774277-9f1b-4ca7-b5f8-2dc946b4f708	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-08-11 16:39:22.766+00
627826f7-630e-4797-9433-3131b5aad0fb	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 18, "scaled": 0.18}}	2025-08-11 16:40:22.766+00
ccf8aa5a-9ad6-4dea-aa89-0ed1165ec459	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT111M"}	2025-08-11 17:24:22.774+00
09783200-d4fd-4ac3-9d44-ea3ebc12bcc9	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 86, "scaled": 0.86}}	2025-08-11 17:25:22.774+00
b1f24497-53a2-4b4e-9d60-8dbd13f9ceac	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-12 11:52:22.774+00
56fe21c6-6afc-4b04-9c38-29e279b2900a	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-12 11:56:22.762+00
ab64d81d-30da-44d1-91e3-7076574c47fd	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-12 11:59:22.762+00
765cf6ff-ac9c-44d5-bceb-48fe8641429a	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT89M"}	2025-08-12 13:28:22.762+00
58894504-4589-4524-b0ba-f4751f3841b8	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-08-12 13:29:22.762+00
b0b2a848-256a-43d5-9ed7-4c02e884184f	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT97M"}	2025-08-12 13:29:22.774+00
2e1244ac-69f9-4acd-955c-2b1050b36d88	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 74, "scaled": 0.74}}	2025-08-12 13:30:22.774+00
e5c17822-2369-4e2c-9cef-b069d97bb10d	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-12 13:52:22.774+00
e055f35c-a3e3-486a-8c0b-2c2edd1795da	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-12 13:53:22.774+00
a7919884-0554-4fda-b8ba-80a7a3533026	f8478e87-8fee-5ef3-95b1-41c971c4abab	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-08-12 13:54:22.774+00
77d91ede-0cf7-4311-bf3d-6d3d6e5a610d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-12 19:04:22.766+00
90f8eee6-52df-4691-914e-7ea930b68bf0	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-12 19:08:22.766+00
01f4dc23-c98f-4303-9708-cc9935ca5387	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT50M"}	2025-08-12 19:58:22.766+00
8d0e3046-4c3e-4312-9cab-82c2264a8ef1	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 8, "scaled": 0.08}}	2025-08-12 19:59:22.766+00
d479d448-5554-4684-be67-03758e879de1	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.3311591807854098}}	2025-08-12 21:27:22.766+00
b59cdddc-81e4-4210-9c16-7b1f2e48ee0b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.3311591807854098}}	2025-08-12 21:28:22.766+00
fe051ec1-71c8-437e-9040-636dcaac4364	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-08-12 21:29:22.766+00
d1824e90-71a8-4bde-9d3a-7ede6bcb7018	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-13 10:33:22.766+00
cd9f1dd4-6fa6-4984-b45d-3b85750ff4c8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT46M"}	2025-08-13 11:19:22.766+00
ebd9e6d9-b68d-4b5e-b823-6196b720988d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 18, "scaled": 0.18}}	2025-08-13 11:20:22.766+00
f2b67d3d-bfb4-4c47-8022-347e68bce83c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34513754798262836}}	2025-08-13 15:00:22.766+00
07b23c45-1607-4b36-9104-570133805594	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34513754798262836}}	2025-08-13 15:01:22.766+00
a4b7c1e9-54b0-42b2-a69c-464a401ed51c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 28, "scaled": 0.28}}	2025-08-13 15:02:22.766+00
8084286a-4698-445f-957b-63f69212d477	6001cdaa-df41-550b-adf6-6641e99307e2	f10c153c-968c-5979-b6cc-05736dc40095	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-13 18:27:28.948+00
ef23ac42-4316-4be3-8eaf-0cdb4981ec84	6001cdaa-df41-550b-adf6-6641e99307e2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-13 18:32:28.948+00
53963e01-e8d5-4437-a81c-859bafa01395	6001cdaa-df41-550b-adf6-6641e99307e2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT267M"}	2025-08-13 22:59:28.948+00
13bb6522-8db4-4aba-a3a2-7b44e7d2d4c5	6001cdaa-df41-550b-adf6-6641e99307e2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-08-13 23:00:28.948+00
6db56d2f-75a2-49b2-a2c8-efcdf95b9f6e	6001cdaa-df41-550b-adf6-6641e99307e2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-13 23:02:28.948+00
6c25c66a-ff0e-4bf1-a349-84f9667bf989	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.691939300990217}}	2025-08-14 15:37:22.774+00
35a0fadc-a3cb-4db1-9143-7662f0648d36	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.691939300990217}}	2025-08-14 15:38:22.774+00
4d540cdd-246c-4f22-9b2e-cd8204e0bde5	f8478e87-8fee-5ef3-95b1-41c971c4abab	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-08-14 15:39:22.774+00
db7975a2-fea2-4314-aca7-9ad5e340edb5	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-14 19:50:22.766+00
fb5a2b13-752e-4fd0-866d-1e28bfa434a8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-08-14 20:59:22.766+00
ce773f89-ba99-42f5-8b43-da4f5211a5ca	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-08-14 21:00:22.766+00
8a3c38f9-e478-4c07-addf-b13354afa9f2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-08-14 21:01:22.766+00
8df9ec15-30f9-4576-875c-50d4fabaa113	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.4641877846295375}}	2025-08-14 22:17:22.766+00
c6c01492-76d5-4cd8-a1e9-fa06bdbd5a43	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.4641877846295375}}	2025-08-14 22:18:22.766+00
c399f598-5dd0-448f-bc86-56dbe8f0477c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-08-14 22:19:22.766+00
f7400062-5331-49d5-bcf2-d39be86b5878	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-15 10:16:22.766+00
21eca295-0b5e-4e6c-8540-e1e6244b5f9d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT49M"}	2025-08-15 11:05:22.766+00
d5352a19-e822-4cd7-bb9e-01e39910b06e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-08-15 11:06:22.766+00
df8bacd0-a03e-4801-b0a0-1acca1bef5c5	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-08-15 11:10:22.766+00
eb5a05a1-f2e7-4afc-9248-d1b9661ec48c	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-15 13:24:22.774+00
69d1be6b-15a3-4130-a386-e2549f132f57	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-15 13:46:22.762+00
6d5a6835-568c-44a5-8a87-96fb38736e37	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-15 14:11:22.774+00
274ca5b5-126a-490e-82a9-b7763575d334	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-15 14:12:22.774+00
2487f8bb-5512-4cda-9811-3f43a37db5e7	f8478e87-8fee-5ef3-95b1-41c971c4abab	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-08-15 14:13:22.774+00
76c6a4a8-4534-4ed6-a06f-707f1ad0bb2a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3032015584215226}}	2025-08-15 14:50:22.766+00
91e757a2-4cc2-4588-92f7-d243dfdd2b98	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3032015584215226}}	2025-08-15 14:51:22.766+00
e5bc0cac-a5dd-4487-8db6-648c7246349e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-08-15 14:52:22.766+00
e98311e6-ed47-43d6-a8fe-fa90aee84ead	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT75M"}	2025-08-15 15:01:22.762+00
6977340e-46d7-4de8-bcb7-e7c2a7d9f9c0	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.66}}	2025-08-15 15:02:22.762+00
5663416d-c071-4e9c-ad03-53788128b1e2	6001cdaa-df41-550b-adf6-6641e99307e2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-15 20:58:20.055+00
bd3b4a41-acca-4c20-a395-4aa488cd8258	6001cdaa-df41-550b-adf6-6641e99307e2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-15 21:03:20.055+00
d6a39ccc-40f1-4115-8c00-ed27dc05ab54	6001cdaa-df41-550b-adf6-6641e99307e2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT256M"}	2025-08-16 01:19:20.055+00
90636933-fd8e-418b-b666-d3f97ca81ecb	6001cdaa-df41-550b-adf6-6641e99307e2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-08-16 01:20:20.055+00
ef7eddbe-3b0b-4dd1-a2e3-fdd4cec3be0b	6001cdaa-df41-550b-adf6-6641e99307e2	dd4608c4-45ad-543d-a42c-6276790440d3	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-16 01:28:20.055+00
da616f9a-7589-47b1-bc46-44faa24674eb	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-16 12:37:22.762+00
d4ecefd6-e586-43c9-9536-a7de7fca1f83	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-08-16 13:41:22.762+00
0eca335e-3e98-467c-811f-0057ab41d779	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-08-16 13:42:22.762+00
3e61d382-b5d9-433e-968b-0a62a74d4e61	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-16 17:05:22.766+00
2e614ee6-528f-4f33-aa0c-0b85ecdc41d5	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-16 17:08:22.766+00
b7e66742-19bb-4543-8ea2-aff1ac5bb94b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-08-16 17:55:22.766+00
27f0920b-2700-4e82-bc61-c370d3418c4a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41}}	2025-08-16 17:56:22.766+00
4c160076-d5f4-4172-9b62-288153a0bf86	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.462600591144882}}	2025-08-16 19:44:22.766+00
a84def2e-ec44-4708-9048-5ba386c932d8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.462600591144882}}	2025-08-16 19:45:22.766+00
c260530b-3f9e-4c53-97dd-90d2b126a4ea	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-08-16 19:46:22.766+00
fc4ef643-ef8f-4c32-bf41-33bc537321d2	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-17 12:19:22.774+00
5d991eb6-0f6c-48f3-804b-280eb6dc2538	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT63M"}	2025-08-17 13:22:22.774+00
b04858a5-a68f-435b-87da-30afbd9e4da2	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-08-17 13:23:22.774+00
81b5361e-7037-41bb-b4fd-3b36762113bf	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-17 13:27:22.774+00
c19f6cde-4a91-4db1-ba91-cfb58660fb6f	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-17 14:56:22.762+00
49c0691a-8b82-4428-94e0-42b13e783b9d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-08-17 15:15:22.766+00
718034e2-eca6-488e-a36e-d77dbd2c66b7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-08-17 15:16:22.766+00
a2ecde62-2f8f-44da-b29d-4a89ebaa247d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-24 10:14:22.766+00
db8310d1-72ef-4024-bd75-171ee8ef5490	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.43}}	2025-08-17 15:17:22.766+00
b9648fc7-b6f3-460f-bcef-d7b87ccd9e1a	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT85M"}	2025-08-17 16:21:22.762+00
30503eac-a79a-45c9-a944-9f2323c81fbf	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-08-17 16:22:22.762+00
d492021f-d66b-40db-a555-eda8cabdd1ce	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-18 12:02:22.774+00
7e320a38-e1d0-4b5d-8efb-510022eacc55	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-18 12:17:22.762+00
738e31a6-a39c-4990-af28-e3fd16a76cdd	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT53M"}	2025-08-18 12:55:22.774+00
55c0b6e4-4215-4d50-b7bf-9d832c72618c	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.89}}	2025-08-18 12:56:22.774+00
ee6d10b6-4368-492f-9af9-e065d70b6a15	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-18 13:04:22.774+00
65e42169-da79-4109-8b44-ff62570e8475	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT83M"}	2025-08-18 13:40:22.762+00
e8fab181-3152-4ceb-919f-af5c9b654734	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 19, "scaled": 0.19}}	2025-08-18 13:41:22.762+00
e9f96400-078d-495c-99db-dd556e98f5ce	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.608818568648264}}	2025-08-18 14:47:22.762+00
cca24c7f-f5f0-4e17-ad44-1aec2d32a293	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 60, "scaled": 0.608818568648264}}	2025-08-18 14:48:22.762+00
041a6418-6867-482f-9fad-f94caa8894d5	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	628435a2-1aba-5f57-8452-22f0f6fe8b5a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-08-18 14:49:22.762+00
8c5576d2-2e25-42aa-848d-47d14f9a90fc	6001cdaa-df41-550b-adf6-6641e99307e2	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-18 14:59:02.171+00
e203936e-89c2-4e8d-b918-4c97476b90ef	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-18 15:04:02.171+00
af08b720-73f5-4187-ad19-768fbba3dffd	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT188M"}	2025-08-18 18:12:02.171+00
1d2c7f4d-035f-4998-9da4-feffd110ec41	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.78}}	2025-08-18 18:13:02.171+00
13e9cdc9-bf78-499b-9276-ca0235d31bdf	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-18 18:22:02.171+00
558dff05-4974-432c-85aa-a8016abe1ec6	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-18 19:48:22.766+00
ecebf57b-6cee-44ca-ae09-8e7043bf201e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-18 19:51:22.766+00
9f3b7b7e-16f3-438f-908d-01f08b2ee73b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT55M"}	2025-08-18 20:46:22.766+00
e27775c8-a4dd-454e-918b-3676fd31a460	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-08-18 20:47:22.766+00
5f4f8823-a06a-47ab-a45d-aeb9f88e1352	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-19 10:33:22.774+00
766e2434-4cf6-48c3-96a3-5944fb3005d6	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT73M"}	2025-08-19 11:46:22.774+00
d118165b-8123-48a9-8a2b-48ffa76f2c45	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 71, "scaled": 0.71}}	2025-08-19 11:47:22.774+00
947a9bab-445a-4eef-bd40-5ecdc32714e7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-19 11:56:22.766+00
1ecd3626-3665-4f24-85e2-166f4d8334a2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT47M"}	2025-08-19 12:43:22.766+00
244fc5ae-8c67-4b9e-91a3-6979121ee01c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-08-19 12:44:22.766+00
d0124d3a-7997-4acb-a592-9a3c52f53536	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-20 08:26:22.766+00
facd93df-0715-4692-9f33-a63e9322ea0d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-20 08:30:22.766+00
ca3f5a9f-fa81-4c7d-adb2-b6b665c17f80	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT56M"}	2025-08-20 09:26:22.766+00
ce00e3bb-eeb9-40ad-9855-c6ca399de31a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 57, "scaled": 0.57}}	2025-08-20 09:27:22.766+00
db573f58-6454-40d8-ac39-bb73e3b7d306	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-20 13:43:22.774+00
d5a8e928-6878-4c1d-b86b-5818760da97c	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT95M"}	2025-08-20 15:18:22.774+00
440353b2-e562-4bcf-b095-6f86e4fa363f	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 81, "scaled": 0.81}}	2025-08-20 15:19:22.774+00
356306ef-1330-4c21-9fe8-8cdb02814102	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.9938265740922099}}	2025-08-20 16:02:22.774+00
769f5a0a-f6ef-42ad-9870-27f715bb3109	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.9938265740922099}}	2025-08-20 16:03:22.774+00
37a919e0-d58e-4624-a9e6-e7248fcb4e3f	f8478e87-8fee-5ef3-95b1-41c971c4abab	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 92, "scaled": 0.92}}	2025-08-20 16:04:22.774+00
0508658f-8341-4763-b4df-8d9b3b8ff5eb	f8478e87-8fee-5ef3-95b1-41c971c4abab	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-21 15:43:22.774+00
30447a89-b551-4578-808f-9eb54b1a700d	f8478e87-8fee-5ef3-95b1-41c971c4abab	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT76M"}	2025-08-21 16:59:22.774+00
a096b489-f1fe-4354-9312-57eef6bdcf1c	f8478e87-8fee-5ef3-95b1-41c971c4abab	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 73, "scaled": 0.73}}	2025-08-21 17:00:22.774+00
42eeac44-af9c-418e-ab03-c476b8fc7469	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-21 17:57:22.762+00
3b53eff5-0f09-4343-9ff0-082903b9ea26	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-21 18:02:22.762+00
c65c7181-4a78-4598-aa85-5e49b50a1624	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-21 19:31:22.766+00
781f2abf-817b-46bc-b2e8-b921fadffc6d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-21 19:33:22.766+00
3055c75e-32b8-4acf-97d7-de3371d19dda	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT96M"}	2025-08-21 19:38:22.762+00
28c30faf-4266-4992-b918-b7a1157609c9	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT53M"}	2025-08-24 11:07:22.766+00
dd2e2693-c4e9-4f7c-90cc-9354371ae2b6	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41}}	2025-08-21 19:39:22.762+00
5c4905c4-b5cc-4de7-93ab-bda452114acf	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-08-21 19:44:22.762+00
2606995a-0297-4baf-8e90-705d16c54d01	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT56M"}	2025-08-21 20:29:22.766+00
2fd5dcb6-9a7f-4d8f-930b-239999445939	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42}}	2025-08-21 20:30:22.766+00
2e618b64-da06-4d19-854a-c10a1b024146	6001cdaa-df41-550b-adf6-6641e99307e2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-21 20:53:35.374+00
8afc6f09-7eeb-442d-bcfc-8bee975a336c	6001cdaa-df41-550b-adf6-6641e99307e2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-21 20:56:35.374+00
223e799c-1bce-4bdc-8c57-38ac8d28c057	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5682282073225391}}	2025-08-21 23:28:22.766+00
9f77aa42-d8ce-43a6-ac90-7398ab92b707	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.5682282073225391}}	2025-08-21 23:29:22.766+00
4249f250-5df4-48b2-91aa-3354a0548ff9	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 55, "scaled": 0.55}}	2025-08-21 23:30:22.766+00
fff0b3a1-75b4-4aeb-ad48-1e0b0e422323	6001cdaa-df41-550b-adf6-6641e99307e2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT311M"}	2025-08-22 02:07:35.374+00
0f8dfd3f-2a6d-4ed8-a9cb-1abdd34e9a42	6001cdaa-df41-550b-adf6-6641e99307e2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 69, "scaled": 0.69}}	2025-08-22 02:08:35.374+00
6ba67e0f-6c28-49cc-9d4c-28693711e85a	6001cdaa-df41-550b-adf6-6641e99307e2	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-22 02:14:35.374+00
0c83cf38-3068-4a6e-b589-aee75e10607a	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-22 10:24:22.774+00
33f00f84-433f-423d-84d2-dbc6d52a2e36	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-22 11:46:22.762+00
889971f5-7ab9-4ef6-a80c-614e986e5ffe	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT118M"}	2025-08-22 12:22:22.774+00
0e33d5d4-6934-4a92-9109-b2ad77ad9502	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56}}	2025-08-22 12:23:22.774+00
d4f169ca-cace-4de9-ae2c-fc3322efe37b	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT72M"}	2025-08-22 12:58:22.762+00
e7457c4f-e4eb-451e-8d1c-06e15caeb85e	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-08-22 12:59:22.762+00
4f524e62-7023-4771-8536-f3641d7f7f57	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.20119615648382566}}	2025-08-22 13:21:22.774+00
a66d193e-20af-412a-b501-89c281393214	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 20, "scaled": 0.20119615648382566}}	2025-08-22 13:22:22.774+00
fe7fc29a-d118-420f-90f7-5c2d68268b12	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-08-22 13:23:22.774+00
b4e91225-d703-4546-a0d6-e71a8ef047a4	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-23 10:16:22.766+00
c13717a6-b079-4468-b32e-683b42e06845	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-23 10:18:22.766+00
e21ccee3-31e6-457d-ba95-2eed1ec190c8	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-23 10:48:22.774+00
df610973-eff2-43e8-ada7-7cc834bb900b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT51M"}	2025-08-23 11:09:22.766+00
2d4ad161-7dff-412d-bae6-7b0027dc040e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-08-23 11:10:22.766+00
d443531f-a9c6-4a2b-8887-930f57b2b258	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-08-23 11:15:22.766+00
8b72bd1d-1b00-49de-a2ae-65ecec14a70a	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT90M"}	2025-08-23 12:18:22.774+00
9599b4f2-d50b-46b4-98cc-aa9d78134e43	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-08-23 12:19:22.774+00
be698724-53a5-4586-9aee-218d7859e529	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-23 12:22:22.774+00
426eb66e-e32a-4f47-9bc0-e89b94f4f93f	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.5490675600472014}}	2025-08-23 13:11:22.774+00
70d823f9-7c93-47db-a9b6-bb44cfab2993	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.5490675600472014}}	2025-08-23 13:12:22.774+00
d7ae0c09-fd47-460f-9b0f-56bdb3b1505a	f8478e87-8fee-5ef3-95b1-41c971c4abab	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-08-23 13:13:22.774+00
f4699d48-1b4c-411b-b655-1e26de01e96f	6001cdaa-df41-550b-adf6-6641e99307e2	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-23 15:52:25.268+00
23eafa93-e0b3-420e-b752-4e997a4e0c2a	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-23 15:56:25.268+00
09222d08-9425-4335-b5c9-65c0e0ef15bb	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT411M"}	2025-08-23 22:47:25.268+00
0309e81d-a161-4122-893e-7dfbf1839392	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 93, "scaled": 0.93}}	2025-08-23 22:48:25.268+00
49d860aa-5185-480b-aff9-79f2b98de0ed	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-23 22:51:25.268+00
32e2e024-cba8-4623-ae8d-cbd8f3243d3b	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-23 23:31:25.268+00
2be917cd-ddfe-4c4e-b051-0112468c7d21	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-23 23:32:25.268+00
99996cc7-731a-41dd-aed5-aa7e50f05e11	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-23 23:33:25.268+00
a4ce9cb3-02ee-483c-b274-4223ef378dd4	6001cdaa-df41-550b-adf6-6641e99307e2	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-08-23 23:37:25.268+00
d90da367-526a-4931-bfb1-b918d3efda5f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-24 10:09:22.766+00
0c49e800-c508-4a74-9813-1c93603274a4	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 18, "scaled": 0.18}}	2025-08-24 11:08:22.766+00
c394ce90-c9a4-443e-bfee-a685dbdc9048	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-08-24 11:12:22.766+00
b3b301ca-9770-4d9c-a62e-f9146f785f7c	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-24 14:09:22.774+00
1e110dac-df5e-4ced-8c1c-8f38ad973a9c	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-24 15:07:22.762+00
a26b3777-20d9-4323-8219-32476582a73c	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT118M"}	2025-08-24 16:07:22.774+00
7403ef9d-c4d0-4e75-ac83-ffd3fef4bf68	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.72}}	2025-08-24 16:08:22.774+00
38f38155-4947-40a0-b52c-2dfc2b35e839	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-24 16:16:22.774+00
854b2852-c491-4ae1-a6dd-0490141e8e33	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.4796266892956449}}	2025-08-24 16:35:22.774+00
9b2d1e5b-98a4-4b67-a950-32a397daa3e9	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.4796266892956449}}	2025-08-24 16:36:22.774+00
68f8896b-c2c2-45d2-8440-45ef074354c7	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 87, "scaled": 0.87}}	2025-08-24 16:37:22.774+00
ad22d9b8-abcc-4ffe-bb18-f3e184620f0a	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT96M"}	2025-08-24 16:43:22.762+00
187e48d7-8a9b-4947-a0ae-fccabdd02da8	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 42, "scaled": 0.42}}	2025-08-24 16:44:22.762+00
3f5daa12-abc9-46a5-86f2-7df3fe5d54e3	f8478e87-8fee-5ef3-95b1-41c971c4abab	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-25 13:54:22.774+00
e82e24d7-e483-4ca3-917d-82bd4bb1c88d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-25 14:46:22.766+00
63a4abdd-86b5-4c30-ba2e-b4d441c2f636	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-25 14:51:22.766+00
dce99281-0393-42ed-9bf5-f96474d327e2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT48M"}	2025-08-25 15:39:22.766+00
88411649-2660-48ec-815d-cb69c6ae70a8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 3, "scaled": 0.03}}	2025-08-25 15:40:22.766+00
a50af544-5c93-451f-9bef-7daebf43fdb8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-26 10:56:22.766+00
4243a1e7-ffee-4bc3-9e52-9c03ab88825d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-26 11:01:22.766+00
06b13430-86fb-4f25-a883-f829fcf683ae	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT60M"}	2025-08-26 12:01:22.766+00
8d850685-d947-4785-a35f-3e5061add565	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 15, "scaled": 0.15}}	2025-08-26 12:02:22.766+00
a8487fe5-7690-475d-8171-a7b8c1afbb78	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-26 12:54:22.774+00
cbb19dec-24db-4dc4-8d70-929d2fbc9d61	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT72M"}	2025-08-26 14:06:22.774+00
ca67778a-c59e-4bcf-8901-2faa599ba16d	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-08-26 14:07:22.774+00
20b14f0b-f041-466d-aa0b-d67cbad3a1b4	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.6635859211598468}}	2025-08-26 14:36:22.774+00
03e6ae22-0789-4fca-b5bd-84d76ed21b23	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.6635859211598468}}	2025-08-26 14:37:22.774+00
82055b33-9c87-42d5-8f60-8fe7731f17ef	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-08-26 14:38:22.774+00
d7274497-8952-470a-af49-056204c4df2f	f8478e87-8fee-5ef3-95b1-41c971c4abab	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-08-26 14:42:22.774+00
23fb573e-7d94-4c82-aa11-75f5eeac9869	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-26 17:48:22.762+00
8af14b85-1443-46e7-ab08-f07ccf4ed6c8	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-26 17:50:22.762+00
15c69a92-47a8-4a7d-9b1d-d7fde3a51687	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT74M"}	2025-08-26 19:04:22.762+00
fe89b33b-abf1-4b91-97d8-c766eef893c5	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 54, "scaled": 0.54}}	2025-08-26 19:05:22.762+00
2e8f98be-09b5-4e68-8f85-4aafb9003996	6001cdaa-df41-550b-adf6-6641e99307e2	6db96e1f-b595-5aec-adbb-46b408029b79	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-26 19:18:11.153+00
3e22ab72-9066-41bc-a5bd-5c29236ea8e9	6001cdaa-df41-550b-adf6-6641e99307e2	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-26 19:23:11.153+00
e1e99077-92ab-46c9-8d46-ba9d5d4f629c	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.7872560732509077}}	2025-08-26 20:19:22.762+00
feecb679-3c76-402e-94e8-fcc911857c3f	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 78, "scaled": 0.7872560732509077}}	2025-08-26 20:20:22.762+00
a71baeca-e570-4c6e-a49b-df99650438e6	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	70423966-9ebb-5262-b082-4b8925547d57	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34}}	2025-08-26 20:21:22.762+00
cd2c55fc-0b65-4e96-88da-591f8493b83f	6001cdaa-df41-550b-adf6-6641e99307e2	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT404M"}	2025-08-27 02:07:11.153+00
ba610636-1046-4f91-957e-85d042b254a3	6001cdaa-df41-550b-adf6-6641e99307e2	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 32, "scaled": 0.32}}	2025-08-27 02:08:11.153+00
f7431d9f-811c-4243-bfe4-c9aeb639bdc7	6001cdaa-df41-550b-adf6-6641e99307e2	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-27 02:11:11.153+00
7cde720d-1cde-477c-a322-8448071c458b	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-27 11:35:22.766+00
9d47f410-1cc9-459e-b72e-c095892fc075	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-27 12:18:22.774+00
75fead88-8251-4f06-a053-47a358e352c1	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT60M"}	2025-08-27 12:35:22.766+00
0fe7400f-3326-4a16-8a44-4a15c74a491d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 5, "scaled": 0.05}}	2025-08-27 12:36:22.766+00
7bcdc3ce-a879-4d82-b117-e36a9c1e7205	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT79M"}	2025-08-27 13:37:22.774+00
1540ec03-86fc-43f4-a2c0-bea2d4734e85	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-27 13:38:22.774+00
2576bbbb-a204-4ffa-a119-1fc3883062b2	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-08-27 13:43:22.774+00
cbe0222d-90c5-4a9a-b4cd-c65c557d5b0d	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-27 13:50:22.774+00
c524b052-130e-4ae9-ab95-ff9158f1543f	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 98, "scaled": 0.982036453991187}}	2025-08-27 14:40:22.774+00
27c143c8-26c2-44d6-b517-6c48281141be	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 98, "scaled": 0.982036453991187}}	2025-08-27 14:41:22.774+00
b16e16f4-7518-46c0-b489-8f41a81b93b8	f8478e87-8fee-5ef3-95b1-41c971c4abab	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 85, "scaled": 0.85}}	2025-08-27 14:42:22.774+00
a7ed7e51-3b6c-4eec-ba30-c965d712a19e	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39686575893924275}}	2025-08-27 15:01:22.766+00
780a6ad4-8475-49d6-aafe-1288d2f5e7f4	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 39, "scaled": 0.39686575893924275}}	2025-08-27 15:02:22.766+00
e6bdf7ef-1099-456a-bd84-6a05ac43eec2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-08-27 15:03:22.766+00
73e310ff-4fdc-4b77-85dd-a53e66eb3964	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.4130789399634296}}	2025-08-28 13:06:22.774+00
6ab6da01-7a5f-4911-8628-6362d7205079	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.4130789399634296}}	2025-08-28 13:07:22.774+00
bf5bbdb6-7121-42d3-a2cc-7276fbf41319	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 27, "scaled": 0.27}}	2025-08-28 13:08:22.774+00
ce77170d-6781-4355-88e2-5da0dfee63cf	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-28 17:04:22.766+00
78220be6-9426-4c9f-9d83-455348d89cbe	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT61M"}	2025-08-28 18:05:22.766+00
33e93e92-f338-4c24-af83-185af79013bf	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-08-28 18:06:22.766+00
ca828e30-ef8a-444b-a4ea-5a53c47a0178	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 4}}	2025-08-28 18:09:22.766+00
e4401a09-938c-4adb-9c2f-c93b0cf4a1b3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.4316154205261435}}	2025-08-28 20:39:22.766+00
6940bf3f-11ba-4fd9-a08a-240dd4d547bd	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 43, "scaled": 0.4316154205261435}}	2025-08-28 20:40:22.766+00
0ca95c69-9c10-4726-936c-07e4f925444d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 19, "scaled": 0.19}}	2025-08-28 20:41:22.766+00
d19d452e-3185-44a6-b23d-9a1ff4b82c2f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-29 12:17:22.766+00
54d97637-9720-4525-912f-3f80fe3a9d8e	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-29 12:54:22.762+00
4aac1fcd-4524-4c48-b189-48817385291b	f8478e87-8fee-5ef3-95b1-41c971c4abab	fcc40587-6fbe-570f-8676-ba7f80daec71	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-29 12:55:22.774+00
e7bfe256-36ec-4f5e-bfdc-609de391a27a	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT60M"}	2025-08-29 13:17:22.766+00
a86dcdd6-76e4-4903-9fa7-b2298fa566d1	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 4, "scaled": 0.04}}	2025-08-29 13:18:22.766+00
51306ec1-490a-43ea-b7bf-5ea3080225c0	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT75M"}	2025-08-29 14:09:22.762+00
872dec52-f5ea-4538-9694-33bb432f9552	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 33, "scaled": 0.33}}	2025-08-29 14:10:22.762+00
fa73cbb8-d00c-47c8-bf19-d0217ae54f33	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-08-29 14:14:22.762+00
09a329ba-41b1-409f-8c21-6f1b5a4db17d	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46276129661877957}}	2025-08-29 15:52:22.766+00
aad67a40-6bfd-44fd-b2f5-04c37818dea7	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46276129661877957}}	2025-08-29 15:53:22.766+00
d999defb-4a4d-44f8-9146-a8c01153ee32	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-08-29 15:54:22.766+00
2fa024c0-dc66-4c8b-a62e-24fb3082cfba	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-30 10:50:22.774+00
c3b70a10-6d53-4be4-9f7c-98b557c82874	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-30 15:15:22.766+00
354b9f6b-dd4a-4146-b94c-868479eed1bc	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-30 15:19:22.766+00
d227769c-eba3-464c-8b3e-e6950b7a50db	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT50M"}	2025-08-30 16:09:22.766+00
087ddc63-4628-45f6-822e-89d440ede606	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-08-30 16:10:22.766+00
c3b0d35b-523a-40ea-9768-000cbf39f84f	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.30716602267251264}}	2025-08-30 19:12:22.766+00
b7ba2d57-0fc4-4a8e-bf54-b07a1db287a2	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.30716602267251264}}	2025-08-30 19:13:22.766+00
eb90d4d3-fc42-4c3c-8c45-93352f205a78	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-08-30 19:14:22.766+00
09fec20b-04a3-465f-b960-d0141656bec7	6001cdaa-df41-550b-adf6-6641e99307e2	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-30 20:38:23.248+00
845d1690-db16-4fc0-bd23-67ffbd211ed6	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-30 20:41:23.248+00
5ff74245-d835-460d-8095-8d1ccff9d064	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT276M"}	2025-08-31 01:17:23.248+00
7105ec79-fcea-41c8-88d0-c175610672f4	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 94, "scaled": 0.94}}	2025-08-31 01:18:23.248+00
a7d5b70d-d06e-4087-974b-eed4586c3ca1	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-31 01:23:23.248+00
3b1275b8-0528-4691-b357-0d95137b8364	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-31 01:39:23.248+00
9c78d76b-b1cd-4d00-a044-66bb1635d84f	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-08-31 01:40:23.248+00
79d41b95-45ee-45d7-9227-c3225d1e1fc0	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 76, "scaled": 0.76}}	2025-08-31 01:41:23.248+00
aa7b4538-1def-44a7-be93-d9c365aef728	6001cdaa-df41-550b-adf6-6641e99307e2	ab3ff241-b1ca-54ed-aa92-b324f1a5155b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-08-31 01:48:23.248+00
df762508-0aab-4acc-85c5-220cfeb54765	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-08-31 13:09:22.766+00
da000a60-8a40-46c6-8b9d-1745e2ea16d8	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT64M"}	2025-08-31 14:13:22.766+00
5eb2301e-ac96-4932-9cc6-1d091c8fb010	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 16, "scaled": 0.16}}	2025-08-31 14:14:22.766+00
ab175827-cd9f-40c3-8eb8-2d3d646fc9d7	f8478e87-8fee-5ef3-95b1-41c971c4abab	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-08-31 14:26:22.774+00
0cf34b1b-b745-42d7-bc0d-b42e2a1962e6	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34644461070013227}}	2025-08-31 16:44:22.766+00
dd68cc80-b2d9-4964-afed-86eee6199fa9	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 34, "scaled": 0.34644461070013227}}	2025-08-31 16:45:22.766+00
fa61a11c-8df6-4eeb-9dab-12e24d1f94fa	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 28, "scaled": 0.28}}	2025-08-31 16:46:22.766+00
cc62cfb3-04f2-4e1b-a61e-0c4df08c8f3c	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-01 10:27:22.766+00
2af1ed32-a744-499b-a47f-629b9522df44	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT58M"}	2025-09-01 11:25:22.766+00
791c88bf-9d7f-433d-af20-0229860852a9	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 46, "scaled": 0.46}}	2025-09-01 11:26:22.766+00
d910aee2-2629-4be7-ba64-81dfa03bc0cd	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-09-01 11:27:22.766+00
0fef0584-2ff5-4493-8449-e0d54c231cde	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.3602779239814515}}	2025-09-01 13:01:22.766+00
d0ec7a43-6476-4d8d-afc0-6d4ab5ec8bc3	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/failed	{"score": {"max": 100, "min": 0, "raw": 36, "scaled": 0.3602779239814515}}	2025-09-01 13:02:22.766+00
be62d47b-b754-45f4-8997-4a1fa9590f64	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 58, "scaled": 0.58}}	2025-09-01 13:03:22.766+00
5f36dec9-a51b-44ea-a0d7-0e45882ce63b	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-01 14:26:22.762+00
8101516d-9aa7-4233-870e-31af1f5ab796	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT66M"}	2025-09-01 15:32:22.762+00
83c3455d-fe36-429c-8098-4e735ced4fa4	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 21, "scaled": 0.21}}	2025-09-01 15:33:22.762+00
7996798b-9ac0-4f88-8675-bd386a8c5a10	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-09-02 18:26:22.766+00
5d7f2769-8121-4aaf-947e-5ecd016aaba5	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-09-02 18:27:22.766+00
6397bbfd-f896-442b-9ffc-bbd7c9afe300	544f5e06-497f-5f4a-b3f5-8c9ccfd415aa	4bfce604-c23f-530e-8c8e-a24764e1667a	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-09-02 18:28:22.766+00
15908023-5df8-425d-8f05-a970daea29fc	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-09-04 13:56:22.762+00
3cce3f52-1ec9-4b41-bfe0-3c2822d065b3	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-04 13:58:22.762+00
950356e6-e8a7-492f-aa92-2b90c89a5098	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT89M"}	2025-09-04 15:27:22.762+00
4a924841-33db-42ae-9e2d-890b88d962ad	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 5, "scaled": 0.05}}	2025-09-04 15:28:22.762+00
e22d20bb-51b0-49bc-a5da-05a9bb07871d	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-07 15:43:22.762+00
500889f7-a5dc-47e2-885a-c00d6a2e07b4	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT91M"}	2025-09-07 17:14:22.762+00
21c6b0e2-b301-412e-a4f6-75bae1e13066	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-09-07 17:15:22.762+00
ff6a297c-0b64-47a0-ae49-1e472376c55e	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-09-08 17:44:22.762+00
d0d12806-9658-4085-9354-b55f3b3fffd2	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-08 17:46:22.762+00
1c386ea1-efbc-4325-b210-17f4f7594d64	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT78M"}	2025-09-08 19:04:22.762+00
5f2f1b49-901d-448a-a28e-16598cfc061b	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 13, "scaled": 0.13}}	2025-09-08 19:05:22.762+00
1e3964cd-3861-4f9c-a7dd-cf49bbc33940	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/searched	\N	2025-09-09 16:11:22.762+00
f9ebbbb1-49a4-48d1-872a-c79cef269b19	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-09 16:13:22.762+00
89511ef3-f276-4719-9a90-58b324fbc2b3	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT78M"}	2025-09-09 17:31:22.762+00
189704dc-94ba-42b0-9d7f-29bed0f79f7f	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 0, "scaled": 0.0}}	2025-09-09 17:32:22.762+00
bdc26e8d-1c7d-456c-a135-9bdd4e19d60b	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.660595339547198}}	2025-09-09 19:04:22.762+00
0943950c-2645-4dad-bfa5-c1413b77c252	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 66, "scaled": 0.660595339547198}}	2025-09-09 19:05:22.762+00
4fc05f42-2c52-4abc-b75a-596a1c4d592a	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	f8743c64-6b32-5a84-a231-88eaa828b8f3	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 19, "scaled": 0.19}}	2025-09-09 19:06:22.762+00
c9aeaa97-15f3-4db3-af33-5b3b248bd955	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-11 15:51:22.762+00
6e27e536-3050-4e62-900a-e89a79b00f5b	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT93M"}	2025-09-11 17:24:22.762+00
aa9ca209-cc04-4937-aaf6-b7842952fd0a	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 45, "scaled": 0.45}}	2025-09-11 17:25:22.762+00
0695280d-bd10-4af3-877f-f351721dd5c1	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-13 14:40:22.762+00
1f1cb20a-700d-42e1-a80a-fe2423db5ffe	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT70M"}	2025-09-13 15:50:22.762+00
22e2b787-eeb2-47e6-ae37-1279035feddb	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-09-13 15:51:22.762+00
f8acfa65-b1cd-438f-813d-07b603db365e	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-09-13 15:54:22.762+00
11fb05a4-a1be-4ae6-a487-77901d2171ba	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-15 14:05:22.762+00
5b354927-04c6-4f31-861d-e46ba31973bd	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT94M"}	2025-09-15 15:39:22.762+00
1854bdf9-ad70-4664-a283-bdf745b92265	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 40, "scaled": 0.4}}	2025-09-15 15:40:22.762+00
edd786c1-c12a-4d68-bbf5-5464ccbbeffe	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-09-15 15:45:22.762+00
19ae9b23-22fe-4b8e-b648-ecfa8a1b59a0	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/searched	\N	2025-09-18 14:34:22.762+00
24a66b62-6f24-440d-844a-dfbf99e9e2cc	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-18 14:38:22.762+00
a0a7d170-738b-40aa-8077-63863d8f09ce	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT67M"}	2025-09-18 15:45:22.762+00
12ec2258-d246-485d-957a-98789a582196	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-09-18 15:46:22.762+00
1a548012-0fb7-4519-b701-769aaa3d57b5	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-09-18 15:51:22.762+00
4ce9aa41-2e55-4e93-b731-104779219803	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 94, "scaled": 0.9481336375195806}}	2025-09-18 17:42:22.762+00
773eead5-c974-4996-a7cf-b42b88235360	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 94, "scaled": 0.9481336375195806}}	2025-09-18 17:43:22.762+00
cf9920cc-d36a-47f8-acfc-82626d711001	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	02d82fe4-bdb5-56b8-b0e6-c2a377fb75fb	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-09-18 17:44:22.762+00
edc1f438-6513-4bdd-8c7c-b6d840d57c57	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-22 12:16:22.762+00
77082fab-4662-4c6a-bf84-7448e8795a90	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT96M"}	2025-09-22 13:52:22.762+00
03c7bcc4-4939-4098-a464-9f6c755996b4	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 62, "scaled": 0.62}}	2025-09-22 13:53:22.762+00
ede46b0c-27f1-4b2b-8cc5-95f8f5655b95	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 1}}	2025-09-22 13:58:22.762+00
9903388b-0354-4c9e-aec9-45ebb9a2550e	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-25 13:20:22.762+00
3b88c2fc-acbe-4ea9-b0fb-8b9d07a7ffb7	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT92M"}	2025-09-25 14:52:22.762+00
55d70fd9-322a-4d2d-a79c-26173f80948e	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 73, "scaled": 0.73}}	2025-09-25 14:53:22.762+00
63137971-4d6d-4fa6-8852-f5a7a4fc1a67	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-09-28 13:37:22.762+00
9e112913-31e3-4469-92c8-b5864c2b63c5	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-28 13:40:22.762+00
e9f4494b-b6a7-41b6-a1f1-e1141615c1e8	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT84M"}	2025-09-28 15:04:22.762+00
8fa53261-ee13-4775-aaa9-3193b98d9947	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 56, "scaled": 0.56}}	2025-09-28 15:05:22.762+00
748ca4aa-bfee-4939-aaf8-a4ddb147b0cf	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-29 11:44:22.762+00
aa3ccb01-6822-4d1d-8e68-67646f93dcab	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT65M"}	2025-09-29 12:49:22.762+00
b6539132-76c3-4a93-92fa-d70dc5d1f125	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 68, "scaled": 0.68}}	2025-09-29 12:50:22.762+00
62dab37f-08dd-4d70-96ab-b4208a542186	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/searched	\N	2025-09-30 16:14:22.762+00
cba0646a-c861-4d88-93c1-2135e5b1ae45	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/initialized	\N	2025-09-30 16:17:22.762+00
d4ab62cf-3e4b-448f-a9a3-95d649a97833	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT90M"}	2025-09-30 17:47:22.762+00
6f7da7d7-5259-43c0-a526-7a2e71f1cfec	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 88, "scaled": 0.88}}	2025-09-30 17:48:22.762+00
bfee56c1-625b-498e-9a8d-783edab54816	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.5375303320628895}}	2025-09-30 21:01:22.762+00
f6ce0314-23ae-493a-ae39-882538d6788e	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 53, "scaled": 0.5375303320628895}}	2025-09-30 21:02:22.762+00
3c22b36d-014b-4862-867b-ac5fe383af76	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	a38e6922-2eda-5548-9bc7-bd5f8e33cf73	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 99, "scaled": 0.99}}	2025-09-30 21:03:22.762+00
1bce6fdc-ddbe-48a5-9fa0-295cfcdef8a8	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-10-02 14:56:22.762+00
55e535a6-eef4-423e-91ef-87ca965b8a44	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT73M"}	2025-10-02 16:09:22.762+00
62c94cf0-4805-4f00-964e-f6249b17cbfb	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 59, "scaled": 0.59}}	2025-10-02 16:10:22.762+00
0623b350-4a07-40b7-9ec6-9168fb67fb0d	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-10-30 16:54:22.762+00
8a8160f0-dbdb-4bdd-80ad-fd975b177fa3	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 5}}	2025-10-02 16:13:22.762+00
671f94f8-28b9-452c-8b51-4c53dedc49d4	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-10-05 16:28:22.762+00
9dc36133-bb05-4c9c-85ac-0c6e3af7eaff	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-10-05 16:32:22.762+00
de0cffd6-775e-4082-81d2-b5117a0791b7	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT76M"}	2025-10-05 17:48:22.762+00
91a7ceac-dd7f-47a0-a9d7-ea00e99c7ad8	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 79, "scaled": 0.79}}	2025-10-05 17:49:22.762+00
e74fecf2-ba9b-4864-b678-980a7ff4f43c	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-10-05 17:53:22.762+00
47933f7a-d472-446e-9e3f-d3eafe42645a	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-10-08 11:52:22.762+00
4567cd6f-f5af-41d6-808d-9e1ed98e7970	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT84M"}	2025-10-08 13:16:22.762+00
2aa163d3-0e6c-4cdd-87e4-1cb2007348b9	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.89}}	2025-10-08 13:17:22.762+00
59def36d-ba4d-4d8c-a719-cef5d3dfd06a	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-10-11 11:03:22.762+00
3375e9b4-12d3-4eff-a8f2-34c02a864762	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT68M"}	2025-10-11 12:11:22.762+00
d024114e-770d-4711-a0db-1fad47a91014	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 100, "scaled": 1.0}}	2025-10-11 12:12:22.762+00
9e6c6e73-ec4e-4e2c-a780-292286c3fa67	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/searched	\N	2025-10-14 14:31:22.762+00
fa93e081-f87c-4d02-a394-3fa1b8bed50f	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/initialized	\N	2025-10-14 14:34:22.762+00
510a8c03-fa91-4022-b3d4-8d41c39f91bb	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT74M"}	2025-10-14 15:48:22.762+00
1b636c0f-c9f5-49b8-8b7e-6f860dd78aa1	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 83, "scaled": 0.83}}	2025-10-14 15:49:22.762+00
a66f1b96-f7ac-4be2-b116-b6d438b9fcd7	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.8975096188290277}}	2025-10-14 19:08:22.762+00
acf57505-d280-4dfb-9854-6bdf51d08d45	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 89, "scaled": 0.8975096188290277}}	2025-10-14 19:09:22.762+00
ee7ee75f-e7e6-424d-9270-4eecd9f9da73	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0895d383-5f59-51b2-ae8c-e0b985d81f1f	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 63, "scaled": 0.63}}	2025-10-14 19:10:22.762+00
61925683-6e0a-453b-b533-7ad0db44adba	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-10-17 13:51:22.762+00
cb35847f-1364-45a5-a7ed-140d7f832789	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-10-17 13:56:22.762+00
cfc20df8-3c13-4dd1-9ef8-1b833128441a	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT83M"}	2025-10-17 15:19:22.762+00
6d5ad7a0-b80e-4ac9-b6ba-7604c43cb778	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 80, "scaled": 0.8}}	2025-10-17 15:20:22.762+00
1b2a9f74-2e92-4947-8027-e14d97e718f7	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-10-17 15:23:22.762+00
aaef0430-821a-4bd8-94fb-ce04925690fe	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-10-18 16:17:22.762+00
90bd449c-d1d7-4281-9c7f-a132e889797c	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT86M"}	2025-10-18 17:43:22.762+00
ce26f0ed-fa6a-4831-8cd6-ee9eabe17b8b	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 64, "scaled": 0.64}}	2025-10-18 17:44:22.762+00
549d77e1-165b-4f36-9ed6-f6bef9da9b6c	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-10-21 12:40:22.762+00
d6c41740-2c30-487e-ba06-5963683fd03c	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT97M"}	2025-10-21 14:17:22.762+00
7dcd9eff-9e76-423d-94ae-cbb9e1f26346	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 47, "scaled": 0.47}}	2025-10-21 14:18:22.762+00
1aeee2f7-6c89-4643-af95-9dd014cb570f	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-10-24 12:35:22.762+00
9ee08b5b-765f-467d-b729-dd644e6ae0ab	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT83M"}	2025-10-24 13:58:22.762+00
241b7856-9953-4f4e-9f6b-12bd78d582dc	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 30, "scaled": 0.3}}	2025-10-24 13:59:22.762+00
3e3c7439-56c4-4720-a2a2-8126cb670374	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/searched	\N	2025-10-25 11:49:22.762+00
1646fe67-bae7-4318-84b1-3f66df64a9ee	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-10-25 11:54:22.762+00
7929cd5c-ad2f-4e62-8030-c31cc8666711	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT84M"}	2025-10-25 13:18:22.762+00
f1439b51-5ba5-424f-abcf-ebd319d6a8da	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 41, "scaled": 0.41}}	2025-10-25 13:19:22.762+00
70f5d110-8734-43a4-af8b-7f82c1e2456b	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/initialized	\N	2025-10-28 13:36:22.762+00
241867bf-bc5d-4065-a3e4-0bdbb075fc56	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT65M"}	2025-10-28 14:41:22.762+00
fde72e9b-7d0c-4d81-b750-f2bfc3a2c702	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 22, "scaled": 0.22}}	2025-10-28 14:42:22.762+00
fe559e45-7f65-4579-a702-3690296b58bb	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 3}}	2025-10-28 14:46:22.762+00
9dfd4baa-40d9-4a9e-8386-98c337973c33	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.7235884048218484}}	2025-10-28 18:37:22.762+00
8cbd73e3-7856-4f86-98ca-a005a41dce78	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 72, "scaled": 0.7235884048218484}}	2025-10-28 18:38:22.762+00
64c1cad9-217c-4fe8-afca-f4347f47d359	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	d79afb6a-4da1-59a3-aca1-a837bf3e62aa	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 37, "scaled": 0.37}}	2025-10-28 18:39:22.762+00
72b37e94-de40-4694-944b-fb77c5d632aa	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-10-30 16:49:22.762+00
10f67fc0-cac1-4502-a312-921352c39c74	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT76M"}	2025-10-30 18:10:22.762+00
27fe98ad-16d9-4ad2-80ae-2da329807bed	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 35, "scaled": 0.35}}	2025-10-30 18:11:22.762+00
7e416c39-ef53-49c9-bc2f-e77972258868	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-10-31 12:51:22.762+00
642ff9f8-2c3b-44b4-9c00-3737e515f3ab	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT74M"}	2025-10-31 14:05:22.762+00
529d12ee-9aab-49ff-ab94-b4a877f70c1c	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 50, "scaled": 0.5}}	2025-10-31 14:06:22.762+00
c349b3f8-4dac-46d0-8c16-720b24427de4	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-11-01 17:25:22.762+00
712b0fae-dbf9-4cc8-99c2-0cae8736feda	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-11-01 17:28:22.762+00
cab90a2d-a2ae-45f0-a758-16d058213aea	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT95M"}	2025-11-01 19:03:22.762+00
b4c9e124-dfc7-4746-9fc3-046f5e28785e	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 31, "scaled": 0.31}}	2025-11-01 19:04:22.762+00
94f4c992-ba2a-4f40-8b82-939ff20c51b0	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/searched	\N	2025-11-02 13:30:22.762+00
d86d780e-3daa-4577-91d0-208382a9bbe5	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-11-02 13:32:22.762+00
f14d4241-fcf7-4d4f-ba96-0d6fba871b35	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT66M"}	2025-11-02 14:38:22.762+00
6cb53404-5e32-4a04-8f3f-f4f067e910a1	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 44, "scaled": 0.44}}	2025-11-02 14:39:22.762+00
d385a64a-a6fe-442b-9c75-bf21e3486929	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/initialized	\N	2025-11-03 11:32:22.762+00
016dc9f3-0651-4c2f-a5e8-d9e004666481	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/exited	{"duration": "PT67M"}	2025-11-03 12:39:22.762+00
068b0ed2-a1c5-4108-b0b3-36b093e0a01b	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 25, "scaled": 0.25}}	2025-11-03 12:40:22.762+00
c472ebf3-0559-43a7-b4af-b461b2fa8851	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/rated	{"score": {"max": 5, "min": 1, "raw": 2}}	2025-11-03 12:41:22.762+00
b0e2b6af-5a8d-437f-b8b6-790406cdc05d	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/scored	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.7793662746563452}}	2025-11-03 13:44:22.762+00
8c727a02-7c50-4321-94eb-c470db2c3574	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/completed	{"score": {"max": 100, "min": 0, "raw": 77, "scaled": 0.7793662746563452}}	2025-11-03 13:45:22.762+00
4e379177-f3b8-45d0-984c-2ccbeae76dbe	92bf70e3-1598-5b49-9db4-d4b7dcff8d55	0f8226a0-d513-534c-871b-15d9f310349b	http://adlnet.gov/expapi/verbs/evaluated	{"score": {"max": 100, "min": 0, "raw": 10, "scaled": 0.1}}	2025-11-03 13:46:22.762+00
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

