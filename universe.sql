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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(200),
    description text NOT NULL,
    age_in_millions_of_years numeric(10,2) NOT NULL,
    number_of_planets integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(200) NOT NULL,
    planet_id integer,
    description text NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(200),
    description text,
    number_of_moons integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(200),
    galaxy_id integer,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    system_id integer NOT NULL,
    name character varying(200) NOT NULL,
    galaxy_id integer,
    description text NOT NULL,
    number_of_planets integer
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_system_id_seq OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_system_id_seq OWNED BY public.system.system_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: system system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN system_id SET DEFAULT nextval('public.system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our solar system', 13.50, 100);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A spiral galaxy located 2.5 million light-years away', 9.80, 120);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'A grand design spiral galaxy located 31 million light-years away', 10.50, 80);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'An unbarred spiral galaxy located 28 million light-years away', 12.30, 150);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'A spiral galaxy located 3 million light-years away', 8.50, 90);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'A grand design spiral galaxy located 21 million light-years away', 11.20, 110);
INSERT INTO public.galaxy VALUES (7, 'Tadpole', 'A spiral galaxy with a long tail located 420 million light-years away', 13.80, 140);
INSERT INTO public.galaxy VALUES (8, 'Cartwheel', 'A lenticular galaxy located 500 million light-years away', 14.60, 130);
INSERT INTO public.galaxy VALUES (9, 'Cigar', 'A barred spiral galaxy located 55 million light-years away', 10.10, 100);
INSERT INTO public.galaxy VALUES (10, 'M101', 'A spiral galaxy located 21 million light-years away', 10.90, 120);
INSERT INTO public.galaxy VALUES (11, 'M51', 'A grand design spiral galaxy located 23 million light-years away', 11.50, 115);
INSERT INTO public.galaxy VALUES (12, 'Barred Spiral', 'A barred spiral galaxy located 35 million light-years away', 12.20, 125);
INSERT INTO public.galaxy VALUES (13, 'M104', 'A spiral galaxy located 29 million light-years away', 11.30, 110);
INSERT INTO public.galaxy VALUES (14, 'M83', 'A barred spiral galaxy located 15 million light-years away', 12.40, 130);
INSERT INTO public.galaxy VALUES (15, 'M77', 'A spiral galaxy located 47 million light-years away', 12.70, 120);
INSERT INTO public.galaxy VALUES (16, 'Maffei', 'A barred spiral galaxy located 10 million light-years away', 11.10, 100);
INSERT INTO public.galaxy VALUES (17, 'Maffei 2', 'A barred spiral galaxy located 8 million light-years away', 10.50, 90);
INSERT INTO public.galaxy VALUES (18, 'Large Magellanic Cloud', 'A irregular galaxy located 160,000 light-years away', 2.50, 30);
INSERT INTO public.galaxy VALUES (19, 'Small Magellanic Cloud', 'A irregular galaxy located 200,000 light-years away', 3.50, 35);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Earth''s only natural satellite', NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'A Martian moon', NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'A Martian moon', NULL);
INSERT INTO public.moon VALUES (4, 'Triton', 9, 'A Neptunian moon', NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 6, 'A Jovian moon', NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 6, 'A Jovian moon', NULL);
INSERT INTO public.moon VALUES (7, 'Io', 6, 'A Jovian moon', NULL);
INSERT INTO public.moon VALUES (8, 'Callisto', 6, 'A Jovian moon', NULL);
INSERT INTO public.moon VALUES (9, 'Titan', 7, 'A Saturnian moon', NULL);
INSERT INTO public.moon VALUES (10, 'Rhea', 7, 'A Saturnian moon', NULL);
INSERT INTO public.moon VALUES (11, 'Iapetus', 7, 'A Saturnian moon', NULL);
INSERT INTO public.moon VALUES (12, 'Tethys', 7, 'A Saturnian moon', NULL);
INSERT INTO public.moon VALUES (13, 'Dione', 7, 'A Saturnian moon', NULL);
INSERT INTO public.moon VALUES (14, 'Enceladus', 7, 'A Saturnian moon', NULL);
INSERT INTO public.moon VALUES (15, 'Mimas', 7, 'A Saturnian moon', NULL);
INSERT INTO public.moon VALUES (16, 'Hyperion', 7, 'A Saturnian moon', NULL);
INSERT INTO public.moon VALUES (17, 'Ijiraq', 7, 'A Saturnian moon', NULL);
INSERT INTO public.moon VALUES (18, 'Helene', 7, 'A Saturnian moon', NULL);
INSERT INTO public.moon VALUES (19, 'Telesto', 7, 'A Saturnian moon', NULL);
INSERT INTO public.moon VALUES (20, 'Calypso', 7, 'A Saturnian moon', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the sun', 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The fourth planet from the sun', 2, 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', 'A planet orbiting Proxima Centauri', 0, 2);
INSERT INTO public.planet VALUES (4, 'Alpha Centauri bb', 'A planet orbiting Alpha Centauri B', 0, 4);
INSERT INTO public.planet VALUES (5, 'Betelgeuse b', 'A planet orbiting Betelgeuse', 0, 5);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'The fifth planet from the sun', 67, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 'The sixth planet from the sun', 62, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'The seventh planet from the sun', 27, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 'The eighth planet from the sun', 14, 1);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Ab', 'A planet orbiting Alpha Centauri A', 0, 3);
INSERT INTO public.planet VALUES (11, 'Antares b', 'A planet orbiting Antares', 0, 6);
INSERT INTO public.planet VALUES (12, 'Deneb b', 'A planet orbiting Deneb', 0, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'A G-type main-sequence star located in the Milky Way galaxy', false, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 'A red dwarf star located in the Andromeda galaxy', false, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 2, 'A G-type main-sequence star located in the Andromeda galaxy', false, true);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 2, 'A K-type main-sequence star located in the Andromeda galaxy', false, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3, 'A red supergiant star located in the Whirlpool galaxy', false, false);
INSERT INTO public.star VALUES (6, 'Antares', 4, 'A red supergiant star located in the Sombrero galaxy', false, false);
INSERT INTO public.star VALUES (7, 'Deneb', 5, 'A blue supergiant star located in the Triangulum galaxy', false, false);
INSERT INTO public.star VALUES (8, 'Vega', 6, 'A white main-sequence star located in the Pinwheel galaxy', false, true);
INSERT INTO public.star VALUES (9, 'Sirius', 7, 'A white main-sequence star located in the Tadpole galaxy', false, true);
INSERT INTO public.star VALUES (10, 'Arcturus', 8, 'A orange giant star located in the Cartwheel galaxy', false, true);
INSERT INTO public.star VALUES (11, 'Rigel', 9, 'A blue supergiant star located in the Cigar galaxy', false, false);
INSERT INTO public.star VALUES (12, 'Betelgeuse', 10, 'A red supergiant star located in the M101 galaxy', false, false);
INSERT INTO public.star VALUES (13, 'Polaris', 11, 'A yellow supergiant star located in the M51 galaxy', false, true);
INSERT INTO public.star VALUES (14, 'Deneb', 12, 'A blue supergiant star located in the Barred Spiral galaxy', false, false);
INSERT INTO public.star VALUES (15, 'Regulus', 13, 'A blue main-sequence star located in the M104 galaxy', false, true);
INSERT INTO public.star VALUES (16, 'Canopus', 14, 'A white giant star located in the M83 galaxy', false, true);
INSERT INTO public.star VALUES (17, 'Achernar', 15, 'A blue main-sequence star located in the M77 galaxy', false, true);
INSERT INTO public.star VALUES (18, 'Capella', 16, 'A yellow giant star located in the Maffei galaxy', false, true);
INSERT INTO public.star VALUES (19, 'Pollux', 17, 'An orange giant star located in the Maffei 2 galaxy', false, true);
INSERT INTO public.star VALUES (20, '47 Tucanae', 18, 'A globular cluster located in the Large Magellanic Cloud galaxy', false, false);
INSERT INTO public.star VALUES (21, 'NGC 292', 19, 'An open cluster located in the Small Magellanic Cloud galaxy', false, false);


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.system VALUES (1, 'Solar System', 1, 'The system that contains our planet Earth', 1);
INSERT INTO public.system VALUES (2, 'Alpha Centauri', 2, 'The nearest star system to Earth', 3);
INSERT INTO public.system VALUES (3, 'Barnard''s Star', 2, 'A red dwarf located 6 light years from Earth', 0);
INSERT INTO public.system VALUES (4, 'Tau Ceti', 2, 'A sun-like star located 12 light years from Earth', 5);
INSERT INTO public.system VALUES (5, 'VY Canis Majoris', 4, 'A red hypergiant located 5,000 light years from Earth', 100);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 19, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 21, true);


--
-- Name: system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_system_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


--
-- Name: system system_system_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_system_id_key UNIQUE (system_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: system system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

