-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: "UESC DB" | type: DATABASE --
-- -- DROP DATABASE IF EXISTS "UESC DB";
-- CREATE DATABASE "UESC DB";
-- -- ddl-end --
-- 

-- object: public."TBL_Aluno" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Aluno" CASCADE;
CREATE TABLE public."TBL_Aluno" (
	"ALU_Matricula" uuid NOT NULL,
	"ALU_Nome" varchar(50) NOT NULL,
	"ALU_Data_Nascimento" date NOT NULL,
	"ALU_CPF" varchar(11) NOT NULL,
	"ALU_Email" varchar(50) NOT NULL,
	"COL_ID_TBL_Colegiado" uuid NOT NULL,
	CONSTRAINT "TBL_Aluno_pk" PRIMARY KEY ("ALU_Matricula")

);
-- ddl-end --
-- ALTER TABLE public."TBL_Aluno" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Professor" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Professor" CASCADE;
CREATE TABLE public."TBL_Professor" (
	"PRO_ID" uuid NOT NULL,
	"PRO_Nome" varchar(50) NOT NULL,
	"PRO_Nivel" varchar(20) NOT NULL,
	"PRO_Graduação" varchar(20) NOT NULL,
	"PRO_Lattes" varchar(100),
	"DEP_ID_TBL_Departamento" uuid NOT NULL,
	CONSTRAINT "TBL_Professor_pk" PRIMARY KEY ("PRO_ID")

);
-- ddl-end --
-- ALTER TABLE public."TBL_Professor" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Colegiado" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Colegiado" CASCADE;
CREATE TABLE public."TBL_Colegiado" (
	"COL_ID" uuid NOT NULL,
	"COL_Nome" varchar(50) NOT NULL,
	"DEP_ID_TBL_Departamento" uuid NOT NULL,
	CONSTRAINT "TBL_Colegiado_pk" PRIMARY KEY ("COL_ID")

);
-- ddl-end --
-- ALTER TABLE public."TBL_Colegiado" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Curso" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Curso" CASCADE;
CREATE TABLE public."TBL_Curso" (
	"CUR_ID" uuid NOT NULL,
	"CUR_Nome" varchar(30) NOT NULL,
	"TIC_ID_TBL_Tipo_Curso" uuid NOT NULL,
	"COL_ID_TBL_Colegiado" uuid NOT NULL,
	CONSTRAINT "TBL_Curso_pk" PRIMARY KEY ("CUR_ID")

);
-- ddl-end --
-- ALTER TABLE public."TBL_Curso" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Materia" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Materia" CASCADE;
CREATE TABLE public."TBL_Materia" (
	"MAT_ID" uuid NOT NULL,
	"MAT_Nome" varchar(30) NOT NULL,
	"MAT_Turma" smallint NOT NULL,
	CONSTRAINT "TBL_Materia_pk" PRIMARY KEY ("MAT_ID")

);
-- ddl-end --
-- ALTER TABLE public."TBL_Materia" OWNER TO postgres;
-- ddl-end --

-- object: public."many_TBL_Materia_has_many_TBL_Aluno" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_TBL_Materia_has_many_TBL_Aluno" CASCADE;
CREATE TABLE public."many_TBL_Materia_has_many_TBL_Aluno" (
	"MAT_ID_TBL_Materia" uuid NOT NULL,
	"ALU_Matricula_TBL_Aluno" uuid NOT NULL,
	CONSTRAINT "many_TBL_Materia_has_many_TBL_Aluno_pk" PRIMARY KEY ("MAT_ID_TBL_Materia","ALU_Matricula_TBL_Aluno")

);
-- ddl-end --

