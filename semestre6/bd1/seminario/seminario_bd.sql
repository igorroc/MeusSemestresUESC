-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: public.departamento | type: TABLE --
-- DROP TABLE IF EXISTS public.departamento CASCADE;
CREATE TABLE public.departamento (
	id smallint NOT NULL,
	nome varchar(50),
	sigla varchar(6),
	data_inicio date,
	data_fim date,
	CONSTRAINT departamento_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.departamento OWNER TO postgres;
-- ddl-end --

-- object: public.colegiado | type: TABLE --
-- DROP TABLE IF EXISTS public.colegiado CASCADE;
CREATE TABLE public.colegiado (
	id smallint NOT NULL,
	nome varchar(50),
	sigla varchar(10),
	data_inicio date,
	data_fim smallint,
	id_departamento smallint,
	CONSTRAINT colegiado_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.colegiado OWNER TO postgres;
-- ddl-end --

-- object: departamento_fk | type: CONSTRAINT --
-- ALTER TABLE public.colegiado DROP CONSTRAINT IF EXISTS departamento_fk CASCADE;
ALTER TABLE public.colegiado ADD CONSTRAINT departamento_fk FOREIGN KEY (id_departamento)
REFERENCES public.departamento (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.professor | type: TABLE --
-- DROP TABLE IF EXISTS public.professor CASCADE;
CREATE TABLE public.professor (
	id smallint NOT NULL,
	nome varchar(50),
	data_nascimento date,
	data_inicio date,
	data_fim date,
	id_departamento smallint,
	id_curso smallint,
	CONSTRAINT professor_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.professor OWNER TO postgres;
-- ddl-end --

-- object: departamento_fk | type: CONSTRAINT --
-- ALTER TABLE public.professor DROP CONSTRAINT IF EXISTS departamento_fk CASCADE;
ALTER TABLE public.professor ADD CONSTRAINT departamento_fk FOREIGN KEY (id_departamento)
REFERENCES public.departamento (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.curso | type: TABLE --
-- DROP TABLE IF EXISTS public.curso CASCADE;
CREATE TABLE public.curso (
	id smallint NOT NULL,
	nome varchar(50),
	data_inicio date,
	data_fim date,
	carga_horaria smallint,
	id_colegiado smallint,
	CONSTRAINT curso_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.curso OWNER TO postgres;
-- ddl-end --

-- object: colegiado_fk | type: CONSTRAINT --
-- ALTER TABLE public.curso DROP CONSTRAINT IF EXISTS colegiado_fk CASCADE;
ALTER TABLE public.curso ADD CONSTRAINT colegiado_fk FOREIGN KEY (id_colegiado)
REFERENCES public.colegiado (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: curso_fk | type: CONSTRAINT --
-- ALTER TABLE public.professor DROP CONSTRAINT IF EXISTS curso_fk CASCADE;
ALTER TABLE public.professor ADD CONSTRAINT curso_fk FOREIGN KEY (id_curso)
REFERENCES public.curso (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


