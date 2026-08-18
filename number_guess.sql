--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number integer NOT NULL,
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 11, 152, 4);
INSERT INTO public.games VALUES (2, 11, 85, 2);
INSERT INTO public.games VALUES (3, 11, 484, 1);
INSERT INTO public.games VALUES (4, 12, 994, 2);
INSERT INTO public.games VALUES (5, 13, 3, 4);
INSERT INTO public.games VALUES (6, 13, 463, 464);
INSERT INTO public.games VALUES (7, 14, 109, 110);
INSERT INTO public.games VALUES (8, 14, 103, 104);
INSERT INTO public.games VALUES (9, 13, 560, 563);
INSERT INTO public.games VALUES (10, 13, 845, 847);
INSERT INTO public.games VALUES (11, 13, 882, 883);
INSERT INTO public.games VALUES (12, 12, 661, 17);
INSERT INTO public.games VALUES (13, 15, 504, 505);
INSERT INTO public.games VALUES (14, 15, 735, 736);
INSERT INTO public.games VALUES (15, 16, 146, 147);
INSERT INTO public.games VALUES (16, 16, 619, 620);
INSERT INTO public.games VALUES (17, 15, 959, 962);
INSERT INTO public.games VALUES (18, 15, 945, 946);
INSERT INTO public.games VALUES (19, 15, 887, 888);
INSERT INTO public.games VALUES (21, 17, 666, 667);
INSERT INTO public.games VALUES (22, 17, 564, 565);
INSERT INTO public.games VALUES (23, 18, 381, 382);
INSERT INTO public.games VALUES (24, 18, 592, 593);
INSERT INTO public.games VALUES (25, 17, 925, 928);
INSERT INTO public.games VALUES (26, 17, 932, 933);
INSERT INTO public.games VALUES (27, 17, 209, 210);
INSERT INTO public.games VALUES (28, 20, 471, 472);
INSERT INTO public.games VALUES (29, 20, 885, 886);
INSERT INTO public.games VALUES (30, 21, 567, 568);
INSERT INTO public.games VALUES (31, 21, 396, 397);
INSERT INTO public.games VALUES (32, 20, 661, 664);
INSERT INTO public.games VALUES (33, 20, 116, 117);
INSERT INTO public.games VALUES (34, 20, 466, 467);
INSERT INTO public.games VALUES (35, 22, 705, 706);
INSERT INTO public.games VALUES (36, 22, 949, 950);
INSERT INTO public.games VALUES (37, 23, 74, 75);
INSERT INTO public.games VALUES (38, 23, 158, 159);
INSERT INTO public.games VALUES (39, 22, 482, 485);
INSERT INTO public.games VALUES (40, 22, 474, 475);
INSERT INTO public.games VALUES (41, 22, 217, 218);
INSERT INTO public.games VALUES (42, 24, 186, 187);
INSERT INTO public.games VALUES (43, 24, 11, 12);
INSERT INTO public.games VALUES (44, 25, 693, 694);
INSERT INTO public.games VALUES (45, 25, 379, 380);
INSERT INTO public.games VALUES (46, 24, 677, 680);
INSERT INTO public.games VALUES (47, 24, 999, 1000);
INSERT INTO public.games VALUES (48, 24, 101, 102);
INSERT INTO public.games VALUES (49, 12, 178, 11);
INSERT INTO public.games VALUES (50, 26, 786, 787);
INSERT INTO public.games VALUES (51, 26, 917, 918);
INSERT INTO public.games VALUES (52, 27, 648, 649);
INSERT INTO public.games VALUES (53, 27, 670, 671);
INSERT INTO public.games VALUES (54, 26, 775, 778);
INSERT INTO public.games VALUES (55, 26, 83, 84);
INSERT INTO public.games VALUES (56, 26, 659, 660);
INSERT INTO public.games VALUES (57, 29, 332, 333);
INSERT INTO public.games VALUES (58, 29, 44, 45);
INSERT INTO public.games VALUES (59, 30, 824, 825);
INSERT INTO public.games VALUES (60, 30, 583, 584);
INSERT INTO public.games VALUES (61, 29, 591, 594);
INSERT INTO public.games VALUES (62, 29, 580, 581);
INSERT INTO public.games VALUES (63, 29, 998, 999);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (11, 'tomo');
INSERT INTO public.users VALUES (12, 'aimi');
INSERT INTO public.users VALUES (13, 'user_1787042236072');
INSERT INTO public.users VALUES (14, 'user_1787042236071');
INSERT INTO public.users VALUES (15, 'user_1787042434619');
INSERT INTO public.users VALUES (16, 'user_1787042434618');
INSERT INTO public.users VALUES (17, 'user_1787042833148');
INSERT INTO public.users VALUES (18, 'user_1787042833147');
INSERT INTO public.users VALUES (19, 'juan');
INSERT INTO public.users VALUES (20, 'user_1787042890253');
INSERT INTO public.users VALUES (21, 'user_1787042890252');
INSERT INTO public.users VALUES (22, 'user_1787042910198');
INSERT INTO public.users VALUES (23, 'user_1787042910197');
INSERT INTO public.users VALUES (24, 'user_1787042937147');
INSERT INTO public.users VALUES (25, 'user_1787042937146');
INSERT INTO public.users VALUES (26, 'user_1787042986665');
INSERT INTO public.users VALUES (27, 'user_1787042986664');
INSERT INTO public.users VALUES (28, 'x');
INSERT INTO public.users VALUES (29, 'user_1787043000464');
INSERT INTO public.users VALUES (30, 'user_1787043000463');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 63, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 30, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

