-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.3
-- PostgreSQL version: 9.6
-- Project Site: pgmodeler.io
-- Model Author: ---
-- -- object: pg_monitor | type: ROLE --
-- -- DROP ROLE IF EXISTS pg_monitor;
-- CREATE ROLE pg_monitor WITH 
-- 	INHERIT
-- 	ENCRYPTED PASSWORD '********';
-- -- ddl-end --
-- 
-- -- object: pg_read_all_settings | type: ROLE --
-- -- DROP ROLE IF EXISTS pg_read_all_settings;
-- CREATE ROLE pg_read_all_settings WITH 
-- 	INHERIT
-- 	ENCRYPTED PASSWORD '********'
-- 	ROLE pg_monitor;
-- -- ddl-end --
-- 
-- -- object: pg_read_all_stats | type: ROLE --
-- -- DROP ROLE IF EXISTS pg_read_all_stats;
-- CREATE ROLE pg_read_all_stats WITH 
-- 	INHERIT
-- 	ENCRYPTED PASSWORD '********'
-- 	ROLE pg_monitor;
-- -- ddl-end --
-- 
-- -- object: pg_stat_scan_tables | type: ROLE --
-- -- DROP ROLE IF EXISTS pg_stat_scan_tables;
-- CREATE ROLE pg_stat_scan_tables WITH 
-- 	INHERIT
-- 	ENCRYPTED PASSWORD '********'
-- 	ROLE pg_monitor;
-- -- ddl-end --
-- 
-- -- object: pg_signal_backend | type: ROLE --
-- -- DROP ROLE IF EXISTS pg_signal_backend;
-- CREATE ROLE pg_signal_backend WITH 
-- 	INHERIT
-- 	ENCRYPTED PASSWORD '********';
-- -- ddl-end --
-- 
-- -- object: pg_read_server_files | type: ROLE --
-- -- DROP ROLE IF EXISTS pg_read_server_files;
-- CREATE ROLE pg_read_server_files WITH 
-- 	INHERIT
-- 	ENCRYPTED PASSWORD '********';
-- -- ddl-end --
-- 
-- -- object: pg_write_server_files | type: ROLE --
-- -- DROP ROLE IF EXISTS pg_write_server_files;
-- CREATE ROLE pg_write_server_files WITH 
-- 	INHERIT
-- 	ENCRYPTED PASSWORD '********';
-- -- ddl-end --
-- 
-- -- object: pg_execute_server_program | type: ROLE --
-- -- DROP ROLE IF EXISTS pg_execute_server_program;
-- CREATE ROLE pg_execute_server_program WITH 
-- 	INHERIT
-- 	ENCRYPTED PASSWORD '********';
-- -- ddl-end --
-- 
-- -- object: pg_database_owner | type: ROLE --
-- -- DROP ROLE IF EXISTS pg_database_owner;
-- CREATE ROLE pg_database_owner WITH 
-- 	INHERIT
-- 	ENCRYPTED PASSWORD '********';
-- -- ddl-end --
-- 
-- -- object: pg_read_all_data | type: ROLE --
-- -- DROP ROLE IF EXISTS pg_read_all_data;
-- CREATE ROLE pg_read_all_data WITH 
-- 	INHERIT
-- 	ENCRYPTED PASSWORD '********';
-- -- ddl-end --
-- 
-- -- object: pg_write_all_data | type: ROLE --
-- -- DROP ROLE IF EXISTS pg_write_all_data;
-- CREATE ROLE pg_write_all_data WITH 
-- 	INHERIT
-- 	ENCRYPTED PASSWORD '********';
-- -- ddl-end --
-- 

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: postgres | type: DATABASE --
-- DROP DATABASE IF EXISTS postgres;
CREATE DATABASE postgres
	ENCODING = 'UTF8'
	LC_COLLATE = 'en_US.UTF-8'
	LC_CTYPE = 'en_US.UTF-8'
	TABLESPACE = pg_default
	OWNER = postgres;
-- ddl-end --
COMMENT ON DATABASE postgres IS E'default administrative connection database';
-- ddl-end --


SET check_function_bodies = false;
-- ddl-end --

-- object: catalogo | type: SCHEMA --
-- DROP SCHEMA IF EXISTS catalogo CASCADE;
CREATE SCHEMA catalogo;
-- ddl-end --
ALTER SCHEMA catalogo OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,catalogo;
-- ddl-end --

-- object: catalogo.subgrupo_catalogo_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS catalogo.subgrupo_catalogo_id_seq CASCADE;
CREATE SEQUENCE catalogo.subgrupo_catalogo_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE catalogo.subgrupo_catalogo_id_seq OWNER TO postgres;
-- ddl-end --

