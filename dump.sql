--
-- PostgreSQL database dump
--

\restrict 7WWwFZswUNhmXFQuo8JyPQFu0pqSXCHq10GtBv7OQyogDB9lWdWnDYomW317RTQ

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

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
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    description text NOT NULL,
    image_url text NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: stotrams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stotrams (
    id integer NOT NULL,
    category_id integer NOT NULL,
    name text NOT NULL,
    subcategory text,
    video_url text,
    telugu_pdf_url text,
    english_pdf_url text,
    kannada_pdf_url text,
    sanskrit_pdf_url text,
    sort_order integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.stotrams OWNER TO postgres;

--
-- Name: stotrams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stotrams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stotrams_id_seq OWNER TO postgres;

--
-- Name: stotrams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stotrams_id_seq OWNED BY public.stotrams.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: stotrams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stotrams ALTER COLUMN id SET DEFAULT nextval('public.stotrams_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, slug, description, image_url, sort_order) FROM stdin;
1	Ganesha Stotrams	ganesha	Devotional hymns dedicated to Lord Ganesha, the remover of obstacles	/images/ganesha.png	1
2	Subramanya Stotrams	subramanya	Sacred prayers to Lord Subramanya (Kartikeya), the commander of the divine army	/images/subramanya.png	2
3	Siva Stotrams	shiva	Devotional hymns to Lord Shiva, the destroyer and transformer	/images/shiva.png	3
4	Devi Stotrams	devi	Sacred prayers to the Divine Mother in her many forms	/images/devi.png	4
5	Vishnu Stotrams	vishnu	Devotional hymns to Lord Vishnu, the preserver of the universe	/images/vishnu.png	5
6	Surya Stotrams	surya	Sacred prayers to Surya, the Sun God and source of all energy	/images/surya.png	6
7	Guru Stotrams	guru	Devotional hymns honoring the spiritual teacher and guru lineage	/images/guru.png	7
8	Hanuman Stotrams	hanuman	Sacred prayers to Lord Hanuman, the embodiment of devotion and strength	/images/hanuman.png	8
\.


--
-- Data for Name: stotrams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stotrams (id, category_id, name, subcategory, video_url, telugu_pdf_url, english_pdf_url, kannada_pdf_url, sanskrit_pdf_url, sort_order) FROM stdin;
1	1	Sri Ganesha Pancharatnam	\N	https://www.youtube.com/watch?v=ALIo0IrqyiE	https://vedam-nadam.org/wp-content/uploads/2024/08/Ganesha_Pancharatna_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Ganesha_Pancharatna_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Ganesha_Pancharatna_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Ganesha_Pancharatna_Stotram_Sanskrit.pdf	1
2	1	Sankatanasana Ganesha Stotram	\N	https://youtu.be/kA6jcZrI_yk	https://vedam-nadam.org/wp-content/uploads/2024/08/Sankatanasana_Ganesha_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Sankatanasana_Ganesha_Stotram_Englsih.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Sankatanasana_Ganesha_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Sankatanasana_Ganesha_Stotram_Sanskrit.pdf	2
3	1	Ganesha Pratahsmarami Stotram	\N	https://www.youtube.com/watch?v=oPPFytwtd6k	https://vedam-nadam.org/wp-content/uploads/2024/08/Ganesha_Pratahsmarana_Stotram.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Ganesha_Pratahsmarami_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Ganesha_Pratahsmarana_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Ganesha_Pratahsmarana_Stotram_Sanskrit.pdf	3
4	1	Ganesha Ekavimsathi Namavali	\N	https://www.youtube.com/watch?v=OhJM9tQTeOk	https://vedam-nadam.org/wp-content/uploads/2024/08/Ganesha_Ekavimsathi_Namavali_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Ganesha_Ekavimsathi_Namavali_Englisg.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Ganesha_Ekavimsathi_Namavali_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Ganesha_Ekavimsathi_Namavali_Sanskrit.pdf	4
5	2	Subrahmanya Bhujamga Prayata Stotram	\N	https://youtu.be/41gMNI2J7ak	https://vedam-nadam.org/wp-content/uploads/2024/08/Subrahmanya_Bhujanga_Prayata_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Subrahmanya_Bhujanga_Prayata_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Subrahmanya_Bhujanga_Prayata_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Subrahmanya_Bhujanga_Prayata_Stotram_Sanskrit.pdf	1
6	2	Pragna Vivardhana Karthikeya Stotram	\N	https://youtu.be/Hpp6SPE7yE4	https://vedam-nadam.org/wp-content/uploads/2024/08/Pragnavivardhana_Karthikeya_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Pragnavivardhana_Karthikeya_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Pragnavivardhana_Karthikeya_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Pragnavivardhana_Karthikeya_Stotram_Sanskrit.pdf	2
7	3	Chandrasekarashtakam	\N	https://www.youtube.com/watch?v=MU0mLvD5r38	https://vedam-nadam.org/wp-content/uploads/2024/09/Chandrasekara_Ashtakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Chandrasekara_Ashtakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Chandrasekara_Ashtakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Chandrasekara_Ashtakam_Sanskrit.pdf	1
8	3	Dakshina Murthy Stotram	\N	https://youtu.be/uIFXAV_xnNI	https://vedam-nadam.org/wp-content/uploads/2024/09/Dakshinamurthy_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Dakshinamurthy_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Dakshinamurthy_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Dakshinamurthy_Stotram_Sanskrit.pdf	2
9	3	Daridrya Dahana Siva Stotram	\N	https://youtu.be/U3Xvti_un-M	https://vedam-nadam.org/wp-content/uploads/2024/09/Daridradahana_Siva_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Daridradahana_Siva_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Daridradahana_Siva_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Daridradahana_Siva_Stotram_Sanskrit.pdf	3
10	3	Dwadasa Jyothirlinga Stotram	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Dwadasa_Jyothirlinga_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Dwadasa_Jyothirlinga_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Dwadasa_Jyothirlinga_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Dwadasa_Jyothirlinga_Stotram_Sanskrit.pdf	4
11	3	Kalabhairavashtakam	\N	https://www.youtube.com/watch?v=Cs7QpsVf-rs	https://vedam-nadam.org/wp-content/uploads/2024/09/Kalabhairava_Ashtakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Kalabhairava_Ashtakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Kalabhairava_Ashtakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Kalabhairava_Ashtakam_Sanskrit.pdf	5
12	3	Margabandhu Stotram	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Margabandu_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Margabandu_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Margabandu_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Margabandu_Stotram_Sanskrit.pdf	6
13	3	Nataraja Stotram	\N	https://youtu.be/9DOxfSCOJgc	https://vedam-nadam.org/wp-content/uploads/2024/09/Nataraja_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Nataraja_Stotram_English.pdf	\N	\N	7
14	3	Siva Manasa Puja	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivamanasa_Puja_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivamanasa_Puja_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivamanasa_Puja_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivamanasa_Puja_Sanskrit.pdf	8
15	3	Siva Panchakshari Stotram	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivapanchakshari_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivapanchakshari_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivapanchakshari_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivapanchakshari_Stotram_Sanskrit.pdf	9
16	3	Sivamahimna Stotram	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivamahimna_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivamahimna_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivamahimna_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivamahimna_Stotram_Sanskrit.pdf	10
17	3	Sivamangalashtakam	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivamangalashtakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivamangalashtakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivamangalashtakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivamangalashtakam_Sanskrit.pdf	11
18	3	Sivanamavalyashtakam	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivanamavali_Ashtakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivanamavali_Ashtakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivanamavali_Ashtakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivanamavali_Ashtakam_Sanskrit.pdf	12
19	3	Sivananda Lahari	\N	https://youtu.be/B_1v77Qh00k	\N	\N	\N	\N	13
20	3	Sivapanchakshara Nakshatramalika Stotram	\N	https://youtu.be/Z8LqUaDjVWQ	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivapanchakshara_Nakshatramala_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivapanchakshara_Nakshatramala_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivapanchakshara_Nakshatramala_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sivapanchakshara_Nakshatramala_Stotram_Sanskrit.pdf	14
21	3	Siva Saharsranamam	\N	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Siva_Sahasranamam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Siva_Sahasranamam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Siva_Sahasranamam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Siva_Sahasranamam_Sanskrit.pdf	15
22	3	Vaidyanathashtakam	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Vydyanaashtakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Vydyanaashtakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Vydyanaashtakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Vydyanaashtakam_Sanskrit.pdf	16
23	4	Argala Stotram	Durga Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Argala_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Argala_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Argala_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Argala_Stotram_Sanskrit.pdf	1
24	4	Arjunakrutha Durga Stotram	Durga Stotrams	https://www.youtube.com/watch?v=e3ZWIAYKZpk	https://vedam-nadam.org/wp-content/uploads/2024/09/Arjunakrutha_Durga_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Arjunakrutha_Durga_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Arjunakrutha_Durga_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Arjunakrutha_Durga_Stotram_Sanskrit.pdf	2
25	4	Durga Chandrakala Sthuti	Durga Stotrams	https://youtu.be/mSSj2A1tK8w	https://vedam-nadam.org/wp-content/uploads/2024/09/DurgaChandrakala_Stuti_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/DurgaChandrakala_Stuti_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/DurgaChandrakala_Stuti_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/DurgaChandrakala_Stuti_Sanskrit.pdf	3
26	4	Durga Dwatrisan Namavali Stotram	Durga Stotrams	https://www.youtube.com/watch?v=C6cJTG8EMo8	https://vedam-nadam.org/wp-content/uploads/2024/09/Durga_Dwatrisan_Namavali_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Durga_Dwatrisan_Namavali_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Durga_Dwatrisan_Namavali_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Durga_Dwatrisan_Namavali_Sanskrit.pdf	4
27	4	Durga Pancharatna Stotram	Durga Stotrams	https://youtu.be/uBm5kEwvXZA	https://vedam-nadam.org/wp-content/uploads/2025/04/Durga_Pancharatna_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Durga_Puncharatna_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Durga_Puncharatna_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Durga_Puncharatna_Stotram_Sanskrit.pdf	5
105	5	Dasakam 5 – Virāṭpuruṣōtpattiḥ	Narayaneeyam	https://youtu.be/NAqmdfWvCIc	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam5_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam5_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam5_Sanskrit.pdf	105
29	4	Kumari Stotram	Durga Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Kumari_Stotram_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Kumari_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Kumari_Stotram_Sanskrit.pdf	7
30	4	Mahishasura Mardhini Stotram	Durga Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Mahishasura_Mardhini_Stotram_Telugu-1.pdf	\N	\N	\N	8
31	4	Gayatri Bhujamga Stotram	Gayatri / Sarada / Syamala Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Gayatri_Bhujanga_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/GayatriBhujangaStotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Gayatri_Bhujanga_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Gayatri_Bhujanga_Stotram_Sanskrit.pdf	9
32	4	Sarada Bhujamga Prayata Ashtakam	Gayatri / Sarada / Syamala Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Sarada_Bhujamga_Prayata_Ashtakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Sarada_Bhujamga_Ashtakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Sarada_Bhujamga_Prayata_Ashtakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Sarada_Bhujamga_Prayata_Ashtakam_Sanskrit.pdf	10
33	4	Syamala Dandakam	Gayatri / Sarada / Syamala Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Syamala_Dandakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Syamala_Dandakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Syamala_Dandakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Syamala_Dandakam_Sanskrit.pdf	11
34	4	Syamala Navaratnamalika Stavam	Gayatri / Sarada / Syamala Stotrams	https://youtu.be/eiviSlkwzTw	https://vedam-nadam.org/wp-content/uploads/2026/01/Syamala_Navaratnamalika_Stavam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Syamala_Navaratnamalika_Stavam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Syamala_Navaratnamalika_Stavam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Syamala_Navaratnamalika_Stavam_Sanskrit.pdf	12
35	4	Anandalahari	Kamakshi / Lalitha Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Anandalahari_Telugui.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Anandalahari_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Anandalahari_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Anandalahari_Sanskrit.pdf	13
36	4	Istakamesvari Stotram	Kamakshi / Lalitha Stotrams	https://www.youtube.com/watch?v=RkVX7MFA_ck	https://vedam-nadam.org/wp-content/uploads/2024/12/Ishtakameswari_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Ishtakameswari_Stotram_Englsih.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Ishtakameswari_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Ishtakameswari_Stotram_Sanskrit.pdf	14
37	4	Kalyanavrushti Stavam	Kamakshi / Lalitha Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Kalyanavrushti_Stavam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Anandalahari_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Kalyanavrushti_Stavam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Kalyanavrushti_Stavam_Sanskrit.pdf	15
38	4	Kamesvaryastakam	Kamakshi / Lalitha Stotrams	https://www.youtube.com/watch?v=pPNsuJH_meE	https://vedam-nadam.org/wp-content/uploads/2024/12/Kaamesvaryashtakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Kaamesvaryashtakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Kaamesvaryashtakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Kaamesvaryashtakam_Sanskrit.pdf	16
39	4	Kamakshi Churnika	Kamakshi / Lalitha Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Kamakshi_Choornika_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Kamakshi_Choornika_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Kamakshi_Choornika_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Kamakshi_Choornika_Sanskrit.pdf	17
40	4	Kamakshi Stotram - 1	Kamakshi / Lalitha Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Kamakshi_Stotram_1_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Kamakshi_Stotram_1_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Kamakshi_Stotram_1_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Kamakshi_Stotram_1_Sanskrit.pdf	18
41	4	Kamakshi Stotram - 2	Kamakshi / Lalitha Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Kamakshi_Stotram_2_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Kamakshi_Stotram_2_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Kamakshi_Stotram_2_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Kamakshi_Stotram_2_Sanskrit.pdf	19
42	4	Lalitha Avirbhava Stuti	Kamakshi / Lalitha Stotrams	https://youtu.be/ThcCs4jVo68	https://vedam-nadam.org/wp-content/uploads/2026/01/Lalitha_Avirbhava_Stuti_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Lalitha_Avirbhava_Stuti_English.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Lalitha_Avirbhava_Stuti_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Lalitha_Avirbhava_Stuti_Sanskrit.pdf	20
43	4	Lalita Pancharatna Stotram	Kamakshi / Lalitha Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Lalitha_Pancharatnam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Lalitha_Pancharatnam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Lalitha_Pancharatnam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Lalitha_Pancharatnam_Sanskrit.pdf	21
44	5	Hayagreeva Stotram	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Hayagreeva_Storam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/HayagrIvaStoram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Hayagreeva_Storam_Kannada-1.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Hayagreeva_Storam_Sanskrit.pdf	1
45	5	Lakshmi Narasimha Pancharatnam	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/LakshmiNarasimha_Pancharatnam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/LakshmiNarasimha_Pancharatnam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/LakshmiNarasimha_Pancharatnam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/LakshmiNarasimha_Pancharatnam_Sanskrit.pdf	2
46	5	Lakshmi Nrusimha Karavalamba Stotram	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Laskhmi_Nrusimha_Karavalamba_Stotram_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Laskhmi_Nrusimha_Karavalamba_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Laskhmi_Nrusimha_Karavalamba_Stotram_Sanskrit.pdf	3
47	5	Madhurashtakam	\N	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Maduraashtakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Maduraashtakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Maduraashtakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Maduraashtakam_Sanskrit.pdf	4
48	5	Medipur Narasimhaswami Suprabhatam	\N	\N	https://vedam-nadam.org/wp-content/uploads/2025/11/Medipur_Narasimhaswami_Suprabhatam_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/11/Medipur_Narasimhaswami_Suprabhatam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/11/Medipur_Narasimhaswami_Suprabhatam_Sanskrit.pdf	5
49	5	Mukundamala	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Mukundamala_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Mukundamala_Kannada-1.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Mukundamala_Sanskrit-1.pdf	6
50	5	Narayana Hrudayam	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Narayana_Hrudayam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Narayana_Hrudayam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Narayana_Hrudayam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Narayana_Hrudayam_Sanskrit.pdf	7
51	5	Runavimochana Narasimha Stotram	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Runavimochana-_Narasimha_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Runavimochana-_Narasimha_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Runavimochana-_Narasimha_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Runavimochana-_Narasimha_Stotram_Sanskrit.pdf	8
52	5	Sudarsanashtakam	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Sudarsanashtakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sudarsanashtakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sudarsanashtakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sudarsanashtakam_Sanskrit.pdf	9
53	5	Venkateswara Ashtakam	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Venkateswara_Ashtakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Venkateswara_Ashtakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Venkateswara_Ashtakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Venkateswara_Ashtakam_Sanskrit.pdf	10
54	5	Vishnu Shatpadi Stotram	\N	https://www.youtube.com/watch?v=cb1a4cEUEW0	https://vedam-nadam.org/wp-content/uploads/2024/09/Vishnushatpadi_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Vishnushatpadi_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Vishnushatpadi_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Vishnushatpadi_Stotram_Sanskrit.pdf	11
55	5	Adivaraha Stotram	\N	https://www.youtube.com/watch?v=dzFgPLj8PHU	https://vedam-nadam.org/wp-content/uploads/2024/12/Adivaraha_Stotram_Bhudevikruta_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Adivaraha_Stotram_Bhudevikruta_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Adivaraha_Stotram_Bhudevikruta_Sanskrit.pdf	12
56	6	Aditya Hrudayam	\N	https://youtu.be/TcWmQ2BPmbE	https://vedam-nadam.org/wp-content/uploads/2024/09/Aditya_Hrydayam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Aditya_Hrydayam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Aditya_Hrydayam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Aditya_Hrydayam_Sanskrit.pdf	1
57	7	Guru Ashtakam	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/08/Guru_Ashtakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Guru_Ashtakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Guru_Ashtakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Guru_Ashtakam_Sanskrit.pdf	1
58	7	Guruparampara	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/08/Guruparampara_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Guruparampara_Stotram_Englsih.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Guruparampara_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Guruparampara_Stotram_Sanskrit.pdf	2
59	7	Hara Haa Sankara! Jaya Jaya Sankara!	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/08/HaraHara_Sankara_Jayajaya_Sankara_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/HaraHara_Sankara_Jayajaya_Sankara_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/HaraHara_Sankara_Jayajaya_Sankara_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/HaraHara_Sankara_Jayajaya_Sankara_Sanskrit.pdf	3
60	7	Maatru Panchakam	\N	https://youtu.be/hjYaEB2APIM	https://vedam-nadam.org/wp-content/uploads/2024/08/MatruPanchakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Matru-Panchakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Matru-Panchakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Matru-Panchakam_Sanskrit.pdf	4
61	7	Sadguru Dasakam	\N	https://youtu.be/XEjqfrMw5nM	https://vedam-nadam.org/wp-content/uploads/2024/08/Sadguru_Dasakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/SadguruDasakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/SadguruDasakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/SadguruDasakam_Sanskrit.pdf	5
62	7	Sri Chandrasekara Gurushthuti Panchakam	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/SriChandraseka_Gurusthuti_Punchakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/SriChandraseka_Gurusthuti_Punchakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/SriChandraseka_Gurusthuti_Punchakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/SriChandraseka_Gurusthuti_Punchakam_Sanskrit.pdf	6
63	7	Totakashtakam	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/08/Totakashtakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Totakashtakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Totakashtakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/08/Totakashtakam_Sanskrit.pdf	7
64	8	Panchamukha Hanuman Stotram	\N	https://youtu.be/HBtsoLlIYrM	https://vedam-nadam.org/wp-content/uploads/2025/11/Panchamukha_Hanuman_Stotram.pdf	https://vedam-nadam.org/wp-content/uploads/2025/11/Panchamukha_Hanuman_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2025/11/Panchamukha_Hanuman_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/11/Panchamukha_Hanuman_Stotram_Sanskrit.pdf	1
65	8	Hanuman Stotram Veebhishanakrutha	\N	https://youtu.be/lCwJCbjK-Dc	https://vedam-nadam.org/wp-content/uploads/2025/04/Hanuman_Stotram_Veebhishanakrutha_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/04/Hanuman_Stotram_Veebhishanakrutha_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/04/Hanuman_Stotram_Veebhishanakrutha_Sanskrit.pdf	2
28	4	Kanakadurgananda Lahari	Durga Stotrams	\N	\N	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Sri_Kanakadurgaanandalahari_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Sri_Kanakadurgaanandalahari_Sanskrit.pdf	6
66	4	Bala Stotram	Kamakshi / Lalitha Stotrams	\N	\N	\N	\N	\N	22
67	4	Lalitha Sahasranamam	Kamakshi / Lalitha Stotrams	https://www.youtube.com/watch?v=Wy3ThWhR8-A&t=14s	\N	\N	\N	\N	23
68	4	Mookapanchasathi - Arya Satakam	Kamakshi / Lalitha Stotrams	\N	\N	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Arya_Sathakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Arya_Sathakam_Sanskrit.pdf	24
69	4	Mookapanchasathi - Paadaravinda Satakam	Kamakshi / Lalitha Stotrams	\N	\N	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Paadaravinda_Sathakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Paadaravinda_Sathakam_Sanskrit.pdf	25
70	4	Mookapanchasathi - Sthuti Satakam	Kamakshi / Lalitha Stotrams	\N	\N	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Sthuti_Sathakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Sthuti_Sathakam_Sanskrit.pdf	26
71	4	Mookapanchasathi - Kataksha Satakam	Kamakshi / Lalitha Stotrams	\N	\N	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Kataksha_Sathakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Kataksha_Sathakam_Sanskrit.pdf	27
72	4	Mookapanchasathi - Mandasmitha Satakam	Kamakshi / Lalitha Stotrams	\N	\N	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Mandasmitha_Sathakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Mandasmitha_Sathakam_Sanskrit.pdf	28
73	4	Rajarajeswari Mantramalika Stotram	Kamakshi / Lalitha Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Rajarajeswari_Mantramalika_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Rajarajeswari_Mantramalika_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Rajarajeswari_Mantramalika_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Rajarajeswari_Mantramalika_Stotram_Sanskrit.pdf	29
74	4	Soundaryalahari Stotram	Kamakshi / Lalitha Stotrams	https://www.youtube.com/watch?v=X2UUQCUrm-c	\N	\N	\N	\N	30
75	4	Tripuraa Tilaka Stotram	Kamakshi / Lalitha Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Tripuraa_Tilaka_Stotram_Telugu-1.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Tripuraa_Tilaka_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Tripuraa_Tilaka_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Tripuraa_Tilaka_Stotram_Sanskrit.pdf	31
76	4	Kanakadhara Stotram	Lakshmi Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2025/03/Kanakadara_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Kanakadara_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2025/03/Kanakadara_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/03/Kanakadara_Stotram_Sanskrit.pdf	32
77	4	Lakshmi Astottara Satanama Stotram	Lakshmi Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Lakshmi_AshotaraSathanam_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Lakshmi_AshotaraSathanam_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Lakshmi_AshotaraSathanam_Stotram_Kannada-1.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Lakshmi_AshotaraSathanam_Stotram_Sanskrit-1.pdf	33
78	4	Lakshmi Hrudyam	Lakshmi Stotrams	\N	\N	\N	\N	\N	34
79	4	Sri Mahalakshmi Ashtakam	Lakshmi Stotrams	https://www.youtube.com/watch?v=NbYApLOy0u8	https://vedam-nadam.org/wp-content/uploads/2024/09/Mahalakshmaashtakam_Indrakruta_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Mahalakshmaashtakam_Indrakruta_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Mahalakshmaashtakam_Indrakruta_Kannada-1.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Mahalakshmaashtakam_Indrakruta_Sanskeit-1.pdf	35
80	4	Mahalakshmi Chaturvimsa Namavali	Lakshmi Stotrams	https://youtu.be/7768brBRgn8	https://vedam-nadam.org/wp-content/uploads/2024/09/Mahalakshmi_Chaturvimsa_Namavali_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Mahalakshmi_Chaturvimsa_Namavali_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Mahalakshmi_Chaturvimsa_Namavali_Kannada-1.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Mahalakshmi_Chaturvimsa_Namavali_Sanskrit-1.pdf	36
81	4	Mahalakshmi Stotram Vishnupuranam	Lakshmi Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Mahalakshmi_Stotram_Vishnupuranam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Mahalakshmi_Stotram_Vishnupurana_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Mahalakshmi_Stotram_Vishnupuranam_Kannada-1.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Mahalakshmi_Stotram_Vishnupuranam_Sanskrit-1.pdf	37
82	4	Viswa Raksha Kavacha Namavali	Lakshmi Stotrams	https://www.youtube.com/watch?v=uHqFq-QU0nk	https://vedam-nadam.org/wp-content/uploads/2024/12/Viswaraksha_Kavacha_Namavali_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Viswaraksha_Kavacha_Namavali_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Viswaraksha_Kavacha_Namavali_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Viswaraksha_Kavacha_Namavali_Sanskrit.pdf	38
83	4	Bhavani Ashtakam	Parvati Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Bhavani_Ashtakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Bhavani_Ashtakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Bhavani_Ashtakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Bhavani_Ashtakam_Sanskrit.pdf	39
84	4	Devi Asvadhati Stotram	Parvati Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Devi_Aswadati_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Devi_Aswadati_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Devi_Aswadati_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Devi_Aswadati_Stotram_Sanskrit.pdf	40
85	4	Garbharaksha Stotram	Parvati Stotrams	https://www.youtube.com/watch?v=38dJUx4xe_g	https://vedam-nadam.org/wp-content/uploads/2024/09/Garbharaksha_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Garbharaksha_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Garbharaksha_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Garbharaksha_Stotram_Sanskrit.pdf	41
86	4	Gouri Dasakam	Parvati Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/Gouri_Dasakam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Gouri_Dasakam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Gouri_Dasakam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/Gouri_Dasakam_Sanskrit.pdf	42
87	4	Mangala Chandika Stotram	Parvati Stotrams	https://www.youtube.com/watch?v=01O2ssXCmmI	https://vedam-nadam.org/wp-content/uploads/2024/09/MangalaChandi_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/MangalaChandi_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/MangalaChandi_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/MangalaChandi_Stotram_Sanskrit.pdf	43
88	4	Navaratnamalika Stotram	Parvati Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/09/NavaratnaMalika_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/NavaratnaMalika_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/NavaratnaMalika_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/09/NavaratnaMalika_Stotram_Sanskrit.pdf	44
89	4	Swayamvara Parvati Mantramala Stotram	Parvati Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Swayamvara_Parvati_Mantramala_Stotram_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Swayamvara_Parvati_Mantramala_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Swayamvara_Parvati_Mantramala_Stotram_Sanskrit.pdf	45
90	4	Maanasa Devi Dwadasanama Stotram	Other Devi Stotrams	https://www.youtube.com/watch?v=8V307WtMbCk	https://vedam-nadam.org/wp-content/uploads/2024/12/Maanasa_Devi_Dwadasanama_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Maanasa_Devi_Dwadasanama_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Maanasa_Devi_Dwadasanama_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Maanasa_Devi_Dwadasanama_Stotram_Sanskrit.pdf	46
91	4	Meenakshi Pancharatnam Stotram	Other Devi Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Meenakshi_Pancharatnam_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Meenakshi_Pancharatnam_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Meenakshi_Pancharatnam_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Meenakshi_Pancharatnam_Sanskrit.pdf	47
92	4	Tulasi Stotram	Other Devi Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Tulasi_Stotram_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Tulasi_Stotram_English.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Tulasi_Stotram_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Tulasi_Stotram_Sanskrit.pdf	48
93	4	Varahai Sthuti Stotram	Other Devi Stotrams	\N	https://vedam-nadam.org/wp-content/uploads/2024/12/Varahai_Sthuti_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Varahai_Sthut_Englishi.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Varahai_Sthuti_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2024/12/Varahai_Sthuti_Sanskrit.pdf	49
94	4	Ganga Stotram	Nadi Stotrams	\N	\N	\N	\N	\N	50
95	4	Godavari Stotram	Nadi Stotrams	\N	\N	\N	\N	\N	51
96	4	Narmadastakam	Nadi Stotrams	\N	\N	\N	\N	\N	52
97	4	Yamunastakam	Nadi Stotrams	\N	\N	\N	\N	\N	53
98	5	Govindashtakam	\N	\N	\N	\N	\N	\N	0
99	5	Krishnashtakam	\N	\N	\N	\N	\N	\N	2
100	5	Dasakam 0 – Narayaneeyam Introduction by Prof. Dr. Dhoolypala Ramakrishna Garu	Narayaneeyam	https://youtu.be/AVRbGDATg2k	\N	\N	\N	\N	100
106	5	Dasakam 6 – Virāṭpuruṣudu Jagadātma Tatvam	Narayaneeyam	https://youtu.be/-18OppiqcxM	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam6_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam6_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam6_Sanskrit.pdf	106
107	5	Dasakam 7 – Hīranyagarbhōtpattiḥ	Narayaneeyam	https://youtu.be/gRouUhUIUrI	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam7_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam7_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam7_Sanskrit.pdf	107
108	5	Dasakam 8 – Pralayavarṇanamu	Narayaneeyam	https://youtu.be/23Gu1uc7z_U	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam8_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam8_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam8_Sanskrit.pdf	108
109	5	Dasakam 9 – Jagathṣrṣtiḥ Prakāra̱ Varṇanamu	Narayaneeyam	https://youtu.be/l2vZbA5el_Q	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam9_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam9_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam9_Sanskrit.pdf	109
110	5	Dasakam 10 – Sṛsībeda Varṇanamu	Narayaneeyam	https://youtu.be/JqswigIqugs	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam10_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam10_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam10_Sanskrit.pdf	110
111	5	Dasakam 11 – Hiraṇyāksha – Hiraṇyakaśipula Uthpathī	Narayaneeyam	https://youtu.be/i39MnD02ZGk	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam11_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam11_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam11_Sanskrit.pdf	111
112	5	Dasakam 12 – Varāhāvatāram	Narayaneeyam	https://youtu.be/RTFtfBwVeDQ	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam12_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam12_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam12_Sanskrit.pdf	112
113	5	Dasakam 13 – Hiraṇyākṣavadha	Narayaneeyam	https://youtu.be/hKFg71rRP0o	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam13_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam13_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam13_Sanskrit.pdf	113
114	5	Dasakam 14 – Kapilōpākhyānam	Narayaneeyam	https://youtu.be/MIQKsJYFyuM	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam14_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam14_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam14_Sanskrit.pdf	114
115	5	Dasakam 15 – Kapilōpadēśam	Narayaneeyam	https://youtu.be/J-mL-1ujILg	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam15_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam15_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam15_Sanskrit.pdf	115
116	5	Dasakam 16 – Naranārāyanāvathāram̍	Narayaneeyam	https://youtu.be/b34QxHiwyd8	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam16_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam16_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam16_Sanskrit.pdf	116
117	5	Dasakam 17 – Dhruva Caritam	Narayaneeyam	https://youtu.be/whhDzzKNtgE	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam17_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam17_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam17_Sanskrit.pdf	117
118	5	Dasakam 18 – Pṛthu Caritam	Narayaneeyam	https://youtu.be/saDFAFnLspk	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam18_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam18_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam18_Sanskrit.pdf	118
119	5	Dasakam 19 – Prachētásulu Katha	Narayaneeyam	https://youtu.be/ZNXRQfBp1Z8	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam19_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam19_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam19_Sanskrit.pdf	119
120	5	Dasakam 20 – Ṛṣabhasula Caritam	Narayaneeyam	https://youtu.be/aoYf0Mh9EQg	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam20_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam20_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam20_Sanskrit.pdf	120
121	5	Dasakam 21 – Jambu Dvīpam – Bhagavad́ Upāsanā	Narayaneeyam	https://youtu.be/XgPzUArExc0	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam21_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam21_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam21_Sanskrit.pdf	121
122	5	Dasakam 22 – Ajāmilopākhyānam	Narayaneeyam	https://youtu.be/TaT58SOenfY	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam22_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam22_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam22_Sanskrit.pdf	122
123	5	Dasakam 23 – Citraketōpākhyānam	Narayaneeyam	https://youtu.be/Dr-jbDdK5bQ	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam23_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam23_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam23_Sanskrit.pdf	123
124	5	Dasakam 24 – Prahlād Caritam	Narayaneeyam	https://youtu.be/zRn0djOFw7c	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam24_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam24_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam24_Sanskrit.pdf	124
125	5	Dasakam 25 – Sri Nrusimhāvatāram	Narayaneeyam	https://youtu.be/mq8bhg7LBZQ	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam25_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam25_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam25_Sanskrit.pdf	125
126	5	Dasakam 26 – Gajēndramōkṣam	Narayaneeyam	https://youtu.be/X1RVoJYbAuc	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam26_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam26_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam26_Sanskrit.pdf	126
127	5	Dasakam 27 – Kūrmāvatāram	Narayaneeyam	https://youtu.be/8PsCniZX9Jk	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam27_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam27_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam27_Sanskrit.pdf	127
128	5	Dasakam 28 – Lakṣhmīsavyam̍varam – Amrutōtpattiḥ	Narayaneeyam	https://youtu.be/_jONJ9KD60I	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam28_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam28_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam28_Sanskrit.pdf	128
129	5	Dasakam 29 – Mōhiniavatāram	Narayaneeyam	https://youtu.be/Tkm5pww-W5M	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam29_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam29_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam29_Sanskrit.pdf	129
130	5	Dasakam 30 – Vāmanāvatāram	Narayaneeyam	https://youtu.be/zcs8XoxceoM	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam30_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam30_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam30_Sanskrit.pdf	130
131	5	Dasakam 31 – Bali Darpaśamanam	Narayaneeyam	https://youtu.be/iH_XjZTWCmQ	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam31_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam31_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam31_Sanskrit.pdf	131
132	5	Dasakam 32 – Matsyāvatāram	Narayaneeyam	https://youtu.be/sgMDZirwVtU	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam32_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam32_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam32_Sanskrit.pdf	132
133	5	Dasakam 33 – Aṃbarēsōpākhyānam	Narayaneeyam	https://youtu.be/Yf-pKg599hw	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam33_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam33_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam33_Sanskrit.pdf	133
134	5	Dasakam 34 – Srī Rāmāvatāram – 1	Narayaneeyam	https://youtu.be/XxUr-9V25Ig	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam34_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam34_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam34_Sankrit.pdf	134
135	5	Dasakam 35 – Srī Rāmāvatāram – 2	Narayaneeyam	https://youtu.be/II1lKhVZCt4	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam35_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam35_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam35_Sanskrit.pdf	135
136	5	Dasakam 36 – Paraśurāmāvatāram	Narayaneeyam	https://youtu.be/qTUMMSZJC8s	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam36_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam36_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam36_Sanskrit.pdf	136
137	5	Dasakam 37 – Śrikṛṣnāvatāram	Narayaneeyam	https://youtu.be/ydGSziMUR2s	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam37_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam37_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam37_Sanskrit.pdf	137
138	5	Dasakam 38 – Śrikṛṣnāvatāram – Gokulam	Narayaneeyam	https://youtu.be/cVQ8sdulyqA	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam38_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam38_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam38_Sanskrit.pdf	138
139	5	Dasakam 39 – Yogamāyā Varnanam	Narayaneeyam	https://youtu.be/Kwd5ggH0T68	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam39_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam39_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam39_Sanskrit.pdf	139
140	5	Dasakam 40 – Pūtana Vadha	Narayaneeyam	https://youtu.be/CfgnQuk8dwY	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam40_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam40_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam40_Sanskrit.pdf	140
141	5	Dasakam 41 – Gopīkānandahēlam	Narayaneeyam	https://youtu.be/ZfFTRVopdfU	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam41_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam41_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam41_Sanskrit.pdf	141
142	5	Dasakam 42 – Śakatāsura Vadha	Narayaneeyam	https://youtu.be/--9WI9weS4E	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam42_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam42_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam42_Sanskrit.pdf	142
143	5	Dasakam 43 – Tṛṇāvarta Vadha	Narayaneeyam	https://youtu.be/0OIFHYErUpQ	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam43_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam43_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam43_Sanskrit.pdf	143
144	5	Dasakam 44 – Jātakarmadī Sam̍skram	Narayaneeyam	https://youtu.be/FL8i3Tqpbgw	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam44_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam44_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam44_Sanskrit.pdf	144
145	5	Dasakam 45 – Śrikṛīshnā Balyakr̄dadi	Narayaneeyam	https://youtu.be/bTdeuuAvPlQ	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam45_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam45_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam45_Sanskrit.pdf	145
146	5	Dasakam 46 – Viśvarōpadarśanam	Narayaneeyam	https://youtu.be/6T63-kwcM_w	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam46_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam46_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam46_Sanskrit.pdf	146
147	5	Dasakam 47 – Ulūkhalabandhanam	Narayaneeyam	https://youtu.be/s_9P8aBgaS0	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam47_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam47_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam47_Sanskrit.pdf	147
148	5	Dasakam 48 – Yamlārjunōddhāram	Narayaneeyam	https://youtu.be/uKWlCktIXpM	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam48_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam48_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam48_Sanskrit.pdf	148
149	5	Dasakam 49 – Bṛṇdāvanavihāram	Narayaneeyam	https://youtu.be/6moycGWwfs0	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam49_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam49_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam49_Sanskrit.pdf	149
150	5	Dasakam 50 – Vatsāsura – Bakāsura Vadha	Narayaneeyam	https://youtu.be/NOvTaEvSSF8	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam50_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam50_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam50_Sanskrit.pdf	150
151	5	Dasakam 51 – Aghāsurāvadham	Narayaneeyam	https://youtu.be/JHmbo-a5FdA	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam51_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam51_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam51_Sanskrit.pdf	151
152	5	Dasakam 52 – Brahmakṛta Vatsāpharanam	Narayaneeyam	https://youtu.be/8UkMnhHPJig	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam52_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam52_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam52_Sanskrit.pdf	152
153	5	Dasakam 53 – Dhēnukāsuravadha	Narayaneeyam	https://youtu.be/2a0_xBr8Ju0	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam53_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam53_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam53_Sanskrit.pdf	153
154	5	Dasakam 54 – Kāliyopakhyanam	Narayaneeyam	https://youtu.be/uBmgnaOAI70	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam54_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam54_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam54_Sanskrit.pdf	154
155	5	Dasakam 55 – Kāliyamardhanam	Narayaneeyam	https://youtu.be/A_NLIzrmvFc	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam55_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam55_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam55_Sanskrit.pdf	155
156	5	Dasakam 56 – Kāliyagarvaśamanam – Bhagavaḍanugraham	Narayaneeyam	https://youtu.be/ONtCN7ZLFUw	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam56_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam56_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam56_Sanskrit.pdf	156
157	5	Dasakam 57 – Pralambasura Vadha	Narayaneeyam	https://youtu.be/GotD1yTfC7Y	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam57_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam57_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam57_Sanskrit.pdf	157
158	5	Dasakam 58 – Dāvāgnisaṃrkaṣanaṃ	Narayaneeyam	https://youtu.be/RJF-P4uWXEU	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam58_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam58_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam58_Sanskrit.pdf	158
159	5	Dasakam 59 – Venugānavarananam	Narayaneeyam	https://youtu.be/HR3j43hVMF4	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam59_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam59_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam59_Sanskrit.pdf	159
160	5	Dasakam 60 – Gopikavastraupaharanam	Narayaneeyam	https://youtu.be/-7xl-BvxCqk	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam60_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam60_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam60_Sanskrit.pdf	160
161	5	Dasakam 61 – Viprapatnianugraham	Narayaneeyam	https://youtu.be/JH8qdykDsrI	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam61_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam61_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam61_Sanskrit.pdf	161
162	5	Dasakam 62 – Indrayagnanivaaranam	Narayaneeyam	https://youtu.be/DZ0h-6plDlo	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam62_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam62_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam62_Sanskrit.pdf	162
163	5	Dasakam 63 – Govardhanodharaṇam	Narayaneeyam	https://youtu.be/K6eNsinX1bk	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam63_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam63_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam63_Sanskrit.pdf	163
164	5	Dasakam 64 – Govindapaṭābhiṣekam	Narayaneeyam	https://youtu.be/oiq-g7fVTzc	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam64_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam64_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam64_Sanskrit.pdf	164
165	5	Dasakam 65 – Rāsakriḍāyāṃ Gopīnāṃ Prapatye	Narayaneeyam	https://youtu.be/MpNAF1MmF_Q	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam65_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam65_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam65_Sanskrit.pdf	165
166	5	Dasakam 66 – Rāsakriḍā	Narayaneeyam	https://youtu.be/yRIn6Hhceg8	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam66_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam66_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam66_Sanskrit.pdf	166
167	5	Dasakam 67 – SriKriśanāṃtaradhānam	Narayaneeyam	https://youtu.be/cRkXEQWsJsw	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam67_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam67_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam67_Sanskrit.pdf	167
168	5	Dasakam 68 – Bhagavatsākśatkāram	Narayaneeyam	https://youtu.be/stC7zwx70go	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam68_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam68_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam68_Sanskrit.pdf	168
169	5	Dasakam 69 – Rāsakeli	Narayaneeyam	https://youtu.be/zmMnCehANuA	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam69_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam69_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam69_Sanskrit.pdf	169
170	5	Dasakam 70 – Sudarśanaśāpamokṣādīvarṇanam – Sankhacūḍa-arisṭavadham	Narayaneeyam	https://youtu.be/F298yT0oLRw	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam70_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam70_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam70_Sanskrit.pdf	170
171	5	Dasakam 71 – Kesi – Vyomasuravadha	Narayaneeyam	https://youtu.be/7QxPXTDme9E	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam71_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam71_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam71_Sanskrit.pdf	171
172	5	Dasakam 72 – Akrūraāgamanam	Narayaneeyam	https://youtu.be/uqBsE0PrCrU	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam72_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam72_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam72_Sanskrit.pdf	172
173	5	Dasakam 73 – Mathurāyāṭrā	Narayaneeyam	https://youtu.be/cvwLy8c5o1A	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam73_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam73_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam73_Sanskrit.pdf	173
174	5	Dasakam 74 – Mathurarāpuri Srikrisṇ Leelāvilāsam	Narayaneeyam	https://youtu.be/Bne7I910g2E	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam74_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam74_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam74_Sanskrit.pdf	174
175	5	Dasakam 75 – Kamsa Vadhā	Narayaneeyam	https://youtu.be/lM4r-gGpLPc	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam75_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam75_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam75_Sanskrit.pdf	175
176	5	Dasakam 76 – Udhāvaḍhotyam	Narayaneeyam	https://youtu.be/LNMvf2AZ5HA	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam76_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam76_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam76_Sanskrit.pdf	176
177	5	Dasakam 77 – Jarāsaṃdhādibhī yudhām	Narayaneeyam	https://youtu.be/xdHz84oGRAc	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam77_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam77_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam77_Sanskrit.pdf	177
178	5	Dasakam 78 – Rukminīsandesam	Narayaneeyam	https://youtu.be/BV08nM1y7Y0	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam78_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam78_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam78_Sanskrit.pdf	178
179	5	Dasakam 79 – Rukminīsvayamvaram	Narayaneeyam	https://youtu.be/pB4NL2NcPwo	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam79_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam79_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam79_Sanskrit.pdf	179
180	5	Dasakam 80 – Syamnatkopākhyānam	Narayaneeyam	https://youtu.be/I_PgoFNsZSU	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam80_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam80_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam80_Sanskrit.pdf	180
181	5	Dasakam 81 – Narākāsuravadhā	Narayaneeyam	https://youtu.be/mCsSmtI0aRM	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam81_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam81_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam81_Sanskrit.pdf	181
182	5	Dasakam 82 – Bānāsurayudham	Narayaneeyam	https://youtu.be/nthP9LUJTz0	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam82_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam82_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam82_Sanskrit.pdf	182
183	5	Dasakam 83 – Pauṇḍrakavadhā	Narayaneeyam	https://youtu.be/hzI0ReRaOPI	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam83_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam83_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam83_Sanskrit.pdf	183
184	5	Dasakam 84 – Samantakapancakayāṭrā	Narayaneeyam	https://youtu.be/8R6_OkAJxdU	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam84_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam84_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam84_Sanskrit.pdf	184
185	5	Dasakam 85 – Sisupālavadha	Narayaneeyam	https://youtu.be/LxpxNUfr0EQ	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam85_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam85_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam85_Sanskrit.pdf	185
186	5	Dasakam 86 – Mahābhāratayudhām	Narayaneeyam	https://youtu.be/shATDlyepZ4	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam86_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam86_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam86_Sanskrit.pdf	186
187	5	Dasakam 87 – Kucelopākhyānam	Narayaneeyam	https://youtu.be/nRzEa7py4iI	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam87_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam87_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam87_Sanskrit.pdf	187
188	5	Dasakam 88 – Arjunagarvabhangam	Narayaneeyam	https://youtu.be/hDfyTt7Jr4I	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam88_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam88_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam88_Sanskrit.pdf	188
189	5	Dasakam 89 – Vṛkāsuravadhām – Bruguparikṣanam	Narayaneeyam	https://youtu.be/KAnZ90MfaXo	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam89_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam89_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam89_Sanskrit.pdf	189
190	5	Dasakam 90 – Viṣanūmahatvam	Narayaneeyam	https://youtu.be/cFtCKUcoMG4	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam90_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam90_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam90_Sanskrit.pdf	190
191	5	Dasakam 91 – Bhakti svarūpavarṇanamu	Narayaneeyam	https://youtu.be/fMr0Vj3B1h8	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam91_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam91_Telugu.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam91_Sanskrit.pdf	191
104	5	Dasakam 4 – Ashtāng̱yōgasidhī varnanamu	Narayaneeyam	https://youtu.be/HeCLu-GSCj4	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam4_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam4_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam4_Sanskrit.pdf	104
101	5	Dasakam 1 – Bḥagavaṯ Mahimā	Narayaneeyam	https://youtu.be/fPuVSjaONBo	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam1_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam1_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam1_Sanskrit.pdf	101
102	5	Dasakam 2 – Bḥagavaṯ Svarūpā Bhākthī Mahṯvamu	Narayaneeyam	https://youtu.be/o4V5GOyxiDM	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam2_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam2_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam2_Sanskrit.pdf	102
103	5	Dasakam 3 – Bḥagavaṯ Svarūpā Varnanamu	Narayaneeyam	https://youtu.be/MRB_XGRMStM	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam3_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam3_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam3_Sanskrit.pdf	103
192	5	Dasakam 92 – Karmamiśra bhakti svarūpamu	Narayaneeyam	https://youtu.be/7dvikF8-hpg	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam92_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam92_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam92_Sanskrit.pdf	192
193	5	Dasakam 93 – 24 Guru – Iruvadinālugumondi guruvulu	Narayaneeyam	https://youtu.be/_0qoeQETx6s	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam93_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam93_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam93_Sanskrit.pdf	193
194	5	Dasakam 94 – Tatvajñānōtapatti	Narayaneeyam	https://youtu.be/bgrYGVwBjV4	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam94_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam94_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam94_Sanskrit.pdf	194
195	5	Dasakam 95 – Dhyānayōgamu	Narayaneeyam	https://youtu.be/xpSmXabfHb8	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam95_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam95_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam95_Sanskrit.pdf	195
196	5	Dasakam 96 – Bhagavadiibhūti – bhaktiyōgamu	Narayaneeyam	https://youtu.be/BR1Qo837sdM	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam96_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam96_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam96_Sanskrit.pdf	196
197	5	Dasakam 97 – Uttamabhaktataprārthana, mārkaṇḍēyōpākhyānamu	Narayaneeyam	https://youtu.be/x3n9orOAIzY	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam97_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam97_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam97_Sanskrit.pdf	197
198	5	Dasakam 98 – kesadipadanta rupavarnanam	Narayaneeyam	https://youtu.be/a4nTS6dozns	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam98_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam98_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam98_Sanskrit.pdf	198
199	5	Dasakam 99 – Bhagavanihima	Narayaneeyam	https://youtu.be/k_1-zXWdA_g	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam99_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam99_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam99_Sanskrit.pdf	199
200	5	Dasakam 100 – Kēśādipādāntarūpavarṇanamu	Narayaneeyam	https://youtu.be/E2_u5WQDA0E	https://vedam-nadam.org/wp-content/uploads/2025/12/Dasakam100_Telugu.pdf	\N	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam100_Kannada.pdf	https://vedam-nadam.org/wp-content/uploads/2026/01/Dasakam100_Sanskrit.pdf	200
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 9, true);


--
-- Name: stotrams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stotrams_id_seq', 200, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_unique UNIQUE (slug);


--
-- Name: stotrams stotrams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stotrams
    ADD CONSTRAINT stotrams_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict 7WWwFZswUNhmXFQuo8JyPQFu0pqSXCHq10GtBv7OQyogDB9lWdWnDYomW317RTQ

