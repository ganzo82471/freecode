--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(40),
    games_played integer NOT NULL,
    best_game integer NOT NULL
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
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (6, 'user_1718521785318', 1, 204);
INSERT INTO public.users VALUES (7, 'user_1718521785317', 1, 870);
INSERT INTO public.users VALUES (8, 'user_1718522178973', 1, 817);
INSERT INTO public.users VALUES (9, 'user_1718522178972', 1, 668);
INSERT INTO public.users VALUES (29, 'user_1718522928296', 1, 177);
INSERT INTO public.users VALUES (11, 'user_1718522444035', 1, 311);
INSERT INTO public.users VALUES (12, 'user_1718522444034', 1, 691);
INSERT INTO public.users VALUES (30, 'user_1718522928295', 1, 355);
INSERT INTO public.users VALUES (13, 'user_1718522491283', 1, 546);
INSERT INTO public.users VALUES (14, 'user_1718522491282', 1, 17);
INSERT INTO public.users VALUES (31, 'user_1718522972190', 1, 178);
INSERT INTO public.users VALUES (32, 'user_1718522972189', 1, 301);
INSERT INTO public.users VALUES (15, 'user_1718522541046', 1, 530);
INSERT INTO public.users VALUES (16, 'user_1718522541045', 1, 817);
INSERT INTO public.users VALUES (33, 'user_1718523127901', 1, 506);
INSERT INTO public.users VALUES (34, 'user_1718523127900', 1, 709);
INSERT INTO public.users VALUES (17, 'user_1718522669400', 1, 379);
INSERT INTO public.users VALUES (18, 'user_1718522669399', 1, 95);
INSERT INTO public.users VALUES (10, 'ganzo', 2, 427);
INSERT INTO public.users VALUES (19, 'user_1718522691394', 1, 217);
INSERT INTO public.users VALUES (20, 'user_1718522691393', 1, 90);
INSERT INTO public.users VALUES (21, 'user_1718522712665', 1, 656);
INSERT INTO public.users VALUES (22, 'user_1718522712664', 1, 770);
INSERT INTO public.users VALUES (23, 'user_1718522748381', 1, 426);
INSERT INTO public.users VALUES (24, 'user_1718522748380', 1, 454);
INSERT INTO public.users VALUES (25, 'user_1718522768678', 1, 254);
INSERT INTO public.users VALUES (26, 'user_1718522768677', 1, 148);
INSERT INTO public.users VALUES (27, 'user_1718522796583', 1, 277);
INSERT INTO public.users VALUES (28, 'user_1718522796582', 1, 43);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 34, true);


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

