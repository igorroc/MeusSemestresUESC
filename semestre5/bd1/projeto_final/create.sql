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
	nome varchar(64) NOT NULL,
	email varchar(32) NOT NULL,
	sigla varchar(10) NOT NULL,
	CONSTRAINT departamento_pk PRIMARY KEY (id),
	CONSTRAINT sigla UNIQUE (sigla)

);
-- ddl-end --
-- ALTER TABLE public.departamento OWNER TO postgres;
-- ddl-end --

-- object: public.docente | type: TABLE --
-- DROP TABLE IF EXISTS public.docente CASCADE;
CREATE TABLE public.docente (
	id smallint NOT NULL,
	nome varchar NOT NULL,
	email varchar(32) NOT NULL,
	id_departamento smallint,
	CONSTRAINT docente_pk PRIMARY KEY (id),
	CONSTRAINT email UNIQUE (email)

);
-- ddl-end --
-- ALTER TABLE public.docente OWNER TO postgres;
-- ddl-end --

-- object: public.colegiado | type: TABLE --
-- DROP TABLE IF EXISTS public.colegiado CASCADE;
CREATE TABLE public.colegiado (
	id smallint NOT NULL,
	nome varchar(64) NOT NULL,
	email varchar(32) NOT NULL,
	id_departamento smallint,
	CONSTRAINT colegiado_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.colegiado OWNER TO postgres;
-- ddl-end --

-- object: departamento_fk | type: CONSTRAINT --
-- ALTER TABLE public.docente DROP CONSTRAINT IF EXISTS departamento_fk CASCADE;
ALTER TABLE public.docente ADD CONSTRAINT departamento_fk FOREIGN KEY (id_departamento)
REFERENCES public.departamento (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.disciplina | type: TABLE --
-- DROP TABLE IF EXISTS public.disciplina CASCADE;
CREATE TABLE public.disciplina (
	id smallint NOT NULL,
	nome varchar(64) NOT NULL,
	carga_horaria integer NOT NULL,
	creditos smallint NOT NULL,
	codigo varchar(10) NOT NULL,
	semestre smallint NOT NULL,
	id_colegiado smallint,
	CONSTRAINT tbl_disciplina_pk PRIMARY KEY (id),
	CONSTRAINT codigo_disciplina UNIQUE (codigo)

);
-- ddl-end --
-- ALTER TABLE public.disciplina OWNER TO postgres;
-- ddl-end --

-- object: departamento_fk | type: CONSTRAINT --
-- ALTER TABLE public.colegiado DROP CONSTRAINT IF EXISTS departamento_fk CASCADE;
ALTER TABLE public.colegiado ADD CONSTRAINT departamento_fk FOREIGN KEY (id_departamento)
REFERENCES public.departamento (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: colegiado_fk | type: CONSTRAINT --
-- ALTER TABLE public.disciplina DROP CONSTRAINT IF EXISTS colegiado_fk CASCADE;
ALTER TABLE public.disciplina ADD CONSTRAINT colegiado_fk FOREIGN KEY (id_colegiado)
REFERENCES public.colegiado (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.historico_disciplina_docente | type: TABLE --
-- DROP TABLE IF EXISTS public.historico_disciplina_docente CASCADE;
CREATE TABLE public.historico_disciplina_docente (
	id_historico_docente smallint NOT NULL,
	semestre_ministrado varchar(10) NOT NULL,
	id_docente smallint,
	id_disciplina smallint,
	CONSTRAINT historico_disciplina_docente_pk PRIMARY KEY (id_historico_docente)

);
-- ddl-end --
-- ALTER TABLE public.historico_disciplina_docente OWNER TO postgres;
-- ddl-end --

-- object: public.interesse_docente | type: TABLE --
-- DROP TABLE IF EXISTS public.interesse_docente CASCADE;
CREATE TABLE public.interesse_docente (
	id smallint NOT NULL,
	docente_interessado_1 smallint,
	docente_interessado_2 smallint,
	docente_interessado_3 smallint,
	docente_interessado_4 smallint,
	id_disciplina smallint NOT NULL,
	CONSTRAINT interesse_docente_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.interesse_docente OWNER TO postgres;
-- ddl-end --

-- object: public.indicacao_docente | type: TABLE --
-- DROP TABLE IF EXISTS public.indicacao_docente CASCADE;
CREATE TABLE public.indicacao_docente (
	id_indicacao_docente smallint NOT NULL,
	semestre_indicacao varchar(10) NOT NULL,
	turma_formandos smallint NOT NULL,
	observacao_indicacao text,
	turma_indicacao_docente varchar(2) NOT NULL,
	tipo_disciplina_indicacao_docente varchar(20) NOT NULL,
	prioridade_docente smallint,
	docente_indicado smallint NOT NULL,
	disciplina_indicacao smallint NOT NULL,
	id_colegiado smallint NOT NULL,
	id_interesse smallint,
	CONSTRAINT indicacao_docente_pk PRIMARY KEY (id_indicacao_docente)

);
-- ddl-end --
-- ALTER TABLE public.indicacao_docente OWNER TO postgres;
-- ddl-end --

-- object: public.horarios | type: TABLE --
-- DROP TABLE IF EXISTS public.horarios CASCADE;
CREATE TABLE public.horarios (
	id smallint NOT NULL,
	id_disciplina smallint,
	id_docente smallint,
	dia_semana smallint,
	horario_inicio time NOT NULL,
	horario_final time NOT NULL,
	turma_disciplina varchar(5) NOT NULL,
	CONSTRAINT tbl_horarios_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.horarios OWNER TO postgres;
-- ddl-end --

-- object: id_docente | type: CONSTRAINT --
-- ALTER TABLE public.historico_disciplina_docente DROP CONSTRAINT IF EXISTS id_docente CASCADE;
ALTER TABLE public.historico_disciplina_docente ADD CONSTRAINT id_docente FOREIGN KEY (id_docente)
REFERENCES public.docente (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_disciplina | type: CONSTRAINT --
-- ALTER TABLE public.historico_disciplina_docente DROP CONSTRAINT IF EXISTS id_disciplina CASCADE;
ALTER TABLE public.historico_disciplina_docente ADD CONSTRAINT id_disciplina FOREIGN KEY (id_disciplina)
REFERENCES public.disciplina (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --

-- object: docente_interessado_1 | type: CONSTRAINT --
-- ALTER TABLE public.interesse_docente DROP CONSTRAINT IF EXISTS docente_interessado_1 CASCADE;
ALTER TABLE public.interesse_docente ADD CONSTRAINT docente_interessado_1 FOREIGN KEY (docente_interessado_1)
REFERENCES public.docente (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --

-- object: docente_interessado_2 | type: CONSTRAINT --
-- ALTER TABLE public.interesse_docente DROP CONSTRAINT IF EXISTS docente_interessado_2 CASCADE;
ALTER TABLE public.interesse_docente ADD CONSTRAINT docente_interessado_2 FOREIGN KEY (docente_interessado_2)
REFERENCES public.docente (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --

-- object: docente_interessado_3 | type: CONSTRAINT --
-- ALTER TABLE public.interesse_docente DROP CONSTRAINT IF EXISTS docente_interessado_3 CASCADE;
ALTER TABLE public.interesse_docente ADD CONSTRAINT docente_interessado_3 FOREIGN KEY (docente_interessado_3)
REFERENCES public.docente (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --

-- object: docente_interessado_4 | type: CONSTRAINT --
-- ALTER TABLE public.interesse_docente DROP CONSTRAINT IF EXISTS docente_interessado_4 CASCADE;
ALTER TABLE public.interesse_docente ADD CONSTRAINT docente_interessado_4 FOREIGN KEY (docente_interessado_4)
REFERENCES public.docente (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_disciplina | type: CONSTRAINT --
-- ALTER TABLE public.interesse_docente DROP CONSTRAINT IF EXISTS id_disciplina CASCADE;
ALTER TABLE public.interesse_docente ADD CONSTRAINT id_disciplina FOREIGN KEY (id_disciplina)
REFERENCES public.disciplina (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --

-- object: prioridade_docente | type: CONSTRAINT --
-- ALTER TABLE public.indicacao_docente DROP CONSTRAINT IF EXISTS prioridade_docente CASCADE;
ALTER TABLE public.indicacao_docente ADD CONSTRAINT prioridade_docente FOREIGN KEY (prioridade_docente)
REFERENCES public.docente (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --

-- object: docente_indicado | type: CONSTRAINT --
-- ALTER TABLE public.indicacao_docente DROP CONSTRAINT IF EXISTS docente_indicado CASCADE;
ALTER TABLE public.indicacao_docente ADD CONSTRAINT docente_indicado FOREIGN KEY (docente_indicado)
REFERENCES public.docente (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --

-- object: disciplina_indicacao | type: CONSTRAINT --
-- ALTER TABLE public.indicacao_docente DROP CONSTRAINT IF EXISTS disciplina_indicacao CASCADE;
ALTER TABLE public.indicacao_docente ADD CONSTRAINT disciplina_indicacao FOREIGN KEY (disciplina_indicacao)
REFERENCES public.disciplina (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_colegiado | type: CONSTRAINT --
-- ALTER TABLE public.indicacao_docente DROP CONSTRAINT IF EXISTS id_colegiado CASCADE;
ALTER TABLE public.indicacao_docente ADD CONSTRAINT id_colegiado FOREIGN KEY (id_colegiado)
REFERENCES public.colegiado (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_interesse | type: CONSTRAINT --
-- ALTER TABLE public.indicacao_docente DROP CONSTRAINT IF EXISTS id_interesse CASCADE;
ALTER TABLE public.indicacao_docente ADD CONSTRAINT id_interesse FOREIGN KEY (id_interesse)
REFERENCES public.interesse_docente (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_disciplina | type: CONSTRAINT --
-- ALTER TABLE public.horarios DROP CONSTRAINT IF EXISTS id_disciplina CASCADE;
ALTER TABLE public.horarios ADD CONSTRAINT id_disciplina FOREIGN KEY (id_disciplina)
REFERENCES public.disciplina (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_docente | type: CONSTRAINT --
-- ALTER TABLE public.horarios DROP CONSTRAINT IF EXISTS id_docente CASCADE;
ALTER TABLE public.horarios ADD CONSTRAINT id_docente FOREIGN KEY (id_docente)
REFERENCES public.docente (id) MATCH SIMPLE
ON DELETE SET NULL ON UPDATE NO ACTION;
-- ddl-end --