-- object: "TBL_Materia_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Materia_has_many_TBL_Aluno" DROP CONSTRAINT IF EXISTS "TBL_Materia_fk" CASCADE;
ALTER TABLE public."many_TBL_Materia_has_many_TBL_Aluno" ADD CONSTRAINT "TBL_Materia_fk" FOREIGN KEY ("MAT_ID_TBL_Materia")
REFERENCES public."TBL_Materia" ("MAT_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Aluno_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Materia_has_many_TBL_Aluno" DROP CONSTRAINT IF EXISTS "TBL_Aluno_fk" CASCADE;
ALTER TABLE public."many_TBL_Materia_has_many_TBL_Aluno" ADD CONSTRAINT "TBL_Aluno_fk" FOREIGN KEY ("ALU_Matricula_TBL_Aluno")
REFERENCES public."TBL_Aluno" ("ALU_Matricula") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."many_TBL_Professor_has_many_TBL_Materia" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_TBL_Professor_has_many_TBL_Materia" CASCADE;
CREATE TABLE public."many_TBL_Professor_has_many_TBL_Materia" (
	"PRO_ID_TBL_Professor" uuid NOT NULL,
	"MAT_ID_TBL_Materia" uuid NOT NULL,
	CONSTRAINT "many_TBL_Professor_has_many_TBL_Materia_pk" PRIMARY KEY ("PRO_ID_TBL_Professor","MAT_ID_TBL_Materia")

);
-- ddl-end --

-- object: "TBL_Professor_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Professor_has_many_TBL_Materia" DROP CONSTRAINT IF EXISTS "TBL_Professor_fk" CASCADE;
ALTER TABLE public."many_TBL_Professor_has_many_TBL_Materia" ADD CONSTRAINT "TBL_Professor_fk" FOREIGN KEY ("PRO_ID_TBL_Professor")
REFERENCES public."TBL_Professor" ("PRO_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Materia_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Professor_has_many_TBL_Materia" DROP CONSTRAINT IF EXISTS "TBL_Materia_fk" CASCADE;
ALTER TABLE public."many_TBL_Professor_has_many_TBL_Materia" ADD CONSTRAINT "TBL_Materia_fk" FOREIGN KEY ("MAT_ID_TBL_Materia")
REFERENCES public."TBL_Materia" ("MAT_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TBL_Universidade" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Universidade" CASCADE;
CREATE TABLE public."TBL_Universidade" (
	"UNI_ID" uuid NOT NULL,
	"UNI_Nome" varchar(50) NOT NULL,
	"UNI_Cidade" varchar(50) NOT NULL,
	CONSTRAINT "TBL_Universidade_pk" PRIMARY KEY ("UNI_ID")

);
-- ddl-end --
-- ALTER TABLE public."TBL_Universidade" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Servidor" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Servidor" CASCADE;
CREATE TABLE public."TBL_Servidor" (
	"SER_ID" uuid NOT NULL,
	"SER_Nome" varchar(50) NOT NULL,
	"SER_Data_Inicio" date NOT NULL,
	"SER_Data_Fim" date,
	"SET_ID_TBL_Setor" uuid NOT NULL,
	"UNI_ID_TBL_Universidade" uuid NOT NULL,
	CONSTRAINT "TBL_Servidor_pk" PRIMARY KEY ("SER_ID")

);
-- ddl-end --
-- ALTER TABLE public."TBL_Servidor" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Setor" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Setor" CASCADE;
CREATE TABLE public."TBL_Setor" (
	"SET_ID" uuid NOT NULL,
	"SET_Nome" varchar(50) NOT NULL,
	CONSTRAINT "TBL_Tipo_Servidor_pk" PRIMARY KEY ("SET_ID")

);
-- ddl-end --
-- ALTER TABLE public."TBL_Setor" OWNER TO postgres;
-- ddl-end --

-- object: "TBL_Setor_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Servidor" DROP CONSTRAINT IF EXISTS "TBL_Setor_fk" CASCADE;
ALTER TABLE public."TBL_Servidor" ADD CONSTRAINT "TBL_Setor_fk" FOREIGN KEY ("SET_ID_TBL_Setor")
REFERENCES public."TBL_Setor" ("SET_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TBL_Tipo_Curso" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Tipo_Curso" CASCADE;
CREATE TABLE public."TBL_Tipo_Curso" (
	"TIC_ID" uuid NOT NULL,
	"TIC_Nome" uuid NOT NULL,
	CONSTRAINT "TBL_Tipo_Curso_pk" PRIMARY KEY ("TIC_ID")

);
-- ddl-end --
-- ALTER TABLE public."TBL_Tipo_Curso" OWNER TO postgres;
-- ddl-end --

-- object: "TBL_Tipo_Curso_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Curso" DROP CONSTRAINT IF EXISTS "TBL_Tipo_Curso_fk" CASCADE;
ALTER TABLE public."TBL_Curso" ADD CONSTRAINT "TBL_Tipo_Curso_fk" FOREIGN KEY ("TIC_ID_TBL_Tipo_Curso")
REFERENCES public."TBL_Tipo_Curso" ("TIC_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Colegiado_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Curso" DROP CONSTRAINT IF EXISTS "TBL_Colegiado_fk" CASCADE;
ALTER TABLE public."TBL_Curso" ADD CONSTRAINT "TBL_Colegiado_fk" FOREIGN KEY ("COL_ID_TBL_Colegiado")
REFERENCES public."TBL_Colegiado" ("COL_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Universidade_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Servidor" DROP CONSTRAINT IF EXISTS "TBL_Universidade_fk" CASCADE;
ALTER TABLE public."TBL_Servidor" ADD CONSTRAINT "TBL_Universidade_fk" FOREIGN KEY ("UNI_ID_TBL_Universidade")
REFERENCES public."TBL_Universidade" ("UNI_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."many_TBL_Curso_has_many_TBL_Materia" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_TBL_Curso_has_many_TBL_Materia" CASCADE;
CREATE TABLE public."many_TBL_Curso_has_many_TBL_Materia" (
	"CUR_ID_TBL_Curso" uuid NOT NULL,
	"MAT_ID_TBL_Materia" uuid NOT NULL,
	CONSTRAINT "many_TBL_Curso_has_many_TBL_Materia_pk" PRIMARY KEY ("CUR_ID_TBL_Curso","MAT_ID_TBL_Materia")

);
-- ddl-end --

-- object: "TBL_Curso_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Curso_has_many_TBL_Materia" DROP CONSTRAINT IF EXISTS "TBL_Curso_fk" CASCADE;
ALTER TABLE public."many_TBL_Curso_has_many_TBL_Materia" ADD CONSTRAINT "TBL_Curso_fk" FOREIGN KEY ("CUR_ID_TBL_Curso")
REFERENCES public."TBL_Curso" ("CUR_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Materia_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Curso_has_many_TBL_Materia" DROP CONSTRAINT IF EXISTS "TBL_Materia_fk" CASCADE;
ALTER TABLE public."many_TBL_Curso_has_many_TBL_Materia" ADD CONSTRAINT "TBL_Materia_fk" FOREIGN KEY ("MAT_ID_TBL_Materia")
REFERENCES public."TBL_Materia" ("MAT_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Colegiado_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Aluno" DROP CONSTRAINT IF EXISTS "TBL_Colegiado_fk" CASCADE;
ALTER TABLE public."TBL_Aluno" ADD CONSTRAINT "TBL_Colegiado_fk" FOREIGN KEY ("COL_ID_TBL_Colegiado")
REFERENCES public."TBL_Colegiado" ("COL_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TBL_Departamento" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Departamento" CASCADE;
CREATE TABLE public."TBL_Departamento" (
	"DEP_ID" uuid NOT NULL,
	"DEP_Sigla" varchar(50) NOT NULL,
	"UNI_ID_TBL_Universidade" uuid NOT NULL,
	CONSTRAINT "TBL_Departamento_pk" PRIMARY KEY ("DEP_ID")

);
-- ddl-end --
-- ALTER TABLE public."TBL_Departamento" OWNER TO postgres;
-- ddl-end --

-- object: "TBL_Departamento_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Colegiado" DROP CONSTRAINT IF EXISTS "TBL_Departamento_fk" CASCADE;
ALTER TABLE public."TBL_Colegiado" ADD CONSTRAINT "TBL_Departamento_fk" FOREIGN KEY ("DEP_ID_TBL_Departamento")
REFERENCES public."TBL_Departamento" ("DEP_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."many_TBL_Servidor_has_many_TBL_Departamento" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_TBL_Servidor_has_many_TBL_Departamento" CASCADE;
CREATE TABLE public."many_TBL_Servidor_has_many_TBL_Departamento" (
	"SER_ID_TBL_Servidor" uuid NOT NULL,
	"DEP_ID_TBL_Departamento" uuid NOT NULL,
	CONSTRAINT "many_TBL_Servidor_has_many_TBL_Departamento_pk" PRIMARY KEY ("SER_ID_TBL_Servidor","DEP_ID_TBL_Departamento")

);
-- ddl-end --

-- object: "TBL_Servidor_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Servidor_has_many_TBL_Departamento" DROP CONSTRAINT IF EXISTS "TBL_Servidor_fk" CASCADE;
ALTER TABLE public."many_TBL_Servidor_has_many_TBL_Departamento" ADD CONSTRAINT "TBL_Servidor_fk" FOREIGN KEY ("SER_ID_TBL_Servidor")
REFERENCES public."TBL_Servidor" ("SER_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Departamento_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Servidor_has_many_TBL_Departamento" DROP CONSTRAINT IF EXISTS "TBL_Departamento_fk" CASCADE;
ALTER TABLE public."many_TBL_Servidor_has_many_TBL_Departamento" ADD CONSTRAINT "TBL_Departamento_fk" FOREIGN KEY ("DEP_ID_TBL_Departamento")
REFERENCES public."TBL_Departamento" ("DEP_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."many_TBL_Servidor_has_many_TBL_Colegiado" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_TBL_Servidor_has_many_TBL_Colegiado" CASCADE;
CREATE TABLE public."many_TBL_Servidor_has_many_TBL_Colegiado" (
	"SER_ID_TBL_Servidor" uuid NOT NULL,
	"COL_ID_TBL_Colegiado" uuid NOT NULL,
	CONSTRAINT "many_TBL_Servidor_has_many_TBL_Colegiado_pk" PRIMARY KEY ("SER_ID_TBL_Servidor","COL_ID_TBL_Colegiado")

);
-- ddl-end --

-- object: "TBL_Servidor_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Servidor_has_many_TBL_Colegiado" DROP CONSTRAINT IF EXISTS "TBL_Servidor_fk" CASCADE;
ALTER TABLE public."many_TBL_Servidor_has_many_TBL_Colegiado" ADD CONSTRAINT "TBL_Servidor_fk" FOREIGN KEY ("SER_ID_TBL_Servidor")
REFERENCES public."TBL_Servidor" ("SER_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Colegiado_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Servidor_has_many_TBL_Colegiado" DROP CONSTRAINT IF EXISTS "TBL_Colegiado_fk" CASCADE;
ALTER TABLE public."many_TBL_Servidor_has_many_TBL_Colegiado" ADD CONSTRAINT "TBL_Colegiado_fk" FOREIGN KEY ("COL_ID_TBL_Colegiado")
REFERENCES public."TBL_Colegiado" ("COL_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."many_TBL_Curso_has_many_TBL_Servidor" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_TBL_Curso_has_many_TBL_Servidor" CASCADE;
CREATE TABLE public."many_TBL_Curso_has_many_TBL_Servidor" (
	"CUR_ID_TBL_Curso" uuid NOT NULL,
	"SER_ID_TBL_Servidor" uuid NOT NULL,
	CONSTRAINT "many_TBL_Curso_has_many_TBL_Servidor_pk" PRIMARY KEY ("CUR_ID_TBL_Curso","SER_ID_TBL_Servidor")

);
-- ddl-end --

-- object: "TBL_Curso_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Curso_has_many_TBL_Servidor" DROP CONSTRAINT IF EXISTS "TBL_Curso_fk" CASCADE;
ALTER TABLE public."many_TBL_Curso_has_many_TBL_Servidor" ADD CONSTRAINT "TBL_Curso_fk" FOREIGN KEY ("CUR_ID_TBL_Curso")
REFERENCES public."TBL_Curso" ("CUR_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Servidor_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Curso_has_many_TBL_Servidor" DROP CONSTRAINT IF EXISTS "TBL_Servidor_fk" CASCADE;
ALTER TABLE public."many_TBL_Curso_has_many_TBL_Servidor" ADD CONSTRAINT "TBL_Servidor_fk" FOREIGN KEY ("SER_ID_TBL_Servidor")
REFERENCES public."TBL_Servidor" ("SER_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Departamento_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Professor" DROP CONSTRAINT IF EXISTS "TBL_Departamento_fk" CASCADE;
ALTER TABLE public."TBL_Professor" ADD CONSTRAINT "TBL_Departamento_fk" FOREIGN KEY ("DEP_ID_TBL_Departamento")
REFERENCES public."TBL_Departamento" ("DEP_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Universidade_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Departamento" DROP CONSTRAINT IF EXISTS "TBL_Universidade_fk" CASCADE;
ALTER TABLE public."TBL_Departamento" ADD CONSTRAINT "TBL_Universidade_fk" FOREIGN KEY ("UNI_ID_TBL_Universidade")
REFERENCES public."TBL_Universidade" ("UNI_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TBL_Cargo" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Cargo" CASCADE;
CREATE TABLE public."TBL_Cargo" (
	"CAR_ID" uuid NOT NULL,
	"CAR_Nome" varchar(50) NOT NULL,
	CONSTRAINT "TBL_Cargo_pk" PRIMARY KEY ("CAR_ID")

);
-- ddl-end --
-- ALTER TABLE public."TBL_Cargo" OWNER TO postgres;
-- ddl-end --

-- object: public."many_TBL_Cargo_has_many_TBL_Servidor" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_TBL_Cargo_has_many_TBL_Servidor" CASCADE;
CREATE TABLE public."many_TBL_Cargo_has_many_TBL_Servidor" (
	"CAR_ID_TBL_Cargo" uuid NOT NULL,
	"SER_ID_TBL_Servidor" uuid NOT NULL,
	CONSTRAINT "many_TBL_Cargo_has_many_TBL_Servidor_pk" PRIMARY KEY ("CAR_ID_TBL_Cargo","SER_ID_TBL_Servidor")

);
-- ddl-end --

-- object: "TBL_Cargo_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Cargo_has_many_TBL_Servidor" DROP CONSTRAINT IF EXISTS "TBL_Cargo_fk" CASCADE;
ALTER TABLE public."many_TBL_Cargo_has_many_TBL_Servidor" ADD CONSTRAINT "TBL_Cargo_fk" FOREIGN KEY ("CAR_ID_TBL_Cargo")
REFERENCES public."TBL_Cargo" ("CAR_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Servidor_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Cargo_has_many_TBL_Servidor" DROP CONSTRAINT IF EXISTS "TBL_Servidor_fk" CASCADE;
ALTER TABLE public."many_TBL_Cargo_has_many_TBL_Servidor" ADD CONSTRAINT "TBL_Servidor_fk" FOREIGN KEY ("SER_ID_TBL_Servidor")
REFERENCES public."TBL_Servidor" ("SER_ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


