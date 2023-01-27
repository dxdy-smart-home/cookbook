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

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: dishes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dishes (
    id bigint NOT NULL,
    name character varying NOT NULL,
    servings_number integer NOT NULL,
    cooking_time integer NOT NULL,
    comment character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: TABLE dishes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.dishes IS 'Блюда';


--
-- Name: COLUMN dishes.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.dishes.name IS 'Название';


--
-- Name: COLUMN dishes.servings_number; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.dishes.servings_number IS 'Количество порций';


--
-- Name: COLUMN dishes.cooking_time; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.dishes.cooking_time IS 'Время готовки, в минутах';


--
-- Name: COLUMN dishes.comment; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.dishes.comment IS 'Примечание';


--
-- Name: dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dishes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dishes_id_seq OWNED BY public.dishes.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ingredients (
    id bigint NOT NULL,
    dish_id bigint NOT NULL,
    product_id bigint NOT NULL,
    number integer NOT NULL,
    unit integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: TABLE ingredients; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.ingredients IS 'Игредиенты';


--
-- Name: COLUMN ingredients.dish_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ingredients.dish_id IS 'Блюдо';


--
-- Name: COLUMN ingredients.product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ingredients.product_id IS 'Продукт';


--
-- Name: COLUMN ingredients.number; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ingredients.number IS 'Количество';


--
-- Name: COLUMN ingredients.unit; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.ingredients.unit IS 'Единицы измерения';


--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: TABLE products; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.products IS 'Продукты';


--
-- Name: COLUMN products.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.products.name IS 'Название';


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: tag_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tag_links (
    id bigint NOT NULL,
    target_type character varying NOT NULL,
    target_id bigint NOT NULL,
    tag_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: TABLE tag_links; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.tag_links IS 'Ссылки на теги';


--
-- Name: COLUMN tag_links.target_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.tag_links.target_id IS 'Ссылка на сущность. Полиморфная связь';


--
-- Name: COLUMN tag_links.tag_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.tag_links.tag_id IS 'Ссылка на тег';


--
-- Name: tag_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tag_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tag_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tag_links_id_seq OWNED BY public.tag_links.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name character varying NOT NULL,
    color character varying NOT NULL,
    context character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: TABLE tags; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.tags IS 'Теги';


--
-- Name: COLUMN tags.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.tags.name IS 'Название';


--
-- Name: COLUMN tags.color; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.tags.color IS 'Цвет';


--
-- Name: COLUMN tags.context; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.tags.context IS 'Контекст';


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: dishes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dishes ALTER COLUMN id SET DEFAULT nextval('public.dishes_id_seq'::regclass);


--
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: tag_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_links ALTER COLUMN id SET DEFAULT nextval('public.tag_links_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tag_links tag_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_links
    ADD CONSTRAINT tag_links_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: index_ingredients_on_dish_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ingredients_on_dish_id ON public.ingredients USING btree (dish_id);


--
-- Name: index_ingredients_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ingredients_on_product_id ON public.ingredients USING btree (product_id);


--
-- Name: index_tag_links_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tag_links_on_tag_id ON public.tag_links USING btree (tag_id);


--
-- Name: index_tag_links_on_target; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tag_links_on_target ON public.tag_links USING btree (target_type, target_id);


--
-- Name: index_tag_links_on_target_id_and_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tag_links_on_target_id_and_tag_id ON public.tag_links USING btree (target_id, tag_id);


--
-- Name: ingredients fk_rails_17c82ffdc6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT fk_rails_17c82ffdc6 FOREIGN KEY (dish_id) REFERENCES public.dishes(id);


--
-- Name: ingredients fk_rails_db974bf3ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT fk_rails_db974bf3ef FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20211017125635'),
('20211117082734'),
('20211117112952'),
('20211118113451'),
('20211202070743'),
('20230127075030');