-- object: catalogo.subgrupo_catalogo | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.subgrupo_catalogo CASCADE;
CREATE TABLE catalogo.subgrupo_catalogo (
	id integer NOT NULL DEFAULT nextval('catalogo.subgrupo_catalogo_id_seq'::regclass),
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	activo boolean NOT NULL,
	catalogo_id integer NOT NULL,
	subgrupo_id integer NOT NULL,
	CONSTRAINT pk_subgrupo_catalogo PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.subgrupo_catalogo IS E'Tabla que almacena los subgrupos de catálogos disponibles en ARKA II en caso de existir más de uno.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_catalogo.id IS E'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_catalogo.fecha_creacion IS E'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_catalogo.fecha_modificacion IS E'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_catalogo.activo IS E'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
-- ddl-end --
ALTER TABLE catalogo.subgrupo_catalogo OWNER TO postgres;
-- ddl-end --

-- object: catalogo.catalogo_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS catalogo.catalogo_id_seq CASCADE;
CREATE SEQUENCE catalogo.catalogo_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE catalogo.catalogo_id_seq OWNER TO postgres;
-- ddl-end --

-- object: catalogo.catalogo | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.catalogo CASCADE;
CREATE TABLE catalogo.catalogo (
	id integer NOT NULL DEFAULT nextval('catalogo.catalogo_id_seq'::regclass),
	nombre character varying(300) NOT NULL,
	descripcion character varying(300) NOT NULL,
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	activo boolean NOT NULL,
	CONSTRAINT pk_catalogo PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.catalogo IS E'Tabla que almacena los catálogos disponibles en ARKA II';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.id IS E'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.nombre IS E'Nombre del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.descripcion IS E'Campo que almacena la información extra del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.fecha_creacion IS E'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.fecha_modificacion IS E'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.activo IS E'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
-- ddl-end --
ALTER TABLE catalogo.catalogo OWNER TO postgres;
-- ddl-end --

-- object: catalogo.subgrupo_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS catalogo.subgrupo_id_seq CASCADE;
CREATE SEQUENCE catalogo.subgrupo_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE catalogo.subgrupo_id_seq OWNER TO postgres;
-- ddl-end --

-- object: catalogo.subgrupo | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.subgrupo CASCADE;
CREATE TABLE catalogo.subgrupo (
	id integer NOT NULL DEFAULT nextval('catalogo.subgrupo_id_seq'::regclass),
	nombre character varying(300) NOT NULL,
	descripcion character varying(300) NOT NULL,
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	activo boolean NOT NULL,
	codigo text NOT NULL,
	tipo_nivel_id integer NOT NULL,
	CONSTRAINT pk_subgrupo PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.subgrupo IS E'Tabla que almacena los subgrupos disponibles en ARKA II';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.id IS E'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.nombre IS E'nombre del subgrupo del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.fecha_creacion IS E'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.fecha_modificacion IS E'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.activo IS E'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
-- ddl-end --
ALTER TABLE catalogo.subgrupo OWNER TO postgres;
-- ddl-end --

-- object: catalogo.subgrupo_subgrupo_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS catalogo.subgrupo_subgrupo_id_seq CASCADE;
CREATE SEQUENCE catalogo.subgrupo_subgrupo_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE catalogo.subgrupo_subgrupo_id_seq OWNER TO postgres;
-- ddl-end --

-- object: catalogo.subgrupo_subgrupo | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.subgrupo_subgrupo CASCADE;
CREATE TABLE catalogo.subgrupo_subgrupo (
	id integer NOT NULL DEFAULT nextval('catalogo.subgrupo_subgrupo_id_seq'::regclass),
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	activo boolean NOT NULL,
	subgrupo_padre_id integer NOT NULL,
	subgrupo_hijo_id integer NOT NULL,
	CONSTRAINT pk_subgrupo_subgrupo PRIMARY KEY (id),
	CONSTRAINT uq_subgrupo_subgrupo UNIQUE (subgrupo_padre_id,subgrupo_hijo_id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.subgrupo_subgrupo IS E'Tabla que almacena los subgrupos de los subgrupos disponibles en ARKA II en caso de que se pueda desagregar más un subgrupo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_subgrupo.id IS E'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_subgrupo.fecha_creacion IS E'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_subgrupo.fecha_modificacion IS E'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_subgrupo.activo IS E'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
-- ddl-end --
ALTER TABLE catalogo.subgrupo_subgrupo OWNER TO postgres;
-- ddl-end --

-- object: catalogo.cuentas_grupo_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS catalogo.cuentas_grupo_id_seq CASCADE;
CREATE SEQUENCE catalogo.cuentas_grupo_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE catalogo.cuentas_grupo_id_seq OWNER TO postgres;
-- ddl-end --

-- object: catalogo.cuentas_subgrupo | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.cuentas_subgrupo CASCADE;
CREATE TABLE catalogo.cuentas_subgrupo (
	id integer NOT NULL DEFAULT nextval('catalogo.cuentas_grupo_id_seq'::regclass),
	cuenta_credito_id character varying(30) NOT NULL,
	cuenta_debito_id character varying(30) NOT NULL,
	subtipo_movimiento_id integer NOT NULL,
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	activo boolean NOT NULL,
	subgrupo_id integer NOT NULL,
	tipo_bien_id integer NOT NULL,
	tipo_movimiento_id integer NOT NULL,
	CONSTRAINT pk_movimiento_cuenta PRIMARY KEY (id),
	CONSTRAINT ck_movimiento_id CHECK (((subtipo_movimiento_id > 0) OR (tipo_movimiento_id > 0))),
	CONSTRAINT ec_subgrupo_tipo_bien_movimiento EXCLUDE 
	USING btree(
	  subgrupo_id pg_catalog.int4_ops WITH pg_catalog.=,
	  tipo_bien_id pg_catalog.int4_ops WITH pg_catalog.=,
	  subtipo_movimiento_id pg_catalog.int4_ops WITH pg_catalog.=,
	  tipo_movimiento_id pg_catalog.int4_ops WITH pg_catalog.=
	) WHERE (activo)

);
-- ddl-end --
COMMENT ON TABLE catalogo.cuentas_subgrupo IS E'Tabla de rompimiento para asociar múltiples cuentas a un subgrupo de un catálogo dependiento el tipo de movimiento. Por ejemplo, donación pertenece a un tipo de movimiento entrada, pero no tiene las mismas cuentas que el tipo de movimiento.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.id IS E'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.cuenta_credito_id IS E'Campo para almacenar el número de la cuenta de crédito asociada a un movimiento. Proviene de KRONOS.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.cuenta_debito_id IS E'Campo para almacenar el número de la cuenta de débito asociada a un movimiento. Proviene de KRONOS.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.subtipo_movimiento_id IS E'Campo que guarda la foranea del movimiento, para asociar una cuenta a un tipo de movimiento específico.  Proviene de KRONOS.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.fecha_creacion IS E'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.fecha_modificacion IS E'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.activo IS E'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
-- ddl-end --
ALTER TABLE catalogo.cuentas_subgrupo OWNER TO postgres;
-- ddl-end --

-- object: catalogo.elemento_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS catalogo.elemento_id_seq CASCADE;
CREATE SEQUENCE catalogo.elemento_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE catalogo.elemento_id_seq OWNER TO postgres;
-- ddl-end --

-- object: catalogo.elemento | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.elemento CASCADE;
CREATE TABLE catalogo.elemento (
	id integer NOT NULL DEFAULT nextval('catalogo.elemento_id_seq'::regclass),
	nombre character varying(300) NOT NULL,
	descripcion character varying(300) NOT NULL,
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	activo boolean NOT NULL,
	subgrupo_id integer NOT NULL,
	codigo text NOT NULL DEFAULT '',
	CONSTRAINT pk_elemento PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.elemento IS E'Tabla que almacena los catálogos disponibles en ARKA II';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.id IS E'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.nombre IS E'Nombre del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.descripcion IS E'Campo que almacena la información extra del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.fecha_creacion IS E'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.fecha_modificacion IS E'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.activo IS E'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
-- ddl-end --
ALTER TABLE catalogo.elemento OWNER TO postgres;
-- ddl-end --

-- object: catalogo.tipo_bien_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS catalogo.tipo_bien_id_seq CASCADE;
CREATE SEQUENCE catalogo.tipo_bien_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE catalogo.tipo_bien_id_seq OWNER TO postgres;
-- ddl-end --

-- object: catalogo.tipo_bien | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.tipo_bien CASCADE;
CREATE TABLE catalogo.tipo_bien (
	id integer NOT NULL DEFAULT nextval('catalogo.tipo_bien_id_seq'::regclass),
	nombre character varying(40) NOT NULL,
	descripcion character varying(250),
	activo boolean NOT NULL,
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	reglas jsonb,
	tipo_bien_padre_id integer,
	necesita_placa boolean NOT NULL,
	necesita_poliza boolean NOT NULL,
	limite_inferior numeric(20,7),
	limite_superior numeric(20,7),
	bodega_consumo boolean,
	CONSTRAINT tipo_bien_pk PRIMARY KEY (id),
	CONSTRAINT ck_tipo_bien_padre_id_tipo_bien CHECK ((id <> tipo_bien_padre_id)),
	CONSTRAINT ck_limite_superior_tipo_bien CHECK ((limite_superior >= limite_inferior)),
	CONSTRAINT ck_limite_inferior_tipo_bien CHECK ((limite_inferior >= (0)::numeric))

);
-- ddl-end --
ALTER TABLE catalogo.tipo_bien OWNER TO postgres;
-- ddl-end --

-- object: catalogo.detalle_subgrupo_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS catalogo.detalle_subgrupo_id_seq CASCADE;
CREATE SEQUENCE catalogo.detalle_subgrupo_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE catalogo.detalle_subgrupo_id_seq OWNER TO postgres;
-- ddl-end --

-- object: catalogo.detalle_subgrupo | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.detalle_subgrupo CASCADE;
CREATE TABLE catalogo.detalle_subgrupo (
	id integer NOT NULL DEFAULT nextval('catalogo.detalle_subgrupo_id_seq'::regclass),
	depreciacion boolean NOT NULL,
	valorizacion boolean NOT NULL,
	amortizacion boolean NOT NULL,
	activo boolean NOT NULL,
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	subgrupo_id integer,
	tipo_bien_id integer NOT NULL,
	vida_util numeric(10,5),
	valor_residual numeric(5,4),
	CONSTRAINT detalle_subgrupo_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN catalogo.detalle_subgrupo.depreciacion IS E'Campo que determina si un Grupo (subgrupo) se deprecia o no.';
-- ddl-end --
COMMENT ON COLUMN catalogo.detalle_subgrupo.valorizacion IS E'Campo que determina si un Grupo (subgrupo) se valoriza o no.';
-- ddl-end --
COMMENT ON COLUMN catalogo.detalle_subgrupo.amortizacion IS E'Indica si al subgrupo le aplica amortización';
-- ddl-end --
COMMENT ON COLUMN catalogo.detalle_subgrupo.vida_util IS E'Valor de la vida útil sugerida para un tipo de bien en años';
-- ddl-end --
COMMENT ON COLUMN catalogo.detalle_subgrupo.valor_residual IS E'Porcentaje del valor residual sugerido para un tipo de bien (0-1)';
-- ddl-end --
ALTER TABLE catalogo.detalle_subgrupo OWNER TO postgres;
-- ddl-end --

-- object: catalogo.tipo_nivel_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS catalogo.tipo_nivel_id_seq CASCADE;
CREATE SEQUENCE catalogo.tipo_nivel_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE catalogo.tipo_nivel_id_seq OWNER TO postgres;
-- ddl-end --

-- object: catalogo.tipo_nivel | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.tipo_nivel CASCADE;
CREATE TABLE catalogo.tipo_nivel (
	id integer NOT NULL DEFAULT nextval('catalogo.tipo_nivel_id_seq'::regclass),
	nombre character varying(20) NOT NULL,
	descripcion character varying(250),
	codigo_abreviacion character varying(20),
	orden numeric(5,2),
	activo boolean NOT NULL,
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	CONSTRAINT pk_tipo_nivel PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE catalogo.tipo_nivel OWNER TO postgres;
-- ddl-end --

-- object: catalogo.relacion_nivel_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS catalogo.relacion_nivel_id_seq CASCADE;
CREATE SEQUENCE catalogo.relacion_nivel_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE catalogo.relacion_nivel_id_seq OWNER TO postgres;
-- ddl-end --

-- object: catalogo.relacion_nivel | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.relacion_nivel CASCADE;
CREATE TABLE catalogo.relacion_nivel (
	id integer NOT NULL DEFAULT nextval('catalogo.relacion_nivel_id_seq'::regclass),
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	activo boolean NOT NULL,
	nivel_padre_id integer NOT NULL,
	nivel_hijo_id integer NOT NULL,
	CONSTRAINT pk_relacion_nivel PRIMARY KEY (id),
	CONSTRAINT uq_relacion_nivel UNIQUE (nivel_padre_id,nivel_hijo_id)

);
-- ddl-end --
ALTER TABLE catalogo.relacion_nivel OWNER TO postgres;
-- ddl-end --

-- object: pg_catalog.trigger_set_fecha_modificacion | type: FUNCTION --
-- DROP FUNCTION IF EXISTS pg_catalog.trigger_set_fecha_modificacion() CASCADE;
CREATE FUNCTION pg_catalog.trigger_set_fecha_modificacion ()
	RETURNS trigger
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 100
	AS $$
BEGIN
  NEW.fecha_creacion = OLD.fecha_creacion;
  NEW.fecha_modificacion = NOW();
  RETURN NEW;
END;
$$;
-- ddl-end --
ALTER FUNCTION pg_catalog.trigger_set_fecha_modificacion() OWNER TO postgres;
-- ddl-end --

-- object: set_fecha_modificacion_detalle_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_detalle_subgrupo ON catalogo.detalle_subgrupo CASCADE;
CREATE TRIGGER set_fecha_modificacion_detalle_subgrupo
	BEFORE UPDATE
	ON catalogo.detalle_subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion('');
-- ddl-end --

-- object: pg_catalog.trigger_set_fecha_creacion | type: FUNCTION --
-- DROP FUNCTION IF EXISTS pg_catalog.trigger_set_fecha_creacion() CASCADE;
CREATE FUNCTION pg_catalog.trigger_set_fecha_creacion ()
	RETURNS trigger
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 100
	AS $$
BEGIN
  NEW.fecha_creacion = NOW();
  NEW.fecha_modificacion = NOW();
  RETURN NEW;
END;
$$;
-- ddl-end --
ALTER FUNCTION pg_catalog.trigger_set_fecha_creacion() OWNER TO postgres;
-- ddl-end --

-- object: set_fecha_creacion_detalle_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_detalle_subgrupo ON catalogo.detalle_subgrupo CASCADE;
CREATE TRIGGER set_fecha_creacion_detalle_subgrupo
	BEFORE INSERT 
	ON catalogo.detalle_subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion('');
-- ddl-end --

-- object: set_fecha_modificacion_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_subgrupo ON catalogo.subgrupo CASCADE;
CREATE TRIGGER set_fecha_modificacion_subgrupo
	BEFORE UPDATE
	ON catalogo.subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion('');
-- ddl-end --

-- object: set_fecha_creacion_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_subgrupo ON catalogo.subgrupo CASCADE;
CREATE TRIGGER set_fecha_creacion_subgrupo
	BEFORE INSERT 
	ON catalogo.subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion('');
-- ddl-end --

-- object: set_fecha_modificacion_catalogo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_catalogo ON catalogo.catalogo CASCADE;
CREATE TRIGGER set_fecha_modificacion_catalogo
	BEFORE UPDATE
	ON catalogo.catalogo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion('');
-- ddl-end --

-- object: set_fecha_creacion_catalogo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_catalogo ON catalogo.catalogo CASCADE;
CREATE TRIGGER set_fecha_creacion_catalogo
	BEFORE INSERT 
	ON catalogo.catalogo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion('');
-- ddl-end --

-- object: set_fecha_modificacion_cuentas_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_cuentas_subgrupo ON catalogo.cuentas_subgrupo CASCADE;
CREATE TRIGGER set_fecha_modificacion_cuentas_subgrupo
	BEFORE UPDATE
	ON catalogo.cuentas_subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion('');
-- ddl-end --

-- object: set_fecha_creacion_cuentas_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_cuentas_subgrupo ON catalogo.cuentas_subgrupo CASCADE;
CREATE TRIGGER set_fecha_creacion_cuentas_subgrupo
	BEFORE INSERT 
	ON catalogo.cuentas_subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion('');
-- ddl-end --

-- object: set_fecha_modificacion_elemento | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_elemento ON catalogo.elemento CASCADE;
CREATE TRIGGER set_fecha_modificacion_elemento
	BEFORE UPDATE
	ON catalogo.elemento
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion('');
-- ddl-end --

-- object: set_fecha_creacion_elemento | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_elemento ON catalogo.elemento CASCADE;
CREATE TRIGGER set_fecha_creacion_elemento
	BEFORE INSERT 
	ON catalogo.elemento
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion('');
-- ddl-end --

-- object: set_fecha_modificacion_relacion_nivel | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_relacion_nivel ON catalogo.relacion_nivel CASCADE;
CREATE TRIGGER set_fecha_modificacion_relacion_nivel
	BEFORE UPDATE
	ON catalogo.relacion_nivel
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion('');
-- ddl-end --

-- object: set_fecha_creacion_relacion_nivel | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_relacion_nivel ON catalogo.relacion_nivel CASCADE;
CREATE TRIGGER set_fecha_creacion_relacion_nivel
	BEFORE INSERT 
	ON catalogo.relacion_nivel
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion('');
-- ddl-end --

-- object: set_fecha_modificacion_subgrupo_catalogo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_subgrupo_catalogo ON catalogo.subgrupo_catalogo CASCADE;
CREATE TRIGGER set_fecha_modificacion_subgrupo_catalogo
	BEFORE UPDATE
	ON catalogo.subgrupo_catalogo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion('');
-- ddl-end --

-- object: set_fecha_creacion_subgrupo_catalogo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_subgrupo_catalogo ON catalogo.subgrupo_catalogo CASCADE;
CREATE TRIGGER set_fecha_creacion_subgrupo_catalogo
	BEFORE INSERT 
	ON catalogo.subgrupo_catalogo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion('');
-- ddl-end --

-- object: set_fecha_modificacion_subgrupo_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_subgrupo_subgrupo ON catalogo.subgrupo_subgrupo CASCADE;
CREATE TRIGGER set_fecha_modificacion_subgrupo_subgrupo
	BEFORE UPDATE
	ON catalogo.subgrupo_subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion('');
-- ddl-end --

-- object: set_fecha_creacion_subgrupo_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_subgrupo_subgrupo ON catalogo.subgrupo_subgrupo CASCADE;
CREATE TRIGGER set_fecha_creacion_subgrupo_subgrupo
	BEFORE INSERT 
	ON catalogo.subgrupo_subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion('');
-- ddl-end --

-- object: set_fecha_modificacion_tipo_bien | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_tipo_bien ON catalogo.tipo_bien CASCADE;
CREATE TRIGGER set_fecha_modificacion_tipo_bien
	BEFORE UPDATE
	ON catalogo.tipo_bien
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion('');
-- ddl-end --

-- object: set_fecha_creacion_tipo_bien | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_tipo_bien ON catalogo.tipo_bien CASCADE;
CREATE TRIGGER set_fecha_creacion_tipo_bien
	BEFORE INSERT 
	ON catalogo.tipo_bien
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion('');
-- ddl-end --

-- object: set_fecha_modificacion_tipo_nivel | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_tipo_nivel ON catalogo.tipo_nivel CASCADE;
CREATE TRIGGER set_fecha_modificacion_tipo_nivel
	BEFORE UPDATE
	ON catalogo.tipo_nivel
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion('');
-- ddl-end --

-- object: set_fecha_creacion_tipo_nivel | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_tipo_nivel ON catalogo.tipo_nivel CASCADE;
CREATE TRIGGER set_fecha_creacion_tipo_nivel
	BEFORE INSERT 
	ON catalogo.tipo_nivel
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion('');
-- ddl-end --

-- -- object: pg_catalog.btint2cmp | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.btint2cmp(smallint,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.btint2cmp (_param1 smallint, _param2 smallint)
-- 	RETURNS integer
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- btint2cmp
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.btint2cmp(smallint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.btint2cmp(smallint,smallint) IS E'less-equal-greater';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.btint2sortsupport | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.btint2sortsupport(internal) CASCADE;
-- CREATE FUNCTION pg_catalog.btint2sortsupport (_param1 internal)
-- 	RETURNS void
-- 	LANGUAGE internal
-- 	IMMUTABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- btint2sortsupport
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.btint2sortsupport(internal) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.btint2sortsupport(internal) IS E'sort support';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.btequalimage | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.btequalimage(oid) CASCADE;
-- CREATE FUNCTION pg_catalog.btequalimage (_param1 oid)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- btequalimage
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.btequalimage(oid) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.btequalimage(oid) IS E'equal image';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.btint24cmp | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.btint24cmp(smallint,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.btint24cmp (_param1 smallint, _param2 integer)
-- 	RETURNS integer
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- btint24cmp
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.btint24cmp(smallint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.btint24cmp(smallint,integer) IS E'less-equal-greater';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.btint28cmp | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.btint28cmp(smallint,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.btint28cmp (_param1 smallint, _param2 bigint)
-- 	RETURNS integer
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- btint28cmp
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.btint28cmp(smallint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.btint28cmp(smallint,bigint) IS E'less-equal-greater';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.in_range | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.in_range(smallint,smallint,bigint,boolean,boolean) CASCADE;
-- CREATE FUNCTION pg_catalog.in_range (_param1 smallint, _param2 smallint, _param3 bigint, _param4 boolean, _param5 boolean)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- in_range_int2_int8
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.in_range(smallint,smallint,bigint,boolean,boolean) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.in_range(smallint,smallint,bigint,boolean,boolean) IS E'window RANGE support';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.in_range | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.in_range(smallint,smallint,integer,boolean,boolean) CASCADE;
-- CREATE FUNCTION pg_catalog.in_range (_param1 smallint, _param2 smallint, _param3 integer, _param4 boolean, _param5 boolean)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- in_range_int2_int4
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.in_range(smallint,smallint,integer,boolean,boolean) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.in_range(smallint,smallint,integer,boolean,boolean) IS E'window RANGE support';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.in_range | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.in_range(smallint,smallint,smallint,boolean,boolean) CASCADE;
-- CREATE FUNCTION pg_catalog.in_range (_param1 smallint, _param2 smallint, _param3 smallint, _param4 boolean, _param5 boolean)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- in_range_int2_int2
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.in_range(smallint,smallint,smallint,boolean,boolean) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.in_range(smallint,smallint,smallint,boolean,boolean) IS E'window RANGE support';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.btint4cmp | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.btint4cmp(integer,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.btint4cmp (_param1 integer, _param2 integer)
-- 	RETURNS integer
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- btint4cmp
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.btint4cmp(integer,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.btint4cmp(integer,integer) IS E'less-equal-greater';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.btint4sortsupport | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.btint4sortsupport(internal) CASCADE;
-- CREATE FUNCTION pg_catalog.btint4sortsupport (_param1 internal)
-- 	RETURNS void
-- 	LANGUAGE internal
-- 	IMMUTABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- btint4sortsupport
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.btint4sortsupport(internal) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.btint4sortsupport(internal) IS E'sort support';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.btint48cmp | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.btint48cmp(integer,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.btint48cmp (_param1 integer, _param2 bigint)
-- 	RETURNS integer
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- btint48cmp
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.btint48cmp(integer,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.btint48cmp(integer,bigint) IS E'less-equal-greater';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.btint42cmp | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.btint42cmp(integer,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.btint42cmp (_param1 integer, _param2 smallint)
-- 	RETURNS integer
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- btint42cmp
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.btint42cmp(integer,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.btint42cmp(integer,smallint) IS E'less-equal-greater';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.in_range | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.in_range(integer,integer,bigint,boolean,boolean) CASCADE;
-- CREATE FUNCTION pg_catalog.in_range (_param1 integer, _param2 integer, _param3 bigint, _param4 boolean, _param5 boolean)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- in_range_int4_int8
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.in_range(integer,integer,bigint,boolean,boolean) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.in_range(integer,integer,bigint,boolean,boolean) IS E'window RANGE support';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.in_range | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.in_range(integer,integer,integer,boolean,boolean) CASCADE;
-- CREATE FUNCTION pg_catalog.in_range (_param1 integer, _param2 integer, _param3 integer, _param4 boolean, _param5 boolean)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- in_range_int4_int4
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.in_range(integer,integer,integer,boolean,boolean) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.in_range(integer,integer,integer,boolean,boolean) IS E'window RANGE support';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.in_range | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.in_range(integer,integer,smallint,boolean,boolean) CASCADE;
-- CREATE FUNCTION pg_catalog.in_range (_param1 integer, _param2 integer, _param3 smallint, _param4 boolean, _param5 boolean)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- in_range_int4_int2
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.in_range(integer,integer,smallint,boolean,boolean) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.in_range(integer,integer,smallint,boolean,boolean) IS E'window RANGE support';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.btint8cmp | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.btint8cmp(bigint,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.btint8cmp (_param1 bigint, _param2 bigint)
-- 	RETURNS integer
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- btint8cmp
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.btint8cmp(bigint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.btint8cmp(bigint,bigint) IS E'less-equal-greater';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.btint8sortsupport | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.btint8sortsupport(internal) CASCADE;
-- CREATE FUNCTION pg_catalog.btint8sortsupport (_param1 internal)
-- 	RETURNS void
-- 	LANGUAGE internal
-- 	IMMUTABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- btint8sortsupport
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.btint8sortsupport(internal) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.btint8sortsupport(internal) IS E'sort support';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.btint84cmp | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.btint84cmp(bigint,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.btint84cmp (_param1 bigint, _param2 integer)
-- 	RETURNS integer
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- btint84cmp
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.btint84cmp(bigint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.btint84cmp(bigint,integer) IS E'less-equal-greater';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.btint82cmp | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.btint82cmp(bigint,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.btint82cmp (_param1 bigint, _param2 smallint)
-- 	RETURNS integer
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- btint82cmp
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.btint82cmp(bigint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.btint82cmp(bigint,smallint) IS E'less-equal-greater';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.in_range | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.in_range(bigint,bigint,bigint,boolean,boolean) CASCADE;
-- CREATE FUNCTION pg_catalog.in_range (_param1 bigint, _param2 bigint, _param3 bigint, _param4 boolean, _param5 boolean)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- in_range_int8_int8
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.in_range(bigint,bigint,bigint,boolean,boolean) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.in_range(bigint,bigint,bigint,boolean,boolean) IS E'window RANGE support';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int2lt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int2lt(smallint,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int2lt (_param1 smallint, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int2lt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int2lt(smallint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int2lt(smallint,smallint) IS E'implementation of < operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.scalarltsel | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.scalarltsel(internal,oid,internal,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.scalarltsel (_param1 internal, _param2 oid, _param3 internal, _param4 integer)
-- 	RETURNS double precision
-- 	LANGUAGE internal
-- 	STABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- scalarltsel
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.scalarltsel(internal,oid,internal,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.scalarltsel(internal,oid,internal,integer) IS E'restriction selectivity of < and related operators on scalar datatypes';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.scalarltjoinsel | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.scalarltjoinsel(internal,oid,internal,smallint,internal) CASCADE;
-- CREATE FUNCTION pg_catalog.scalarltjoinsel (_param1 internal, _param2 oid, _param3 internal, _param4 smallint, _param5 internal)
-- 	RETURNS double precision
-- 	LANGUAGE internal
-- 	STABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- scalarltjoinsel
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.scalarltjoinsel(internal,oid,internal,smallint,internal) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.scalarltjoinsel(internal,oid,internal,smallint,internal) IS E'join selectivity of < and related operators on scalar datatypes';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.< | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<(smallint,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.< (
-- 	PROCEDURE = pg_catalog.int2lt
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = smallint
-- 	, RESTRICT = pg_catalog.scalarltsel
-- 	, JOIN = pg_catalog.scalarltjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<(smallint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<(smallint,smallint) IS E'less than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int2le | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int2le(smallint,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int2le (_param1 smallint, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int2le
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int2le(smallint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int2le(smallint,smallint) IS E'implementation of <= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.scalarlesel | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.scalarlesel(internal,oid,internal,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.scalarlesel (_param1 internal, _param2 oid, _param3 internal, _param4 integer)
-- 	RETURNS double precision
-- 	LANGUAGE internal
-- 	STABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- scalarlesel
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.scalarlesel(internal,oid,internal,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.scalarlesel(internal,oid,internal,integer) IS E'restriction selectivity of <= and related operators on scalar datatypes';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.scalarlejoinsel | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.scalarlejoinsel(internal,oid,internal,smallint,internal) CASCADE;
-- CREATE FUNCTION pg_catalog.scalarlejoinsel (_param1 internal, _param2 oid, _param3 internal, _param4 smallint, _param5 internal)
-- 	RETURNS double precision
-- 	LANGUAGE internal
-- 	STABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- scalarlejoinsel
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.scalarlejoinsel(internal,oid,internal,smallint,internal) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.scalarlejoinsel(internal,oid,internal,smallint,internal) IS E'join selectivity of <= and related operators on scalar datatypes';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.<= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<=(smallint,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.<= (
-- 	PROCEDURE = pg_catalog.int2le
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = smallint
-- 	, RESTRICT = pg_catalog.scalarlesel
-- 	, JOIN = pg_catalog.scalarlejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<=(smallint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<=(smallint,smallint) IS E'less than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int2eq | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int2eq(smallint,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int2eq (_param1 smallint, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int2eq
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int2eq(smallint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int2eq(smallint,smallint) IS E'implementation of = operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.eqsel | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.eqsel(internal,oid,internal,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.eqsel (_param1 internal, _param2 oid, _param3 internal, _param4 integer)
-- 	RETURNS double precision
-- 	LANGUAGE internal
-- 	STABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- eqsel
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.eqsel(internal,oid,internal,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.eqsel(internal,oid,internal,integer) IS E'restriction selectivity of = and related operators';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.eqjoinsel | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.eqjoinsel(internal,oid,internal,smallint,internal) CASCADE;
-- CREATE FUNCTION pg_catalog.eqjoinsel (_param1 internal, _param2 oid, _param3 internal, _param4 smallint, _param5 internal)
-- 	RETURNS double precision
-- 	LANGUAGE internal
-- 	STABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- eqjoinsel
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.eqjoinsel(internal,oid,internal,smallint,internal) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.eqjoinsel(internal,oid,internal,smallint,internal) IS E'join selectivity of = and related operators';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.=(smallint,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.= (
-- 	PROCEDURE = pg_catalog.int2eq
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = smallint
-- 	, RESTRICT = pg_catalog.eqsel
-- 	, JOIN = pg_catalog.eqjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.=(smallint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.=(smallint,smallint) IS E'equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int2ge | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int2ge(smallint,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int2ge (_param1 smallint, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int2ge
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int2ge(smallint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int2ge(smallint,smallint) IS E'implementation of >= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.scalargesel | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.scalargesel(internal,oid,internal,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.scalargesel (_param1 internal, _param2 oid, _param3 internal, _param4 integer)
-- 	RETURNS double precision
-- 	LANGUAGE internal
-- 	STABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- scalargesel
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.scalargesel(internal,oid,internal,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.scalargesel(internal,oid,internal,integer) IS E'restriction selectivity of >= and related operators on scalar datatypes';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.scalargejoinsel | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.scalargejoinsel(internal,oid,internal,smallint,internal) CASCADE;
-- CREATE FUNCTION pg_catalog.scalargejoinsel (_param1 internal, _param2 oid, _param3 internal, _param4 smallint, _param5 internal)
-- 	RETURNS double precision
-- 	LANGUAGE internal
-- 	STABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- scalargejoinsel
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.scalargejoinsel(internal,oid,internal,smallint,internal) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.scalargejoinsel(internal,oid,internal,smallint,internal) IS E'join selectivity of >= and related operators on scalar datatypes';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.>= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>=(smallint,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.>= (
-- 	PROCEDURE = pg_catalog.int2ge
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = smallint
-- 	, RESTRICT = pg_catalog.scalargesel
-- 	, JOIN = pg_catalog.scalargejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>=(smallint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>=(smallint,smallint) IS E'greater than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int2gt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int2gt(smallint,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int2gt (_param1 smallint, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int2gt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int2gt(smallint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int2gt(smallint,smallint) IS E'implementation of > operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.scalargtsel | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.scalargtsel(internal,oid,internal,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.scalargtsel (_param1 internal, _param2 oid, _param3 internal, _param4 integer)
-- 	RETURNS double precision
-- 	LANGUAGE internal
-- 	STABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- scalargtsel
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.scalargtsel(internal,oid,internal,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.scalargtsel(internal,oid,internal,integer) IS E'restriction selectivity of > and related operators on scalar datatypes';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.scalargtjoinsel | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.scalargtjoinsel(internal,oid,internal,smallint,internal) CASCADE;
-- CREATE FUNCTION pg_catalog.scalargtjoinsel (_param1 internal, _param2 oid, _param3 internal, _param4 smallint, _param5 internal)
-- 	RETURNS double precision
-- 	LANGUAGE internal
-- 	STABLE 
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- scalargtjoinsel
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.scalargtjoinsel(internal,oid,internal,smallint,internal) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.scalargtjoinsel(internal,oid,internal,smallint,internal) IS E'join selectivity of > and related operators on scalar datatypes';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.> | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>(smallint,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.> (
-- 	PROCEDURE = pg_catalog.int2gt
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = smallint
-- 	, RESTRICT = pg_catalog.scalargtsel
-- 	, JOIN = pg_catalog.scalargtjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>(smallint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>(smallint,smallint) IS E'greater than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int24lt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int24lt(smallint,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int24lt (_param1 smallint, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int24lt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int24lt(smallint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int24lt(smallint,integer) IS E'implementation of < operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.< | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<(smallint,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.< (
-- 	PROCEDURE = pg_catalog.int24lt
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.scalarltsel
-- 	, JOIN = pg_catalog.scalarltjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<(smallint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<(smallint,integer) IS E'less than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int24le | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int24le(smallint,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int24le (_param1 smallint, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int24le
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int24le(smallint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int24le(smallint,integer) IS E'implementation of <= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.<= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<=(smallint,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.<= (
-- 	PROCEDURE = pg_catalog.int24le
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.scalarlesel
-- 	, JOIN = pg_catalog.scalarlejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<=(smallint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<=(smallint,integer) IS E'less than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int24eq | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int24eq(smallint,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int24eq (_param1 smallint, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int24eq
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int24eq(smallint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int24eq(smallint,integer) IS E'implementation of = operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.=(smallint,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.= (
-- 	PROCEDURE = pg_catalog.int24eq
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.eqsel
-- 	, JOIN = pg_catalog.eqjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.=(smallint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.=(smallint,integer) IS E'equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int24ge | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int24ge(smallint,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int24ge (_param1 smallint, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int24ge
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int24ge(smallint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int24ge(smallint,integer) IS E'implementation of >= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.>= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>=(smallint,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.>= (
-- 	PROCEDURE = pg_catalog.int24ge
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.scalargesel
-- 	, JOIN = pg_catalog.scalargejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>=(smallint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>=(smallint,integer) IS E'greater than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int24gt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int24gt(smallint,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int24gt (_param1 smallint, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int24gt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int24gt(smallint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int24gt(smallint,integer) IS E'implementation of > operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.> | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>(smallint,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.> (
-- 	PROCEDURE = pg_catalog.int24gt
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.scalargtsel
-- 	, JOIN = pg_catalog.scalargtjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>(smallint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>(smallint,integer) IS E'greater than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int28lt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int28lt(smallint,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int28lt (_param1 smallint, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int28lt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int28lt(smallint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int28lt(smallint,bigint) IS E'implementation of < operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.< | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<(smallint,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.< (
-- 	PROCEDURE = pg_catalog.int28lt
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.scalarltsel
-- 	, JOIN = pg_catalog.scalarltjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<(smallint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<(smallint,bigint) IS E'less than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int28le | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int28le(smallint,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int28le (_param1 smallint, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int28le
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int28le(smallint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int28le(smallint,bigint) IS E'implementation of <= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.<= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<=(smallint,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.<= (
-- 	PROCEDURE = pg_catalog.int28le
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.scalarlesel
-- 	, JOIN = pg_catalog.scalarlejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<=(smallint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<=(smallint,bigint) IS E'less than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int28eq | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int28eq(smallint,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int28eq (_param1 smallint, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int28eq
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int28eq(smallint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int28eq(smallint,bigint) IS E'implementation of = operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.=(smallint,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.= (
-- 	PROCEDURE = pg_catalog.int28eq
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.eqsel
-- 	, JOIN = pg_catalog.eqjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.=(smallint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.=(smallint,bigint) IS E'equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int28ge | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int28ge(smallint,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int28ge (_param1 smallint, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int28ge
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int28ge(smallint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int28ge(smallint,bigint) IS E'implementation of >= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.>= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>=(smallint,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.>= (
-- 	PROCEDURE = pg_catalog.int28ge
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.scalargesel
-- 	, JOIN = pg_catalog.scalargejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>=(smallint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>=(smallint,bigint) IS E'greater than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int28gt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int28gt(smallint,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int28gt (_param1 smallint, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int28gt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int28gt(smallint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int28gt(smallint,bigint) IS E'implementation of > operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.> | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>(smallint,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.> (
-- 	PROCEDURE = pg_catalog.int28gt
-- 	, LEFTARG = smallint
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.scalargtsel
-- 	, JOIN = pg_catalog.scalargtjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>(smallint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>(smallint,bigint) IS E'greater than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int4lt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int4lt(integer,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int4lt (_param1 integer, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int4lt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int4lt(integer,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int4lt(integer,integer) IS E'implementation of < operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.< | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<(integer,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.< (
-- 	PROCEDURE = pg_catalog.int4lt
-- 	, LEFTARG = integer
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.scalarltsel
-- 	, JOIN = pg_catalog.scalarltjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<(integer,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<(integer,integer) IS E'less than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int4le | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int4le(integer,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int4le (_param1 integer, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int4le
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int4le(integer,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int4le(integer,integer) IS E'implementation of <= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.<= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<=(integer,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.<= (
-- 	PROCEDURE = pg_catalog.int4le
-- 	, LEFTARG = integer
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.scalarlesel
-- 	, JOIN = pg_catalog.scalarlejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<=(integer,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<=(integer,integer) IS E'less than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int4eq | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int4eq(integer,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int4eq (_param1 integer, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int4eq
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int4eq(integer,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int4eq(integer,integer) IS E'implementation of = operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.=(integer,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.= (
-- 	PROCEDURE = pg_catalog.int4eq
-- 	, LEFTARG = integer
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.eqsel
-- 	, JOIN = pg_catalog.eqjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.=(integer,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.=(integer,integer) IS E'equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int4ge | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int4ge(integer,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int4ge (_param1 integer, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int4ge
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int4ge(integer,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int4ge(integer,integer) IS E'implementation of >= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.>= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>=(integer,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.>= (
-- 	PROCEDURE = pg_catalog.int4ge
-- 	, LEFTARG = integer
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.scalargesel
-- 	, JOIN = pg_catalog.scalargejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>=(integer,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>=(integer,integer) IS E'greater than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int4gt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int4gt(integer,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int4gt (_param1 integer, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int4gt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int4gt(integer,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int4gt(integer,integer) IS E'implementation of > operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.> | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>(integer,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.> (
-- 	PROCEDURE = pg_catalog.int4gt
-- 	, LEFTARG = integer
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.scalargtsel
-- 	, JOIN = pg_catalog.scalargtjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>(integer,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>(integer,integer) IS E'greater than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int42lt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int42lt(integer,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int42lt (_param1 integer, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int42lt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int42lt(integer,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int42lt(integer,smallint) IS E'implementation of < operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.< | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<(integer,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.< (
-- 	PROCEDURE = pg_catalog.int42lt
-- 	, LEFTARG = integer
-- 	, RIGHTARG = smallint
-- 	, RESTRICT = pg_catalog.scalarltsel
-- 	, JOIN = pg_catalog.scalarltjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<(integer,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<(integer,smallint) IS E'less than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int42le | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int42le(integer,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int42le (_param1 integer, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int42le
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int42le(integer,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int42le(integer,smallint) IS E'implementation of <= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.<= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<=(integer,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.<= (
-- 	PROCEDURE = pg_catalog.int42le
-- 	, LEFTARG = integer
-- 	, RIGHTARG = smallint
-- 	, RESTRICT = pg_catalog.scalarlesel
-- 	, JOIN = pg_catalog.scalarlejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<=(integer,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<=(integer,smallint) IS E'less than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int42eq | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int42eq(integer,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int42eq (_param1 integer, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int42eq
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int42eq(integer,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int42eq(integer,smallint) IS E'implementation of = operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.=(integer,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.= (
-- 	PROCEDURE = pg_catalog.int42eq
-- 	, LEFTARG = integer
-- 	, RIGHTARG = smallint
-- 	, COMMUTATOR = OPERATOR(pg_catalog.=)
-- 	, RESTRICT = pg_catalog.eqsel
-- 	, JOIN = pg_catalog.eqjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.=(integer,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.=(integer,smallint) IS E'equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int42ge | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int42ge(integer,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int42ge (_param1 integer, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int42ge
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int42ge(integer,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int42ge(integer,smallint) IS E'implementation of >= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.>= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>=(integer,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.>= (
-- 	PROCEDURE = pg_catalog.int42ge
-- 	, LEFTARG = integer
-- 	, RIGHTARG = smallint
-- 	, RESTRICT = pg_catalog.scalargesel
-- 	, JOIN = pg_catalog.scalargejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>=(integer,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>=(integer,smallint) IS E'greater than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int42gt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int42gt(integer,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int42gt (_param1 integer, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int42gt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int42gt(integer,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int42gt(integer,smallint) IS E'implementation of > operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.> | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>(integer,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.> (
-- 	PROCEDURE = pg_catalog.int42gt
-- 	, LEFTARG = integer
-- 	, RIGHTARG = smallint
-- 	, RESTRICT = pg_catalog.scalargtsel
-- 	, JOIN = pg_catalog.scalargtjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>(integer,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>(integer,smallint) IS E'greater than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int48lt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int48lt(integer,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int48lt (_param1 integer, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int48lt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int48lt(integer,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int48lt(integer,bigint) IS E'implementation of < operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.< | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<(integer,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.< (
-- 	PROCEDURE = pg_catalog.int48lt
-- 	, LEFTARG = integer
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.scalarltsel
-- 	, JOIN = pg_catalog.scalarltjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<(integer,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<(integer,bigint) IS E'less than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int48le | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int48le(integer,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int48le (_param1 integer, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int48le
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int48le(integer,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int48le(integer,bigint) IS E'implementation of <= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.<= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<=(integer,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.<= (
-- 	PROCEDURE = pg_catalog.int48le
-- 	, LEFTARG = integer
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.scalarlesel
-- 	, JOIN = pg_catalog.scalarlejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<=(integer,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<=(integer,bigint) IS E'less than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int48eq | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int48eq(integer,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int48eq (_param1 integer, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int48eq
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int48eq(integer,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int48eq(integer,bigint) IS E'implementation of = operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.=(integer,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.= (
-- 	PROCEDURE = pg_catalog.int48eq
-- 	, LEFTARG = integer
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.eqsel
-- 	, JOIN = pg_catalog.eqjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.=(integer,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.=(integer,bigint) IS E'equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int48ge | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int48ge(integer,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int48ge (_param1 integer, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int48ge
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int48ge(integer,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int48ge(integer,bigint) IS E'implementation of >= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.>= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>=(integer,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.>= (
-- 	PROCEDURE = pg_catalog.int48ge
-- 	, LEFTARG = integer
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.scalargesel
-- 	, JOIN = pg_catalog.scalargejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>=(integer,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>=(integer,bigint) IS E'greater than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int48gt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int48gt(integer,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int48gt (_param1 integer, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int48gt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int48gt(integer,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int48gt(integer,bigint) IS E'implementation of > operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.> | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>(integer,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.> (
-- 	PROCEDURE = pg_catalog.int48gt
-- 	, LEFTARG = integer
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.scalargtsel
-- 	, JOIN = pg_catalog.scalargtjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>(integer,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>(integer,bigint) IS E'greater than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int8lt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int8lt(bigint,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int8lt (_param1 bigint, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int8lt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int8lt(bigint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int8lt(bigint,bigint) IS E'implementation of < operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.< | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<(bigint,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.< (
-- 	PROCEDURE = pg_catalog.int8lt
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.scalarltsel
-- 	, JOIN = pg_catalog.scalarltjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<(bigint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<(bigint,bigint) IS E'less than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int8le | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int8le(bigint,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int8le (_param1 bigint, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int8le
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int8le(bigint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int8le(bigint,bigint) IS E'implementation of <= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.<= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<=(bigint,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.<= (
-- 	PROCEDURE = pg_catalog.int8le
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.scalarlesel
-- 	, JOIN = pg_catalog.scalarlejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<=(bigint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<=(bigint,bigint) IS E'less than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int8eq | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int8eq(bigint,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int8eq (_param1 bigint, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int8eq
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int8eq(bigint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int8eq(bigint,bigint) IS E'implementation of = operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.=(bigint,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.= (
-- 	PROCEDURE = pg_catalog.int8eq
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.eqsel
-- 	, JOIN = pg_catalog.eqjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.=(bigint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.=(bigint,bigint) IS E'equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int8ge | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int8ge(bigint,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int8ge (_param1 bigint, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int8ge
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int8ge(bigint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int8ge(bigint,bigint) IS E'implementation of >= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.>= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>=(bigint,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.>= (
-- 	PROCEDURE = pg_catalog.int8ge
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.scalargesel
-- 	, JOIN = pg_catalog.scalargejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>=(bigint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>=(bigint,bigint) IS E'greater than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int8gt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int8gt(bigint,bigint) CASCADE;
-- CREATE FUNCTION pg_catalog.int8gt (_param1 bigint, _param2 bigint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int8gt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int8gt(bigint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int8gt(bigint,bigint) IS E'implementation of > operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.> | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>(bigint,bigint) CASCADE;
-- CREATE OPERATOR pg_catalog.> (
-- 	PROCEDURE = pg_catalog.int8gt
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = bigint
-- 	, RESTRICT = pg_catalog.scalargtsel
-- 	, JOIN = pg_catalog.scalargtjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>(bigint,bigint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>(bigint,bigint) IS E'greater than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int82lt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int82lt(bigint,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int82lt (_param1 bigint, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int82lt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int82lt(bigint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int82lt(bigint,smallint) IS E'implementation of < operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.< | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<(bigint,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.< (
-- 	PROCEDURE = pg_catalog.int82lt
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = smallint
-- 	, RESTRICT = pg_catalog.scalarltsel
-- 	, JOIN = pg_catalog.scalarltjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<(bigint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<(bigint,smallint) IS E'less than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int82le | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int82le(bigint,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int82le (_param1 bigint, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int82le
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int82le(bigint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int82le(bigint,smallint) IS E'implementation of <= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.<= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<=(bigint,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.<= (
-- 	PROCEDURE = pg_catalog.int82le
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = smallint
-- 	, RESTRICT = pg_catalog.scalarlesel
-- 	, JOIN = pg_catalog.scalarlejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<=(bigint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<=(bigint,smallint) IS E'less than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int82eq | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int82eq(bigint,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int82eq (_param1 bigint, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int82eq
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int82eq(bigint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int82eq(bigint,smallint) IS E'implementation of = operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.=(bigint,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.= (
-- 	PROCEDURE = pg_catalog.int82eq
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = smallint
-- 	, COMMUTATOR = OPERATOR(pg_catalog.=)
-- 	, RESTRICT = pg_catalog.eqsel
-- 	, JOIN = pg_catalog.eqjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.=(bigint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.=(bigint,smallint) IS E'equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int82ge | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int82ge(bigint,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int82ge (_param1 bigint, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int82ge
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int82ge(bigint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int82ge(bigint,smallint) IS E'implementation of >= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.>= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>=(bigint,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.>= (
-- 	PROCEDURE = pg_catalog.int82ge
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = smallint
-- 	, RESTRICT = pg_catalog.scalargesel
-- 	, JOIN = pg_catalog.scalargejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>=(bigint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>=(bigint,smallint) IS E'greater than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int82gt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int82gt(bigint,smallint) CASCADE;
-- CREATE FUNCTION pg_catalog.int82gt (_param1 bigint, _param2 smallint)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int82gt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int82gt(bigint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int82gt(bigint,smallint) IS E'implementation of > operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.> | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>(bigint,smallint) CASCADE;
-- CREATE OPERATOR pg_catalog.> (
-- 	PROCEDURE = pg_catalog.int82gt
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = smallint
-- 	, RESTRICT = pg_catalog.scalargtsel
-- 	, JOIN = pg_catalog.scalargtjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>(bigint,smallint) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>(bigint,smallint) IS E'greater than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int84lt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int84lt(bigint,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int84lt (_param1 bigint, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int84lt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int84lt(bigint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int84lt(bigint,integer) IS E'implementation of < operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.< | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<(bigint,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.< (
-- 	PROCEDURE = pg_catalog.int84lt
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.scalarltsel
-- 	, JOIN = pg_catalog.scalarltjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<(bigint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<(bigint,integer) IS E'less than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int84le | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int84le(bigint,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int84le (_param1 bigint, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int84le
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int84le(bigint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int84le(bigint,integer) IS E'implementation of <= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.<= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.<=(bigint,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.<= (
-- 	PROCEDURE = pg_catalog.int84le
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.scalarlesel
-- 	, JOIN = pg_catalog.scalarlejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.<=(bigint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.<=(bigint,integer) IS E'less than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int84eq | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int84eq(bigint,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int84eq (_param1 bigint, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int84eq
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int84eq(bigint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int84eq(bigint,integer) IS E'implementation of = operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.=(bigint,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.= (
-- 	PROCEDURE = pg_catalog.int84eq
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = integer
-- 	, COMMUTATOR = OPERATOR(pg_catalog.=)
-- 	, RESTRICT = pg_catalog.eqsel
-- 	, JOIN = pg_catalog.eqjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.=(bigint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.=(bigint,integer) IS E'equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int84ge | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int84ge(bigint,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int84ge (_param1 bigint, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int84ge
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int84ge(bigint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int84ge(bigint,integer) IS E'implementation of >= operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.>= | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>=(bigint,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.>= (
-- 	PROCEDURE = pg_catalog.int84ge
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.scalargesel
-- 	, JOIN = pg_catalog.scalargejoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>=(bigint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>=(bigint,integer) IS E'greater than or equal';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int84gt | type: FUNCTION --
-- -- DROP FUNCTION IF EXISTS pg_catalog.int84gt(bigint,integer) CASCADE;
-- CREATE FUNCTION pg_catalog.int84gt (_param1 bigint, _param2 integer)
-- 	RETURNS boolean
-- 	LANGUAGE internal
-- 	IMMUTABLE LEAKPROOF
-- 	STRICT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$
-- int84gt
-- $$;
-- -- ddl-end --
-- ALTER FUNCTION pg_catalog.int84gt(bigint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON FUNCTION pg_catalog.int84gt(bigint,integer) IS E'implementation of > operator';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.> | type: OPERATOR --
-- -- DROP OPERATOR IF EXISTS pg_catalog.>(bigint,integer) CASCADE;
-- CREATE OPERATOR pg_catalog.> (
-- 	PROCEDURE = pg_catalog.int84gt
-- 	, LEFTARG = bigint
-- 	, RIGHTARG = integer
-- 	, RESTRICT = pg_catalog.scalargtsel
-- 	, JOIN = pg_catalog.scalargtjoinsel);
-- -- ddl-end --
-- ALTER OPERATOR pg_catalog.>(bigint,integer) OWNER TO postgres;
-- -- ddl-end --
-- COMMENT ON OPERATOR pg_catalog.>(bigint,integer) IS E'greater than';
-- -- ddl-end --
-- 
-- -- object: pg_catalog.int4_ops | type: OPERATOR CLASS --
-- -- DROP OPERATOR CLASS IF EXISTS pg_catalog.int4_ops USING btree CASCADE;
-- CREATE OPERATOR CLASS pg_catalog.int4_ops DEFAULT  FOR TYPE integer
--  USING btree AS
-- 	FUNCTION	1	pg_catalog.btint2cmp(smallint,smallint),
-- 	FUNCTION	2	pg_catalog.btint2sortsupport(internal),
-- 	FUNCTION	4	pg_catalog.btequalimage(oid),
-- 	FUNCTION	1	pg_catalog.btint24cmp(smallint,integer),
-- 	FUNCTION	1	pg_catalog.btint28cmp(smallint,bigint),
-- 	FUNCTION	3	pg_catalog.in_range(smallint,smallint,bigint,boolean,boolean),
-- 	FUNCTION	3	pg_catalog.in_range(smallint,smallint,integer,boolean,boolean),
-- 	FUNCTION	3	pg_catalog.in_range(smallint,smallint,smallint,boolean,boolean),
-- 	FUNCTION	1	pg_catalog.btint4cmp(integer,integer),
-- 	FUNCTION	2	pg_catalog.btint4sortsupport(internal),
-- 	FUNCTION	4	pg_catalog.btequalimage(oid),
-- 	FUNCTION	1	pg_catalog.btint48cmp(integer,bigint),
-- 	FUNCTION	1	pg_catalog.btint42cmp(integer,smallint),
-- 	FUNCTION	3	pg_catalog.in_range(integer,integer,bigint,boolean,boolean),
-- 	FUNCTION	3	pg_catalog.in_range(integer,integer,integer,boolean,boolean),
-- 	FUNCTION	3	pg_catalog.in_range(integer,integer,smallint,boolean,boolean),
-- 	FUNCTION	1	pg_catalog.btint8cmp(bigint,bigint),
-- 	FUNCTION	2	pg_catalog.btint8sortsupport(internal),
-- 	FUNCTION	4	pg_catalog.btequalimage(oid),
-- 	FUNCTION	1	pg_catalog.btint84cmp(bigint,integer),
-- 	FUNCTION	1	pg_catalog.btint82cmp(bigint,smallint),
-- 	FUNCTION	3	pg_catalog.in_range(bigint,bigint,bigint,boolean,boolean),
-- 	OPERATOR	1	pg_catalog.<(smallint,smallint) FOR SEARCH ,
-- 	OPERATOR	2	pg_catalog.<=(smallint,smallint) FOR SEARCH ,
-- 	OPERATOR	3	pg_catalog.=(smallint,smallint) FOR SEARCH ,
-- 	OPERATOR	4	pg_catalog.>=(smallint,smallint) FOR SEARCH ,
-- 	OPERATOR	5	pg_catalog.>(smallint,smallint) FOR SEARCH ,
-- 	OPERATOR	1	pg_catalog.<(smallint,integer) FOR SEARCH ,
-- 	OPERATOR	2	pg_catalog.<=(smallint,integer) FOR SEARCH ,
-- 	OPERATOR	3	pg_catalog.=(smallint,integer) FOR SEARCH ,
-- 	OPERATOR	4	pg_catalog.>=(smallint,integer) FOR SEARCH ,
-- 	OPERATOR	5	pg_catalog.>(smallint,integer) FOR SEARCH ,
-- 	OPERATOR	1	pg_catalog.<(smallint,bigint) FOR SEARCH ,
-- 	OPERATOR	2	pg_catalog.<=(smallint,bigint) FOR SEARCH ,
-- 	OPERATOR	3	pg_catalog.=(smallint,bigint) FOR SEARCH ,
-- 	OPERATOR	4	pg_catalog.>=(smallint,bigint) FOR SEARCH ,
-- 	OPERATOR	5	pg_catalog.>(smallint,bigint) FOR SEARCH ,
-- 	OPERATOR	1	pg_catalog.<(integer,integer) FOR SEARCH ,
-- 	OPERATOR	2	pg_catalog.<=(integer,integer) FOR SEARCH ,
-- 	OPERATOR	3	pg_catalog.=(integer,integer) FOR SEARCH ,
-- 	OPERATOR	4	pg_catalog.>=(integer,integer) FOR SEARCH ,
-- 	OPERATOR	5	pg_catalog.>(integer,integer) FOR SEARCH ,
-- 	OPERATOR	1	pg_catalog.<(integer,smallint) FOR SEARCH ,
-- 	OPERATOR	2	pg_catalog.<=(integer,smallint) FOR SEARCH ,
-- 	OPERATOR	3	pg_catalog.=(integer,smallint) FOR SEARCH ,
-- 	OPERATOR	4	pg_catalog.>=(integer,smallint) FOR SEARCH ,
-- 	OPERATOR	5	pg_catalog.>(integer,smallint) FOR SEARCH ,
-- 	OPERATOR	1	pg_catalog.<(integer,bigint) FOR SEARCH ,
-- 	OPERATOR	2	pg_catalog.<=(integer,bigint) FOR SEARCH ,
-- 	OPERATOR	3	pg_catalog.=(integer,bigint) FOR SEARCH ,
-- 	OPERATOR	4	pg_catalog.>=(integer,bigint) FOR SEARCH ,
-- 	OPERATOR	5	pg_catalog.>(integer,bigint) FOR SEARCH ,
-- 	OPERATOR	1	pg_catalog.<(bigint,bigint) FOR SEARCH ,
-- 	OPERATOR	2	pg_catalog.<=(bigint,bigint) FOR SEARCH ,
-- 	OPERATOR	3	pg_catalog.=(bigint,bigint) FOR SEARCH ,
-- 	OPERATOR	4	pg_catalog.>=(bigint,bigint) FOR SEARCH ,
-- 	OPERATOR	5	pg_catalog.>(bigint,bigint) FOR SEARCH ,
-- 	OPERATOR	1	pg_catalog.<(bigint,smallint) FOR SEARCH ,
-- 	OPERATOR	2	pg_catalog.<=(bigint,smallint) FOR SEARCH ,
-- 	OPERATOR	3	pg_catalog.=(bigint,smallint) FOR SEARCH ,
-- 	OPERATOR	4	pg_catalog.>=(bigint,smallint) FOR SEARCH ,
-- 	OPERATOR	5	pg_catalog.>(bigint,smallint) FOR SEARCH ,
-- 	OPERATOR	1	pg_catalog.<(bigint,integer) FOR SEARCH ,
-- 	OPERATOR	2	pg_catalog.<=(bigint,integer) FOR SEARCH ,
-- 	OPERATOR	3	pg_catalog.=(bigint,integer) FOR SEARCH ,
-- 	OPERATOR	4	pg_catalog.>=(bigint,integer) FOR SEARCH ,
-- 	OPERATOR	5	pg_catalog.>(bigint,integer) FOR SEARCH ;
-- -- ddl-end --
-- ALTER OPERATOR CLASS pg_catalog.int4_ops USING btree OWNER TO postgres;
-- -- ddl-end --
-- 
-- object: fk_subgrupo_catalogo_subgrupo | type: CONSTRAINT --
-- ALTER TABLE catalogo.subgrupo_catalogo DROP CONSTRAINT IF EXISTS fk_subgrupo_catalogo_subgrupo CASCADE;
ALTER TABLE catalogo.subgrupo_catalogo ADD CONSTRAINT fk_subgrupo_catalogo_subgrupo FOREIGN KEY (subgrupo_id)
REFERENCES catalogo.subgrupo (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_subgrupo_catalogo_catalogo | type: CONSTRAINT --
-- ALTER TABLE catalogo.subgrupo_catalogo DROP CONSTRAINT IF EXISTS fk_subgrupo_catalogo_catalogo CASCADE;
ALTER TABLE catalogo.subgrupo_catalogo ADD CONSTRAINT fk_subgrupo_catalogo_catalogo FOREIGN KEY (catalogo_id)
REFERENCES catalogo.catalogo (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_subgrupo_tipo_nivel | type: CONSTRAINT --
-- ALTER TABLE catalogo.subgrupo DROP CONSTRAINT IF EXISTS fk_subgrupo_tipo_nivel CASCADE;
ALTER TABLE catalogo.subgrupo ADD CONSTRAINT fk_subgrupo_tipo_nivel FOREIGN KEY (tipo_nivel_id)
REFERENCES catalogo.tipo_nivel (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_subgrupo_subgrupo_subgrupo_padre | type: CONSTRAINT --
-- ALTER TABLE catalogo.subgrupo_subgrupo DROP CONSTRAINT IF EXISTS fk_subgrupo_subgrupo_subgrupo_padre CASCADE;
ALTER TABLE catalogo.subgrupo_subgrupo ADD CONSTRAINT fk_subgrupo_subgrupo_subgrupo_padre FOREIGN KEY (subgrupo_padre_id)
REFERENCES catalogo.subgrupo (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_subgrupo_subgrupo_subgrupo_hijo | type: CONSTRAINT --
-- ALTER TABLE catalogo.subgrupo_subgrupo DROP CONSTRAINT IF EXISTS fk_subgrupo_subgrupo_subgrupo_hijo CASCADE;
ALTER TABLE catalogo.subgrupo_subgrupo ADD CONSTRAINT fk_subgrupo_subgrupo_subgrupo_hijo FOREIGN KEY (subgrupo_hijo_id)
REFERENCES catalogo.subgrupo (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_cuentas_grupo_subgrupo | type: CONSTRAINT --
-- ALTER TABLE catalogo.cuentas_subgrupo DROP CONSTRAINT IF EXISTS fk_cuentas_grupo_subgrupo CASCADE;
ALTER TABLE catalogo.cuentas_subgrupo ADD CONSTRAINT fk_cuentas_grupo_subgrupo FOREIGN KEY (subgrupo_id)
REFERENCES catalogo.subgrupo (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_cuentas_subgrupo_tipo_bien | type: CONSTRAINT --
-- ALTER TABLE catalogo.cuentas_subgrupo DROP CONSTRAINT IF EXISTS fk_cuentas_subgrupo_tipo_bien CASCADE;
ALTER TABLE catalogo.cuentas_subgrupo ADD CONSTRAINT fk_cuentas_subgrupo_tipo_bien FOREIGN KEY (tipo_bien_id)
REFERENCES catalogo.tipo_bien (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_elemento_subgrupo | type: CONSTRAINT --
-- ALTER TABLE catalogo.elemento DROP CONSTRAINT IF EXISTS fk_elemento_subgrupo CASCADE;
ALTER TABLE catalogo.elemento ADD CONSTRAINT fk_elemento_subgrupo FOREIGN KEY (subgrupo_id)
REFERENCES catalogo.subgrupo (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_tipo_bien_tipo_bien_padre | type: CONSTRAINT --
-- ALTER TABLE catalogo.tipo_bien DROP CONSTRAINT IF EXISTS fk_tipo_bien_tipo_bien_padre CASCADE;
ALTER TABLE catalogo.tipo_bien ADD CONSTRAINT fk_tipo_bien_tipo_bien_padre FOREIGN KEY (tipo_bien_padre_id)
REFERENCES catalogo.tipo_bien (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_detalle_subgrupo_tipo_bien | type: CONSTRAINT --
-- ALTER TABLE catalogo.detalle_subgrupo DROP CONSTRAINT IF EXISTS fk_detalle_subgrupo_tipo_bien CASCADE;
ALTER TABLE catalogo.detalle_subgrupo ADD CONSTRAINT fk_detalle_subgrupo_tipo_bien FOREIGN KEY (tipo_bien_id)
REFERENCES catalogo.tipo_bien (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_detalle_subgrupo_subgrupo | type: CONSTRAINT --
-- ALTER TABLE catalogo.detalle_subgrupo DROP CONSTRAINT IF EXISTS fk_detalle_subgrupo_subgrupo CASCADE;
ALTER TABLE catalogo.detalle_subgrupo ADD CONSTRAINT fk_detalle_subgrupo_subgrupo FOREIGN KEY (subgrupo_id)
REFERENCES catalogo.subgrupo (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_tipo_nivel_nivel_padre | type: CONSTRAINT --
-- ALTER TABLE catalogo.relacion_nivel DROP CONSTRAINT IF EXISTS fk_tipo_nivel_nivel_padre CASCADE;
ALTER TABLE catalogo.relacion_nivel ADD CONSTRAINT fk_tipo_nivel_nivel_padre FOREIGN KEY (nivel_padre_id)
REFERENCES catalogo.tipo_nivel (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_tipo_nivel_nivel_hijo | type: CONSTRAINT --
-- ALTER TABLE catalogo.relacion_nivel DROP CONSTRAINT IF EXISTS fk_tipo_nivel_nivel_hijo CASCADE;
ALTER TABLE catalogo.relacion_nivel ADD CONSTRAINT fk_tipo_nivel_nivel_hijo FOREIGN KEY (nivel_hijo_id)
REFERENCES catalogo.tipo_nivel (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


