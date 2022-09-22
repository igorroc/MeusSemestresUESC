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
-- object: "conta" | type: TABLE --
-- DROP TABLE IF EXISTS "conta" CASCADE;
CREATE TABLE conta (
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    nome varchar(64) NOT NULL,
    saldo numeric DEFAULT 0,
    CONSTRAINT conta_pk PRIMARY KEY (id)
);

-- ddl-end --
-- ALTER TABLE "conta" OWNER TO postgres;
-- ddl-end --
-- object: transacoes | type: TABLE --
-- DROP TABLE IF EXISTS transacoes CASCADE;
CREATE TABLE transacoes (
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    valor numeric NOT NULL,
    id_conta smallint NOT NULL,
    id_conta1 smallint NOT NULL,
    CONSTRAINT transacoes_pk PRIMARY KEY (id)
);

-- ddl-end --
-- ALTER TABLE transacoes OWNER TO postgres;
-- ddl-end --
-- object: conta_fk | type: CONSTRAINT --
-- ALTER TABLE transacoes DROP CONSTRAINT IF EXISTS conta_fk CASCADE;
ALTER TABLE
    transacoes
ADD
    CONSTRAINT conta_fk FOREIGN KEY (id_conta) REFERENCES "conta" (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE;

-- ddl-end --
-- object: conta_fk1 | type: CONSTRAINT --
-- ALTER TABLE transacoes DROP CONSTRAINT IF EXISTS conta_fk1 CASCADE;
ALTER TABLE
    transacoes
ADD
    CONSTRAINT conta_fk1 FOREIGN KEY (id_conta1) REFERENCES conta (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE;

-- ddl-end --