--
-- PostgreSQL database dump
--

-- Dumped from database version 12.20 (Ubuntu 12.20-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.20 (Ubuntu 12.20-0ubuntu0.20.04.1)

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
    name character varying(40) NOT NULL,
    diameter_in_ly numeric(4,1),
    description text,
    "real" boolean
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    "real" boolean
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    radius_in_km integer,
    distance_from_planet_in_km integer,
    "real" boolean
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
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    description text,
    "real" boolean
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
    name character varying(40),
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL,
    "real" boolean
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 87.4, NULL, true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 152.0, NULL, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 76.9, NULL, true);
INSERT INTO public.galaxy VALUES (5, 'Messier 77', 90.0, NULL, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 163.3, NULL, true);
INSERT INTO public.galaxy VALUES (7, 'NGC 1300', 110.0, NULL, true);
INSERT INTO public.galaxy VALUES (8, 'Star Wars Galaxy', NULL, NULL, false);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Elliptical', true);
INSERT INTO public.galaxy_type VALUES (2, 'Spiral', true);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, NULL, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, NULL, NULL, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, NULL, NULL, true);
INSERT INTO public.moon VALUES (4, 'Io', 5, NULL, NULL, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, NULL, NULL, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, NULL, NULL, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, NULL, NULL, true);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, NULL, NULL, true);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, NULL, NULL, true);
INSERT INTO public.moon VALUES (10, 'Elara', 5, NULL, NULL, true);
INSERT INTO public.moon VALUES (11, 'Titan', 6, NULL, NULL, true);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, NULL, NULL, true);
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, NULL, NULL, true);
INSERT INTO public.moon VALUES (14, 'Dione', 6, NULL, NULL, true);
INSERT INTO public.moon VALUES (15, 'Tethys', 6, NULL, NULL, true);
INSERT INTO public.moon VALUES (16, 'Enceladus', 6, NULL, NULL, true);
INSERT INTO public.moon VALUES (17, 'Mimas', 6, NULL, NULL, true);
INSERT INTO public.moon VALUES (18, 'Hyperion', 6, NULL, NULL, true);
INSERT INTO public.moon VALUES (19, 'Titania', 7, NULL, NULL, true);
INSERT INTO public.moon VALUES (20, 'Oberon', 7, NULL, NULL, true);
INSERT INTO public.moon VALUES (21, 'Umbriel', 7, NULL, NULL, true);
INSERT INTO public.moon VALUES (22, 'Ariel', 7, NULL, NULL, true);
INSERT INTO public.moon VALUES (23, 'Miranda', 7, NULL, NULL, true);
INSERT INTO public.moon VALUES (24, 'Triton', 8, NULL, NULL, true);
INSERT INTO public.moon VALUES (25, 'Proteus', 8, NULL, NULL, true);
INSERT INTO public.moon VALUES (26, 'Nereid', 8, NULL, NULL, true);
INSERT INTO public.moon VALUES (27, 'Larissa', 8, NULL, NULL, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, true, 4503, 'The closest planet to the Sun, Mercury is a small, rocky world with a heavily cratered surface and extreme temperature fluctuations. It has a thin atmosphere and no moons.', true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, true, 4503, 'Earth''s "sister planet," Venus has a thick, toxic atmosphere of carbon dioxide and sulfuric acid clouds. It features volcanic plains and is the hottest planet in the Solar System.', true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, false, true, 4503, 'The only planet known to support life, Earth has diverse ecosystems, abundant water, and a protective atmosphere. It has one moon, which influences tides.', true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, true, 4503, 'The "Red Planet," Mars has iron oxide-rich soil, the largest volcano, and evidence of past water. It has two small moons, Phobos and Deimos.', true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, true, 4565, 'The largest planet, Jupiter is a gas giant with a thick atmosphere, known for the Great Red Spot and a strong magnetic field. It has at least 79 moons.', true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, true, 4543, 'Known for its stunning ring system, Saturn is a gas giant with numerous moons, including Titan, which has a dense atmosphere and liquid methane lakes.', true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, true, 4543, 'An ice giant with a blue-green color, Uranus rotates on its side and has a faint ring system. It has 27 known moons, including Titania and Oberon.', true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, true, 4543, 'The farthest planet, Neptune is an ice giant with a deep blue color, strong winds, and a faint ring system. It has 14 known moons, with Triton being the largest.', true);
INSERT INTO public.planet VALUES (9, 'Tatooine', 12, true, true, 5000, 'A desert planet with twin suns, home to moisture farmers and various alien species.', false);
INSERT INTO public.planet VALUES (10, 'Pandora', 3, true, true, 2000, 'A lush, habitable moon with a rich ecosystem, inhabited by the Na''vi and known for its bioluminescent flora.', false);
INSERT INTO public.planet VALUES (11, 'Vulcan', 10, true, true, 4000, 'The home planet of the Vulcan species, known for its logical inhabitants and advanced technology.', false);
INSERT INTO public.planet VALUES (12, 'Gallifrey', 11, true, true, 10000, 'The home planet of the Time Lords, characterized by beautiful landscapes and advanced time travel technology.', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4850, 1, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 5300, 1, true);
INSERT INTO public.star VALUES (1, 'Sun', 4600, 1, true);
INSERT INTO public.star VALUES (10, '40 Eridani', 6900, 1, true);
INSERT INTO public.star VALUES (11, 'The Eye of Harmony', NULL, 1, false);
INSERT INTO public.star VALUES (12, 'Tatto I and Tatto II', NULL, 8, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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

