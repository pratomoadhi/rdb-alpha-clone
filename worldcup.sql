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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_id integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (65, 2018, 'Final', 82, 4, 83, 2);
INSERT INTO public.games VALUES (66, 2018, 'Third Place', 84, 2, 85, 0);
INSERT INTO public.games VALUES (67, 2018, 'Semi-Final', 83, 2, 85, 1);
INSERT INTO public.games VALUES (68, 2018, 'Semi-Final', 82, 1, 84, 0);
INSERT INTO public.games VALUES (69, 2018, 'Quarter-Final', 83, 3, 86, 2);
INSERT INTO public.games VALUES (70, 2018, 'Quarter-Final', 85, 2, 87, 0);
INSERT INTO public.games VALUES (71, 2018, 'Quarter-Final', 84, 2, 88, 1);
INSERT INTO public.games VALUES (72, 2018, 'Quarter-Final', 82, 2, 89, 0);
INSERT INTO public.games VALUES (73, 2018, 'Eighth-Final', 85, 2, 90, 1);
INSERT INTO public.games VALUES (74, 2018, 'Eighth-Final', 87, 1, 91, 0);
INSERT INTO public.games VALUES (75, 2018, 'Eighth-Final', 84, 3, 92, 2);
INSERT INTO public.games VALUES (76, 2018, 'Eighth-Final', 88, 2, 93, 0);
INSERT INTO public.games VALUES (77, 2018, 'Eighth-Final', 83, 2, 94, 1);
INSERT INTO public.games VALUES (78, 2018, 'Eighth-Final', 86, 2, 95, 1);
INSERT INTO public.games VALUES (79, 2018, 'Eighth-Final', 89, 2, 96, 1);
INSERT INTO public.games VALUES (80, 2018, 'Eighth-Final', 82, 4, 97, 3);
INSERT INTO public.games VALUES (81, 2014, 'Final', 98, 1, 97, 0);
INSERT INTO public.games VALUES (82, 2014, 'Third Place', 99, 3, 88, 0);
INSERT INTO public.games VALUES (83, 2014, 'Semi-Final', 97, 1, 99, 0);
INSERT INTO public.games VALUES (84, 2014, 'Semi-Final', 98, 7, 88, 1);
INSERT INTO public.games VALUES (85, 2014, 'Quarter-Final', 99, 1, 100, 0);
INSERT INTO public.games VALUES (86, 2014, 'Quarter-Final', 97, 1, 84, 0);
INSERT INTO public.games VALUES (87, 2014, 'Quarter-Final', 88, 2, 90, 1);
INSERT INTO public.games VALUES (88, 2014, 'Quarter-Final', 98, 1, 82, 0);
INSERT INTO public.games VALUES (89, 2014, 'Eighth-Final', 88, 2, 101, 1);
INSERT INTO public.games VALUES (90, 2014, 'Eighth-Final', 90, 2, 89, 0);
INSERT INTO public.games VALUES (91, 2014, 'Eighth-Final', 82, 2, 102, 0);
INSERT INTO public.games VALUES (92, 2014, 'Eighth-Final', 98, 2, 103, 1);
INSERT INTO public.games VALUES (93, 2014, 'Eighth-Final', 99, 2, 93, 1);
INSERT INTO public.games VALUES (94, 2014, 'Eighth-Final', 100, 2, 104, 1);
INSERT INTO public.games VALUES (95, 2014, 'Eighth-Final', 97, 1, 91, 0);
INSERT INTO public.games VALUES (96, 2014, 'Eighth-Final', 84, 2, 105, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (82, 'France');
INSERT INTO public.teams VALUES (83, 'Croatia');
INSERT INTO public.teams VALUES (84, 'Belgium');
INSERT INTO public.teams VALUES (85, 'England');
INSERT INTO public.teams VALUES (86, 'Russia');
INSERT INTO public.teams VALUES (87, 'Sweden');
INSERT INTO public.teams VALUES (88, 'Brazil');
INSERT INTO public.teams VALUES (89, 'Uruguay');
INSERT INTO public.teams VALUES (90, 'Colombia');
INSERT INTO public.teams VALUES (91, 'Switzerland');
INSERT INTO public.teams VALUES (92, 'Japan');
INSERT INTO public.teams VALUES (93, 'Mexico');
INSERT INTO public.teams VALUES (94, 'Denmark');
INSERT INTO public.teams VALUES (95, 'Spain');
INSERT INTO public.teams VALUES (96, 'Portugal');
INSERT INTO public.teams VALUES (97, 'Argentina');
INSERT INTO public.teams VALUES (98, 'Germany');
INSERT INTO public.teams VALUES (99, 'Netherlands');
INSERT INTO public.teams VALUES (100, 'Costa Rica');
INSERT INTO public.teams VALUES (101, 'Chile');
INSERT INTO public.teams VALUES (102, 'Nigeria');
INSERT INTO public.teams VALUES (103, 'Algeria');
INSERT INTO public.teams VALUES (104, 'Greece');
INSERT INTO public.teams VALUES (105, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 96, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 105, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

