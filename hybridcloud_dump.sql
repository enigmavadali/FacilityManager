--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2024-02-12 16:53:01

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

--
-- TOC entry 3330 (class 1262 OID 24857)
-- Name: hybridcloud; Type: DATABASE; Schema: -; Owner: postgres
--

-- Added check to see if the database exists
DO $$ BEGIN
  IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'hybridcloud') THEN
    -- Create the database if it doesn't exist
    CREATE DATABASE hybridcloud WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
  END IF;
END $$;

-- CREATE DATABASE hybridcloud WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE hybridcloud OWNER TO postgres;

\connect hybridcloud

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
-- TOC entry 214 (class 1259 OID 24858)
-- Name: resident; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resident (
    pid integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    room integer,
    gender character varying(50),
    age integer,
    dob date,
    telephone character varying(50),
    haspet character varying(50),
    weight_lbs integer,
    photo character varying(500),
    emmergencycontact1 character varying(50),
    telephone_emc1 character varying(50),
    relationship_emc1 character varying(15),
    emmergencycontact2 character varying(50),
    telephone_emc2 character varying(50),
    relationship_emc2 character varying(15),
    isambulatory character varying(50),
    isabletocommunicate character varying(50),
    medicalinformation character varying(250),
    isvacinnatedforcovid19 character varying(50),
    lastfall date,
    lastervisit date,
    dischargedfromovernighthospitalstay character varying(50),
    isfallrisk character varying(50),
    iswanderrisk character varying(50),
    iselopementrisk character varying(50),
    physician character varying(50),
    physician_telephone character varying(50),
    ispet text
);


ALTER TABLE public.resident OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24870)
-- Name: sensor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sensor (
    sensor_id integer NOT NULL,
    sensor_name character varying(50) NOT NULL,
    pid_attached integer NOT NULL
);


ALTER TABLE public.sensor OWNER TO postgres;

