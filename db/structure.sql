--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attendances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE attendances (
    id integer NOT NULL,
    student_id integer,
    training_id integer,
    date date,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attendances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE attendances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attendances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE attendances_id_seq OWNED BY attendances.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE courses (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: course_datatables; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW course_datatables AS
 SELECT courses.name AS course,
    courses.description,
    courses.id AS course_id
   FROM courses;


--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE courses_id_seq OWNED BY courses.id;


--
-- Name: facilitators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE facilitators (
    id integer NOT NULL,
    name character varying,
    email character varying,
    home_city character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: facilitator_datatables; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW facilitator_datatables AS
 SELECT facilitators.name,
    facilitators.email,
    facilitators.description,
    facilitators.home_city,
    facilitators.id AS facilitator_id
   FROM facilitators;


--
-- Name: facilitators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE facilitators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: facilitators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE facilitators_id_seq OWNED BY facilitators.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE groups (
    id integer NOT NULL,
    student_id integer,
    tag character varying,
    organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: groups_students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE groups_students (
    group_id integer NOT NULL,
    student_id integer NOT NULL
);


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE organizations (
    id integer NOT NULL,
    name character varying,
    student_id integer,
    leader character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE students (
    id integer NOT NULL,
    wp_first_name character varying,
    wp_last_name character varying,
    wp_email character varying,
    wp_id integer,
    occupation character varying,
    organization character varying,
    wp_login character varying,
    wp_display_name character varying,
    email_list boolean,
    student_discount boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: group_datatables; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW group_datatables AS
 SELECT ( SELECT (((s.wp_last_name)::text || '#'::text) || outer_g.id)
           FROM students s
          WHERE (s.id = outer_g.student_id)) AS name,
    outer_g.id AS group_id,
    ( SELECT (((s.wp_first_name)::text || ' '::text) || (s.wp_last_name)::text)
           FROM students s
          WHERE (s.id = outer_g.student_id)) AS owner,
    outer_g.student_id AS owner_id,
    ( SELECT o.name
           FROM organizations o
          WHERE (o.id = outer_g.organization_id)) AS organization,
    outer_g.organization_id,
    ( SELECT (count(*))::text AS count
           FROM groups_students gs
          WHERE (gs.group_id = outer_g.id)) AS count
   FROM groups outer_g;


--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying,
    street_1 character varying,
    street_2 character varying,
    city character varying,
    state character varying,
    zip character varying,
    country character varying,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: location_datatables; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW location_datatables AS
 SELECT locations.name AS location_name,
    locations.id AS location_id,
    locations.city
   FROM locations;


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: organization_datatables; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW organization_datatables AS
 SELECT organizations.id,
    organizations.name,
    organizations.student_id,
    organizations.leader,
    organizations.created_at,
    organizations.updated_at
   FROM organizations;


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organizations_id_seq OWNED BY organizations.id;


--
-- Name: registrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE registrations (
    id integer NOT NULL,
    registerable_type character varying,
    registerable_id integer,
    training_id integer,
    code integer,
    paid_for boolean DEFAULT false,
    amt_paid_cents integer DEFAULT 0,
    sign_up_date date,
    auth_code character varying,
    refunded boolean,
    reg_type character varying,
    owner_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: registrants; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW registrants AS
 SELECT
        CASE
            WHEN ((r.registerable_type)::text = 'Student'::text) THEN ( SELECT (((s.wp_first_name)::text || ' '::text) || (s.wp_last_name)::text)
               FROM students s
              WHERE (s.id = r.registerable_id))
            ELSE ( SELECT (((s.wp_last_name)::text || '#'::text) || (g.id)::text)
               FROM (students s
                 JOIN groups g ON ((g.student_id = s.id)))
              WHERE (g.id = r.registerable_id))
        END AS name,
    r.registerable_id,
    r.registerable_type
   FROM registrations r;


--
-- Name: trainings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE trainings (
    id integer NOT NULL,
    start_date date,
    end_date date,
    code character varying(20),
    regular_price_cents integer DEFAULT 0,
    group_price_cents integer DEFAULT 0,
    student_price_cents integer DEFAULT 0,
    early_regular_price_cents integer DEFAULT 0,
    early_group_price_cents integer DEFAULT 0,
    early_student_price_cents integer DEFAULT 0,
    min_group_size integer DEFAULT 5,
    new_registration_closed date,
    early_registration_cutoff date,
    min_attendees integer,
    max_attendees integer,
    course_id integer,
    facilitator_id integer,
    location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: registration_datatables; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW registration_datatables AS
 SELECT (outer_r.code)::text AS registration_code,
    ( SELECT c.name
           FROM ((registrations r
             JOIN trainings t ON ((r.training_id = t.id)))
             JOIN courses c ON ((t.course_id = c.id)))
          WHERE (r.id = outer_r.id)) AS course_name,
    ( SELECT c.id
           FROM ((registrations r
             JOIN trainings t ON ((r.training_id = t.id)))
             JOIN courses c ON ((t.course_id = c.id)))
          WHERE (r.id = outer_r.id)) AS course_id,
    ( SELECT (t.code)::text AS code
           FROM (registrations r
             JOIN trainings t ON ((r.training_id = t.id)))
          WHERE (r.id = outer_r.id)) AS training_code,
    ( SELECT t.id
           FROM (registrations r
             JOIN trainings t ON ((r.training_id = t.id)))
          WHERE (r.id = outer_r.id)) AS training_id,
    ( SELECT (((s.wp_first_name)::text || ' '::text) || (s.wp_last_name)::text)
           FROM (registrations r
             JOIN students s ON ((r.owner_id = s.id)))
          WHERE (r.id = outer_r.id)) AS owner_name,
    ( SELECT s.id
           FROM (registrations r
             JOIN students s ON ((r.owner_id = s.id)))
          WHERE (r.id = outer_r.id)) AS owner_id,
        CASE
            WHEN ((outer_r.registerable_type)::text = 'Student'::text) THEN ( SELECT (((s.wp_first_name)::text || ' '::text) || (s.wp_last_name)::text)
               FROM (registrations r
                 JOIN students s ON ((r.registerable_id = s.id)))
              WHERE (r.id = outer_r.id))
            ELSE ( SELECT (((s.wp_last_name)::text || '#'::text) || g.id)
               FROM ((registrations r
                 JOIN groups g ON ((r.registerable_id = g.id)))
                 JOIN students s ON ((g.student_id = s.id)))
              WHERE (r.id = outer_r.id))
        END AS registrant,
    outer_r.registerable_type,
    outer_r.registerable_id,
        CASE
            WHEN (outer_r.paid_for IS TRUE) THEN 'Yes'::text
            ELSE 'No'::text
        END AS paid_for,
    to_char(outer_r.updated_at, 'MM/DD/YYYY HH:MI AM'::text) AS updated_at,
    outer_r.id AS registration_id
   FROM registrations outer_r;


--
-- Name: registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE registrations_id_seq OWNED BY registrations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE students_id_seq OWNED BY students.id;


--
-- Name: training_datatables; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW training_datatables AS
 SELECT t.id AS training_id,
    c.id AS course_id,
    c.name AS course,
    t.code,
    to_char((t.start_date)::timestamp with time zone, 'MM/DD/YYYY'::text) AS start,
    to_char((t.end_date)::timestamp with time zone, 'MM/DD/YYYY'::text) AS "end",
    l.city
   FROM ((trainings t
     JOIN courses c ON ((t.course_id = c.id)))
     JOIN locations l ON ((t.location_id = l.id)));


--
-- Name: trainings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE trainings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trainings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE trainings_id_seq OWNED BY trainings.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE transactions (
    id integer NOT NULL,
    registration_id integer,
    owner_id integer,
    status character varying,
    payment_instrument_type character varying,
    amount numeric(8,2) DEFAULT 0.0,
    transaction_id character varying,
    transaction_type character varying,
    customer_id character varying,
    processor_authorization_code character varying,
    processor_response_code character varying,
    processor_response_text character varying,
    customer_first_name character varying,
    customer_last_name character varying,
    billing_first_name character varying,
    billing_last_name character varying,
    authorization_id character varying,
    capture_id character varying,
    payer_first_name character varying,
    payer_last_name character varying,
    payer_id character varying,
    payment_id character varying,
    transaction_fee_amount character varying,
    bin character varying,
    card_type character varying,
    cardholder_name character varying,
    last_4 character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: transaction_datatables; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW transaction_datatables AS
 SELECT outer_t.id AS transaction_id,
    outer_t.registration_id,
    outer_t.transaction_id AS payment_transaction_id,
    ( SELECT (r.code)::text AS code
           FROM registrations r
          WHERE (r.id = outer_t.registration_id)) AS registration_code,
    ( SELECT (((s.wp_first_name)::text || ' '::text) || (s.wp_last_name)::text)
           FROM (students s
             JOIN registrations r ON ((r.owner_id = s.id)))
          WHERE (r.id = outer_t.registration_id)) AS owner_name,
    ( SELECT s.id
           FROM (students s
             JOIN registrations r ON ((r.owner_id = s.id)))
          WHERE (r.id = outer_t.registration_id)) AS owner_id,
    ( SELECT rt.name
           FROM (registrations r
             JOIN registrants rt ON (((r.registerable_id = rt.registerable_id) AND ((r.registerable_type)::text = (rt.registerable_type)::text))))
          WHERE (r.id = outer_t.registration_id)) AS registerable_name,
    ( SELECT r.registerable_id
           FROM registrations r
          WHERE (r.id = outer_t.registration_id)) AS registerable_id,
    ( SELECT r.registerable_type
           FROM registrations r
          WHERE (r.id = outer_t.registration_id)) AS registerable_type,
    outer_t.status,
        CASE
            WHEN ((outer_t.payment_instrument_type)::text = 'paypal_account'::text) THEN 'PayPal'::text
            ELSE 'Credit Card'::text
        END AS payment_type,
        CASE
            WHEN ((outer_t.payment_instrument_type)::text = 'paypal_account'::text) THEN (((outer_t.payer_first_name)::text || ' '::text) || (outer_t.payer_last_name)::text)
            ELSE
            CASE
                WHEN ((outer_t.billing_last_name IS NULL) OR (outer_t.billing_first_name IS NULL)) THEN 'Unspecified'::text
                ELSE (((outer_t.billing_first_name)::text || ' '::text) || (outer_t.billing_last_name)::text)
            END
        END AS payer_name,
    ('$'::text || (outer_t.amount)::text) AS amount,
    to_char(outer_t.created_at, 'MM/DD/YYYY HH:MI AM'::text) AS created_at,
    to_char(outer_t.updated_at, 'MM/DD/YYYY HH:MI AM'::text) AS updated_at
   FROM transactions outer_t;


--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transactions_id_seq OWNED BY transactions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    admin boolean,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY attendances ALTER COLUMN id SET DEFAULT nextval('attendances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY courses ALTER COLUMN id SET DEFAULT nextval('courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY facilitators ALTER COLUMN id SET DEFAULT nextval('facilitators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations ALTER COLUMN id SET DEFAULT nextval('organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY registrations ALTER COLUMN id SET DEFAULT nextval('registrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY students ALTER COLUMN id SET DEFAULT nextval('students_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY trainings ALTER COLUMN id SET DEFAULT nextval('trainings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transactions ALTER COLUMN id SET DEFAULT nextval('transactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attendances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY attendances
    ADD CONSTRAINT attendances_pkey PRIMARY KEY (id);


--
-- Name: courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: facilitators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY facilitators
    ADD CONSTRAINT facilitators_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY registrations
    ADD CONSTRAINT registrations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: trainings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trainings
    ADD CONSTRAINT trainings_pkey PRIMARY KEY (id);


--
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_attendances_on_student_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attendances_on_student_id ON attendances USING btree (student_id);


--
-- Name: index_attendances_on_training_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attendances_on_training_id ON attendances USING btree (training_id);


--
-- Name: index_groups_on_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groups_on_organization_id ON groups USING btree (organization_id);


--
-- Name: index_groups_on_student_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groups_on_student_id ON groups USING btree (student_id);


--
-- Name: index_organizations_on_student_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_organizations_on_student_id ON organizations USING btree (student_id);


--
-- Name: index_registrations_on_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registrations_on_owner_id ON registrations USING btree (owner_id);


--
-- Name: index_registrations_on_registerable_type_and_registerable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registrations_on_registerable_type_and_registerable_id ON registrations USING btree (registerable_type, registerable_id);


--
-- Name: index_registrations_on_training_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registrations_on_training_id ON registrations USING btree (training_id);


--
-- Name: index_students_on_occupation; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_students_on_occupation ON students USING btree (occupation);


--
-- Name: index_students_on_organization; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_students_on_organization ON students USING btree (organization);


--
-- Name: index_students_on_wp_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_students_on_wp_email ON students USING btree (wp_email);


--
-- Name: index_students_on_wp_first_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_students_on_wp_first_name ON students USING btree (wp_first_name);


--
-- Name: index_students_on_wp_last_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_students_on_wp_last_name ON students USING btree (wp_last_name);


--
-- Name: index_trainings_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_trainings_on_code ON trainings USING btree (code);


--
-- Name: index_trainings_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trainings_on_course_id ON trainings USING btree (course_id);


--
-- Name: index_trainings_on_facilitator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trainings_on_facilitator_id ON trainings USING btree (facilitator_id);


--
-- Name: index_trainings_on_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trainings_on_location_id ON trainings USING btree (location_id);


--
-- Name: index_transactions_on_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transactions_on_owner_id ON transactions USING btree (owner_id);


--
-- Name: index_transactions_on_registration_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transactions_on_registration_id ON transactions USING btree (registration_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: fk_rails_548e1699c9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT fk_rails_548e1699c9 FOREIGN KEY (student_id) REFERENCES students(id);


--
-- Name: fk_rails_67b62b1855; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trainings
    ADD CONSTRAINT fk_rails_67b62b1855 FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fk_rails_7c9b5713f2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trainings
    ADD CONSTRAINT fk_rails_7c9b5713f2 FOREIGN KEY (facilitator_id) REFERENCES facilitators(id);


--
-- Name: fk_rails_80f99b8048; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trainings
    ADD CONSTRAINT fk_rails_80f99b8048 FOREIGN KEY (course_id) REFERENCES courses(id);


--
-- Name: fk_rails_d9d06276a3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT fk_rails_d9d06276a3 FOREIGN KEY (organization_id) REFERENCES organizations(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20160504223233'), ('20160505014012'), ('20160505014050'), ('20160505014123'), ('20160505015155'), ('20160509030222'), ('20160509030400'), ('20160509030600'), ('20160509032020'), ('20160512181222'), ('20160527021958'), ('20160601200000'), ('20160601200010'), ('20160623224050'), ('20160624212534'), ('20160624212559'), ('20160624212609'), ('20160624212619'), ('20160624212631'), ('20160624212643'), ('20160624212724');


