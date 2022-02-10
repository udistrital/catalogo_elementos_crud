-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1
-- PostgreSQL version: 9.6
-- Project Site: pgmodeler.io
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --

-- object: desarrollooas | type: ROLE --
-- DROP ROLE IF EXISTS desarrollooas;
CREATE ROLE desarrollooas WITH 
	SUPERUSER
	CREATEDB
	CREATEROLE
	INHERIT
	LOGIN
	REPLICATION
	ENCRYPTED PASSWORD '********';
-- ddl-end --


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: bd_oas | type: DATABASE --
-- -- DROP DATABASE IF EXISTS bd_oas;
-- CREATE DATABASE bd_oas
-- 	ENCODING = 'UTF8'
-- 	LC_COLLATE = 'en_US.UTF-8'
-- 	LC_CTYPE = 'en_US.UTF-8'
-- 	TABLESPACE = pg_default
-- 	OWNER = postgres;
-- -- ddl-end --
-- 

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
CREATE TABLE catalogo.subgrupo_catalogo(
	id integer NOT NULL DEFAULT nextval('catalogo.subgrupo_catalogo_id_seq'::regclass),
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	activo boolean NOT NULL,
	catalogo_id integer NOT NULL,
	subgrupo_id integer NOT NULL,
	CONSTRAINT pk_subgrupo_catalogo PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.subgrupo_catalogo IS 'Tabla que almacena los subgrupos de catálogos disponibles en ARKA II en caso de existir más de uno.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_catalogo.id IS 'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_catalogo.fecha_creacion IS 'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_catalogo.fecha_modificacion IS 'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_catalogo.activo IS 'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
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
CREATE TABLE catalogo.catalogo(
	id integer NOT NULL DEFAULT nextval('catalogo.catalogo_id_seq'::regclass),
	nombre character varying(300) NOT NULL,
	descripcion character varying(300) NOT NULL,
	fecha_inicio timestamp NOT NULL,
	fecha_fin timestamp,
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	activo boolean NOT NULL,
	CONSTRAINT pk_catalogo PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.catalogo IS 'Tabla que almacena los catálogos disponibles en ARKA II';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.id IS 'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.nombre IS 'Nombre del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.descripcion IS 'Campo que almacena la información extra del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.fecha_inicio IS 'Campo que almacena cuando inicia el funcionamiento del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.fecha_fin IS 'Campo que almacena cuando deja de funcionar el catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.fecha_creacion IS 'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.fecha_modificacion IS 'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.activo IS 'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
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
CREATE TABLE catalogo.subgrupo(
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
COMMENT ON TABLE catalogo.subgrupo IS 'Tabla que almacena los subgrupos disponibles en ARKA II';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.id IS 'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.nombre IS 'nombre del subgrupo del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.fecha_creacion IS 'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.fecha_modificacion IS 'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.activo IS 'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
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
CREATE TABLE catalogo.subgrupo_subgrupo(
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
COMMENT ON TABLE catalogo.subgrupo_subgrupo IS 'Tabla que almacena los subgrupos de los subgrupos disponibles en ARKA II en caso de que se pueda desagregar más un subgrupo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_subgrupo.id IS 'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_subgrupo.fecha_creacion IS 'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_subgrupo.fecha_modificacion IS 'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_subgrupo.activo IS 'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
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
CREATE TABLE catalogo.cuentas_subgrupo(
	id integer NOT NULL DEFAULT nextval('catalogo.cuentas_grupo_id_seq'::regclass),
	cuenta_credito_id character varying(20) NOT NULL,
	cuenta_debito_id character varying(20) NOT NULL,
	subtipo_movimiento_id integer NOT NULL,
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	activo boolean NOT NULL,
	subgrupo_id integer NOT NULL,
	CONSTRAINT pk_movimiento_cuenta PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.cuentas_subgrupo IS 'Tabla de rompimiento para asociar múltiples cuentas a un subgrupo de un catálogo dependiento el tipo de movimiento. Por ejemplo, donación pertenece a un tipo de movimiento entrada, pero no tiene las mismas cuentas que el tipo de movimiento.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.id IS 'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.cuenta_credito_id IS 'Campo para almacenar el número de la cuenta de crédito asociada a un movimiento. Proviene de KRONOS.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.cuenta_debito_id IS 'Campo para almacenar el número de la cuenta de débito asociada a un movimiento. Proviene de KRONOS.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.subtipo_movimiento_id IS 'Campo que guarda la foranea del movimiento, para asociar una cuenta a un tipo de movimiento específico.  Proviene de KRONOS.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.fecha_creacion IS 'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.fecha_modificacion IS 'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_subgrupo.activo IS 'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
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
CREATE TABLE catalogo.elemento(
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
COMMENT ON TABLE catalogo.elemento IS 'Tabla que almacena los catálogos disponibles en ARKA II';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.id IS 'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.nombre IS 'Nombre del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.descripcion IS 'Campo que almacena la información extra del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.fecha_creacion IS 'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.fecha_modificacion IS 'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.activo IS 'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
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
CREATE TABLE catalogo.tipo_bien(
	id integer NOT NULL DEFAULT nextval('catalogo.tipo_bien_id_seq'::regclass),
	nombre character varying(20) NOT NULL,
	descripcion character varying(250),
	codigo_abreviacion character varying(20),
	orden numeric(5,2),
	activo boolean NOT NULL,
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	reglas jsonb,
	tipo_bien_padre integer,
	necesita_placa boolean NOT NULL,
	CONSTRAINT tipo_bien_pk PRIMARY KEY (id)

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
CREATE TABLE catalogo.detalle_subgrupo(
	id integer NOT NULL DEFAULT nextval('catalogo.detalle_subgrupo_id_seq'::regclass),
	depreciacion boolean NOT NULL,
	valorizacion boolean NOT NULL,
	deterioro boolean NOT NULL,
	vida_util numeric(10,5),
	valor_residual numeric(5,4),
	activo boolean NOT NULL,
	fecha_creacion timestamp with time zone NOT NULL,
	fecha_modificacion timestamp with time zone NOT NULL,
	subgrupo_id integer,
	tipo_bien_id integer NOT NULL,
	CONSTRAINT detalle_subgrupo_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN catalogo.detalle_subgrupo.depreciacion IS 'Campo que determina si un Grupo (subgrupo) se deprecia o no.';
-- ddl-end --
COMMENT ON COLUMN catalogo.detalle_subgrupo.valorizacion IS 'Campo que determina si un Grupo (subgrupo) se valoriza o no.';
-- ddl-end --
COMMENT ON COLUMN catalogo.detalle_subgrupo.deterioro IS 'Campo que determina si un Grupo (subgrupo) se deteriora o no.';
-- ddl-end --
COMMENT ON COLUMN catalogo.detalle_subgrupo.vida_util IS 'Valor de la vida útil sugerida para un tipo de bien en años';
-- ddl-end --
COMMENT ON COLUMN catalogo.detalle_subgrupo.valor_residual IS 'Porcentaje del valor residual sugerido para un tipo de bien (0-1)';
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
CREATE TABLE catalogo.tipo_nivel(
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
CREATE TABLE catalogo.relacion_nivel(
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
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion();
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
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion();
-- ddl-end --

-- object: set_fecha_modificacion_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_subgrupo ON catalogo.subgrupo CASCADE;
CREATE TRIGGER set_fecha_modificacion_subgrupo
	BEFORE UPDATE
	ON catalogo.subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion();
-- ddl-end --

-- object: set_fecha_creacion_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_subgrupo ON catalogo.subgrupo CASCADE;
CREATE TRIGGER set_fecha_creacion_subgrupo
	BEFORE INSERT 
	ON catalogo.subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion();
-- ddl-end --

-- object: set_fecha_modificacion_catalogo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_catalogo ON catalogo.catalogo CASCADE;
CREATE TRIGGER set_fecha_modificacion_catalogo
	BEFORE UPDATE
	ON catalogo.catalogo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion();
-- ddl-end --

-- object: set_fecha_creacion_catalogo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_catalogo ON catalogo.catalogo CASCADE;
CREATE TRIGGER set_fecha_creacion_catalogo
	BEFORE INSERT 
	ON catalogo.catalogo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion();
-- ddl-end --

-- object: set_fecha_modificacion_cuentas_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_cuentas_subgrupo ON catalogo.cuentas_subgrupo CASCADE;
CREATE TRIGGER set_fecha_modificacion_cuentas_subgrupo
	BEFORE UPDATE
	ON catalogo.cuentas_subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion();
-- ddl-end --

-- object: set_fecha_creacion_cuentas_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_cuentas_subgrupo ON catalogo.cuentas_subgrupo CASCADE;
CREATE TRIGGER set_fecha_creacion_cuentas_subgrupo
	BEFORE INSERT 
	ON catalogo.cuentas_subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion();
-- ddl-end --

-- object: set_fecha_modificacion_elemento | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_elemento ON catalogo.elemento CASCADE;
CREATE TRIGGER set_fecha_modificacion_elemento
	BEFORE UPDATE
	ON catalogo.elemento
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion();
-- ddl-end --

-- object: set_fecha_creacion_elemento | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_elemento ON catalogo.elemento CASCADE;
CREATE TRIGGER set_fecha_creacion_elemento
	BEFORE INSERT 
	ON catalogo.elemento
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion();
-- ddl-end --

-- object: set_fecha_modificacion_relacion_nivel | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_relacion_nivel ON catalogo.relacion_nivel CASCADE;
CREATE TRIGGER set_fecha_modificacion_relacion_nivel
	BEFORE UPDATE
	ON catalogo.relacion_nivel
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion();
-- ddl-end --

-- object: set_fecha_creacion_relacion_nivel | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_relacion_nivel ON catalogo.relacion_nivel CASCADE;
CREATE TRIGGER set_fecha_creacion_relacion_nivel
	BEFORE INSERT 
	ON catalogo.relacion_nivel
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion();
-- ddl-end --

-- object: set_fecha_modificacion_subgrupo_catalogo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_subgrupo_catalogo ON catalogo.subgrupo_catalogo CASCADE;
CREATE TRIGGER set_fecha_modificacion_subgrupo_catalogo
	BEFORE UPDATE
	ON catalogo.subgrupo_catalogo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion();
-- ddl-end --

-- object: set_fecha_creacion_subgrupo_catalogo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_subgrupo_catalogo ON catalogo.subgrupo_catalogo CASCADE;
CREATE TRIGGER set_fecha_creacion_subgrupo_catalogo
	BEFORE INSERT 
	ON catalogo.subgrupo_catalogo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion();
-- ddl-end --

-- object: set_fecha_modificacion_subgrupo_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_subgrupo_subgrupo ON catalogo.subgrupo_subgrupo CASCADE;
CREATE TRIGGER set_fecha_modificacion_subgrupo_subgrupo
	BEFORE UPDATE
	ON catalogo.subgrupo_subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion();
-- ddl-end --

-- object: set_fecha_creacion_subgrupo_subgrupo | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_subgrupo_subgrupo ON catalogo.subgrupo_subgrupo CASCADE;
CREATE TRIGGER set_fecha_creacion_subgrupo_subgrupo
	BEFORE INSERT 
	ON catalogo.subgrupo_subgrupo
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion();
-- ddl-end --

-- object: set_fecha_modificacion_tipo_bien | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_tipo_bien ON catalogo.tipo_bien CASCADE;
CREATE TRIGGER set_fecha_modificacion_tipo_bien
	BEFORE UPDATE
	ON catalogo.tipo_bien
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion();
-- ddl-end --

-- object: set_fecha_creacion_tipo_bien | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_tipo_bien ON catalogo.tipo_bien CASCADE;
CREATE TRIGGER set_fecha_creacion_tipo_bien
	BEFORE INSERT 
	ON catalogo.tipo_bien
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion();
-- ddl-end --

-- object: set_fecha_modificacion_tipo_nivel | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_modificacion_tipo_nivel ON catalogo.tipo_nivel CASCADE;
CREATE TRIGGER set_fecha_modificacion_tipo_nivel
	BEFORE UPDATE
	ON catalogo.tipo_nivel
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_modificacion();
-- ddl-end --

-- object: set_fecha_creacion_tipo_nivel | type: TRIGGER --
-- DROP TRIGGER IF EXISTS set_fecha_creacion_tipo_nivel ON catalogo.tipo_nivel CASCADE;
CREATE TRIGGER set_fecha_creacion_tipo_nivel
	BEFORE INSERT 
	ON catalogo.tipo_nivel
	FOR EACH ROW
	EXECUTE PROCEDURE pg_catalog.trigger_set_fecha_creacion();
-- ddl-end --

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

-- object: fk_elemento_subgrupo | type: CONSTRAINT --
-- ALTER TABLE catalogo.elemento DROP CONSTRAINT IF EXISTS fk_elemento_subgrupo CASCADE;
ALTER TABLE catalogo.elemento ADD CONSTRAINT fk_elemento_subgrupo FOREIGN KEY (subgrupo_id)
REFERENCES catalogo.subgrupo (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_tipo_bien_tipo_bien_padre | type: CONSTRAINT --
-- ALTER TABLE catalogo.tipo_bien DROP CONSTRAINT IF EXISTS fk_tipo_bien_tipo_bien_padre CASCADE;
ALTER TABLE catalogo.tipo_bien ADD CONSTRAINT fk_tipo_bien_tipo_bien_padre FOREIGN KEY (tipo_bien_padre)
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

-- object: grant_9ad857ec28 | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA catalogo
   TO postgres;
-- ddl-end --

-- object: grant_26bb822c85 | type: PERMISSION --
GRANT USAGE
   ON SCHEMA catalogo
   TO desarrollooas;
-- ddl-end --

-- object: grant_325e8d543c | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER
   ON TABLE catalogo.subgrupo_catalogo
   TO postgres;
-- ddl-end --

-- object: grant_62ff4de657 | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE
   ON TABLE catalogo.subgrupo_catalogo
   TO desarrollooas;
-- ddl-end --

-- object: grant_78272b60cd | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER
   ON TABLE catalogo.catalogo
   TO postgres;
-- ddl-end --

-- object: grant_6aadc732b3 | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE
   ON TABLE catalogo.catalogo
   TO desarrollooas;
-- ddl-end --

-- object: grant_6de413bb0a | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER
   ON TABLE catalogo.subgrupo
   TO postgres;
-- ddl-end --

-- object: grant_83829958b7 | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE
   ON TABLE catalogo.subgrupo
   TO desarrollooas;
-- ddl-end --

-- object: grant_7c20442439 | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER
   ON TABLE catalogo.subgrupo_subgrupo
   TO postgres;
-- ddl-end --

-- object: grant_7f8e1e55d2 | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE
   ON TABLE catalogo.subgrupo_subgrupo
   TO desarrollooas;
-- ddl-end --

-- object: grant_2427a117bc | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER
   ON TABLE catalogo.cuentas_subgrupo
   TO postgres;
-- ddl-end --

-- object: grant_fce2c5e8a5 | type: PERMISSION --
GRANT SELECT,INSERT,UPDATE,DELETE
   ON TABLE catalogo.cuentas_subgrupo
   TO desarrollooas;
-- ddl-end --