--
-- TOC entry 3323 (class 0 OID 24858)
-- Dependencies: 214
-- Data for Name: resident; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (1, 'Georgia', 'Banner', NULL, 'Female', 70, '1952-02-20', '912-313-0194', 'NO', 125, 'https://robohash.org/commodinemoaut.png?size=200x200&set=set1', 'Zara Banner', '912-679-6865', 'grand-son', 'Jessica Banner', '754-943-4842', 'daughter', 'YES', 'YES', 'Hypertension, Hip Replacement - 3 years ago', 'YES', '2021-01-04', '2021-04-05', 'YES', 'NO', 'NO', 'NO', 'Fredrika Turvie', '973-224-5897', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (2, 'Laura', 'Axford', NULL, 'Female', 80, '1942-07-27', '928-544-5183', 'NO', 134, 'https://robohash.org/laudantiumlaboreeos.png?size=200x200&set=set1', 'Francis Ali', '612-475-5498', 'son-in-law', 'Margaret Benediktsson', '947-661-5123', 'daughter', 'YES', 'YES', 'Diabetic, COPD', 'YES	', NULL, '2021-03-27', 'NO', 'YES', 'NO', 'NO', 'Dr. Carol Abys', '702-420-7977', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (3, 'Ronda', 'Harburtson', NULL, 'Female', 60, '1929-08-27', '909-681-3069', 'NO', 122, 'https://robohash.org/nemoreprehenderiteveniet.png?size=200x200&set=set1', 'Jewel Schutt', '909-343-6245', 'son', 'Steven Holloway', '602-945-5955', 'son', 'YES', 'YES', 'Eyeglasses - Depression - Hypertension', 'YES', NULL, '2021-01-06', 'NO', 'NO', 'NO', 'NO', 'Dr. Madelyn Mudle', '518-557-0500', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (4, 'Christopher', 'Keightley', NULL, 'Male', 79, '1943-10-24', '704-608-7363', 'NO', 229, 'https://robohash.org/quinisiea.png?size=200x200&set=set1', 'Salvador Kidd', '800-987-3788', 'daughter', 'Caroline Cook', '776-956-9939', 'daughter-in-law', 'YES', 'YES', 'Aphasia induced by Prior Stroke, Congestive Heart Failure', 'YES', NULL, '2021-02-24', 'YES', 'YES', 'NO', 'NO', 'Dr. Nikki Glashby', '978-228-3974', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (5, 'Warren', 'McMeanma', NULL, 'Male', 83, '1939-05-21', '163-257-1533', 'NO', 163, 'https://robohash.org/eosquamtenetur.png?size=200x200&set=set1', 'Paul Ramsey', '373-837-9391', 'son', 'Susan Hodgson', '130-803-8199', 'son', 'YES', 'YES', 'Asthmatic - Colon Cancer ', 'YES', '2021-02-17', '2021-02-19', 'YES', 'YES', 'NO', 'NO', 'Dr. Harry Klus', '248-222-4556', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (7, 'Ruby', 'Santori', NULL, 'Female', 69, '1953-03-19', '525-264-7395', 'NO', 102, 'https://robohash.org/nihilnamquis.png?size=200x200&set=set1', 'Raul Parker', '669-402-6827', 'daughter', 'John Wiggins', '783-699-6603', 'grand-daughter', 'YES', 'YES', 'Hearing Aids, MS (early stage), Previous breast cancer', 'YES', '2021-10-03', '2021-09-04', 'YES', 'NO', 'NO', 'NO', 'Yoseline White', '607-544-9081', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (8, 'Lily', 'Kitchinham', NULL, 'Female', 85, '1937-03-19', '624-324-7238', 'NO', 116, 'https://robohash.org/velautvoluptas.png?size=200x200&set=set1', 'Zara Collins', '724-174-3646', 'daughter', 'Matthew Jones', '289-343-4508', 'son-in-law', 'YES', 'YES', 'Diabetic, ESRD', 'YES', '2021-07-19', '2021-12-28', 'NO', 'NO', 'NO', 'NO', 'Dr. Patricia Fishbourne', '773-532-8380', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (9, 'Hadley', 'Frid', NULL, 'Female', 83, '1939-01-18', '334-988-5496', 'NO', 165, 'https://robohash.org/nisiporroconsequuntur.png?size=200x200&set=set1', 'Mariyah Solomon', '539-601-2273', 'son', 'Edward Lee', '119-153-7846', 'son', 'YES', 'YES', 'Hearing Aids,  Hypertension, Chronic back pain', 'YES', '2021-03-15', '2021-03-19', 'YES', 'YES', 'NO', 'NO', 'Dr. Lockwood MacColl', '702-721-2225', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (10, 'Marita', 'Deniseau', NULL, 'Female', 101, '1921-04-05', '156-781-7523', 'NO', 114, 'https://robohash.org/quinihiliste.png?size=200x200&set=set1', 'Ali Cummings', '524-623-4137', 'son', 'Ken Bradley', '829-174-4897', 'daughter', 'YES', 'YES', 'Osteoarthritis, Congestive Heart Failure', 'YES', NULL, '2021-09-03', 'YES', 'YES', 'NO', 'NO', 'Dr. Harley Orneblow', '872-209-3368', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (12, 'Melissa', 'Gosse', NULL, 'Female', 91, '1931-07-31', '291-999-8275', 'NO', 108, 'https://robohash.org/laborumutquia.png?size=200x200&set=set1', 'Ivy Oneill', '417-846-3377', 'son-in-law', 'Margaret Wilson', '542-720-2077', 'son-in-law', 'YES', 'YES', 'COPD, Arthritis, MCI', 'YES', '2021-09-25', '2021-11-16', 'YES', 'NO', 'NO', 'NO', 'Dr. Solomon Piccard', '205-575-1704', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (14, 'Silvia', 'Brandli', NULL, 'Female', 84, '1938-07-27', '672-938-4346', 'NO', 144, 'https://robohash.org/exestneque.png?size=200x200&set=set1', 'London Lambert', '160-570-8260', 'daughter-in-law', 'Margaret Rivera', '705-387-9681', 'grand-daughter', 'YES', 'YES', 'COPD (oxygen), Peanut Allergy, Hypertension', 'YES', '2021-07-12', NULL, 'NO', 'YES', 'NO', 'NO', 'Dr. Teddy Spilling', '212-877-2536', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (16, 'Zeja', 'Vasilik', NULL, 'Female', 85, '1937-09-19', '195-140-4952', 'NO', 127, 'https://robohash.org/nihilcupiditateid.png?size=200x200&set=set1', 'Reed Garrett', '874-682-4688', 'grand-son', 'Carol Padilla', '810-591-8516', 'son', 'YES', 'YES', 'Hearing Aids, Hypertension, Osteoarthritis', 'YES', '2022-01-19', NULL, 'YES', 'YES', 'NO', 'NO', 'Dr. Matthew Bricham', '541-702-6636', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (18, 'Gennifer', 'Antoniou', NULL, 'Female', 81, '1941-06-22', '140-485-5806', 'NO', 110, 'https://robohash.org/voluptatumillumnobis.png?size=200x200&set=set1', 'Zara Collins', '692-632-8229', 'grand-daughter', 'Carol Padilla', '329-478-3529', 'daughter-in-law', 'YES', 'YES', 'Rheumatoid Arthritis, Depression', 'YES', '2021-05-06', '2021-06-17', 'NO', 'YES', 'NO', 'NO', 'Dr. Christina Bricham', '612-217-4097', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (19, 'Tracey', 'Tuhy', NULL, 'Female', 74, '1948-03-31', '424-886-5656', 'NO', 125, 'https://robohash.org/etrerumaccusantium.png?size=200x200&set=set1', 'Oliver Michael', '135-611-2815', 'daughter-in-law', 'Kenny Johnson', '555-670-3899', 'daughter', 'YES', 'YES', 'Uses Hearing Aids and eyeglasses, Knee Replacement (5 weeks ago)', 'YES', NULL, NULL, 'YES', 'YES', 'NO', 'NO', 'Dr. Rita monrroe', '714-905-8167', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (20, 'Germaine', 'Ramusson', NULL, 'Female', 83, '1939-09-12', '270-418-7427', 'NO', 140, 'https://robohash.org/doloresmaioresest.png?size=200x200&set=set1', 'Adrian Stanley', '670-835-8016', 'grand-daughter', 'Carol Padilla', '272-158-5676', 'son-in-law', 'YES', 'YES', 'Prior Stroke,  hypertension, MCI', 'YES', NULL, '2021-11-11', 'NO', 'NO', 'NO', 'NO', 'Dr. Casey Huges', '979-667-8922', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (21, 'Morissa', 'Farloe', NULL, 'Female', 88, '1934-10-09', '211-245-9760', 'NO', 132, 'https://robohash.org/fugiatdoloreassumenda.png?size=200x200&set=set1', 'Zara Collins', '405-405-9278', 'grand-daughter', 'Emma Jenkins', '794-875-3380', 'grand-daughter', 'YES', 'YES', 'Diabetic, Congestive Heart Disease, Covid +', 'YES', '2021-09-08', '2021-04-04', 'NO', 'NO', 'NO', 'NO', 'Dr. Donna McKline', '212-877-4174', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (23, 'Glenda', 'Harburtson', NULL, 'Female', 60, '1962-12-26', '515-558-0142', 'NO', 131, 'https://robohash.org/etfacereet.png?size=200x200&set=set1', 'Jean Cooper', '912-551-1873', 'daughter', 'Ryan Cooper', '515-674-9834', 'son', 'YES', 'YES', 'Daughter of Tracey ', 'YES', '2021-01-07', '2021-01-24', 'NO', 'NO', 'NO', 'NO', 'Dr. Shelley Glason', '951-894-8586', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (24, 'Tracy', 'Andrivel', NULL, 'Female', 82, '1940-03-17', '336-118-2324', 'NO', 130, 'https://robohash.org/voluptasdoloribusvel.png?size=200x200&set=set1', 'Tessa Kelly', '401-216-0873', 'grand-daughter', 'Andrew Perkins', '411-623-5572', 'grand-daughter', 'YES', 'YES', 'Hypertension, Type 2 diabetes, osteoarthritis, Hearing Aids ', 'YES', NULL, '2022-01-18', 'YES', 'YES', 'NO', 'NO', 'Dr. Kessie Cusick', '412-457-1769', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (25, 'Lucius', 'Reihill', NULL, 'Male ', 96, '1952-02-16', '157-518-4702', 'NO', 190, 'https://robohash.org/numquamtemporibusamet.png?size=200x200&set=set1', 'Jaylin Freeman', '764-808-5685', 'grand-son', 'Brian Rodriguez', '592-284-0061', 'grand-son', 'YES', 'YES', 'Hypertension, hearing aids, eyeglasses, Panic Attack', 'YES', '2022-01-04', '2021-04-04', 'YES', 'NO', 'NO', 'NO', 'Dr. Hal Karpman', '603-390-5135', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (26, 'Sal', 'Follan', NULL, 'Female', 85, '1937-01-18', '670-611-4347', 'NO', 126, 'https://robohash.org/etipsaquia.png?size=200x200&set=set1', 'Jewel Watkins', '141-940-0523', 'son', 'Ruth Biggs', '406-689-7000', 'grand-daughter', 'YES', 'NO', 'HTN, COPD, Dementia', 'YES', '2021-06-07', '2021-11-10', 'YES', 'YES', 'YES', 'YES', 'Dr. Mufi Verzey', '212-877-6153', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (27, 'Tootsie', 'Halden', NULL, 'Female', 98, '1924-10-05', '138-544-5996', 'NO', 112, 'https://robohash.org/eaetprovident.png?size=200x200&set=set1', 'Blake Odonnell', '168-410-3882', 'daughter', 'Margaret Rivera', '829-409-8152', 'son-in-law', 'YES', 'YES', 'Osteoarthritis, Prior Stroke ', 'YES', '2021-05-07', NULL, 'NO', 'NO', 'NO', 'NO', 'Dr. Maddy Ackerley', '216-520-7487', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (15, 'Rick', 'Truin', NULL, 'Male', 79, '1943-04-03', '706-765-7464', 'NO', 107, 'https://robohash.org/infacerevoluptatum.png?size=200x200&set=set1', 'Alexis Alvarez', '977-851-0773', 'grand-daughter', 'Ken Bradley', '271-632-4943', 'son', 'YES', 'YES', 'Visual Impariment requiring glasses, HTN, DM', 'YES', '2022-01-11', '2021-11-10', 'YES', 'NO', 'NO', 'NO', 'Dr. Maggie Ritchings', '612-217-5880', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (28, 'Melony', 'Summerlad', NULL, 'Female', 75, '1947-07-13', '797-356-0427', 'NO', 137, 'https://robohash.org/sedaliquidnon.png?size=200x200&set=set1', 'Thaddeus Huang', '959-808-3264', 'daughter-in-law', 'Jason Watson', '117-788-3730', 'daughter', 'YES', 'YES', 'Panic Attacks,  Depression, Hypertension', 'YES', '2022-01-12', '2021-11-08', 'NO', 'YES', 'NO', 'NO', 'Dr. Shandie Rodman', '662-318-5396', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (29, 'Lanae', 'Wrennall', NULL, 'Female', 88, '1934-12-24', '377-462-7930', 'NO', 110, 'https://robohash.org/autemquisquamdolorem.png?size=200x200&set=set1', 'Tessa Kelly', '815-598-4931', 'son-in-law', 'Elizabeth Griffiths', '383-187-4736', 'daughter', 'YES', 'YES', 'Diabetes, prior stroke ', 'YES', '2021-11-16', '2021-06-03', 'NO', 'NO', 'NO', 'NO', 'Dr. Cory White', '612-217-6581', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (30, 'Rosalinda', 'Hindge', NULL, 'Female', 92, '1930-03-15', '153-950-4850', 'NO', 131, 'https://robohash.org/officiissedet.png?size=200x200&set=set1', 'Salvador Kidd', '609-630-9061', 'daughter', 'Ronald Taylor', '744-677-0518', 'daughter', 'YES', 'YES', 'Hypertension, asthmatic', 'YES', NULL, '2021-12-08', 'YES', 'NO', 'NO', 'NO', 'Dr. Ella Bridley', '954-963-9253', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (31, 'Karole', 'Embleton', NULL, 'Female', 79, '1943-09-03', '403-604-2633', 'NO', 115, 'https://robohash.org/repudiandaeremmagni.png?size=200x200&set=set1', 'Alexis Alvarez', '603-319-5285', 'son-in-law', 'Kenny Johnson', '172-494-0259', 'daughter', 'YES', 'YES', 'Osteoarthritis, Arthritis, Previous breast cancer', 'YES', NULL, '2021-10-20', 'YES', 'NO', 'NO', 'NO', 'Dr. Prisca Grindle', '612-217-3632', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (17, 'Mona', 'Lisa', NULL, 'Female', 69, '1953-08-15', '153-950-4850', 'YES', 141, 'https://robohash.org/officiissedet.png?size=200x200&set=set1', 'Salvador Kidd', '609-630-9061', 'daughter', 'Ronald Taylor', '744-677-0518', 'daughter', 'YES', 'YES', 'Visual Impariment, HTN, DM', 'YES', NULL, '2021-12-08', 'YES', 'YES', 'NO', 'NO', 'Dr. Ella Bridley', '954-963-9253', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (13, 'Dorian', 'Medendorp', NULL, 'Male', 75, '1947-02-01', '667-492-8985', 'NO', 169, 'https://robohash.org/velitfacereest.png?size=200x200&set=set1', 'Zara Collins', '562-371-9738', 'grand-son', 'Sandy Gomez', '292-857-0298', 'grand-son', 'YES', 'YES', 'Hypertension, hyperlipidemia, osteoarthritus ', 'YES', NULL, '2021-11-18', 'YES', 'YES', 'NO', 'NO', 'Dr. Issiah Dalbey', '612-217-6222', NULL);
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (32, 'Magnum', 'PI', NULL, 'Male', NULL, NULL, '153-950-4850', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SERVICE DOG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'YES');
INSERT INTO public.resident (pid, first_name, last_name, room, gender, age, dob, telephone, haspet, weight_lbs, photo, emmergencycontact1, telephone_emc1, relationship_emc1, emmergencycontact2, telephone_emc2, relationship_emc2, isambulatory, isabletocommunicate, medicalinformation, isvacinnatedforcovid19, lastfall, lastervisit, dischargedfromovernighthospitalstay, isfallrisk, iswanderrisk, iselopementrisk, physician, physician_telephone, ispet) VALUES (11, 'Hank', 'Dahlback', NULL, 'Male', 81, '1941-03-27', '832-298-8043', 'NO', 136, 'https://robohash.org/nulladolorexercitationem.png?size=200x200&set=set1', 'Blake Odonnell', '744-584-0591', 'grand-daughter', 'Jeffrey Kim', '140-731-4010', 'daughter-in-law', 'YES', 'YES', 'Hypertension', 'YES', NULL, '2021-05-30', 'NO', 'YES', 'NO', 'NO', 'Dr. Trixie Newhouse', '615-536-5792', NULL);


--
-- TOC entry 3324 (class 0 OID 24870)
-- Dependencies: 215
-- Data for Name: sensor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sensor (sensor_id, sensor_name, pid_attached) VALUES (1, 'Blood Pressure', 1);
INSERT INTO public.sensor (sensor_id, sensor_name, pid_attached) VALUES (2, 'Blood Pressure', 5);


--
-- TOC entry 3177 (class 2606 OID 24864)
-- Name: resident resident_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resident
    ADD CONSTRAINT resident_pkey PRIMARY KEY (pid);


--
-- TOC entry 3179 (class 2606 OID 24874)
-- Name: sensor sensor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor
    ADD CONSTRAINT sensor_pkey PRIMARY KEY (sensor_id);


--
-- TOC entry 3180 (class 2606 OID 24875)
-- Name: sensor fk_pid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor
    ADD CONSTRAINT fk_pid FOREIGN KEY (pid_attached) REFERENCES public.resident(pid);


-- Completed on 2024-02-12 16:53:02

--
-- PostgreSQL database dump complete
--

