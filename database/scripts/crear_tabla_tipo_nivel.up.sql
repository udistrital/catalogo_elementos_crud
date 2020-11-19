-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 9.5
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: catalogo | type: SCHEMA --
-- DROP SCHEMA IF EXISTS catalogo CASCADE;
-- ddl-end --

-- object: catalogo.tipo_nivel | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.tipo_nivel CASCADE;
ALTER TABLE catalogo.subgrupo ADD COLUMN tipo_nivel_id integer NOT NULL;

CREATE TABLE catalogo.tipo_nivel (
	id serial NOT NULL,
	nombre varchar(20) NOT NULL,
	descripcion varchar(250),
	codigo_abreviacion varchar(20),
	orden numeric(5,2),
	activo boolean NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	CONSTRAINT pk_tipo_nivel PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE catalogo.tipo_nivel OWNER TO postgres;
-- ddl-end --

-- object: fk_subgrupo_tipo_nivel | type: CONSTRAINT --
-- ALTER TABLE catalogo.subgrupo DROP CONSTRAINT IF EXISTS fk_subgrupo_tipo_nivel CASCADE;
ALTER TABLE catalogo.subgrupo ADD CONSTRAINT fk_subgrupo_tipo_nivel FOREIGN KEY (tipo_nivel_id)
REFERENCES catalogo.tipo_nivel (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


