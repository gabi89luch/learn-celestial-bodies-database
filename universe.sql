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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_km integer NOT NULL,
    is_potentially_hazardous boolean,
    is_near_earth boolean,
    mass_gigatons numeric(10,2),
    star_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth_light_years integer,
    has_black_hole boolean,
    is_spiral boolean,
    description text
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    distance_from_planet_km integer,
    is_spherical boolean,
    has_atmosphere boolean,
    surface_temperature_kelvin numeric(6,2)
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    mass_earth_ratio numeric(10,2),
    diameter_km integer NOT NULL,
    has_life boolean,
    is_habitable boolean,
    orbital_period_days integer,
    has_rings text
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    temperature_kelvin numeric(10,2),
    is_binary boolean,
    has_planets boolean,
    color character varying(20)
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, false, false, 939.00, 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, false, false, 259.00, 1);
INSERT INTO public.asteroid VALUES (3, 'Eros', 16, true, true, 6.69, 1);
INSERT INTO public.asteroid VALUES (4, 'Bennu', 0, true, true, 0.07, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0, true, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2537000, true, true, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 10000, 3200000, false, true, 'Third largest in Local Group');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 13250, 29350000, true, false, 'Distinctive hat-like shape');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 400, 23160000, false, true, 'Interacting grand-design spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 13270, 13050000, true, false, 'Prominent dust lane');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, 384400, true, false, 250.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, 9377, false, false, 233.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 23460, false, false, 233.00);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3642, 421700, true, true, 110.00);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 671100, true, true, 102.00);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 1070400, true, true, 110.00);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 1882700, true, true, 134.00);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 1221870, true, true, 93.70);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 238020, true, true, 75.00);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396, 185520, true, false, 64.00);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 2707, 354760, true, true, 38.00);
INSERT INTO public.moon VALUES (12, 'Nereid', 8, 340, 5513810, false, false, 50.00);
INSERT INTO public.moon VALUES (13, 'Naiad', 8, 60, 48224, false, false, 51.00);
INSERT INTO public.moon VALUES (14, 'Thalassa', 8, 80, 50074, false, false, 51.00);
INSERT INTO public.moon VALUES (15, 'Despina', 8, 150, 52526, false, false, 51.00);
INSERT INTO public.moon VALUES (16, 'Galatea', 8, 158, 61953, false, false, 51.00);
INSERT INTO public.moon VALUES (17, 'Larissa', 8, 194, 73548, false, false, 51.00);
INSERT INTO public.moon VALUES (18, 'Proteus', 8, 420, 117646, false, false, 51.00);
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 472, 129390, true, false, 60.00);
INSERT INTO public.moon VALUES (20, 'Ariel', 7, 1158, 191020, true, false, 60.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.00, 12742, true, true, 365, 'no');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.11, 6779, false, false, 687, 'no');
INSERT INTO public.planet VALUES (3, 'Venus', 1, 0.82, 12104, false, false, 225, 'no');
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 0.06, 4879, false, false, 88, 'no');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 317.80, 139820, false, false, 4333, 'yes');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 95.20, 116460, false, false, 10759, 'yes');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 14.50, 50724, false, false, 30687, 'yes');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 17.10, 49244, false, false, 60190, 'yes');
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 1.27, 12742, false, true, 11, 'no');
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 6, 1.17, 13594, false, true, 130, 'no');
INSERT INTO public.planet VALUES (11, 'HD 40307g', 6, 8.20, 23821, false, true, 198, 'no');
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 6, 3.10, 15835, false, true, 37, 'no');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 5778.00, false, true, 'yellow');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 3042.00, true, true, 'red');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 242, 9940.00, true, false, 'white');
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 6000, 5790.00, true, true, 'yellow');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 8, 3600.00, false, false, 'red');
INSERT INTO public.star VALUES (6, 'Vega', 1, 455, 9602.00, false, true, 'blue-white');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

